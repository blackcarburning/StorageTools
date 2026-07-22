# StorageTools Web Helper — IBM Storage Protect v8 Report Helper

A self-contained, **no-install** browser application that generates one complete IBM Storage Protect `dsmadmc` collection script, packages all results into a single portable `.tar` archive, builds one coloured multi-sheet XLSX workbook from that archive, and can run an offline traffic-light healthcheck analysis from the imported collection data.

---

## Requirements

| Component | Requirement |
|-----------|-------------|
| Browser   | Any modern browser (Chrome, Edge, Firefox). No server needed — open `index.html` directly. |
| Windows host (optional) | `dsmadmc.exe` from the IBM Storage Protect administrative client package for `.cmd` scripts. Archive creation uses PowerShell (built in to Windows 7/Server 2008 R2 and later); no separate `tar.exe` installation is required. |
| Unix/Linux host (optional) | `dsmadmc` administrative client binary for `.sh` scripts (for example `/opt/tivoli/tsm/client/ba/bin/dsmadmc`); `tar` (standard on all POSIX systems). |
| XLSX / DOCX export | Built into `index.html` as self-contained exporters; no CDN, installation, or companion files required. |

---

## Workflow

### Step 1 — Open the app
Open `web/index.html` in your browser. No web server is required.

### Step 2 — Configure (Setup tab)
Fill in:
- **Windows path to `dsmadmc.exe`** — used for `.cmd`
- **Unix/Linux path to `dsmadmc`** — used for `.sh`
- **Admin User ID** and **Password** — a Storage Protect admin with at least `ANALYST` privilege
- **Windows / Unix option file path** — optional, leave blank if the client defaults already select the target server
- **Server name / label** — used to name output files only; **does not select the target server**. The target server is selected by the option file or by the administrative client's default options.
- **Customer name** — included in report headers
- **Windows / Unix output directory** — collection output folder (default: `StorageTools_Output`). Relative paths are resolved from the directory where the script is run; absolute paths are used as entered.

Click **Save to Browser** to persist settings between sessions (the password is never saved).

### Step 3 — Download the complete collection script (Generate Scripts tab)
Download exactly one of the unified script types:
- **Download Complete CMD**
- **Download Complete SH**

Both formats run the same canonical collection of **80 queries**, package all results into one `.tar` archive inside the configured output folder, and retain all collected CSV files in that folder alongside the archive.

Generated filenames:
- `StorageTools_Complete_<SERVER>.cmd`
- `StorageTools_Complete_<SERVER>.sh`

### Step 4 — Run the script on a host with the admin client

> **Windows archive creation:** The generated `.cmd` script includes a built-in PowerShell TAR writer as a fallback; no separate `tar.exe` installation is required. If `tar.exe` is present it is used for speed, otherwise the built-in implementation writes a standards-compliant uncompressed USTAR archive directly.

#### Windows (`.cmd`)
Run from **Command Prompt** (not PowerShell):
```cmd
StorageTools_Complete_TSMSERVER01.cmd
```
`tar.exe` is not required. The script automatically uses a built-in PowerShell TAR writer when native `tar.exe` is not present.

#### Unix/Linux (`.sh`)
Run from a POSIX shell:
```sh
chmod +x StorageTools_Complete_TSMSERVER01.sh
./StorageTools_Complete_TSMSERVER01.sh
```

Each query writes one `.csv` file into a temporary working directory. The script performs a credential/connection preflight before running queries, echoes per-query status in real time, mirrors stderr to `collection_errors.log`, translates IBM return codes, and prints final pass/warn/fail totals.

On completion the script packages all CSV files, `collection_log.txt`, `collection_errors.log`, and `manifest.txt` into a single `.tar` archive, then moves all those files to the configured output folder so they remain accessible regardless of archive success. The configured output folder itself is never deleted. **If archiving fails (or the archive is empty), all collected CSV files are still retained in the output folder and can be imported individually.**

On the **next run** of the same script, the prior loose CSV, manifest, and log files in the output folder are removed before new data is collected (delete-before strategy). Previous `.tar` archives are kept. Pre-existing unrelated files in the output folder are never deleted.

Final archive filename:
- `StorageTools_Complete_<SANITIZED_SERVER>_<UTC_TIMESTAMP>.tar`

### Step 5 — Import results (Import Results tab)
Drag-and-drop or select the **single `.tar` collection archive** produced by the script. The app reads all CSV results, the collection log, the error log, and the manifest from the archive and shows a unified import summary.

> **Compatibility fallback:** individual `.csv` files may also be selected if you have a collection from an older script version.

### Step 6 — Run Healthcheck Analysis (Healthcheck Analysis tab)
After importing the unified `.tar` archive, open **Healthcheck Analysis** and click **Run / Generate Traffic Light Report**.

