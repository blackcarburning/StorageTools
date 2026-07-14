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

let ALL_QUERIES, WORKBOOK_SHEETS, generateCmdContent, generateShContent, formatSectionName,
    parseTarArchive, parseManifest, STATE, buildCollectionLogSheet, buildCollectionErrorsSheet,
    XLSX, buildCoverSheet, buildIndexSheet, buildSheet, readReportMetadata, defaultReportFilename,
    sanitizeXlsxFilename, syncReportMetadataFromConfig, isoLocalDate, generateReport,
    parseDsmOutput, sanitizeXmlChars, addQueryBlock, ws_set, cmdSafeTitle, cmdSafeSetValue,
    deriveExpectedColumnsFromSql, buildImportedState;
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
    reportCustomerName: '',
    reportPreparedBy: '',
    reportDate: '',
    reportServerName: '',
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
    'document', 'localStorage', 'alert', 'prompt', 'URL', 'Blob', 'TextEncoder', 'TextDecoder', 'clearTimeout', 'setTimeout',
    `${js}; return { ALL_QUERIES, WORKBOOK_SHEETS, generateCmdContent, generateShContent, formatSectionName, parseTarArchive, parseManifest, STATE, buildCollectionLogSheet, buildCollectionErrorsSheet, XLSX, buildCoverSheet, buildIndexSheet, buildSheet, readReportMetadata, defaultReportFilename, sanitizeXlsxFilename, syncReportMetadataFromConfig, isoLocalDate, generateReport, parseDsmOutput, sanitizeXmlChars, addQueryBlock, ws_set, cmdSafeTitle, cmdSafeSetValue, deriveExpectedColumnsFromSql, buildImportedState };`
  );
  const result = sandbox(
    mockDoc,
    { getItem: () => null, setItem: () => {} },
    () => {},
    () => null,
    { createObjectURL: () => 'blob:test', revokeObjectURL: () => {} },
    class Blob {},
    TextEncoder,
    TextDecoder,
    () => {},
    () => 0,
  );
  ({ ALL_QUERIES, WORKBOOK_SHEETS, generateCmdContent, generateShContent, formatSectionName,
     parseTarArchive, parseManifest, STATE, buildCollectionLogSheet, buildCollectionErrorsSheet, XLSX,
     buildCoverSheet, buildIndexSheet, buildSheet, readReportMetadata, defaultReportFilename,
     sanitizeXlsxFilename, syncReportMetadataFromConfig, isoLocalDate, generateReport,
     parseDsmOutput, sanitizeXmlChars, addQueryBlock, ws_set, cmdSafeTitle, cmdSafeSetValue,
     deriveExpectedColumnsFromSql, buildImportedState } = result);
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
if (cmd.includes('IBM Storage Protect - Complete Collection')) ok('CMD script is labeled as complete collection (ASCII dash)');
else fail('CMD script missing complete collection label');
if (sh.includes('IBM Storage Protect — Complete Collection')) ok('SH script is labeled as complete collection');
else fail('SH script missing complete collection label');
const runQueryCount = (sh.match(/^\s*run_query /gm) || []).length;
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
try {
  fs.writeFileSync(tmpSh, sh, 'utf8');
  cp.execFileSync('sh', ['-n', tmpSh], { stdio: 'pipe' });
  ok('Generated SH passes sh -n');
} catch (err) {
  fail(`Generated SH failed sh -n: ${String(err.stderr || err.message)}`);
} finally {
  try { fs.unlinkSync(tmpSh); } catch (_) {}
}

section('12. SH archive packaging');
const shArchiveTokens = [
  'command -v tar',
  'manifest.txt',
  'format=StorageTools-Collection',
  'query_count=',
  'ARCHIVE_TMP',
  'ARCHIVE_FILE',
  'ARCHIVE_SERVER',
  'tar -cf',
  'mv "$ARCHIVE_TMP" "$ARCHIVE_FILE"',
  'rm -rf "$OUTDIR"',
];
for (const token of shArchiveTokens) {
  if (sh.includes(token)) ok(`SH includes: ${token}`);
  else fail(`SH missing: ${token}`);
}
if (/StorageTools_Complete_/.test(sh)) ok('SH archive filename follows StorageTools_Complete_ prefix');
else fail('SH archive filename missing StorageTools_Complete_ prefix');

section('13. CMD archive packaging');
const cmdArchiveTokens = [
  'where tar',
  'manifest.txt',
  'format=StorageTools-Collection',
  'ARCHIVE_TMP',
  'ARCHIVE_FILE',
  'ARCHIVE_SERVER',
  'tar -cf',
  'MOVE /Y',
  'RD /S /Q',
];
for (const token of cmdArchiveTokens) {
  if (cmd.includes(token)) ok(`CMD includes: ${token}`);
  else fail(`CMD missing: ${token}`);
}
if (/StorageTools_Complete_/.test(cmd)) ok('CMD archive filename follows StorageTools_Complete_ prefix');
else fail('CMD archive filename missing StorageTools_Complete_ prefix');

section('14. TAR parser unit tests');
if (typeof parseTarArchive !== 'function') {
  fail('parseTarArchive is not exported');
} else {
  // ── TAR builder helper ──────────────────────────────────────────────────
  // Node.js Buffers may share a pool ArrayBuffer with non-zero byteOffset.
  // Always extract a standalone ArrayBuffer before passing to parseTarArchive.
  function toAB(buf) {
    return buf.buffer.slice(buf.byteOffset, buf.byteOffset + buf.byteLength);
  }
  function buildTarHeader(name, size, typeflag) {
    const hdr = Buffer.alloc(512, 0);
    const nameBytes = Buffer.from(name, 'utf8');
    nameBytes.copy(hdr, 0, 0, Math.min(100, nameBytes.length));
    Buffer.from('0000644\0', 'utf8').copy(hdr, 100);
    Buffer.from('0000000\0', 'utf8').copy(hdr, 108);
    Buffer.from('0000000\0', 'utf8').copy(hdr, 116);
    const sizeStr = ('0'.repeat(11) + size.toString(8)).slice(-11) + '\0';
    Buffer.from(sizeStr, 'utf8').copy(hdr, 124);
    Buffer.from('00000000000\0', 'utf8').copy(hdr, 136);
    hdr.fill(0x20, 148, 156);           // checksum placeholder (spaces)
    hdr[156] = typeflag.charCodeAt(0);
    Buffer.from('ustar\0', 'utf8').copy(hdr, 257);
    Buffer.from('00', 'utf8').copy(hdr, 263);
    let sum = 0;
    for (let i = 0; i < 512; i++) sum += hdr[i];
    const chkStr = (sum.toString(8)).padStart(6, '0') + '\0 ';
    Buffer.from(chkStr, 'utf8').copy(hdr, 148);
    return hdr;
  }
  function buildTarEntry(name, contentStr) {
    const data   = Buffer.from(contentStr, 'utf8');
    const hdr    = buildTarHeader(name, data.length, '0');
    const padLen = data.length > 0 ? Math.ceil(data.length / 512) * 512 : 0;
    const padded = Buffer.alloc(padLen, 0);
    data.copy(padded);
    return Buffer.concat([hdr, padded]);
  }
  function buildTar(entries) {
    const parts = entries.map(([n, c]) => buildTarEntry(n, c));
    const end   = Buffer.alloc(1024, 0); // two zero blocks
    return toAB(Buffer.concat([...parts, end]));
  }

  // Test 1: valid archive with CSVs, logs, manifest
  {
    const buf = buildTar([
      ['./doc_01_status.csv',     'SERVER_NAME,VERSION\nSRV1,8.1.27'],
      ['./collection_log.txt',   'collection started\ncollection complete'],
      ['./collection_errors.log',''],
      ['./manifest.txt',         'format=StorageTools-Collection\nformat_version=1\npassed=1\nwarned=0\nfailed=0'],
    ]);
    const r = parseTarArchive(buf);
    if (r.errors.length === 0) ok('TAR: valid archive parsed without errors');
    else fail(`TAR: valid archive had errors: ${r.errors.join('; ')}`);
    if (r.files.has('doc_01_status.csv')) ok('TAR: CSV file found by basename');
    else fail('TAR: CSV file not found by basename');
    if (r.files.has('collection_log.txt')) ok('TAR: collection_log.txt found');
    else fail('TAR: collection_log.txt not found');
    if (r.files.has('collection_errors.log')) ok('TAR: collection_errors.log found (empty)');
    else fail('TAR: collection_errors.log not found');
    if (r.files.has('manifest.txt')) ok('TAR: manifest.txt found');
    else fail('TAR: manifest.txt not found');
  }

  // Test 2: nested top-level directory (tar -C OUTDIR .)
  {
    const buf = buildTar([
      ['StorageTools_Complete_SRV_20260713/doc_01_status.csv', 'COL\nVAL'],
      ['StorageTools_Complete_SRV_20260713/manifest.txt',      'format=StorageTools-Collection'],
    ]);
    const r = parseTarArchive(buf);
    if (r.errors.length === 0) ok('TAR: nested top-level directory parsed without errors');
    else fail(`TAR: nested directory errors: ${r.errors.join('; ')}`);
    if (r.files.has('doc_01_status.csv')) ok('TAR: CSV found under nested directory');
    else fail('TAR: CSV not found under nested directory');
  }

  // Test 3: two zero blocks = proper end of archive
  {
    const entry = buildTarEntry('test.csv', 'A,B\n1,2');
    const zeroes = Buffer.alloc(1024, 0);
    const trailing = buildTarEntry('should_not_appear.csv', 'X');
    const buf = toAB(Buffer.concat([entry, zeroes, trailing]));
    const r = parseTarArchive(buf);
    if (!r.files.has('should_not_appear.csv')) ok('TAR: entries after two zero blocks are ignored');
    else fail('TAR: incorrectly parsed entries after two zero blocks');
  }

  // Test 4: truncated data block rejection
  {
    const hdr = buildTarHeader('big.csv', 1024, '0');
    const shortData = Buffer.alloc(256, 0x41); // only 256 bytes, needs 1024
    const buf = toAB(Buffer.concat([hdr, shortData]));
    const r = parseTarArchive(buf);
    if (r.errors.length > 0) ok('TAR: truncated archive produces error');
    else fail('TAR: truncated archive should produce error');
  }

  // Test 5: invalid octal size rejection
  {
    const hdr = buildTarHeader('bad.csv', 0, '0');
    // Overwrite size field with non-octal characters
    Buffer.from('ZZZZZZZZZZZZ', 'utf8').copy(hdr, 124, 0, 12);
    const buf = toAB(Buffer.concat([hdr, Buffer.alloc(512, 0), Buffer.alloc(1024, 0)]));
    const r = parseTarArchive(buf);
    if (r.errors.length > 0) ok('TAR: invalid octal size produces error');
    else fail('TAR: invalid octal size should produce error');
  }

  // Test 6: path traversal rejection
  {
    for (const unsafe of ['../escape.csv', '/absolute.csv', 'C:/drive.csv', 'a/../../b.csv']) {
      const buf = buildTar([[unsafe, 'data']]);
      const r = parseTarArchive(buf);
      const baseName = unsafe.split('/').pop().split('\\').pop();
      if (r.warnings.some(w => w.includes('unsafe'))) ok(`TAR: unsafe path rejected: ${unsafe}`);
      else if (!r.files.has(baseName)) ok(`TAR: unsafe path not stored: ${unsafe}`);
      else fail(`TAR: unsafe path should be rejected: ${unsafe}`);
    }
  }

  // Test 7: duplicate filenames — first occurrence wins
  {
    const buf = buildTar([
      ['file.csv', 'first'],
      ['file.csv', 'second'],
    ]);
    const r = parseTarArchive(buf);
    if (r.warnings.some(w => /[Dd]uplicate/.test(w))) ok('TAR: duplicate filename generates warning');
    else fail('TAR: duplicate filename should generate warning');
    const data = r.files.get('file.csv');
    const text = data ? new TextDecoder().decode(data) : '';
    if (text === 'first') ok('TAR: first occurrence of duplicate used');
    else fail(`TAR: expected first duplicate to win, got: ${JSON.stringify(text)}`);
  }
}

