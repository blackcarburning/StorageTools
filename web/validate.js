#!/usr/bin/env node
/**
 * validate.js — lightweight offline test for StorageTools web/index.html
 *
 * Checks:
 *  1. JavaScript block parses without syntax errors.
 *  2. DOC_QUERIES and HEALTH_QUERIES are non-empty arrays.
 *  3. Every query has a unique id and unique outputFile.
 *  4. Query ids match their outputFile base names.
 *  5. No query SQL contains known-invalid column references.
 *  6. Generated CMD content contains the expected per-query diagnostic markers.
 *  7. Generated SH content uses run_query, traps, and produces counters.
 *  8. Every query section maps to a known XLSX sheet section.
 *  9. Generated SH has no unsafe printf format strings beginning with a hyphen.
 * 10. Generated SH includes preflight and ANS1051I fatal handling.
 * 11. Generated CMD includes preflight and ANS1051I fatal handling.
 *
 * Usage:  node web/validate.js
 * Exit:   0 = all checks passed, 1 = one or more failures.
 */

'use strict';
const fs = require('fs');
const path = require('path');

const HTML_FILE = path.join(__dirname, 'index.html');

let PASS = 0;
let FAIL = 0;

function ok(msg) {
  console.log('  [PASS]', msg);
  PASS++;
}
function fail(msg) {
  console.error('  [FAIL]', msg);
  FAIL++;
}
function section(title) {
  console.log('\n──', title);
}

// ─── Read source ─────────────────────────────────────────────────────────────
const html = fs.readFileSync(HTML_FILE, 'utf8');

// ─── 1. JavaScript syntax ────────────────────────────────────────────────────
section('1. JavaScript syntax');
// Use case-insensitive match to handle any HTML casing (also satisfies CodeQL js/bad-tag-filter).
const scriptMatch = html.match(/<script>([\s\S]*?)<\/script>/i);
if (!scriptMatch) {
  fail('No <script> block found in index.html');
  process.exit(1);
}
const js = scriptMatch[1];
try {
  new Function(js); // eslint-disable-line no-new-func
  ok('JavaScript parses without syntax errors');
} catch (e) {
  fail(`JavaScript syntax error: ${e.message}`);
  process.exit(1);
}

// ─── Evaluate query arrays ────────────────────────────────────────────────────
// We execute the script in a sandboxed Function context and extract the arrays.
// The IIFE at the bottom calls document methods, so we stub the bare minimum.
let DOC_QUERIES, HEALTH_QUERIES;
try {
  // Provide minimal stubs for globals the IIFE calls during initialisation
  const mockEl = {
    value: '', innerHTML: '', style: {}, textContent: '',
    classList: { add: ()=>{}, remove: ()=>{} },
    addEventListener: () => {},
  };
  const mockDoc = {
    querySelectorAll: () => ({ forEach: () => {} }),
    getElementById:   () => mockEl,
    createElement:    () => ({ href: '', download: '', click: ()=>{}, style: {} }),
    addEventListener: () => {},
  };
  const mockStorage = { getItem: () => null, setItem: () => {} };

  const sandbox = new Function( // eslint-disable-line no-new-func
    'document', 'localStorage', 'alert', 'URL', 'Blob', 'TextEncoder', 'clearTimeout', 'setTimeout',
    `${js}; return { DOC_QUERIES, HEALTH_QUERIES };`
  );
  const result = sandbox(
    mockDoc,
    mockStorage,
    () => {},
    { createObjectURL: () => '', revokeObjectURL: () => '' },
    class Blob {},
    class TextEncoder { encode(s) { return Buffer.from(s); } },
    () => {},
    (fn) => { /* skip timers */ }
  );
  DOC_QUERIES    = result.DOC_QUERIES;
  HEALTH_QUERIES = result.HEALTH_QUERIES;
} catch (e) {
  fail(`Could not extract query arrays: ${e.message}`);
  process.exit(1);
}

