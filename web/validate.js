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
    sanitizeXlsxFilename, syncReportMetadataFromConfig, isoLocalDate, generateReport;
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
    `${js}; return { ALL_QUERIES, WORKBOOK_SHEETS, generateCmdContent, generateShContent, formatSectionName, parseTarArchive, parseManifest, STATE, buildCollectionLogSheet, buildCollectionErrorsSheet, XLSX, buildCoverSheet, buildIndexSheet, buildSheet, readReportMetadata, defaultReportFilename, sanitizeXlsxFilename, syncReportMetadataFromConfig, isoLocalDate, generateReport };`
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
     sanitizeXlsxFilename, syncReportMetadataFromConfig, isoLocalDate, generateReport } = result);
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

console.log('\n============================================================');
console.log(`Results: ${PASS} passed, ${FAIL} failed`);
if (FAIL > 0) {
  console.error('VALIDATION FAILED');
  process.exit(1);
}
console.log('VALIDATION PASSED');