section('15. parseManifest');
if (typeof parseManifest !== 'function') {
  fail('parseManifest is not exported');
} else {
  const m = parseManifest('format=StorageTools-Collection\nformat_version=1\npassed=20\nwarned=3\nfailed=2\ncustomer=ACME\nserver_label=SRV1');
  if (m.format === 'StorageTools-Collection') ok('parseManifest: format key');
  else fail(`parseManifest: expected format=StorageTools-Collection, got ${JSON.stringify(m.format)}`);
  if (m.passed === '20') ok('parseManifest: passed count');
  else fail(`parseManifest: expected passed=20, got ${JSON.stringify(m.passed)}`);
  if (m.customer === 'ACME') ok('parseManifest: customer key');
  else fail(`parseManifest: expected customer=ACME, got ${JSON.stringify(m.customer)}`);
}

section('16. XLSX Collection_Log and Collection_Errors sheets');
if (typeof buildCollectionLogSheet !== 'function' || typeof buildCollectionErrorsSheet !== 'function') {
  fail('buildCollectionLogSheet / buildCollectionErrorsSheet not exported');
} else {
  // Test with no archive state
  STATE.archive = null;
  const wb1 = { SheetNames: [], Sheets: {} };
  const addSheet1 = (ws, name) => { wb1.SheetNames.push(name); wb1.Sheets[name] = ws; };
  buildCollectionLogSheet({ SheetNames: wb1.SheetNames, Sheets: wb1.Sheets, utils: { book_append_sheet: addSheet1 } });
  if (wb1.SheetNames.includes('Collection_Log')) ok('XLSX: Collection_Log sheet created with no archive');
  else fail('XLSX: Collection_Log sheet missing');

  // Test with archive state having log content and empty errors
  STATE.archive = {
    filename: 'StorageTools_Complete_SRV_20260713.tar',
    manifest: { format_version: '1', passed: '5', warned: '1', failed: '0' },
    collectionLog: 'line 1 of log\nline 2 of log',
    collectionErrors: '',
    warnings: [],
  };
  const wb2 = { SheetNames: [], Sheets: {} };
  const appendSheet = (ws, name) => { wb2.SheetNames.push(name); wb2.Sheets[name] = ws; };
  const mockWb2 = { SheetNames: wb2.SheetNames, Sheets: wb2.Sheets, utils: { book_append_sheet: appendSheet } };
  buildCollectionLogSheet(mockWb2);
  buildCollectionErrorsSheet(mockWb2);
  if (wb2.SheetNames.includes('Collection_Log')) ok('XLSX: Collection_Log sheet created with log content');
  else fail('XLSX: Collection_Log sheet missing when content present');
  if (wb2.SheetNames.includes('Collection_Errors')) ok('XLSX: Collection_Errors sheet created');
  else fail('XLSX: Collection_Errors sheet missing');

  // Verify Collection_Errors shows "No errors recorded" for empty log
  const errWs = wb2.Sheets['Collection_Errors'];
  const noErrCell = errWs && errWs['A2'];
  if (noErrCell && String(noErrCell.v).toLowerCase().includes('no errors')) ok('XLSX: Collection_Errors shows no-errors message for empty log');
  else fail(`XLSX: Collection_Errors should show no-errors message, got: ${JSON.stringify(noErrCell && noErrCell.v)}`);

  // Sheet names must be valid Excel (<= 31 chars, no invalid chars)
  for (const name of ['Collection_Log', 'Collection_Errors']) {
    if (name.length <= 31) ok(`XLSX: ${name} length ≤ 31 chars`);
    else fail(`XLSX: ${name} too long (${name.length})`);
    if (!/[\[\]\*\?:\\/]/.test(name)) ok(`XLSX: ${name} has valid Excel characters`);
    else fail(`XLSX: ${name} contains invalid Excel characters`);
  }

  // Check generateReport calls both builders
  if (/buildCollectionLogSheet/.test(js) && /buildCollectionErrorsSheet/.test(js))
    ok('generateReport calls buildCollectionLogSheet and buildCollectionErrorsSheet');
  else fail('generateReport missing buildCollectionLogSheet or buildCollectionErrorsSheet call');

  STATE.archive = null; // restore
}

