# StorageTools Web Helper — IBM Storage Protect v8 Report Helper

A self-contained, **no-install** browser application that generates `dsmadmc` collection
scripts for IBM Storage Protect (formerly Spectrum Protect / TSM), parses their output, and
produces a coloured multi-sheet XLSX report.

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
- **Windows path to `dsmadmc.exe`** — e.g. `C:\Program Files\Tivoli\TSM\baclient\dsmadmc.exe` (used for `.cmd`)
- **Unix/Linux path to `dsmadmc`** — e.g. `/opt/tivoli/tsm/client/ba/bin/dsmadmc` (used for `.sh`)
- **Admin User ID** and **Password** — a Spectrum Protect admin with at least `ANALYST` privilege
- **Option file path** — optional, leave blank if the server is reached without an options file
- **Server name / label** — used to name output files (no functional impact)
- **Customer name** — included in report headers
- **Output directory/path** — where collection CSVs are written by either script type (default: `StorageTools_Output`)

Click **Save to Browser** to persist settings between sessions (password is never saved).

### Step 3 — Download collection scripts (Generate Scripts tab)
Click one or more of:
- **Download Documentation CMD**
- **Download Healthcheck CMD**
- **Download Documentation SH**
- **Download Healthcheck SH**

Generated file names:
- `StorageTools_Documentation_<SERVER>.cmd` — SQL SELECT queries covering full server configuration (see `DOC_QUERIES` in `index.html` for the full list)
- `StorageTools_Healthcheck_<SERVER>.cmd` — SQL SELECT queries covering operational health (see `HEALTH_QUERIES` in `index.html` for the full list)
- `StorageTools_Documentation_<SERVER>.sh` — same query set/output filenames as the documentation CMD script
- `StorageTools_Healthcheck_<SERVER>.sh` — same query set/output filenames as the healthcheck CMD script

### Step 4 — Run scripts on the target host
Copy the generated script(s) to a host that has the administrative client installed.

#### Windows (`.cmd`)
Run on a Windows server or workstation that has `dsmadmc.exe`.

Run from a **Command Prompt** (not PowerShell):
```cmd
StorageTools_Documentation_TSMSERVER01.cmd
```

#### Unix/Linux (`.sh`)
Run on a Unix/Linux host with `dsmadmc` available:
```sh
chmod +x StorageTools_Documentation_TSMSERVER01.sh
./StorageTools_Documentation_TSMSERVER01.sh
```

Each query creates one `.csv` file in the configured output directory/path.
Errors are written to `collection_errors.log` — query failures do **not** stop the batch.

> **Tip:** Run as a user with filesystem access to the configured client executable and
> network access to the IBM Storage Protect server.

### Step 5 — Import results (Import Results tab)
Return to the web app. On the **Import Results** tab:
1. Click the file-drop area (or drag-and-drop) and select **all** `.csv` files from the
   `StorageTools_Output` folder.
2. The status table updates immediately, showing:
   - ✅ **Imported** — file present with data rows
   - ⚠️ **No rows** — file imported but query returned no results (normal for empty tables)
   - ⬜ **Not imported** — file not yet selected

### Step 6 — Generate report (Report tab)
Click **Download XLSX Report**. A coloured workbook is saved with:
- **Index** sheet: import status and row counts for all queries
- **13 documentation sheets**: Server, Admins, Nodes, Filespaces, Policy, Schedules, Storage,
  Volumes, Occupancy, Replication, DR, Advanced\_v8, Scripts
- **6 healthcheck sheets**: HC\_Database, HC\_Storage, HC\_Schedules, HC\_Nodes,
  HC\_Activity, HC\_Advanced

---

## Security

> ⚠️ **The generated CMD and SH files contain your IBM Storage Protect admin password in plain text.**

1. **Delete script files and the output folder immediately** after importing results into the app.
2. Do not email, store in shared drives, or commit generated scripts to source control.
3. Do not share output CSV files unless you are sure they contain no sensitive data.
4. Consider resetting the admin account password after the collection run.
5. On Windows, command-line passwords may be visible to local process inspection tools
   (Task Manager, Sysinternals Process Explorer, endpoint monitoring agents).
6. On Unix/Linux, command-line arguments may be visible to local users while the query command runs (for example via `ps`).