// ─── 2. Non-empty arrays ─────────────────────────────────────────────────────
section('2. Query arrays are non-empty');
if (Array.isArray(DOC_QUERIES) && DOC_QUERIES.length > 0) {
  ok(`DOC_QUERIES has ${DOC_QUERIES.length} queries`);
} else {
  fail(`DOC_QUERIES is empty or not an array`);
}
if (Array.isArray(HEALTH_QUERIES) && HEALTH_QUERIES.length > 0) {
  ok(`HEALTH_QUERIES has ${HEALTH_QUERIES.length} queries`);
} else {
  fail(`HEALTH_QUERIES is empty or not an array`);
}

// ─── 3. Unique ids and outputFiles ───────────────────────────────────────────
section('3. Unique query IDs and output filenames');
const allQueries = [...DOC_QUERIES, ...HEALTH_QUERIES];
const idsSeen       = new Set();
const filesSeen     = new Set();
let dupIds = [], dupFiles = [];
for (const q of allQueries) {
  if (idsSeen.has(q.id))       dupIds.push(q.id);
  if (filesSeen.has(q.outputFile)) dupFiles.push(q.outputFile);
  idsSeen.add(q.id);
  filesSeen.add(q.outputFile);
}
if (dupIds.length === 0) {
  ok('All query IDs are unique');
} else {
  fail(`Duplicate query IDs: ${dupIds.join(', ')}`);
}
if (dupFiles.length === 0) {
  ok('All output filenames are unique');
} else {
  fail(`Duplicate output filenames: ${dupFiles.join(', ')}`);
}

// ─── 4. ID/outputFile consistency ────────────────────────────────────────────
section('4. Query ID matches outputFile base name');
let idFileMismatches = 0;
for (const q of allQueries) {
  const base = q.outputFile.replace(/\.csv$/, '');
  if (base !== q.id) {
    fail(`ID/file mismatch: id=${q.id}, outputFile=${q.outputFile}`);
    idFileMismatches++;
  }
}
if (idFileMismatches === 0) ok('All IDs match their outputFile base names');

// ─── 5. Known-invalid column references ──────────────────────────────────────
section('5. No known-invalid SQL column references');
// These column names were identified as wrong against IBM SP documentation.
const bannedCols = [
  { pattern: /\bSERVER_TYPE\b/i,  context: 'SERVERS view (not documented for v8.1.27)' },
  // RULE_TYPE in STGRULES is wrong (should be TYPE per IBM docs);
  // REPLICATIONRULES may legitimately use RULE_TYPE — check only STGRULES queries.
  { pattern: /\bRULE_TYPE\b.*STGRULES|STGRULES.*\bRULE_TYPE\b/is,
                                  context: 'STGRULES (should be TYPE per IBM docs)' },
  { pattern: /\bDEST_STGPOOL_NAME\b.*STGRULES|STGRULES.*\bDEST_STGPOOL_NAME\b/is,
                                  context: 'STGRULES (column name unverified)' },
  { pattern: /\bDESCRIPTION\b.*\bPROCESSES\b|\bPROCESSES\b.*\bDESCRIPTION\b/is,
                                  context: 'PROCESSES (DESCRIPTION not in documented columns)' },
  { pattern: /\bPCT_COMPLETE\b/i, context: 'PROCESSES (PCT_COMPLETE not in documented columns)' },
  // DB view: wrong column names confirmed by rc=3 in the field.
  { pattern: /\bTOT_FILE_SYSTEM_MB\b/i, context: 'DB view (wrong name; use TOTAL_SPACE_MB)' },
  { pattern: /\bUSED_DB_SPACE_MB\b/i,   context: 'DB view (wrong name; use USED_SPACE_MB)' },
  { pattern: /\bLAST_REORG\b/i,         context: 'DB view (column does not exist)' },
  // DBSPACE view: wrong column names confirmed by rc=3 in the field.
  { pattern: /\bTOTAL_FS_SIZE_MB\b/i,   context: 'DBSPACE view (wrong name; use TOTAL_SPACE_MB)' },
  { pattern: /\bUSED_FS_SIZE_MB\b/i,    context: 'DBSPACE view (wrong name; use USED_SPACE_MB)' },
  // NODES view: non-existent or wrong column names confirmed by rc=3 in the field.
  { pattern: /\bTCP_NAME\b/i,           context: 'NODES view (column does not exist)' },
  { pattern: /\bSESSION_INITIATION\b/i, context: 'NODES view (wrong name; use SESSIONSECURITY)' },
  { pattern: /\bCLIENT_OS_LEVEL\b/i,    context: 'NODES view (column not in standard NODES view)' },
  // ADMINS view: wrong column names confirmed by rc=3 in the field.
  { pattern: /\bLAST_ACCESS\b.*ADMINS|ADMINS.*\bLAST_ACCESS\b/is,
                                         context: 'ADMINS view (wrong name; use LASTACC_TIME)' },
  // CLIENT_SCHEDULES view: SCHED_STYLE not present in CLIENT_SCHEDULES on all v8.1.x servers.
  { pattern: /\bSCHED_STYLE\b.*CLIENT_SCHEDULES|CLIENT_SCHEDULES.*\bSCHED_STYLE\b/is,
                                         context: 'CLIENT_SCHEDULES (column absent on many v8.1.x; present in ADMIN_SCHEDULES only)' },
];
let bannedFound = 0;
for (const q of allQueries) {
  for (const { pattern, context } of bannedCols) {
    if (pattern.test(q.sql)) {
      fail(`Query ${q.id} uses banned column (${context}): matched /${pattern.source}/i`);
      bannedFound++;
    }
  }
}
if (bannedFound === 0) ok('No known-invalid column references found');