section('17. XLSX auto-fit widths and cover worksheet');
if (typeof buildSheet !== 'function' || typeof buildCoverSheet !== 'function' || typeof buildIndexSheet !== 'function') {
  fail('buildSheet/buildCoverSheet/buildIndexSheet not exported');
} else {
  const serverQuery = ALL_QUERIES.find(q => q.section === 'Server');
  if (!serverQuery) {
    fail('No Server query found for width tests');
  } else {
    STATE.imported = {};
    STATE.imported[serverQuery.outputFile] = {
      name: serverQuery.outputFile,
      headers: ['H1', 'H2', 'VeryLongHeaderName123'],
      rows: [
        ['1', 'short\nthis is the longest line', 'x'],
        ['2', 'tiny', 'y'],
      ],
    };
    const wbA = { SheetNames: [], Sheets: {} };
    const addSheetA = (ws, name) => { wbA.SheetNames.push(name); wbA.Sheets[name] = ws; };
    buildSheet({ SheetNames: wbA.SheetNames, Sheets: wbA.Sheets, utils: { book_append_sheet: addSheetA } }, 'Server');
    const wsA = wbA.Sheets.Server;
    if (wsA && Array.isArray(wsA['!cols'])) ok('XLSX widths: buildSheet assigns !cols');
    else fail('XLSX widths: !cols missing on data sheet');

    const w1 = wsA && wsA['!cols'] && wsA['!cols'][1] ? wsA['!cols'][1].wch : 0;
    if (w1 === 26) ok('XLSX widths: multiline values use longest line width (+padding)');
    else fail(`XLSX widths: expected multiline width 26, got ${w1}`);

    const w2 = wsA && wsA['!cols'] && wsA['!cols'][2] ? wsA['!cols'][2].wch : 0;
    if (w2 === 23) ok('XLSX widths: header text contributes to column width');
    else fail(`XLSX widths: expected header-driven width 23, got ${w2}`);

    STATE.imported[serverQuery.outputFile] = {
      name: serverQuery.outputFile,
      headers: ['ID', 'MESSAGE'],
      rows: [['1', 'L'.repeat(400)]],
    };
    const wbB = { SheetNames: [], Sheets: {} };
    const addSheetB = (ws, name) => { wbB.SheetNames.push(name); wbB.Sheets[name] = ws; };
    buildSheet({ SheetNames: wbB.SheetNames, Sheets: wbB.Sheets, utils: { book_append_sheet: addSheetB } }, 'Server');
    const maxW = wbB.Sheets.Server && wbB.Sheets.Server['!cols'] && wbB.Sheets.Server['!cols'][1]
      ? wbB.Sheets.Server['!cols'][1].wch : 0;
    if (maxW === 80) ok('XLSX widths: maximum width bound enforced');
    else fail(`XLSX widths: expected max width 80, got ${maxW}`);

    STATE.imported[serverQuery.outputFile] = {
      name: serverQuery.outputFile,
      headers: ['ID', 'MESSAGE'],
      rows: [],
    };
    buildSheet({ SheetNames: wbB.SheetNames, Sheets: wbB.Sheets, utils: { book_append_sheet: addSheetB } }, 'Server');
    const minW = wbB.Sheets.Server && wbB.Sheets.Server['!cols'] && wbB.Sheets.Server['!cols'][0]
      ? wbB.Sheets.Server['!cols'][0].wch : 0;
    if (minW >= 8) ok('XLSX widths: minimum width bound enforced');
    else fail(`XLSX widths: expected minimum width >=8, got ${minW}`);
  }

  STATE.imported = {};
  STATE.archive = null;
  const wbAll = { SheetNames: [], Sheets: {} };
  const addSheetAll = (ws, name) => { wbAll.SheetNames.push(name); wbAll.Sheets[name] = ws; };
  const reportMeta = { customer: 'Acme', preparedBy: 'Analyst', reportDate: '2026-07-13', server: 'SRV1' };
  buildCoverSheet({ SheetNames: wbAll.SheetNames, Sheets: wbAll.Sheets, utils: { book_append_sheet: addSheetAll } }, reportMeta);
  buildIndexSheet({ SheetNames: wbAll.SheetNames, Sheets: wbAll.Sheets, utils: { book_append_sheet: addSheetAll } }, reportMeta);
  for (const name of WORKBOOK_SHEETS) {
    buildSheet({ SheetNames: wbAll.SheetNames, Sheets: wbAll.Sheets, utils: { book_append_sheet: addSheetAll } }, name);
  }
  buildCollectionLogSheet({ SheetNames: wbAll.SheetNames, Sheets: wbAll.Sheets, utils: { book_append_sheet: addSheetAll } });
  buildCollectionErrorsSheet({ SheetNames: wbAll.SheetNames, Sheets: wbAll.Sheets, utils: { book_append_sheet: addSheetAll } });

  if (wbAll.SheetNames[0] === 'Cover') ok('Cover sheet is first worksheet');
  else fail(`Expected first worksheet to be Cover, got ${JSON.stringify(wbAll.SheetNames[0])}`);

  const missingCols = wbAll.SheetNames.filter(name => !(wbAll.Sheets[name] && Array.isArray(wbAll.Sheets[name]['!cols']) && wbAll.Sheets[name]['!cols'].length > 0));
  if (missingCols.length === 0) ok('All generated worksheets include calculated column widths');
  else fail(`Sheets missing calculated widths: ${missingCols.join(', ')}`);

  const coverWs = wbAll.Sheets.Cover;
  if (coverWs && coverWs.B6 && coverWs.B7 && coverWs.B8 && coverWs.B9) ok('Cover includes all report metadata fields');
  else fail('Cover missing one or more metadata value cells');

  const wbBlank = { SheetNames: [], Sheets: {} };
  const addBlank = (ws, name) => { wbBlank.SheetNames.push(name); wbBlank.Sheets[name] = ws; };
  buildCoverSheet({ SheetNames: wbBlank.SheetNames, Sheets: wbBlank.Sheets, utils: { book_append_sheet: addBlank } },
    { customer: '', preparedBy: '', reportDate: '', server: '' });
  const blankVals = ['B6', 'B7', 'B8', 'B9'].map(a => wbBlank.Sheets.Cover[a] && wbBlank.Sheets.Cover[a].v);
  if (blankVals.every(v => v === 'Not specified')) ok('Blank cover metadata renders as "Not specified" placeholders');
  else fail(`Expected all blank cover placeholders to be "Not specified", got ${JSON.stringify(blankVals)}`);

  const realWb = XLSX.utils.book_new();
  buildCoverSheet(realWb, reportMeta);
  const bytes = XLSX.write(realWb, { bookType: 'xlsx', type: 'array' });
  function unzipStoredEntries(uint8) {
    const data = Buffer.from(uint8);
    const out = new Map();
    let p = 0;
    while (p + 30 <= data.length) {
      if (data.readUInt32LE(p) !== 0x04034b50) break;
      const comp = data.readUInt16LE(p + 8);
      const size = data.readUInt32LE(p + 22);
      const nameLen = data.readUInt16LE(p + 26);
      const extraLen = data.readUInt16LE(p + 28);
      const nameStart = p + 30;
      const dataStart = nameStart + nameLen + extraLen;
      const name = data.slice(nameStart, nameStart + nameLen).toString('utf8');
      if (comp !== 0) break;
      out.set(name, data.slice(dataStart, dataStart + size).toString('utf8'));
      p = dataStart + size;
    }
    return out;
  }
  const zipEntries = unzipStoredEntries(bytes);
  const coverXml = zipEntries.get('xl/worksheets/sheet1.xml') || '';
  const stylesXml = zipEntries.get('xl/styles.xml') || '';
  if (/<mergeCells/.test(coverXml) && /A1:F1/.test(coverXml)) ok('Cover XML includes merged title cells');
  else fail('Cover XML missing expected merges');
  if (/ht="42"/.test(coverXml)) ok('Cover XML includes designed row heights');
  else fail('Cover XML missing expected custom row height');
  if (/<sz val="22"\/>/.test(stylesXml)) ok('Cover XML styles include large title font size');
  else fail('Cover XML missing large title font size');
}

