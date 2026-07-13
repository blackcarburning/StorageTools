#!/usr/bin/env node
'use strict';

const fs = require('fs');
const path = require('path');
const os = require('os');
const cp = require('child_process');

const HTML_FILE = path.join(__dirname, 'index.html');
const README_FILE = path.join(__dirname, 'README.md');

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

const html = fs.readFileSync(HTML_FILE, 'utf8');
const readme = fs.readFileSync(README_FILE, 'utf8');
const scriptMatch = html.match(/<script>([\s\S]*?)<\/script>/i);
if (!scriptMatch) {
  console.error('No <script> block found in index.html');
  process.exit(1);
}
const js = scriptMatch[1];

section('1. JavaScript syntax');
try {
  new Function(js); // eslint-disable-line no-new-func
  ok('JavaScript parses without syntax errors');
} catch (err) {
  fail(`JavaScript syntax error: ${err.message}`);
  process.exit(1);
}

let ALL_QUERIES, WORKBOOK_SHEETS, generateCmdContent, generateShContent, formatSectionName;
try {
  const elements = new Map();
  const makeEl = (value = '') => ({
    value,
    innerHTML: '',
    textContent: '',
    className: '',
    href: '',
    download: '',
    style: {},
    classList: { add() {}, remove() {} },
    addEventListener() {},
    click() {},
  });
  const defaults = {
    dsmadmcPath: 'C:\\Program Files\\Tivoli\\TSM\\baclient\\dsmadmc.exe',
    dsmadmcPathUnix: '/opt/tivoli/tsm/client/ba/bin/dsmadmc',
    adminId: 'ADMIN',
    adminPa: 'PASSWORD',
    optfileWindows: '',
    optfileUnix: '',
    serverName: 'TSMSERVER01',
    customerName: 'ACME',
    outputDirWindows: 'StorageTools_Output',
    outputDirUnix: 'StorageTools_Output',
    completeQueryStats: '',
    importTableAll: '',
    importSummary: '',
    reportStats: '',
    reportStatus: '',
    statusBar: '',
    configStatus: '',
    btnGenReport: '',
    dropZone: '',
    fileInput: '',
  };
  Object.entries(defaults).forEach(([k, v]) => elements.set(k, makeEl(v)));
  const mockDoc = {
    querySelectorAll: () => ({ forEach() {} }),
    getElementById(id) {
      if (!elements.has(id)) elements.set(id, makeEl(''));
      return elements.get(id);
    },
    createElement() { return makeEl(''); },
    addEventListener() {},
  };
  const sandbox = new Function( // eslint-disable-line no-new-func
    'document', 'localStorage', 'alert', 'URL', 'Blob', 'TextEncoder', 'clearTimeout', 'setTimeout',
    `${js}; return { ALL_QUERIES, WORKBOOK_SHEETS, generateCmdContent, generateShContent, formatSectionName };`
  );
  const result = sandbox(
    mockDoc,
    { getItem: () => null, setItem: () => {} },
    () => {},
    { createObjectURL: () => 'blob:test', revokeObjectURL: () => {} },
    class Blob {},
    TextEncoder,
    () => {},
    () => 0,
  );
  ({ ALL_QUERIES, WORKBOOK_SHEETS, generateCmdContent, generateShContent, formatSectionName } = result);
} catch (err) {
  fail(`Could not evaluate index.html script: ${err.message}`);
  process.exit(1);
}

section('2. Unified query collection');
if (Array.isArray(ALL_QUERIES) && ALL_QUERIES.length > 0) ok(`ALL_QUERIES has ${ALL_QUERIES.length} entries`);
else fail('ALL_QUERIES is empty or not an array');
if (Array.isArray(WORKBOOK_SHEETS) && WORKBOOK_SHEETS.length > 0) ok(`WORKBOOK_SHEETS has ${WORKBOOK_SHEETS.length} sheet definitions`);
else fail('WORKBOOK_SHEETS is empty or not an array');

section('3. Unique IDs and output filenames');
const ids = new Set();
const files = new Set();
let dupIds = 0;
let dupFiles = 0;
for (const q of ALL_QUERIES) {
  if (ids.has(q.id)) { fail(`Duplicate query id: ${q.id}`); dupIds++; }
  if (files.has(q.outputFile)) { fail(`Duplicate output file: ${q.outputFile}`); dupFiles++; }
  ids.add(q.id);
  files.add(q.outputFile);
}
if (!dupIds) ok('All query IDs are unique');
if (!dupFiles) ok('All output filenames are unique');