// ─── 5b. Date arithmetic spacing ─────────────────────────────────────────────
section('5b. Date arithmetic spacing (CURRENT_TIMESTAMP interval)');
// CURRENT_TIMESTAMP-N DAYS without a space before N is a DB2 parse error.
// Correct form: CURRENT_TIMESTAMP - N DAYS  (space on both sides of operator).
let badDateArith = 0;
for (const q of allQueries) {
  if (/CURRENT_TIMESTAMP-[0-9]/i.test(q.sql)) {
    fail(`Query ${q.id} has unspaced date arithmetic (CURRENT_TIMESTAMP-N): add spaces around the minus`);
    badDateArith++;
  }
}
if (badDateArith === 0) ok('All CURRENT_TIMESTAMP interval expressions are correctly spaced');

// ─── 6. Division-by-zero guards ──────────────────────────────────────────────
section('6. Division-by-zero guards (NULLIF) on percentage calculations');
// Queries that divide by a potentially-zero column should use NULLIF.
const divisionQueries = allQueries.filter(q =>
  /FLOAT\([A-Z_]+\)\s*\/\s*FLOAT\([A-Z_]+\)/i.test(q.sql)
);
let missingNullif = 0;
for (const q of divisionQueries) {
  // Check: any FLOAT(x)/FLOAT(y) where y is not protected by NULLIF
  if (/FLOAT\([^)]+\)\s*\/\s*FLOAT\((?!NULLIF)[^)]+\)/i.test(q.sql)) {
    fail(`Query ${q.id} may divide by zero (FLOAT/FLOAT without NULLIF on divisor)`);
    missingNullif++;
  }
}
if (missingNullif === 0) ok('All FLOAT/FLOAT divisions are guarded with NULLIF');