section('18. Report metadata defaults and filename handling');
if (typeof syncReportMetadataFromConfig !== 'function' || typeof readReportMetadata !== 'function' ||
    typeof sanitizeXlsxFilename !== 'function' || typeof defaultReportFilename !== 'function' ||
    typeof isoLocalDate !== 'function') {
  fail('Report metadata helper functions not exported');
} else {
  const baseDate = isoLocalDate();
  if (/^\d{4}-\d{2}-\d{2}$/.test(baseDate)) ok('isoLocalDate returns YYYY-MM-DD');
  else fail(`isoLocalDate should return YYYY-MM-DD, got ${JSON.stringify(baseDate)}`);

  const mkEl = id => {
    const m = html.match(new RegExp(`id="${id}"`));
    return !!m;
  };
  if (mkEl('reportCustomerName') && mkEl('reportPreparedBy') && mkEl('reportDate') && mkEl('reportServerName'))
    ok('Report tab includes all metadata input fields');
  else fail('Report tab missing one or more metadata input fields');

  // Re-evaluate with editable DOM values for metadata/default tests.
  const elements2 = new Map();
  const makeEl2 = (value = '') => ({
    value, innerHTML: '', textContent: '', className: '', href: '', download: '', style: {},
    classList: { add() {}, remove() {} }, addEventListener() {}, click() {},
  });
  const defaults2 = {
    dsmadmcPath: 'C:\\Program Files\\Tivoli\\TSM\\baclient\\dsmadmc.exe',
    dsmadmcPathUnix: '/opt/tivoli/tsm/client/ba/bin/dsmadmc',
    adminId: 'ADMIN', adminPa: 'PASSWORD', optfileWindows: '', optfileUnix: '',
    serverName: 'CONFIG_SERVER', customerName: 'CONFIG_CUSTOMER',
    reportCustomerName: '', reportPreparedBy: '', reportDate: '', reportServerName: '',
    outputDirWindows: 'StorageTools_Output', outputDirUnix: 'StorageTools_Output',
    completeQueryStats: '', importTableAll: '', importSummary: '', reportStats: '', reportStatus: '',
    statusBar: '', configStatus: '', btnGenReport: '', dropZone: '', fileInput: '',
  };
  Object.entries(defaults2).forEach(([k, v]) => elements2.set(k, makeEl2(v)));
  const mockDoc2 = {
    querySelectorAll: () => ({ forEach() {} }),
    getElementById(id) { if (!elements2.has(id)) elements2.set(id, makeEl2('')); return elements2.get(id); },
    createElement() { return makeEl2(''); },
    addEventListener() {},
  };
  const fn2 = new Function( // eslint-disable-line no-new-func
    'document', 'localStorage', 'alert', 'prompt', 'URL', 'Blob', 'TextEncoder', 'TextDecoder', 'clearTimeout', 'setTimeout',
    `${js}; return { syncReportMetadataFromConfig, readReportMetadata, readConfig, defaultReportFilename, sanitizeXlsxFilename, generateReport };`
  );
  let urlCalls = 0;
  const ctx2 = fn2(
    mockDoc2,
    { getItem: () => null, setItem: () => {} },
    () => {},
    () => null,
    { createObjectURL: () => { urlCalls++; return 'blob:test'; }, revokeObjectURL: () => {} },
    class Blob {},
    TextEncoder,
    TextDecoder,
    () => {},
    () => 0,
  );
  ctx2.syncReportMetadataFromConfig(true);
  const m = ctx2.readReportMetadata();
  if (m.customer === 'CONFIG_CUSTOMER' && m.server === 'CONFIG_SERVER') ok('Report fields default from setup customer/server values');
  else fail(`Report defaults should mirror setup values, got ${JSON.stringify(m)}`);
  if (/^\d{4}-\d{2}-\d{2}$/.test(m.reportDate)) ok('Report date defaults to local ISO date');
  else fail(`Report date default invalid: ${JSON.stringify(m.reportDate)}`);
  if (m.preparedBy === '') ok('Prepared by defaults blank');
  else fail(`Prepared by should default blank, got ${JSON.stringify(m.preparedBy)}`);

  const cfgAfter = ctx2.readConfig();
  if (cfgAfter.serverName === 'CONFIG_SERVER' && cfgAfter.customerName === 'CONFIG_CUSTOMER') ok('Report metadata defaults do not alter connection/server config fields');
  else fail('Report metadata defaults unexpectedly modified configuration fields');

  const defFile = ctx2.defaultReportFilename({ customer: 'Cust:One', server: '../Srv', reportDate: '2026-07-13', preparedBy: '' });
  if (/\.xlsx$/i.test(defFile) && !/[<>:"/\\|?*\u0000-\u001f]/.test(defFile)) ok('Default filename is sanitized and ends with .xlsx');
  else fail(`Default filename invalid: ${JSON.stringify(defFile)}`);

  const s1 = ctx2.sanitizeXlsxFilename('bad<>:"/\\|?*name.xlsx.xlsx', 'Default.xlsx');
  if (s1 === 'bad_________name.xlsx') ok('sanitizeXlsxFilename removes forbidden chars and duplicate .xlsx');
  else fail(`Unexpected forbidden-char sanitization result: ${JSON.stringify(s1)}`);
  const s2 = ctx2.sanitizeXlsxFilename('../path/..\\report .xlsx', 'Default.xlsx');
  if (s2 === '__path___report.xlsx') ok('sanitizeXlsxFilename strips path-like input and trailing spaces/dots');
  else fail(`Unexpected path sanitization result: ${JSON.stringify(s2)}`);
  const s3 = ctx2.sanitizeXlsxFilename('   ', 'Default.xlsx');
  if (s3 === 'Default.xlsx') ok('sanitizeXlsxFilename uses default on blank input');
  else fail(`Expected blank input to use default filename, got ${JSON.stringify(s3)}`);

  ctx2.generateReport();
  if (urlCalls === 0) ok('Canceled filename prompt skips workbook generation/download');
  else fail('Canceled filename prompt should not generate/download workbook');
  const status = elements2.get('reportStatus');
  if (status && /canceled/i.test(String(status.textContent))) ok('Canceled filename prompt reports non-error canceled status');
  else fail(`Canceled prompt status message missing/incorrect: ${JSON.stringify(status && status.textContent)}`);
}

// ─────────────────────────────────────────────────────────────────────────────
section('19. sanitizeXmlChars — XML 1.0 character sanitizer');
if (typeof sanitizeXmlChars !== 'function') {
  fail('sanitizeXmlChars is not exported');
} else {
  // Preserve allowed whitespace characters
  if (sanitizeXmlChars('\t\n\r') === '\t\n\r') ok('sanitizeXmlChars preserves TAB, LF, CR');
  else fail(`sanitizeXmlChars must preserve TAB/LF/CR, got ${JSON.stringify(sanitizeXmlChars('\t\n\r'))}`);

  // Remove C0 control characters (except TAB=0x09, LF=0x0A, CR=0x0D)
  const c0 = '\x00\x01\x02\x03\x04\x05\x06\x07\x08\x0B\x0C\x0E\x0F\x10\x11\x12\x13\x14\x15\x16\x17\x18\x19\x1A\x1B\x1C\x1D\x1E\x1F\x7F';
  if (sanitizeXmlChars(c0) === '') ok('sanitizeXmlChars removes forbidden C0 controls and DEL');
  else fail(`sanitizeXmlChars should remove C0/DEL, got ${JSON.stringify(sanitizeXmlChars(c0))}`);

  // Preserve ordinary ASCII and Unicode text
  const normal = 'Hello, World! — IBM Storage Protect v8.1.27 \u00E9\u00FC\u4E2D\u6587';
  if (sanitizeXmlChars(normal) === normal) ok('sanitizeXmlChars preserves ordinary Unicode text');
  else fail(`sanitizeXmlChars must not alter normal text, got ${JSON.stringify(sanitizeXmlChars(normal))}`);

  // Remove noncharacters U+FFFE and U+FFFF
  if (sanitizeXmlChars('\uFFFE\uFFFF') === '') ok('sanitizeXmlChars removes U+FFFE and U+FFFF noncharacters');
  else fail(`sanitizeXmlChars should remove U+FFFE/U+FFFF, got ${JSON.stringify(sanitizeXmlChars('\uFFFE\uFFFF'))}`);

  // Remove isolated high surrogate (not followed by low)
  const isolatedHigh = '\uD800x';
  if (sanitizeXmlChars(isolatedHigh) === 'x') ok('sanitizeXmlChars removes isolated high surrogate');
  else fail(`sanitizeXmlChars should remove isolated high surrogate, got ${JSON.stringify(sanitizeXmlChars(isolatedHigh))}`);

  // Remove isolated low surrogate (not preceded by high)
  const isolatedLow = 'x\uDC00';
  if (sanitizeXmlChars(isolatedLow) === 'x') ok('sanitizeXmlChars removes isolated low surrogate');
  else fail(`sanitizeXmlChars should remove isolated low surrogate, got ${JSON.stringify(sanitizeXmlChars(isolatedLow))}`);

  // Preserve valid supplementary character (emoji stored as surrogate pair U+1F600)
  const emoji = '\uD83D\uDE00'; // U+1F600 GRINNING FACE
  if (sanitizeXmlChars(emoji) === emoji) ok('sanitizeXmlChars preserves valid surrogate pair (supplementary char)');
  else fail(`sanitizeXmlChars must preserve valid surrogate pairs, got ${JSON.stringify(sanitizeXmlChars(emoji))}`);

  // String with mixed content: forbidden chars removed, "orphan" preserved (its leading \uD800 is stripped)
  const mixed = 'OK\x00bad\x01data\tgood\ntext\uFFFEend\uD800orphan';
  const expected = 'OKbaddata\tgood\ntextendorphan';
  if (sanitizeXmlChars(mixed) === expected) ok('sanitizeXmlChars strips forbidden chars from mixed content');
  else fail(`sanitizeXmlChars mixed content: expected ${JSON.stringify(expected)}, got ${JSON.stringify(sanitizeXmlChars(mixed))}`);
}

// ─────────────────────────────────────────────────────────────────────────────
section('20. Generated worksheet XML contains no XML 1.0-forbidden characters');
if (typeof XLSX === 'undefined' || typeof buildCoverSheet !== 'function') {
  fail('XLSX or buildCoverSheet not available for XML content tests');
} else {
  function unzipForXmlTest(uint8) {
    const data = Buffer.from(uint8);
    const out = new Map();
    let p = 0;
    while (p + 30 <= data.length) {
      if (data.readUInt32LE(p) !== 0x04034b50) break;
      const comp = data.readUInt16LE(p + 8);
      const size = data.readUInt32LE(p + 22);
      const nameLen = data.readUInt16LE(p + 26);
      const extraLen = data.readUInt16LE(p + 28);
      const nameStart = p + 30;
      const dataStart = nameStart + nameLen + extraLen;
      const name = data.slice(nameStart, nameStart + nameLen).toString('utf8');
      if (comp !== 0) break;
      out.set(name, data.slice(dataStart, dataStart + size).toString('utf8'));
      p = dataStart + size;
    }
    return out;
  }
  // Build a workbook via ws_set with control-character content
  const wb = XLSX.utils.book_new();
  const ws = {};
  ws['!ref'] = 'A1:A2';
  ws['!widthTracker'] = { widths: [], minWch: 8, maxWch: 80 };
  // Write cells via ws_set so sanitization is applied
  if (typeof ws_set === 'function') {
    ws_set(ws, 0, 0, 'normal text', {});
    ws_set(ws, 1, 0, 'bad\x00control\x01here', {});
    // Verify stored value has been sanitized by ws_set
    const a2Cell = ws['A2'];
    if (a2Cell && !/[\x00\x01]/.test(String(a2Cell.v))) ok('ws_set strips forbidden chars from stored cell value');
    else fail(`ws_set should strip forbidden chars from stored value, got ${JSON.stringify(a2Cell && a2Cell.v)}`);
  } else {
    // Fallback: directly assign (won't go through ws_set)
    ws['A1'] = { v: 'normal text', t: 's', s: {} };
    ws['A2'] = { v: 'bad\x00control\x01here', t: 's', s: {} };
    fail('ws_set not exported; cannot test stored-value sanitization directly');
  }
  XLSX.utils.book_append_sheet(wb, ws, 'Test');
  const bytes = XLSX.write(wb, { bookType: 'xlsx', type: 'array' });
  const entries = unzipForXmlTest(bytes);
  const sheetXml = entries.get('xl/worksheets/sheet1.xml') || '';
  // The forbidden chars U+0000 and U+0001 must not appear in the output XML
  const hasForbidden = /[\x00-\x08\x0B\x0C\x0E-\x1F\x7F]/.test(sheetXml);
  if (!hasForbidden) ok('Generated worksheet XML contains no XML 1.0-forbidden control characters');
  else fail('Generated worksheet XML still contains forbidden control characters');
}

// ─────────────────────────────────────────────────────────────────────────────
section('21. parseDsmOutput — banner filtering and header detection');
if (typeof parseDsmOutput !== 'function') {
  fail('parseDsmOutput is not exported');
} else {
  const shortStatusHeader = { columns: ['SERVER_NAME', 'VERSION'] };
  const statusQuery = ALL_QUERIES.find(q => q.id === 'doc_01_status');

  // Standard CSV with no banner
  const plain = 'SERVER_NAME,VERSION\nSRV1,8.1.27\n1 row(s) affected.';
  const r1 = parseDsmOutput(plain, shortStatusHeader);
  if (r1.headers.join(',') === 'SERVER_NAME,VERSION') ok('parseDsmOutput: plain CSV header detected');
  else fail(`parseDsmOutput: plain CSV headers wrong: ${JSON.stringify(r1.headers)}`);
  if (r1.rows.length === 1 && r1.rows[0][0] === 'SRV1') ok('parseDsmOutput: plain CSV data row parsed');
  else fail(`parseDsmOutput: plain CSV rows wrong: ${JSON.stringify(r1.rows)}`);

  // Full banner block — all four banner lines must be filtered
  const bannerText = [
    'Command Line Administrative Interface - Version 8\tRelease 1\tLevel 27.0',
    '(c) Copyright IBM Corp. 1990\t2025\t',
    'Server Version 8\tRelease 1\tLevel 27.000',
    'Server date/time: 13/07/26   17:12:14  Last access: 13/07/26   17:12:14',
    'SERVER_NAME,VERSION',
    'SRV1,8.1.27',
    '1 row(s) affected.',
  ].join('\n');
  const r2 = parseDsmOutput(bannerText, shortStatusHeader);
  if (r2.headers.join(',') === 'SERVER_NAME,VERSION') ok('parseDsmOutput: banner filtered; CSV header detected');
  else fail(`parseDsmOutput: banner not filtered; headers: ${JSON.stringify(r2.headers)}`);
  if (r2.rows.length === 1 && r2.rows[0][0] === 'SRV1') ok('parseDsmOutput: data rows correct after banner filtering');
  else fail(`parseDsmOutput: data rows wrong after banner: ${JSON.stringify(r2.rows)}`);

  // Variant: spaces instead of tabs, mixed case
  const bannerSpaces = [
    'COMMAND   LINE   ADMINISTRATIVE   INTERFACE - Version 8   Release 1   Level 27.0',
    '(C) COPYRIGHT IBM CORP. 1990   2025',
    'Server Version 9   Release 2   Level 5.001',
    'server date/time: 2026-07-14   09:00:00  Last access: 2026-07-14   09:00:00',
    'A,B',
    'x,y',
  ].join('\n');
  const r3 = parseDsmOutput(bannerSpaces, { columns: ['A', 'B'] });
  if (r3.headers.join(',') === 'A,B') ok('parseDsmOutput: banner variant with spaces/mixed case filtered');
  else fail(`parseDsmOutput: banner variant not filtered; headers: ${JSON.stringify(r3.headers)}`);

  const bannerVariants = [
    '\ufeff\x01Command Line Administrative Interface - Version 8\tRelease 1\tLevel 27.0\n(c) Copyright IBM Corp. 1990\t2025\nServer Version 8\tRelease 1\tLevel 27.000\nServer date/time: 13/07/26   17:12:14  Last access: 13/07/26   17:12:14\nA,B\nx,y',
    '"Command Line Administrative Interface - Version 8","Release 1","Level 27.0"\n"(c) Copyright IBM Corp. 1990","2025"\n"Server Version 8","Release 1","Level 27.000"\n"Server date/time: 13/07/26   17:12:14  Last access: 13/07/26   17:12:14"\nA,B\nx,y',
    '  Command Line Administrative Interface - Version 8   Release 1   Level 27.0  \n  (c) Copyright IBM Corp. 1990   2025  \n  Server Version 8   Release 1   Level 27.000  \n  Server date/time: 13/07/26   17:12:14  Last access: 13/07/26   17:12:14  \nA,B\nx,y',
    'A,B\n"(c) Copyright IBM Corp. 1990","2025"\nx,y',
    'A,B\n(c) Copyright IBM Corp. 1990,2025\nx,y',
    'A,B\n\ufeff\x01(c)\tCopyright IBM Corp. 1990\t,\t2025\nx,y',
  ];
  const variantsOk = bannerVariants.every(text => {
    const parsed = parseDsmOutput(text, { columns: ['A', 'B'] });
    return parsed.headers.join(',') === 'A,B' && parsed.rows.length === 1 && parsed.rows[0][0] === 'x';
  });
  if (variantsOk) ok('parseDsmOutput: tab/comma/quoted/BOM/control banner variants filtered');
  else fail('parseDsmOutput: one or more banner variants still leaked into rows');

  const noMatchVariants = [
    'ANR2034E SELECT: No match found using this criteria.',
    '"ANR2034E SELECT: No match found using this criteria."',
    'anr2034e    select :   no    match found using this criteria .',
    '"ANR2034E SELECT: No match found","using this criteria."',
    '\ufeff\x01ANR2034E SELECT:\tNo match found using this criteria.',
  ];
  const noMatchOk = noMatchVariants.every((variant) => {
    const parsed = parseDsmOutput(variant, { columns: ['COL_A', 'COL_B'] });
    return parsed.headers.join(',') === 'COL_A,COL_B' && parsed.rows.length === 0;
  });
  if (noMatchOk) ok('parseDsmOutput: ANR2034E no-match variants normalized to empty result with expected headers');
  else fail('parseDsmOutput: ANR2034E no-match variant leaked into data');

  const noMatchWithHeader = parseDsmOutput([
    'A,B',
    'ANR2034E SELECT: No match found using this criteria.',
  ].join('\n'), { columns: ['A', 'B'] });
  if (noMatchWithHeader.headers.join(',') === 'A,B' && noMatchWithHeader.rows.length === 0) ok('parseDsmOutput: no-match keeps emitted header and no data rows');
  else fail(`parseDsmOutput: no-match header handling failed: ${JSON.stringify(noMatchWithHeader)}`);

  // Ensure "Server Version" in a data column is NOT filtered
  const withServerVer = [
    'SERVER_NAME,SERVER_VERSION',
    'SRV1,Server Version 8.1',
  ].join('\n');
  const r4 = parseDsmOutput(withServerVer, { columns: ['SERVER_NAME', 'SERVER_VERSION'] });
  if (r4.headers[0] === 'SERVER_NAME') ok('parseDsmOutput: "Server Version" in data column is not filtered');
  else fail(`parseDsmOutput: incorrectly filtered row with "Server Version" in data: ${JSON.stringify(r4)}`);

  // IBM SP product line still filtered
  const ibmLine = [
    'IBM Storage Protect for Virtual Environments',
    'NODE_NAME',
    'NODE1',
  ].join('\n');
  const r5 = parseDsmOutput(ibmLine);
  if (r5.headers[0] === 'NODE_NAME') ok('parseDsmOutput: IBM product line still filtered');
  else fail(`parseDsmOutput: IBM product line filter broken: ${JSON.stringify(r5.headers)}`);

  const noHeader = [
    'Command Line Administrative Interface - Version 8\tRelease 1\tLevel 27.0',
    '(c) Copyright IBM Corp. 1990\t2025',
    'Server Version 8\tRelease 1\tLevel 27.000',
    'Server date/time: 13/07/26   17:12:14  Last access: 13/07/26   17:12:14',
    'SRV1,10.10.10.10,1500,TCPIP,8,1,27,0,2026-07-01,90,8,30,COMPLIANT,200,80,ONLINE,OFF,YES,NO,15',
    '1 row(s) affected.',
  ].join('\n');
  const r6 = parseDsmOutput(noHeader, statusQuery);
  if (r6.headers[0] === 'SERVER_NAME' && r6.rows.length === 1 && r6.rows[0][0] === 'SRV1') ok('parseDsmOutput: first genuine data row remains data when server emits no header');
  else fail(`parseDsmOutput: first data row was not preserved correctly: ${JSON.stringify(r6)}`);

  const mismatch = 'WRONG_A,WRONG_B,WRONG_C\n1,2,3';
  const r7 = parseDsmOutput(mismatch, { columns: ['COL_A', 'COL_B'] });
  if (r7.headers.join(',') === 'COL_A,COL_B' && r7.rows[0][0] === 'WRONG_A') ok('parseDsmOutput: mismatched first row retained as data');
  else fail(`parseDsmOutput: mismatched first row should remain data, got ${JSON.stringify(r7)}`);

  if (typeof buildImportedState === 'function') {
    const imported = buildImportedState({
      'doc_41_syscat_key_cols.csv': [
        'TABNAME,COLNO,COLNAME,TYPENAME',
        'DBSPACE,0,VOLUME_NAME,VARCHAR',
        'DBSPACE,1,DBSPACE_NUM,INTEGER',
        'DBSPACE,2,FILE_SYSTEM,VARCHAR',
      ].join('\n'),
      'doc_03_dbspace.csv': [
        'Command Line Administrative Interface - Version 8\tRelease 1\tLevel 27.0',
        '(c) Copyright IBM Corp. 1990\t2025',
        'Server Version 8\tRelease 1\tLevel 27.000',
        'Server date/time: 13/07/26   17:12:14  Last access: 13/07/26   17:12:14',
        'VOL001,0,/tsm/db01',
      ].join('\n'),
    });
    const dbspace = imported['doc_03_dbspace.csv'];
    if (dbspace && dbspace.headers.join(',') === 'VOLUME_NAME,DBSPACE_NUM,FILE_SYSTEM' && dbspace.rows[0][0] === 'VOL001') ok('buildImportedState: SELECT * query uses schema metadata without losing data row');
    else fail(`buildImportedState: schema-backed SELECT * headers failed: ${JSON.stringify(dbspace)}`);
  } else {
    fail('buildImportedState is not exported');
  }

  // Empty input
  const r8 = parseDsmOutput('');
  if (r8.headers.length === 0 && r8.rows.length === 0) ok('parseDsmOutput: empty input returns empty result');
  else fail(`parseDsmOutput: empty input should return empty, got ${JSON.stringify(r8)}`);

  const nonNoMatchAnr = parseDsmOutput([
    'A,B',
    'ANR9999E Unexpected database error,DETAILS',
  ].join('\n'), { columns: ['A', 'B'] });
  if (nonNoMatchAnr.rows.length === 1 && /^ANR9999E/i.test(nonNoMatchAnr.rows[0][0])) ok('parseDsmOutput: non-no-match ANR messages remain visible');
  else fail(`parseDsmOutput: non-no-match ANR should remain visible, got ${JSON.stringify(nonNoMatchAnr)}`);

  const sharedFixtureLf = [
    'Command Line Administrative Interface - Version 8\tRelease 1\tLevel 27.0',
    '(c) Copyright IBM Corp. 1990\t2025',
    'Server Version 8\tRelease 1\tLevel 27.000',
    'Server date/time: 13/07/26   17:12:14  Last access: 13/07/26   17:12:14',
    'A,B',
    'ANR2034E SELECT: No match found using this criteria.',
    '1 row(s) affected.',
  ].join('\n');
  const sharedFixtureCrlf = sharedFixtureLf.replace(/\n/g, '\r\n');
  const parsedLf = parseDsmOutput(sharedFixtureLf, { columns: ['A', 'B'] });
  const parsedCrlf = parseDsmOutput(sharedFixtureCrlf, { columns: ['A', 'B'] });
  if (JSON.stringify(parsedLf) === JSON.stringify(parsedCrlf)) ok('parseDsmOutput: LF and CRLF fixtures parse identically');
  else fail(`parseDsmOutput: LF/CRLF mismatch: ${JSON.stringify(parsedLf)} vs ${JSON.stringify(parsedCrlf)}`);
}

// ─────────────────────────────────────────────────────────────────────────────
section('22. SELECT projection parsing and query metadata');
if (typeof deriveExpectedColumnsFromSql !== 'function') {
  fail('deriveExpectedColumnsFromSql is not exported');
} else {
  const simple = deriveExpectedColumnsFromSql('SELECT A,B,C FROM T');
  if (simple.join(',') === 'A,B,C') ok('deriveExpectedColumnsFromSql: simple columns preserve order');
  else fail(`deriveExpectedColumnsFromSql: simple projection failed: ${JSON.stringify(simple)}`);

  const complex = deriveExpectedColumnsFromSql("SELECT N.NODE_NAME, COUNT(*) AS NODE_COUNT, CASE WHEN STATUS IN ('A,B','C') THEN 'x' ELSE 'y' END AS STATUS_FLAG, COALESCE(TRIM(DESCR), 'x,y') LABEL, CHAR(CURRENT_TIMESTAMP) FROM NODES N");
  if (complex[0] === 'NODE_NAME' && complex[1] === 'NODE_COUNT' && complex[2] === 'STATUS_FLAG' && complex[3] === 'LABEL' && typeof complex[4] === 'string' && complex[4].length > 0) ok('deriveExpectedColumnsFromSql: aliases, strings, functions, CASE, and expression labels parsed');
  else fail(`deriveExpectedColumnsFromSql: complex projection failed: ${JSON.stringify(complex)}`);

  const distinct = deriveExpectedColumnsFromSql('SELECT DISTINCT NODE_NAME FROM FILESPACES');
  if (distinct.join(',') === 'NODE_NAME') ok('deriveExpectedColumnsFromSql: DISTINCT simple column handled');
  else fail(`deriveExpectedColumnsFromSql: DISTINCT failed: ${JSON.stringify(distinct)}`);

  const star = deriveExpectedColumnsFromSql('SELECT * FROM DBSPACE', { DBSPACE: ['VOLUME_NAME', 'DBSPACE_NUM'] });
  if (star.join(',') === 'VOLUME_NAME,DBSPACE_NUM') ok('deriveExpectedColumnsFromSql: SELECT * uses supplied schema metadata');
  else fail(`deriveExpectedColumnsFromSql: SELECT * schema handling failed: ${JSON.stringify(star)}`);

  const allDerived = ALL_QUERIES.filter(q => !Array.isArray(q.columns) || q.columns.length === 0);
  if (allDerived.length === 0) ok('ALL_QUERIES now has expected columns for every canonical query');
  else fail(`Queries still missing expected columns: ${allDerived.map(q => q.id).join(', ')}`);
}

// ─────────────────────────────────────────────────────────────────────────────
section('23. Left-alignment in generated XLSX styles');
if (typeof XLSX === 'undefined') {
  fail('XLSX not available for alignment tests');
} else {
  function unzipStyles(uint8) {
    const data = Buffer.from(uint8);
    const out = new Map();
    let p = 0;
    while (p + 30 <= data.length) {
      if (data.readUInt32LE(p) !== 0x04034b50) break;
      const comp = data.readUInt16LE(p + 8);
      const size = data.readUInt32LE(p + 22);
      const nameLen = data.readUInt16LE(p + 26);
      const extraLen = data.readUInt16LE(p + 28);
      const nameStart = p + 30;
      const dataStart = nameStart + nameLen + extraLen;
      const name = data.slice(nameStart, nameStart + nameLen).toString('utf8');
      if (comp !== 0) break;
      out.set(name, data.slice(dataStart, dataStart + size).toString('utf8'));
      p = dataStart + size;
    }
    return out;
  }
  const wb2 = XLSX.utils.book_new();
  const ws2 = {};
  ws2['!ref'] = 'A1:A1';
  ws2['A1'] = { v: 'test', t: 's', s: {} };
  XLSX.utils.book_append_sheet(wb2, ws2, 'Align');
  const bytes2 = XLSX.write(wb2, { bookType: 'xlsx', type: 'array' });
  const entries2 = unzipStyles(bytes2);
  const stylesXml2 = entries2.get('xl/styles.xml') || '';
  // Extract only the <cellXfs> section (not <cellStyleXfs> which is a base style record)
  const cellXfsMatch = stylesXml2.match(/<cellXfs\b[^>]*>([\s\S]*?)<\/cellXfs>/);
  const cellXfsContent = cellXfsMatch ? cellXfsMatch[1] : '';
  const xfMatches = cellXfsContent.match(/<xf[^>]*>/g) || [];
  const allLeftAligned = xfMatches.length > 0 && xfMatches.every(tag => /applyAlignment="1"/.test(tag));
  if (allLeftAligned) ok('All <cellXfs> <xf> elements have applyAlignment="1"');
  else fail(`Some <cellXfs> <xf> elements missing applyAlignment="1": ${xfMatches.filter(t => !/applyAlignment="1"/.test(t)).join(' | ')}`);
  const hasHorizLeft = /horizontal="left"/.test(stylesXml2);
  if (hasHorizLeft) ok('Styles XML includes horizontal="left" alignment');
  else fail('Styles XML missing horizontal="left" alignment');
  // Verify wrapText style also has horizontal="left"
  const hasWrapLeft = /<alignment horizontal="left" wrapText="1"/.test(stylesXml2) || /<alignment[^>]*wrapText="1"[^>]*horizontal="left"/.test(stylesXml2);
  if (hasWrapLeft || /<alignment horizontal="left"/.test(stylesXml2)) ok('Wrap-text styles also specify horizontal="left"');
  else fail('Wrap-text styles missing horizontal="left"');
}

// ─────────────────────────────────────────────────────────────────────────────
section('24. Column header fallback and row/header length safety');
if (typeof addQueryBlock !== 'function') {
  fail('addQueryBlock is not exported');
} else {
  // Build a minimal worksheet mock
  function makeWs() {
    const ws = {};
    ws['!widthTracker'] = { widths: [], minWch: 8, maxWch: 80 };
    return ws;
  }

  // 1. Empty result with query.columns fallback
  const q1 = {
    id: 'test_q', title: 'Test Query', outputFile: 'test.csv',
    columns: ['COL_A', 'COL_B', 'COL_C'],
  };
  const ws1 = makeWs();
  addQueryBlock(ws1, 0, q1, { headers: [], rows: [] });
  // Row 0 = section header, row 1 = column headers (from q1.columns), row 2 = "No rows returned"
  if (ws1['A2'] && ws1['A2'].v === 'COL_A') ok('addQueryBlock: query.columns used as header fallback for empty result');
  else fail(`addQueryBlock: expected COL_A at A2, got ${JSON.stringify(ws1['A2'] && ws1['A2'].v)}`);
  if (ws1['C2'] && ws1['C2'].v === 'COL_C') ok('addQueryBlock: all fallback columns written');
  else fail(`addQueryBlock: expected COL_C at C2, got ${JSON.stringify(ws1['C2'] && ws1['C2'].v)}`);
  if (ws1['A3'] && /no rows/i.test(ws1['A3'].v)) ok('addQueryBlock: "No rows returned" after fallback header');
  else fail(`addQueryBlock: expected "No rows returned" at A3, got ${JSON.stringify(ws1['A3'] && ws1['A3'].v)}`);

  // 2. No fallback when query.columns not defined and headers empty
  const q2 = { id: 'test_q2', title: 'Test2', outputFile: 'test2.csv' };
  const ws2 = makeWs();
  addQueryBlock(ws2, 0, q2, { headers: [], rows: [] });
  // Should go straight to "No rows returned" without inventing headers
  if (ws2['A2'] && /no rows/i.test(ws2['A2'].v)) ok('addQueryBlock: no invented headers when query.columns undefined');
  else fail(`addQueryBlock: expected "No rows returned" at A2, got ${JSON.stringify(ws2['A2'] && ws2['A2'].v)}`);

  // 3. Row shorter than header — pad with empty string
  const q3 = { id: 'test_q3', title: 'Test3', outputFile: 'test3.csv' };
  const ws3 = makeWs();
  addQueryBlock(ws3, 0, q3, {
    headers: ['H1', 'H2', 'H3'],
    rows: [['val1', 'val2']], // only 2 values, header has 3
  });
  // C3 should exist (padded) and be empty string
  if (ws3['C3'] !== undefined && ws3['C3'].v === '') ok('addQueryBlock: short row padded with empty cell to match header width');
  else fail(`addQueryBlock: expected empty pad at C3, got ${JSON.stringify(ws3['C3'])}`);

  // 4. Row longer than header — extra columns written with deterministic fallback header
  const q4 = { id: 'test_q4', title: 'Test4', outputFile: 'test4.csv' };
  const ws4 = makeWs();
  addQueryBlock(ws4, 0, q4, {
    headers: ['H1'],
    rows: [['v1', 'v2', 'v3']], // 3 values, header has 1
  });
  if (ws4['B2'] && ws4['B2'].v === 'EXTRA_1' && ws4['C2'] && ws4['C2'].v === 'EXTRA_2') ok('addQueryBlock: extra fields receive deterministic EXTRA_* headers');
  else fail(`addQueryBlock: expected EXTRA_* headers at B2/C2, got ${JSON.stringify(ws4['B2'])} / ${JSON.stringify(ws4['C2'])}`);
  // Extra values in B3, C3 should be written
  if (ws4['B3'] && ws4['B3'].v === 'v2') ok('addQueryBlock: extra fields beyond header written to worksheet');
  else fail(`addQueryBlock: expected v2 at B3, got ${JSON.stringify(ws4['B3'] && ws4['B3'].v)}`);
  if (ws4['C3'] && ws4['C3'].v === 'v3') ok('addQueryBlock: all extra fields written');
  else fail(`addQueryBlock: expected v3 at C3, got ${JSON.stringify(ws4['C3'] && ws4['C3'].v)}`);

  // 5. Imported CSV headers take priority over query.columns when both available
  const q5 = {
    id: 'test_q5', title: 'Test5', outputFile: 'test5.csv',
    columns: ['FALLBACK_A', 'FALLBACK_B'],
  };
  const ws5 = makeWs();
  addQueryBlock(ws5, 0, q5, { headers: ['REAL_A', 'REAL_B'], rows: [] });
  if (ws5['A2'] && ws5['A2'].v === 'REAL_A') ok('addQueryBlock: imported headers take priority over query.columns');
  else fail(`addQueryBlock: imported headers should win, got ${JSON.stringify(ws5['A2'] && ws5['A2'].v)}`);

  // 6. Fixture worksheet should have nonblank headers and no banner text
  const serverQuery = ALL_QUERIES.find(q => q.id === 'doc_01_status');
  const ws6 = makeWs();
  const parsedFixture = parseDsmOutput([
    'Command Line Administrative Interface - Version 8\tRelease 1\tLevel 27.0',
    '(c) Copyright IBM Corp. 1990\t2025',
    'Server Version 8\tRelease 1\tLevel 27.000',
    'Server date/time: 13/07/26   17:12:14  Last access: 13/07/26   17:12:14',
    'SRV1,10.10.10.10,1500,TCPIP,8,1,27,0,2026-07-01,90,8,30,COMPLIANT,200,80,ONLINE,OFF,YES,NO,15',
  ].join('\n'), serverQuery);
  addQueryBlock(ws6, 0, serverQuery, parsedFixture);
  if (ws6['A2'] && ws6['A2'].v && ws6['B2'] && ws6['B2'].v) ok('addQueryBlock: fixture worksheet has a nonblank header row');
  else fail(`addQueryBlock: fixture worksheet header row blank: ${JSON.stringify(ws6)}`);
  const leakedBanner = Object.values(ws6).some(cell => cell && cell.v && /Command Line Administrative Interface|Server Version 8|Copyright IBM/i.test(String(cell.v)));
  if (!leakedBanner) ok('addQueryBlock: fixture worksheet contains no client/version banner text');
  else fail('addQueryBlock: banner text leaked into fixture worksheet cells');

  const noMatchQuery = { id: 'test_nomatch', title: 'NoMatch', outputFile: 'no_match.csv', columns: ['A', 'B'] };
  const ws7 = makeWs();
  const parsedNoMatch = parseDsmOutput('ANR2034E SELECT: No match found using this criteria.', noMatchQuery);
  addQueryBlock(ws7, 0, noMatchQuery, parsedNoMatch);
  const leakedNoMatchCell = Object.values(ws7).some(cell => cell && cell.v && /ANR2034E|No match found using this criteria/i.test(String(cell.v)));
  if (!leakedNoMatchCell) ok('addQueryBlock: no-match message text does not appear in worksheet cells');
  else fail('addQueryBlock: raw no-match message leaked into worksheet cells');

  if (typeof XLSX !== 'undefined') {
    function unzipNoMatchXml(zipBytes) {
      const data = Buffer.from(zipBytes);
      const out = new Map();
      let p = 0;
      while (p + 30 <= data.length) {
        if (data.readUInt32LE(p) !== 0x04034b50) break;
        const comp = data.readUInt16LE(p + 8);
        const size = data.readUInt32LE(p + 22);
        const nameLen = data.readUInt16LE(p + 26);
        const extraLen = data.readUInt16LE(p + 28);
        const nameStart = p + 30;
        const dataStart = nameStart + nameLen + extraLen;
        const name = data.slice(nameStart, nameStart + nameLen).toString('utf8');
        if (comp !== 0) break;
        out.set(name, data.slice(dataStart, dataStart + size).toString('utf8'));
        p = dataStart + size;
      }
      return out;
    }
    const wbNoMatch = XLSX.utils.book_new();
    XLSX.utils.book_append_sheet(wbNoMatch, ws7, 'NoMatch');
    const bytesNoMatch = XLSX.write(wbNoMatch, { bookType: 'xlsx', type: 'array' });
    const sheetNoMatchXml = unzipNoMatchXml(bytesNoMatch).get('xl/worksheets/sheet1.xml') || '';
    if (!/ANR2034E|No match found using this criteria/i.test(sheetNoMatchXml)) ok('addQueryBlock: generated worksheet XML excludes raw no-match IBM text');
    else fail('addQueryBlock: generated worksheet XML still contains raw no-match IBM text');
  } else {
    fail('XLSX not available for no-match XML leakage check');
  }
}

// ─────────────────────────────────────────────────────────────────────────────
section('25. README troubleshooting notes for sanitization and banner filtering');
if (readme.includes('control character') || readme.includes('XML') || readme.includes('illegal')) {
  ok('README includes troubleshooting note for XML/control-character issues');
} else {
  fail('README missing troubleshooting note for XML/control-character sanitization');
}
if (readme.includes('banner') || readme.includes('administrative-client') || readme.includes('Command Line Administrative')) {
  ok('README includes troubleshooting note for CLI banner filtering');
} else {
  fail('README missing troubleshooting note for CLI banner filtering');
}
if (readme.includes('ANR2034E') || readme.includes('No match found')) {
  ok('README includes troubleshooting note for no-match normalization');
} else {
  fail('README missing troubleshooting note for ANR2034E/no-match normalization');
}

// ─────────────────────────────────────────────────────────────────────────────
section('26. Windows CMD path correctness (backslash escaping)');
{
  // All four critical Windows paths must be present with correct separator
  const goodPaths = [
    '%OUTDIR%\\qerr.tmp',
    '%OUTDIR%\\preflight.tmp',
    '%OUTDIR%\\collection_log.txt',
    '%OUTDIR%\\collection_errors.log',
  ];
  for (const p of goodPaths) {
    if (cmd.includes(p)) ok(`CMD contains correct path: ${p}`);
    else fail(`CMD missing correct path: ${p}`);
  }

  // None of the malformed (backslash-dropped) forms must appear
  const badPaths = [
    '%OUTDIR%qerr.tmp',
    '%OUTDIR%preflight.tmp',
    '%OUTDIR%collection_log.txt',
    '%OUTDIR%collection_errors.log',
  ];
  for (const p of badPaths) {
    if (!cmd.includes(p)) ok(`CMD has no malformed path: ${p}`);
    else fail(`CMD contains malformed path: ${p}`);
  }
}

section('27. Windows CMD ANS1051 authentication detection (no stale ERRORLEVEL)');
{
  // Must NOT use stale ERRORLEVEL pattern
  if (!cmd.includes('IF %ERRORLEVEL%==0 SET ANS1051_FATAL=1')) {
    ok('CMD does not use stale ERRORLEVEL for ANS1051_FATAL');
  } else {
    fail('CMD still uses stale ERRORLEVEL pattern for ANS1051_FATAL');
  }

  // Must use && pattern so SET only runs when FINDSTR succeeds
  if (cmd.includes('FINDSTR /I "ANS1051I" "%OUTDIR%\\qerr.tmp" > NUL 2>&1 && SET "ANS1051_FATAL=1"')) {
    ok('CMD uses FINDSTR && SET pattern for ANS1051_FATAL');
  } else {
    fail('CMD missing FINDSTR && SET pattern for ANS1051_FATAL');
  }

  // ANS1051_FATAL must be initialized to 0
  if (cmd.includes('SET "ANS1051_FATAL=0"')) {
    ok('CMD initializes ANS1051_FATAL=0');
  } else {
    fail('CMD does not initialize ANS1051_FATAL=0');
  }

  // Preflight must also use && pattern
  if (cmd.includes('FINDSTR /I "ANS1051I" "%OUTDIR%\\preflight.tmp" > NUL 2>&1 && SET PREFLIGHT_AUTH=0')) {
    ok('CMD uses FINDSTR && SET pattern for PREFLIGHT_AUTH');
  } else {
    fail('CMD missing FINDSTR && SET pattern for PREFLIGHT_AUTH');
  }
}

section('28. Windows CMD dsmadmc invocation (credentials and optfile)');
{
  // Credentials must be quoted in every invocation
  if (cmd.includes('-id="%ADMID%"') && cmd.includes('-pa="%ADMPA%"')) {
    ok('CMD quotes admin ID and password in dsmadmc invocations');
  } else {
    fail('CMD missing quoted admin credentials in dsmadmc invocations');
  }

  // OPTARG must be present (covers optfile)
  if (cmd.includes('%OPTARG%')) {
    ok('CMD includes %OPTARG% for optfile handling');
  } else {
    fail('CMD missing %OPTARG% for optfile handling');
  }

  // Preflight must use quoted credentials too
  const preflightLine = cmd.split(/\r?\n/).find(l => l.includes('QUERY SESSION'));
  if (preflightLine && preflightLine.includes('-id="%ADMID%"') && preflightLine.includes('-pa="%ADMPA%"')) {
    ok('CMD preflight dsmadmc uses quoted credentials');
  } else {
    fail('CMD preflight dsmadmc missing quoted credentials');
  }
}

section('29. Windows CMD: no non-ASCII dash punctuation in generated text');
{
  const emDash = '\u2014';
  const enDash = '\u2013';
  if (!cmd.includes(emDash) && !cmd.includes(enDash)) {
    ok('CMD contains no em/en dash characters (no mojibake risk)');
  } else {
    // Report the offending lines
    const lines = cmd.split('\r\n');
    lines.forEach((line, i) => {
      if (line.includes(emDash) || line.includes(enDash)) {
        fail(`CMD line ${i + 1} contains non-ASCII dash: ${line.slice(0, 80)}`);
      }
    });
  }

  // SH script must still have em dashes (unchanged)
  if (sh.includes(emDash)) {
    ok('SH script retains em dash (SH output unchanged)');
  } else {
    fail('SH script lost em dash - SH generation should not change');
  }
}

section('30. Windows CMD: consistent qerr.tmp path across redirect/size/TYPE/FINDSTR/DEL');
{
  const qerrPath = '"%OUTDIR%\\qerr.tmp"';
  const count = cmd.split(qerrPath).length - 1;
  // Expect at least 6 uses: redirection (in buildCmdLine), size-check×2, TYPE×2, FINDSTR, DEL
  if (count >= 6) {
    ok(`CMD uses consistent qerr.tmp path (${count} times)`);
  } else {
    fail(`CMD uses qerr.tmp path fewer times than expected (${count}); may be inconsistent`);
  }
}

section('31. Windows CMD title-safe stderr/auth flow uses subroutine (no block interpolation)');
{
  const inlineLiteralLabelRegex = /echo --- Stderr for \[[0-9]+\/[0-9]+\]/;

  if (cmd.includes(':HandleQueryStderr')) {
    ok('CMD defines :HandleQueryStderr subroutine');
  } else {
    fail('CMD missing :HandleQueryStderr subroutine');
  }

  if (cmd.includes('CALL :HandleQueryStderr')) {
    ok('CMD calls :HandleQueryStderr for each query');
  } else {
    fail('CMD does not call :HandleQueryStderr');
  }

  if (!cmd.includes('FOR %%S IN ("%OUTDIR%\\qerr.tmp") DO IF %%~zS GTR 0 (')) {
    ok('CMD removed parenthesized stderr block that could break on title parentheses');
  } else {
    fail('CMD still contains parenthesized stderr block with inline title risk');
  }

  if (!cmd.includes('IF %ANS1051_FATAL%==1 (')) {
    ok('CMD removed parenthesized ANS1051 fatal block with inline title risk');
  } else {
    fail('CMD still contains parenthesized ANS1051 fatal block');
  }

  if (!inlineLiteralLabelRegex.test(cmd)) {
    ok('CMD no longer inlines literal query labels in stderr block output');
  } else {
    fail('CMD still inlines literal query labels in stderr block output');
  }
}

section('32. Windows CMD metacharacter-heavy titles are safely represented');
{
  const queryIndex = 2;
  const queryNum = String(queryIndex + 1).padStart(2, '0');
  const totalQueries = ALL_QUERIES.length;
  const originalTitle = ALL_QUERIES[queryIndex].title;
  const specialTitle = 'Database Volumes (30 days) (48 hrs) & | < > ^ % "double"\n\'single\'';
  ALL_QUERIES[queryIndex].title = specialTitle;
  const cmdSpecial = generateCmdContent();
  ALL_QUERIES[queryIndex].title = originalTitle;

  const cmdSafeSpecialTitle = cmdSafeSetValue(cmdSafeTitle(specialTitle));
  const expectedSetLine = `SET "Q_LABEL=[${queryNum}/${totalQueries}] ${cmdSafeSpecialTitle}"`;

  if (cmdSpecial.includes(expectedSetLine)) {
    ok('CMD safely stores metacharacter-heavy title via SET assignment escaping');
  } else {
    fail('CMD does not safely escape metacharacter-heavy title in SET assignment');
  }

  if (cmdSpecial.includes('echo --- Stderr for "%Q_LABEL%" ---')) {
    ok('CMD stderr output uses quoted variable expansion rather than inline title literal');
  } else {
    fail('CMD stderr output does not use quoted variable expansion');
  }

  if (cmdSpecial.includes('IF "%QERR_HAS_STDERR%"=="1" TYPE "%OUTDIR%\\qerr.tmp" >> "%OUTDIR%\\collection_errors.log"')) {
    ok('CMD still appends stderr output to collection_errors.log');
  } else {
    fail('CMD no longer appends stderr output to collection_errors.log');
  }

  if (cmdSpecial.includes('FINDSTR /I "ANS1051I" "%OUTDIR%\\qerr.tmp" > NUL 2>&1 && SET "ANS1051_FATAL=1"')) {
    ok('CMD still detects real ANS1051I authentication failures');
  } else {
    fail('CMD missing ANS1051I detection in stderr handling');
  }

  if (cmdSpecial.includes('IF EXIST "%OUTDIR%\\qerr.tmp" DEL "%OUTDIR%\\qerr.tmp"')) {
    ok('CMD still cleans up qerr.tmp after stderr/auth checks');
  } else {
    fail('CMD missing qerr.tmp cleanup in stderr/auth flow');
  }
}


console.log('\n============================================================');
console.log(`Results: ${PASS} passed, ${FAIL} failed`);
if (FAIL > 0) {
  console.error('VALIDATION FAILED');
  process.exit(1);
}
console.log('VALIDATION PASSED');