### Passwords with special characters
If your password contains any of: `! ^ & | < > %`

- `%` — double it to `%%` in the `SET "ADMPA=..."` line (CMD escaping)
- `!` — avoid if `EnableDelayedExpansion` is used; the generated scripts do **not** use it,
  so `!` in passwords is generally safe with standard `setlocal`
- `^`, `&`, `|`, `<`, `>` — may require prefixing with `^` in CMD variable values

For complex passwords, consider using an option file with the password stored via
IBM Storage Protect client options instead of command-line flags.

### IBM documentation reference
The script options are based on IBM Storage Protect administrative client usage (`dsmadmc` with options such as `-commadelimited`, `-id`, `-pa`, and `-optfile`):

- IBM Storage Protect docs: <https://www.ibm.com/docs/en/storage-protect/8.1.27?topic=servers-server-commands-options-utilities>

---

## SQL Version Compatibility

All SELECT statements target **IBM Storage Protect v8.1.x** (DB2-based SQL engine).

Key v8 SQL practices used:
- `DISTINCT` keyword instead of the deprecated `unique()` aggregate
- `FLOAT(col)` for safe numeric division (avoids integer truncation)
- `DECIMAL(n,m)` casts for all computed GB/percentage values
- `CURRENT_TIMESTAMP - N DAYS/HOURS` for timestamp arithmetic
- `SUBSTR(CHAR(timestamp), 1, 19)` for safe datetime formatting
- `INNER JOIN` syntax for multi-table queries

Queries marked **[v8 only]** target tables introduced in SP v8:
- `CONTAINERS` — directory/cloud container pool objects
- `REPLICATIONRULES` — v8 replication rule definitions
- `STGRULES` — storage rules (v8.1.8+)
- `RETENTIONSETS` — retention set definitions (v8.1.4+)
- v8-extended columns on `STGPOOLS` (cloud storage columns)

These queries **silently fail** on older servers and their errors are captured to
`collection_errors.log` without stopping the batch.

---

## Offline Usage

`web/index.html` is fully self-contained. XLSX generation is implemented directly in the
page, so report downloads work offline with no CDN access and no extra files.

---

## Files Generated

| File | Description |
|------|-------------|
| `StorageTools_Documentation_<SERVER>.cmd` | Windows batch — documentation collection (39 queries) |
| `StorageTools_Healthcheck_<SERVER>.cmd`   | Windows batch — healthcheck collection (28 queries) |
| `StorageTools_Documentation_<SERVER>.sh` | Unix/Linux shell — documentation collection (39 queries, same CSV filenames/output format as CMD) |
| `StorageTools_Healthcheck_<SERVER>.sh`   | Unix/Linux shell — healthcheck collection (28 queries, same CSV filenames/output format as CMD) |
| `StorageTools_Output\doc_01_status.csv`   | One CSV per documentation query |
| `StorageTools_Output\hc_01_db_space.csv`  | One CSV per healthcheck query |
| `StorageTools_Output\collection_log.txt`  | Collection start/end timestamps |
| `StorageTools_Output\collection_errors.log` | Any query errors (non-fatal) |
| `StorageTools_Report_<CUSTOMER>_<SERVER>_<DATE>.xlsx` | Final coloured XLSX report |

---

## Legacy Tool

The original Perl tool `STORAGE_TOOLS_v2.113.pl` remains unchanged in the repository root (`/STORAGE_TOOLS_v2.113.pl`).
This web helper is an independent addition and does not modify or replace the Perl tool.

---

## Troubleshooting

| Problem | Solution |
|---------|----------|
| CMD file opens and closes instantly | Right-click → Run as Administrator, or run from Command Prompt |
| `dsmadmc.exe` not found | Verify the full path in Setup; use `dir "C:\...\dsmadmc.exe"` to confirm |
| `./script.sh: not found` or permission denied | Verify Unix client path, then run `chmod +x script.sh` and execute from a POSIX shell |
| All output files empty | Check `collection_errors.log`; verify admin credentials and server connectivity |
| XLSX download button does nothing | Confirm your browser allows downloads from local files and review the browser console for any client-side errors |
| v8-only queries all fail | Expected on SP v7 and earlier; core queries still succeed |
| Password with `%` breaks CMD | Double the `%` character in the `SET "ADMPA=..."` line of the CMD file |