// ─── 7. CMD script content ───────────────────────────────────────────────────
section('7. Generated CMD script diagnostic content');
// Reuse the same mock environment to call generateCmdContent/generateShContent.
let cmdDoc, shDoc;
try {
  const mockEl = {
    value: '', innerHTML: '', style: {}, textContent: '',
    classList: { add: ()=>{}, remove: ()=>{} },
    addEventListener: () => {},
  };
  const mockDoc = {
    querySelectorAll: () => ({ forEach: () => {} }),
    getElementById:   () => mockEl,
    createElement:    () => ({ href: '', download: '', click: ()=>{}, style: {} }),
    addEventListener: () => {},
  };
  const mockStorage = { getItem: () => null, setItem: () => {} };

  const genFn = new Function( // eslint-disable-line no-new-func
    'document', 'localStorage', 'alert', 'URL', 'Blob', 'TextEncoder', 'clearTimeout', 'setTimeout',
    `${js}; return { generateCmdContent, generateShContent };`
  );
  const { generateCmdContent, generateShContent } = genFn(
    mockDoc,
    mockStorage,
    () => {},
    { createObjectURL: () => '', revokeObjectURL: () => '' },
    class Blob {},
    class TextEncoder { encode(s) { return Buffer.from(s); } },
    () => {},
    () => {}
  );
  cmdDoc = generateCmdContent('doc');
  shDoc  = generateShContent('doc');
} catch (e) {
  fail(`Could not generate scripts: ${e.message}`);
  process.exit(1);
}

// CMD: per-query diagnostics
const cmdChecks = [
  ['initialises collection_errors.log', /type nul > ".*collection_errors\.log"/i],
  ['uses per-query qerr.tmp temp file', /".*qerr\.tmp"/],
  ['captures stderr to temp file', /2>".*qerr\.tmp"/],
  ['sets QRC from ERRORLEVEL', /SET QRC=%ERRORLEVEL%/],
  ['sets QSTATUS', /SET QSTATUS=\[OK\]/],
  ['checks for FAILED', /SET QSTATUS=\[FAILED\]/],
  ['checks for WARN', /SET QSTATUS=\[WARN\]/],
  ['echoes status to console', /echo\s+%QSTATUS%/],
  ['appends status to log', />> ".*collection_log\.txt"/],
  ['echoes stderr to console', /TYPE ".*qerr\.tmp"/],
  ['appends stderr to errors log', /TYPE ".*qerr\.tmp" >> ".*collection_errors\.log"/],
  ['deletes temp file', /DEL ".*qerr\.tmp"/],
  ['has authentication preflight', /PREFLIGHT_RC=%ERRORLEVEL%/],
  ['preflight aborts on failure', /EXIT \/B 1/],
  ['detects ANS1051I in CMD preflight', /FINDSTR.*ANS1051I.*preflight/i],
  ['detects ANS1051I per-query and aborts', /ANS1051_FATAL/],
];
for (const [desc, pattern] of cmdChecks) {
  if (pattern.test(cmdDoc)) {
    ok(`CMD: ${desc}`);
  } else {
    fail(`CMD: missing — ${desc} (pattern: ${pattern})`);
  }
}

// ─── 8. SH script content ────────────────────────────────────────────────────
section('8. Generated SH script diagnostic content');
const shChecks = [
  ['truncates log files at startup', /: > "\$LOGFILE"/],
  ['truncates error log at startup', /: > "\$ERRLOG"/],
  ['defines cleanup trap', /trap cleanup EXIT INT TERM/],
  ['cleanup trap handles PREFLIGHT_TMP', /rm -f "\$PREFLIGHT_TMP"/],
  ['defines run_query function', /^run_query\(\)/m],
  ['uses mktemp for temp file', /mktemp/],
  ['captures stderr to temp file', /2>"\$QTMP"/],
  ['tees stderr to console and errlog', /tee -a "\$ERRLOG" < "\$QTMP" >&2/],
  ['has [OK] status', /QSTATUS="\[OK\]"/],
  ['has [WARN] status', /QSTATUS="\[WARN\]"/],
  ['has [FAILED] status', /QSTATUS="\[FAILED\]"/],
  ['increments FAIL_COUNT', /FAIL_COUNT=\$\(\(FAIL_COUNT \+ 1\)\)/],
  ['increments PASS_COUNT', /PASS_COUNT=\$\(\(PASS_COUNT \+ 1\)\)/],
  ['appends status to logfile', />> "\$LOGFILE"/],
  ['appends context to errlog', />> "\$ERRLOG"/],
  ['removes temp file', /rm -f "\$QTMP"/],
  ['calls run_query for each query', /^run_query /m],
  ['prints final summary counts', /Passed:.*Warned:.*Failed:/],
  ['has authentication preflight before queries', /PREFLIGHT_TMP=.*mktemp/],
  ['preflight runs QUERY SESSION', /run_dsmadmc 'QUERY SESSION'/],
  ['preflight checks PREFLIGHT_RC', /PREFLIGHT_RC=\$\?/],
  ['preflight aborts with exit 1 on failure', /PREFLIGHT_RC.*-ne 0[\s\S]{0,600}exit 1/],
  ['ANS1051I fatal check inside run_query', /grep -qi 'ANS1051I' "\$QTMP"/],
];
for (const [desc, pattern] of shChecks) {
  if (pattern.test(shDoc)) {
    ok(`SH: ${desc}`);
  } else {
    fail(`SH: missing — ${desc} (pattern: ${pattern})`);
  }
}