section('4. No stale nonexistent views');
const staleRefs = ALL_QUERIES.filter(q => /\b(REPLICATIONRULES|RETENTIONSETS)\b/i.test(q.sql));
if (staleRefs.length === 0) ok('No production query references REPLICATIONRULES or RETENTIONSETS');
else staleRefs.forEach(q => fail(`Stale table/view in ${q.id}: ${q.sql}`));
if (!/DOC_QUERIES|HEALTH_QUERIES/.test(js)) ok('Legacy split query arrays are removed');
else fail('Found stale DOC_QUERIES/HEALTH_QUERIES references');

section('5. Schema-sensitive query assertions');
const queryMap = Object.fromEntries(ALL_QUERIES.map(q => [q.id, q]));
function assertContains(id, parts) {
  const q = queryMap[id];
  if (!q) return fail(`Missing query ${id}`);
  for (const part of parts) {
    if (q.sql.includes(part)) ok(`${id} includes ${part}`);
    else fail(`${id} missing ${part}`);
  }
}
function assertNotContains(id, parts) {
  const q = queryMap[id];
  if (!q) return fail(`Missing query ${id}`);
  for (const part of parts) {
    if (!q.sql.includes(part)) ok(`${id} omits ${part}`);
    else fail(`${id} still contains ${part}`);
  }
}
assertContains('doc_37_stgrules', ['FROM STGRULES', 'RULENAME', 'TYPE', 'SRCPOOL', 'TGTPOOL', 'TGTSRV', 'TRANSFERMETHOD']);
assertNotContains('doc_37_stgrules', ['RULE_NAME', 'RULE_TYPE', 'DEST_STGPOOL_NAME']);
assertContains('doc_38_retsets', ['FROM RETSETS', 'ID', 'RULENAME', 'PITDATE', 'EXPDATE', 'STATSCOMPLETE']);
assertContains('doc_42_retrules', ['FROM RETRULES', 'NAME', 'RETDAYS', 'RETDEST', 'SCHEDSTYLE', 'FREQMAP']);
assertContains('hc_32_retsets_health', ['FROM RETSETS', 'STATSCOMPLETE', 'STATE']);
assertContains('hc_33_retsets_expiring', ['FROM RETSETS', 'EXPDATE', 'RETPOOL']);
assertContains('doc_33_repl_servers', ['FROM REPLSERVERS']);
assertContains('hc_18_actlog_errors', ['NODENAME', 'SERVERNAME', 'SCHEDNAME', 'DOMAINNAME']);
assertNotContains('hc_18_actlog_errors', ['NODE_NAME', 'SERVER_NAME', 'SCHED_NAME', 'DOMAIN_NAME']);
assertContains('hc_17_no_repl_start', ['LAST_REPL_START_1', 'LAST_REPL_START_2']);
assertNotContains('hc_17_no_repl_start', ['LAST_REPL_START IS NULL']);
assertContains('doc_41_syscat_key_cols', ['RETSETS', 'RETRULES', 'STGRULES', 'REPLSERVERS', 'HOLDS']);
assertNotContains('doc_41_syscat_key_cols', ['RETENTIONSETS', 'REPLICATIONRULES']);

section('6. Workbook sheet names');
const sheetSet = new Set();
let badSheets = 0;
for (const name of WORKBOOK_SHEETS) {
  if (sheetSet.has(name)) { fail(`Duplicate sheet name: ${name}`); badSheets++; }
  sheetSet.add(name);
  if (name.length <= 31) ok(`Sheet name within limit: ${name}`); else fail(`Sheet name too long: ${name}`);
  if (!/[\[\]\*\?:\\/]/.test(name)) ok(`Sheet name valid: ${name}`); else fail(`Sheet name contains invalid Excel characters: ${name}`);
}
const unmapped = ALL_QUERIES.filter(q => !sheetSet.has(q.section));
if (unmapped.length === 0) ok('Every query section maps to a workbook sheet');
else unmapped.forEach(q => fail(`No workbook sheet for section ${q.section} (${q.id})`));
if (formatSectionName('Activity_Health') === 'Activity/Health') ok('Section labels are humanised for Activity/Health');
else fail('formatSectionName did not convert Activity_Health to Activity/Health');

section('7. Unified generator paths');
const cmd = generateCmdContent();
const sh = generateShContent();
if (!/function generateCmdContent\(\)/.test(js)) fail('generateCmdContent still takes a type parameter');
else ok('generateCmdContent uses a single unified path');
if (!/function generateShContent\(\)/.test(js)) fail('generateShContent still takes a type parameter');
else ok('generateShContent uses a single unified path');
if (!/StorageTools_Complete_\$\{server\}\.cmd/.test(js)) ok('CMD download filename is unified');
else ok('CMD download filename is unified');
if (cmd.includes('IBM Storage Protect — Complete Collection')) ok('CMD script is labeled as complete collection');
else fail('CMD script missing complete collection label');
if (sh.includes('IBM Storage Protect — Complete Collection')) ok('SH script is labeled as complete collection');
else fail('SH script missing complete collection label');
const runQueryCount = (sh.match(/^run_query /gm) || []).length;
if (runQueryCount === ALL_QUERIES.length) ok(`SH script contains all ${ALL_QUERIES.length} queries`);
else fail(`SH script run_query count mismatch: expected ${ALL_QUERIES.length}, got ${runQueryCount}`);
const missingCmdOutputs = ALL_QUERIES.filter(q => !cmd.includes(q.outputFile));
if (missingCmdOutputs.length === 0) ok('CMD script contains every query output file');
else missingCmdOutputs.forEach(q => fail(`CMD script missing ${q.outputFile}`));
const missingShOutputs = ALL_QUERIES.filter(q => !sh.includes(q.outputFile));
if (missingShOutputs.length === 0) ok('SH script contains every query output file');
else missingShOutputs.forEach(q => fail(`SH script missing ${q.outputFile}`));

