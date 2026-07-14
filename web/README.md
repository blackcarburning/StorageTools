# StorageTools Web Helper — IBM Storage Protect v8 Report Helper

A self-contained, **no-install** browser application that generates one complete IBM Storage Protect `dsmadmc` collection script, packages all results into a single portable `.tar` archive, and builds one coloured multi-sheet XLSX workbook from that archive.

---

## Requirements

| Component | Requirement |
|-----------|-------------|
| Browser   | Any modern browser (Chrome, Edge, Firefox). No server needed — open `index.html` directly. |
| Windows host (optional) | `dsmadmc.exe` from the IBM Storage Protect administrative client package for `.cmd` scripts; `tar.exe` (included with Windows 10 1803+ and Windows Server 2019+). |
| Unix/Linux host (optional) | `dsmadmc` administrative client binary for `.sh` scripts (for example `/opt/tivoli/tsm/client/ba/bin/dsmadmc`); `tar` (standard on all POSIX systems). |
| XLSX export | Built into `index.html` as a self-contained exporter; no CDN, installation, or companion files required. |

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
- **Windows / Unix output directory** — where the generated scripts write CSV output (default: `StorageTools_Output`)

Click **Save to Browser** to persist settings between sessions (the password is never saved).

### Step 3 — Download the complete collection script (Generate Scripts tab)
Download exactly one of the unified script types:
- **Download Complete CMD**
- **Download Complete SH**

Both formats run the same canonical collection of **76 queries**, package all results into one `.tar` archive, and leave only that archive file on disk.

Generated filenames:
- `StorageTools_Complete_<SERVER>.cmd`
- `StorageTools_Complete_<SERVER>.sh`

### Step 4 — Run the script on a host with the admin client

> **Requirement:** `tar` must be available on the collection host. The script checks for `tar`/`tar.exe` before running and exits with a clear error if it is not found.

#### Windows (`.cmd`)
Run from **Command Prompt** (not PowerShell):
```cmd
StorageTools_Complete_TSMSERVER01.cmd
```

#### Unix/Linux (`.sh`)
Run from a POSIX shell:
```sh
chmod +x StorageTools_Complete_TSMSERVER01.sh
./StorageTools_Complete_TSMSERVER01.sh
```

Each query writes one `.csv` file into a temporary working directory. The script performs a credential/connection preflight before running queries, echoes per-query status in real time, mirrors stderr to `collection_errors.log`, translates IBM return codes, and prints final pass/warn/fail totals.

On completion the script packages all CSV files, `collection_log.txt`, `collection_errors.log`, and `manifest.txt` into a single `.tar` archive, verifies the archive is valid and non-empty, then removes the working directory. **If archiving fails, the working directory and all individual files are retained for manual recovery.**

Final archive filename:
- `StorageTools_Complete_<SANITIZED_SERVER>_<UTC_TIMESTAMP>.tar`

### Step 5 — Import results (Import Results tab)
Drag-and-drop or select the **single `.tar` collection archive** produced by the script. The app reads all CSV results, the collection log, the error log, and the manifest from the archive and shows a unified import summary.

> **Compatibility fallback:** individual `.csv` files may also be selected if you have a collection from an older script version.

### Step 6 — Download the complete workbook (Report tab)
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

StorageTools automatically filters these banner lines before header detection and data parsing. Filtering is case-insensitive and tolerant of whitespace, quoting, BOM/control-character prefixes, and version-number changes. If the server emits a trustworthy header row, StorageTools keeps it. If the output contains only data rows, StorageTools falls back to deterministic column headers derived from the query `SELECT` list and schema metadata for `SELECT *` queries such as `DBSPACE`. Empty-result sheets still retain their expected column headings.

---

## Offline Usage

`web/index.html` is fully self-contained and offline-capable. XLSX generation and TAR parsing are implemented directly in the page with no CDN and no companion services.

---

## Files Generated

| File | Description |
|------|-------------|
| `StorageTools_Complete_<SERVER>.cmd` | Windows complete collection script (76 queries) |
| `StorageTools_Complete_<SERVER>.sh` | Unix/Linux complete collection script (76 queries) |
| `StorageTools_Complete_<SERVER>_<TIMESTAMP>.tar` | Single portable archive: all CSV results + `collection_log.txt` + `collection_errors.log` + `manifest.txt` |
| `StorageTools_Complete_Report_<CUSTOMER>_<SERVER>_<DATE>.xlsx` | Unified workbook including Collection_Log and Collection_Errors sheets |

Individual CSV files and logs are packaged into the `.tar` archive and removed on success. The `.tar` archive is the only collection artifact that should remain after a successful run.

---

## Legacy Tool

The original Perl tool `STORAGE_TOOLS_v2.113.pl` remains unchanged in the repository root. This web helper is separate and does not modify the legacy Perl workflow.