// ─── 9. SH printf safety ─────────────────────────────────────────────────────
section('9. Generated SH printf safety');
// No printf format string may begin with a hyphen (would be misinterpreted as an option)
const unsafePrintf = /printf\s+'-[^']/;
if (unsafePrintf.test(shDoc)) {
  fail('SH: contains printf with format string beginning with a hyphen (unsafe — use printf \'%s\\n\' "..." instead)');
} else {
  ok('SH: no printf format string begins with a hyphen');
}
// The specific bad pattern from the bug report must not appear
const badPrintfPattern = /printf\s+'---/;
if (badPrintfPattern.test(shDoc)) {
  fail("SH: contains printf '--- (format string starting with --- — triggers 'invalid option' in bash/POSIX sh)");
} else {
  ok("SH: no printf '--- pattern (fixed: uses printf '%s\\n' \"--- ...\" instead)");
}

// ─── 10. XLSX sheet section coverage ─────────────────────────────────────────
section('10. All query sections map to a known XLSX sheet');
const knownDocSections = new Set([
  'Server','Admins','Nodes','Filespaces','Occupancy','Policy','Schedules',
  'Storage','Volumes','Replication','DR','Advanced_v8','Scripts','Schema'
]);
const knownHcSections = new Set([
  'HC_Database','HC_Storage','HC_Schedules','HC_Nodes','HC_Activity','HC_Advanced'
]);
let unmappedSections = 0;
for (const q of DOC_QUERIES) {
  if (!knownDocSections.has(q.section)) {
    fail(`DOC query ${q.id} has unrecognised section: "${q.section}"`);
    unmappedSections++;
  }
}
for (const q of HEALTH_QUERIES) {
  if (!knownHcSections.has(q.section)) {
    fail(`HC query ${q.id} has unrecognised section: "${q.section}"`);
    unmappedSections++;
  }
}
if (unmappedSections === 0) ok('All query sections are mapped to XLSX sheets');

// ─── 11. RC translation tests ────────────────────────────────────────────────
section('11. RC translation in generated scripts');