The healthcheck engine:
- evaluates the already imported archive data locally in the browser; it does **not** reconnect to IBM Storage Protect
- follows the Perl traffic-light rules from `HELIX_TRAFFIC_LIGHT_compiled_v14.pl` as closely as the imported datasets allow
- preserves missing-data behavior by marking unavailable-source checks as **Not Tested / Insufficient Data** instead of silently treating them as healthy
- shows per-rule status, source values, threshold/rationale, findings, and recommendations grouped by healthcheck section
- atomically replaces prior healthcheck results when you import a new archive or rerun the analysis

The completed report opens in a **separate browser tab/window** and includes:
- a dedicated **AI-assisted healthcheck evaluation** section near the beginning of the report
- executive summary and overall traffic light
- Red / Amber / Green / Informational / Not Tested counters
- detailed findings by section
- missing-data / insufficient-data items
- collection metadata from the imported archive

The AI section always shows one of these states:
- **Not included** — deterministic report only; no OpenAI request was made
- **Generating** — includes the selected model ID and a visible waiting message
- **Included** — includes the model ID, generation timestamp, narrative output, and review disclaimer
- **Failed** — includes the model ID (if known), attempt timestamp, sanitized error, and a note that the deterministic report remains complete

You can also download the same report as a `.docx` file from the Healthcheck tab or from the opened report tab.

### Step 7 — Download the complete workbook (Report tab)
Enter optional report metadata (Customer, Prepared by, Report date, Server label) and click **Download Complete XLSX Report**.
You will be prompted to confirm/edit the final `.xlsx` filename before download.

Generated report filename:
- `StorageTools_Complete_Report_<CUSTOMER>_<SERVER>_<DATE>.xlsx`

The workbook is one document containing multiple worksheets including:
- **Cover** — report title page with customer/prepared-by/date/server metadata
- **Index** — summary with archive/manifest metadata, pass/warn/fail counts, and import timestamp
- **Collection_Log** — `collection_log.txt` line by line
- **Collection_Errors** — `collection_errors.log` line by line (or a clear "No errors recorded" row)
- Server, Admins, Nodes, Filespaces, Policy, Schedules, Storage, Volumes, Occupancy, Replication, DR, Retention, Advanced, Activity/Health, Scripts, Schema

---

## Coverage Highlights

The unified collection includes:
- core server, database, log, admin, node, filespace, policy, schedule, storage, volume, occupancy, DR, script, and schema-discovery queries
- replication coverage including `SERVERS`, `REPLSERVERS`, and exact-schema `STGRULES`
- retention coverage including exact-schema `RETSETS`, `RETRULES`, and `HOLDS`
- low-cost health checks for schedules, nodes, activity log, storage, sessions, processes, retention-set state/statistics, and retention expiration ordering

The real-server schema-backed advanced queries use the confirmed table names:
- `STGRULES`
- `RETSETS`
- `RETRULES`
- `REPLSERVERS`
- retention helper views surfaced via schema discovery such as `RETSETCONTENTS`, `RETSET_MEMBERS`, `RETSET_VOLUMES`, `RETRULE_MEMBERS`, `HOLDS`, `HELDRETSETS`, and `RETMEDIA`

Optional feature views can still warn on older or differently licensed servers. Confirmed views on the attached schema are queried with their exact names and should not return `RC_NOTABLE` on that server family.

---

## Healthcheck Analysis Notes

### Perl-rule parity and exclusions

`HELIX_TRAFFIC_LIGHT_compiled_v14.pl` in the repository root is the authoritative rule source. The web helper ports the rule ordering, thresholds, status wording, and recommendations into browser-side JavaScript so the analysis can run against the imported archive contents.

Some Perl checks depend on source fields or time windows that are **not** present in the current archive format. Those checks are intentionally reported as **Not Tested / Insufficient Data** with the missing source identified, rather than being approximated. This is expected behavior and is preferable to a false Green result.

### New collection fields (archive format v1+)

The following fields and aggregate queries were added to enable previously Not Tested HELIX rules:

| Source file | New field / query | Enables rule |
|---|---|---|
| `doc_01_status.csv` | `SCHEDMODE`, `SUMMARYRETENTION`, `EVENTRETENTION` | Schedule Mode, Summary Log Retention, Event Log Retention |
| `doc_34_drm_status.csv` | `FILEPROCESS` | Process File DB Backups? |
| `doc_07_nodes.csv` | `TCP_ADDRESS` | Nodes Defined / Unique |
| `hc_35_scratch_warnings.csv` | Full-retention ACTLOG aggregate (9 MSGNOs) | Scratch Tape Warnings |
| `hc_36_tape_mounts.csv` | 168-hour TAPE MOUNT summary + drive count | Tape Mount Utilisation |

