# StorageTools Web Helper — IBM Storage Protect v8 Report Helper

A self-contained, **no-install** browser application that generates one complete IBM Storage Protect `dsmadmc` collection, parses the returned CSV files, and builds one coloured multi-sheet XLSX workbook.

---

## Requirements

| Component | Requirement |
|-----------|-------------|
| Browser   | Any modern browser (Chrome, Edge, Firefox). No server needed — open `index.html` directly. |
| Windows host (optional) | `dsmadmc.exe` from the IBM Storage Protect administrative client package for `.cmd` scripts. |
| Unix/Linux host (optional) | `dsmadmc` administrative client binary for `.sh` scripts (for example `/opt/tivoli/tsm/client/ba/bin/dsmadmc`). |
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

Both formats run the same canonical collection of **76 queries** and use the same CSV output filenames.

Generated filenames:
- `StorageTools_Complete_<SERVER>.cmd`
- `StorageTools_Complete_<SERVER>.sh`

### Step 4 — Run the script on a host with the admin client
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

Each query writes one `.csv` file into the configured output directory. The script performs a credential/connection preflight before running queries, echoes per-query status in real time, mirrors stderr to `collection_errors.log`, translates IBM return codes, and prints final pass/warn/fail totals.

### Step 5 — Import results (Import Results tab)
Select **all** `.csv` files from the output directory. The app shows one unified import list covering the entire collection.

### Step 6 — Download the complete workbook (Report tab)
Click **Download Complete XLSX Report**.

Generated report filename:
- `StorageTools_Complete_Report_<CUSTOMER>_<SERVER>_<DATE>.xlsx`

The workbook is one document containing multiple worksheets such as:
- Index
- Server
- Admins
- Nodes
- Filespaces
- Policy
- Schedules
- Storage
- Volumes
- Occupancy
- Replication
- DR
- Retention
- Advanced
- Activity/Health
- Scripts
- Schema

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

1. Delete generated script files and the output folder immediately after importing results.
2. Do not email, share, or commit generated scripts.
3. Treat output CSV files as sensitive operational data.
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

Primary log files:
- `StorageTools_Output/collection_log.txt`
- `StorageTools_Output/collection_errors.log`

If you see `ANS1051I Invalid user id or password`, correct the admin credentials or the option file/server defaults. The preflight aborts immediately instead of repeating the same failure for every query.

---

## Offline Usage

`web/index.html` is fully self-contained and offline-capable. XLSX generation is implemented directly in the page with no CDN and no companion services.

---

## Files Generated

| File | Description |
|------|-------------|
| `StorageTools_Complete_<SERVER>.cmd` | Windows complete collection script (76 queries) |
| `StorageTools_Complete_<SERVER>.sh` | Unix/Linux complete collection script (76 queries) |
| `StorageTools_Output/*.csv` | One CSV per query |
| `StorageTools_Output/collection_log.txt` | Per-query status log with RC translation |
| `StorageTools_Output/collection_errors.log` | Mirrored stderr with query context |
| `StorageTools_Complete_Report_<CUSTOMER>_<SERVER>_<DATE>.xlsx` | Unified workbook |

---

## Legacy Tool

The original Perl tool `STORAGE_TOOLS_v2.113.pl` remains unchanged in the repository root. This web helper is separate and does not modify the legacy Perl workflow.