// SH: rc_info function and case statement
const shRcChecks = [
  ['defines rc_info function',            /^rc_info\(\)/m],
  ['rc_info uses POSIX case statement',   /case "\$1" in/],
  ['rc_info maps 0 to RC_OK (OK)',        /0\).*RC_SYM="RC_OK".*RC_SEV="OK"/],
  ['rc_info maps 3 to RC_SYNTAX (FAIL)',  /3\).*RC_SYM="RC_SYNTAX".*RC_SEV="FAIL"/],
  ['rc_info maps 11 to RC_NOTFOUND (WARN)', /11\).*RC_SYM="RC_NOTFOUND".*RC_SEV="WARN"/],
  ['rc_info maps 28 to RC_NOTABLE (FAIL)', /28\).*RC_SYM="RC_NOTABLE".*RC_SEV="FAIL"/],
  ['rc_info maps 35 to RC_CANCELED (WARN)', /35\).*RC_SYM="RC_CANCELED".*RC_SEV="WARN"/],
  ['rc_info maps 137 to DSM_RC_AUTH_FAILURE', /137\).*RC_SYM="DSM_RC_AUTH_FAILURE"/],
  ['rc_info maps unknown to RC_UNKNOWN_VALUE', /\*\).*RC_SYM="RC_UNKNOWN_VALUE"/],
  ['run_query calls rc_info',             /rc_info "\$QRC"/],
  ['run_query uses RC_SEV for WARN',      /\[ "\$RC_SEV" = "WARN" \]/],
  ['run_query shows RC_SYM in output',    /echo.*\$RC_SYM/],
  ['run_query log includes RC_SYM',       /\$LOGFILE.*\$RC_SYM|\$RC_SYM.*\$LOGFILE/],
  ['counter uses QSTATUS not QRC',        /QSTATUS.*\[FAILED\].*FAIL_COUNT|\[ "\$QSTATUS" = "\[FAILED\]" \]/],
  ['preflight calls rc_info',             /rc_info "\$PREFLIGHT_RC"/],
];
for (const [desc, pattern] of shRcChecks) {
  if (pattern.test(shDoc)) {
    ok(`SH: ${desc}`);
  } else {
    fail(`SH: missing — ${desc} (pattern: ${pattern})`);
  }
}

// CMD: :RCInfo subroutine and per-query integration
const cmdRcChecks = [
  ['defines :RCInfo subroutine',           /^:RCInfo$/m],
  ['RCInfo maps 0 to RC_OK (OK)',          /"0".*RC_OK.*RC_SEV.*OK/],
  ['RCInfo maps 3 to RC_SYNTAX',           /"3".*RC_SYNTAX/],
  ['RCInfo maps 11 to RC_NOTFOUND (WARN)', /"11".*RC_NOTFOUND.*RC_SEV.*WARN/],
  ['RCInfo maps 28 to RC_NOTABLE',         /"28".*RC_NOTABLE/],
  ['RCInfo maps 35 to RC_CANCELED (WARN)', /"35".*RC_CANCELED.*RC_SEV.*WARN/],
  ['RCInfo maps 137 to DSM_RC_AUTH_FAILURE', /"137".*DSM_RC_AUTH_FAILURE/],
  ['per-query CALL :RCInfo',               /CALL :RCInfo %QRC%/],
  ['per-query uses RC_SEV for WARN',       /RC_SEV.*WARN.*QSTATUS.*WARN/i],
  ['per-query shows RC_SYM in console',    /echo.*%RC_SYM%/],
  ['per-query log includes RC_SYM',        /%RC_SYM%.*collection_log/],
  ['tracks PASS_COUNT',                    /PASS_COUNT=0/],
  ['tracks WARN_COUNT',                    /WARN_COUNT=0/],
  ['tracks FAIL_COUNT',                    /FAIL_COUNT=0/],
  ['increments PASS_COUNT per query',      /PASS_COUNT\+=1/],
  ['increments WARN_COUNT per query',      /WARN_COUNT\+=1/],
  ['increments FAIL_COUNT per query',      /FAIL_COUNT\+=1/],
  ['summary shows Passed/Warned/Failed',   /Passed:.*PASS_COUNT.*Warned:.*WARN_COUNT.*Failed:.*FAIL_COUNT/],
  ['preflight CALL :RCInfo',               /CALL :RCInfo %PREFLIGHT_RC%/],
];
for (const [desc, pattern] of cmdRcChecks) {
  if (pattern.test(cmdDoc)) {
    ok(`CMD: ${desc}`);
  } else {
    fail(`CMD: missing — ${desc} (pattern: ${pattern})`);
  }
}

// ─── Summary ──────────────────────────────────────────────────────────────────
console.log(`\n${'='.repeat(60)}`);
console.log(`Results: ${PASS} passed, ${FAIL} failed`);
if (FAIL > 0) {
  console.error('VALIDATION FAILED — see [FAIL] lines above');
  process.exit(1);
} else {
  console.log('VALIDATION PASSED');
  process.exit(0);
}