Archives generated before these fields were added will show the affected checks as **Not Tested / Insufficient Data** rather than producing false results. Backward compatibility is fully preserved.

### Deterministic local analysis

When **Include OpenAI analysis** is **unchecked**:
- the browser generates only the deterministic traffic-light report
- no OpenAI network request is made
- the report remains fully offline and reproducible from the same archive input

### Optional OpenAI analysis

The Healthcheck tab contains a collapsible **AI analysis** area with:
- a masked OpenAI API key field
- a model refresh action that queries `GET /v1/models`
- a filtered model selector for text/reasoning models
- a custom model ID field for account-specific or newly released model IDs
- an **Include OpenAI analysis** checkbox

If AI analysis is enabled, StorageTools first builds the complete deterministic report locally, then sends a **structured summary of the report findings** to the OpenAI Responses API to request a narrative analysis. The app does **not** upload the `.tar` archive itself, your IBM credentials, or unrelated collection files.

The separate-tab HTML report and exported DOCX both place the **AI-assisted healthcheck evaluation** section immediately after the cover metadata and before the detailed deterministic findings. The section explicitly shows whether AI evaluation is **Not included**, **Generating**, **Included**, or **Failed**, along with the selected model ID and the relevant timestamp when available. Treat the AI narrative as advisory output that should be reviewed by a qualified IBM Storage Protect administrator.

### Strong API-key warning

OpenAI recommends keeping API keys server-side. This app is intentionally self-contained and has **no backend**, so client-side API-key use is available only as an explicit advanced option.

Because of that:
- only use the AI feature on a **trusted local device**
- do **not** use it on shared or untrusted machines
- the API key is **memory-only**
- the API key is **not** written to localStorage, sessionStorage, the URL, the archive, the generated report, or the exported DOCX
- the API key is cleared when the page reloads

Enabling AI analysis may send report content to OpenAI and may incur API charges on your account.

### Model selection

- StorageTools first tries the live `GET /v1/models` list for the entered API key.
- If that request fails, the UI falls back to a curated list of compatible Responses API text/reasoning models.
- Image/audio/video/embedding/moderation-only models are excluded from the normal selector.
- If a model you need is not listed, enter its exact API identifier in the custom model field.
- Model availability is controlled by OpenAI and your account permissions; a friendly API error is shown if a chosen model is unavailable.

### Separate-tab report and DOCX export

- The report window is opened synchronously from the Run button to avoid popup blockers where possible.
- The report first renders a safe standalone shell, then fills in the deterministic findings, and finally replaces the AI section with the Included/Failed result when the OpenAI request finishes.
- The HTML report uses escaped text and embedded styling only; no external resources are loaded.
- The Healthcheck tab and report window clearly mark DOCX export as unavailable while AI generation is pending so you do not export an ambiguous intermediate document.
- The DOCX export contains the same final AI state shown in the HTML report, including model ID, timestamp, Included/Not included/Generating/Failed status, and any sanitized failure message.

### Manual verification notes

For manual browser testing:
1. Import a real unified `.tar` archive.
2. Run the Healthcheck report once with AI disabled and confirm no network call is made.
3. Confirm the report opens in a new tab/window, immediately shows a generating shell, and that **Print / Save as PDF** works from that tab.
4. While AI is generating, confirm the report shows **AI-assisted evaluation: Generating** and DOCX export is marked as unavailable.
5. Download the `.docx` report after completion/failure and open it in Word or LibreOffice.
6. If desired, enter a real OpenAI API key on a trusted machine, refresh models, enable AI analysis, and confirm the AI section appears near the beginning with the final Included/Failed state, model ID, and timestamp.

---

## Security

> ⚠️ **The generated CMD and SH files contain your IBM Storage Protect admin password in plain text.**

1. Delete generated script files immediately after the collection run.
2. Transfer only the `.tar` archive — do not email, share, or commit generated scripts.
3. Treat the `.tar` archive and its CSV contents as sensitive operational data.
4. Consider resetting the admin password after the collection run.

### Passwords with special characters
If your password contains any of `! ^ & | < > %`:
- `%` — double it to `%%` in CMD variable values
- `^`, `&`, `|`, `<`, `>` — may require CMD escaping depending on the local shell environment

---

## Return-code translation and troubleshooting

Both generated scripts translate IBM Storage Protect return codes and show the symbolic name in the console and `collection_log.txt`.

Common codes:

| RC | Symbol | Severity | Meaning |
|----|--------|----------|---------|
| 0 | `RC_OK` | OK | Command completed successfully |
| 3 | `RC_SYNTAX` | FAILED | Invalid SQL/command syntax, wrong columns, or bad parameters |
| 11 | `RC_NOTFOUND` | WARN | Query ran successfully but returned no rows |
| 28 | `RC_NOTABLE` | FAILED by default | Referenced table/view does not exist |
| 35 | `RC_CANCELED` | WARN | Command cancelled |
| 137 | `DSM_RC_AUTH_FAILURE` | FAILED | Authentication failure |

For queries explicitly marked as optional feature views, `RC_NOTABLE` is downgraded to **WARN** so older servers can still complete the overall collection.

Primary log files (inside the `.tar` archive after collection):
- `collection_log.txt`
- `collection_errors.log`

If you see `ANS1051I Invalid user id or password`, correct the admin credentials or the option file/server defaults. The preflight aborts immediately instead of repeating the same failure for every query.

If the archive creation step fails, the script retains all individual files in the working directory and prints its path. You can inspect those files directly or re-run the script.

### Excel recovery warnings (illegal XML characters)

If Excel shows a repair/recovery message when opening the generated `.xlsx` file (e.g. "Replaced Part: /xl/worksheets/sheetN.xml part with XML error. Illegal xml character."), this was caused by control characters embedded in `dsmadmc` output CSV files. Since this version, StorageTools automatically strips all characters forbidden by XML 1.0 (C0 control bytes, isolated UTF-16 surrogate code units, and noncharacters U+FFFE/U+FFFF) before writing any value into the workbook. Valid Unicode text, tabs, line feeds, and supplementary characters (emoji, CJK extensions, etc.) are preserved. No manual intervention is required.

### Administrative-client banner lines

Older or certain configurations of `dsmadmc` print a multi-line banner before the CSV output:

```
Command Line Administrative Interface - Version 8    Release 1    Level 27.0
(c) Copyright IBM Corp. 1990    2025
Server Version 8    Release 1    Level 27.000
Server date/time: 13/07/26   17:12:14  Last access: 13/07/26   17:12:14
```

StorageTools automatically filters these banner lines before header detection and data parsing. Filtering is case-insensitive and tolerant of whitespace, quoting, BOM/control-character prefixes, and version-number changes. If the server emits a trustworthy header row, StorageTools keeps it. If the output contains only data rows, StorageTools falls back to deterministic column headers derived from the query `SELECT` list and schema metadata for `SELECT *` queries such as `DBSPACE`. Empty-result sheets still retain their expected column headings. Known no-match responses such as `ANR2034E SELECT: No match found using this criteria.` are also normalized as empty results (without writing raw IBM error text into worksheet data cells).

### Healthcheck popup blockers, unavailable models, and API errors

- If the Healthcheck report tab does not appear, allow popups for the local `index.html` page and run the analysis again.
- If **Refresh models** fails, confirm the API key is valid and has access to OpenAI models. The UI will keep a fallback list available, and you can also enter a custom model ID manually.
- If AI analysis fails because of authentication, rate limiting, or model access, the deterministic healthcheck report is still kept and shown; the AI failure is reported separately.
- If lower-priority findings must be truncated before sending them to OpenAI, all Red and Amber findings are preserved first and the report notes that truncation occurred.

---

## Offline Usage

`web/index.html` is fully self-contained and offline-capable. XLSX generation and TAR parsing are implemented directly in the page with no CDN and no companion services.

---

## Files Generated

| File | Description |
|------|-------------|
| `StorageTools_Complete_<SERVER>.cmd` | Windows complete collection script (80 queries) |
| `StorageTools_Complete_<SERVER>.sh` | Unix/Linux complete collection script (80 queries) |
| `StorageTools_Complete_<SERVER>_<TIMESTAMP>.tar` | Single portable archive: all CSV results + `collection_log.txt` + `collection_errors.log` + `manifest.txt` |
| `StorageTools_Complete_Report_<CUSTOMER>_<SERVER>_<DATE>.xlsx` | Unified workbook including Collection_Log and Collection_Errors sheets |
| `StorageTools_Healthcheck_Report_<CUSTOMER>_<SERVER>_<DATE>.docx` | Traffic-light healthcheck report exported from the imported archive, including the dedicated AI-assisted evaluation section and its final state metadata |

Individual CSV files and logs are retained in the output folder after every run and are also packaged into the `.tar` archive. Both the archive and the individual files can be imported into StorageTools. On the next run, prior loose collection files are removed before new data is collected; previous `.tar` archives are kept.

---

## Legacy Tool

The original Perl tool `STORAGE_TOOLS_v2.113.pl` remains unchanged in the repository root. This web helper is separate and does not modify the legacy Perl workflow.