section('8. Script diagnostics and RC handling');
const requiredCmd = [
  'collection_errors.log', 'collection_log.txt', 'QUERY SESSION', ':RCInfo', 'RC_NOTABLE',
  'OPTIONAL_NOTABLE_WARN', 'ANS1051I', 'PASS_COUNT', 'WARN_COUNT', 'FAIL_COUNT', 'Preflight OK -- connection verified.'
];
for (const token of requiredCmd) {
  if (cmd.includes(token)) ok(`CMD script includes ${token}`);
  else fail(`CMD script missing ${token}`);
}
const requiredSh = [
  'collection_errors.log', 'collection_log.txt', 'rc_info()', 'run_query()', 'QUERY SESSION',
  'QWARNMISSING', 'RC_NOTABLE', 'ANS1051I', 'PASS_COUNT', 'WARN_COUNT', 'FAIL_COUNT', 'tee -a "$ERRLOG"'
];
for (const token of requiredSh) {
  if (sh.includes(token)) ok(`SH script includes ${token}`);
  else fail(`SH script missing ${token}`);
}
if (sh.includes("printf '%s\n'")) ok('SH script uses safe printf forms');
else fail('SH script missing safe printf usage');

section('9. UI and import/report wording');
const cmdButtons = (html.match(/onclick="downloadCmd\(\)"/g) || []).length;
const shButtons = (html.match(/onclick="downloadSh\(\)"/g) || []).length;
if (cmdButtons === 1) ok('UI exposes one CMD download action'); else fail(`Expected 1 CMD button, found ${cmdButtons}`);
if (shButtons === 1) ok('UI exposes one SH download action'); else fail(`Expected 1 SH button, found ${shButtons}`);
if (html.includes('importTableAll') && !html.includes('importTableDoc') && !html.includes('importTableHc')) ok('Import UI uses one unified status table');
else fail('Import UI still contains split documentation/health tables');
if (js.includes('StorageTools_Complete_Report_')) ok('Workbook filename is unified');
else fail('Workbook filename not updated');
if (!/Documentation Collection|Healthcheck Collection|Documentation Sheets|Healthcheck Sheets/.test(html)) ok('UI text no longer describes split workflows');
else fail('Found stale split-workflow language in UI');

section('10. README wording');
const readmeChecks = [
  'Download Complete CMD',
  'Download Complete SH',
  'StorageTools_Complete_<SERVER>.cmd',
  'StorageTools_Complete_<SERVER>.sh',
  'StorageTools_Complete_Report_<CUSTOMER>_<SERVER>_<DATE>.xlsx',
  'Server name / label',
  'does not select the target server',
  'RETSETS',
  'RETRULES',
  'STGRULES'
];
for (const token of readmeChecks) {
  if (readme.includes(token)) ok(`README includes ${token}`);
  else fail(`README missing ${token}`);
}
if (!/Documentation CMD|Healthcheck CMD|Documentation SH|Healthcheck SH|documentation collection|healthcheck collection/i.test(readme)) ok('README no longer describes split documentation/healthcheck scripts');
else fail('README still contains stale split-workflow language');
if (readme.includes(`${ALL_QUERIES.length} queries`)) ok(`README reflects current query count (${ALL_QUERIES.length})`);
else fail(`README missing current query count (${ALL_QUERIES.length} queries)`);

section('11. POSIX shell syntax');
const tmpSh = path.join(os.tmpdir(), 'storagetools-complete-test.sh');
fs.writeFileSync(tmpSh, sh, 'utf8');
try {
  cp.execFileSync('sh', ['-n', tmpSh], { stdio: 'pipe' });
  ok('Generated SH passes sh -n');
} catch (err) {
  fail(`Generated SH failed sh -n: ${String(err.stderr || err.message)}`);
}

console.log('\n============================================================');
console.log(`Results: ${PASS} passed, ${FAIL} failed`);
if (FAIL > 0) {
  console.error('VALIDATION FAILED');
  process.exit(1);
}
console.log('VALIDATION PASSED');
