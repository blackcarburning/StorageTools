Storage Tools Manual (Internal Version)
Version 2.114


Index
1.	SUMMARY	4
1.1.	FUNCTIONALITY	4
1.1.1.	Core TSM	4
1.1.2.	TSM for VE Sizing Tool	4
1.1.3.	TSM Accounting Log Processor	4
1.1.4.	TSM Client Log Access	4
1.1.5.	IBM Storage Documentation	5
1.1.6.	Client WMI Architecture Query	5
2.	DOWNLOADING	6
3.	SYSTEM REQUIREMENTS	6
4.	TSM VERSIONS	7
5.	RUNNING/INSTALLING	7
6.	SECURITY	8
6.1.	INTERNAL ACCESS	8
6.2.	CUSTOMER ACCESS	9
6.3.	TIMEOUT	11
7.	BEFORE YOU START	12
7.1.	MENUS	12
7.1.1.	Main Menu	12
7.1.2.	TSM Menu	13
7.1.3.	IBM Storage Tools and AIX Performance Scripts Menu	13
7.1.4.	Brocade Tools Menu	14
7.2.	ERROR TRAPPING AND SOME NOTES ON ERROR CAUSES	14
7.3.	OUTPUT DIRECTORY	14
7.4.	CUSTOMER NAME	15
8.	USING STORAGE TOOLS	17
8.1.	TSM MENU	17
8.1.1.	TSM Healthcheck	18
8.1.2.	TSM Documentation	19
8.1.3.	TSM Backup Catalogue	20
8.1.4.	TSM Deduplication Catalogue	23
8.1.5.	Node Activity Report (including VE)	24
8.1.6.	TSM Missed Files Spreadsheet (With exclude list generation)	25
8.1.7.	TSM Replication Report	27
8.1.8.	TSM Helix Checks	28
8.1.9.	TSM Filespace Catalogue	29
8.1.10.	TSM Macros	31
8.1.11.	TSM Drive and Process Graphs	32
8.1.12.	TSM Command Line	34
8.1.13.	TSM Define Nodes from File	36
8.1.14.	Return to Previous Menu	37
9.	MAIN MENU: TSM IBM DEDUPLICATION STATISTICS (BETA)	38
10.	MAIN MENU: TSM DEDUPLICATION STATISTICS DETAIL PER NODE (BETA)	39
11.	MAIN MENU: TSM MICRO HEALTHCHECK	41
11.1.	CUSTOMER NAME	41
11.2.	PROCESSING	41
11.3.	CHOOSE LIBRARY (LOCAL AND REMOTE)	43
11.4.	XML OUTPUT	43
12.	MAIN MENU: TSM FOR VE SIZING TOOL	47
12.1.	PROCESSING THE RVTOOLS SPREADSHEET	47
12.2.	MODEL PARAMETERS	50
12.3.	RUN THE MODEL	51
12.4.	MAKE THE SPREADSHEET (FINAL STEP)	52
13.	MAIN MENU: TSM ACCOUNTING LOG PROCESSOR	56
14.	SUB MENU: TSM CLIENT LOG FILE ACCESS	57
14.1.	GET A LOG FILE	58
14.2.	SEARCH FOR A NODE	61
14.3.	SEARCH FOR NODE ERRORS IN TSM	61
14.4.	SEARCH FOR NODE ERRORS IN TSM	62
14.5.	TSM COMMAND LINE	62
14.6.	CHANGE THE DRIVE LETTER FOR FILES	64
15.	SUB MENU: IBM STORAGE TOOLS	65
15.1.	V7000/V9000/SVC DOCUMENTATION	65
15.2.	V7000U DOCUMENTATION	66
15.3.	XIV DOCUMENTATION	66
15.4.	DS8000 DOCUMENTATION	66
16.	SUB MENU: BROCADE TOOLS	68
16.1.	BROCADE DOCUMENTATION	68
16.2.	BROCADE ANALYSIS	68
16.3.	COMMAND LINE	68
16.4.	SWITCH NAME SERVER CONTENTS	68
17.	SUB MENU: CLIENT NODE WMI PROCESSOR QUERY	69
18.	APPENDIX A – CHANGE HISTORY	69

 
1.	Summary

Storage tools is a comprehensive TSM and IBM storage analysis and management tool written in Perl and compiled to be stand-alone.

In most cases it does not need any external applications (Powershell is required for some functionality) and can be installed on any server, desktop or laptop running Windows. It does not require Perl. It does not require or collect historical data.

1.1.	Functionality
1.1.1.	Core TSM

Storage Tools currently has the following functionality:

•	TSM Healthcheck (output spreadsheet)
•	TSM Documentation (output spreadsheet)
•	TSM Backup Catalogue (output spreadsheet)
•	TSM for VE activity report (output spreadsheet)
•	TSM IBM Deduplication Catalogue using IBM published scripts and OC table queries (output spreadsheet)
•	TSM Deduplication per node using DEDUPSTATS (cleans up, output to text file)
•	TSM Missed Files (output spreadsheet)
•	TSM Replication Report  (output spreadsheet)
•	TSM Helix Checks  (output spreadsheet)
•	TSM Filespace Catalogue  (output spreadsheet)
•	TSM Performance Historical Analysis (Backup/Housekeeping MB/s, spreadsheet)
•	TSM Performance 24 hour Analysis (10s intervals, CSV)
•	TSM Frontend Accounting (IBM scripts – output to spreadsheet)
•	TSM Create macros for library devices, policy, nodes (output scripts)
•	TSM Drive Usage and TSM Process Graphs (output .png)
•	TSM command line, console and delimited command line to multiple clients at once
•	TSM Micro Healthcheck – (output Word XML). Automated healthcheck with graphs and problem analysis

1.1.2.	TSM for VE Sizing Tool

•	TSM for VE sizing tool (output spreadsheet) – requires RVTools output in xlsx format. 

NOTE: This now requires some work to bring it into line with recent sizing and performance changes


1.1.3.	TSM Accounting Log Processor 

•	Process dsmaccnt.log (output text file and .CSV)

1.1.4.	TSM Client Log Access

•	Access baclient, SQL, Exchange, Oracle client logs (output text – requires W7 + with powershell v2 and credentials to access client OS – Windows clients only)

1.1.5.	IBM Storage Documentation

•	V7000/V9000/V5000/SVC/Storwize family Documentation (output spreadsheet)
•	V7000U block and filer documentation (output spreadsheet)
•	XIV Documentation (Requires XCLI installed) (output spreadsheet)
•	DS8000 Documentation (Requires DSCLI installed) (output spreadsheet)
1.1.6.	Client WMI Architecture Query

•	WMI query on all clients for CPU, OS, Memory etc (output spreadsheet)
 
2.	Downloading

Software is stored on the Tectrade Dropbox.

The latest version in the “Tectrade Storage Tools” directory in Dropbox. “version.txt” shows changes. Older versions may be stored.

Additionally the .exe is packed as a zip to help avoid issues with firewalls.
3.	System Requirements

•	Windows 7 or above (e.g 2008/2012). Tested with 64 bit only. 32 bit W7 may work.
•	approx 50MB free disk (application approx. 20MB – there is no check)
•	Powershell v2 for client log file access and WMI queries (not required for other functions)
•	DSCLI for DS8000 documentation (not required for other functions)
•	XCLI for XIV documentation (not required for other functions)

It does NOT require the following to be installed (these are bundled)

•	Perl
•	TSM admin client
•	Putty (plink.exe only)

The TSM client may be required only if there are issues with the bundled client (unusual)
 
4.	TSM Versions

TSM Documentation and Healthcheck reports will work at versions 5,6,7,8+. All other functionality is designed for TSM 6 or above. TSM v5 has a different SQL syntax for many functions and is no longer supported by IBM. Node replication and deduplication reports are not applicable regardless. The Micro Healthcheck has not been tested on version 5 and is unlikely to work.
5.	Running/Installing

Storage Tools does not install anything in the registry. The first time the .exe is run it will unpack into a temporary user area and this may take 15-30 seconds on FIRST run. Provided the temporary area is not deleted the application will run quickly after the first time.

Always ‘run as’ Administrator. It may be OK without doing this, but experience has shown that this is the safest way to run this tool due to permissions when the tool tries to run external modules such as dsmadmc, plink and powershell. Applications running other applications can cause security issues.

 
 

6.	Security
6.1.	Internal Access

The opening screen will show a password prompt. If you have the ‘Tectrade Only’ password then enter it here. This will take you into the notes page and into the main menu. the password can be obtained from Keepass. 

 

DO NOT GIVE THIS PASSWORD TO CUSTOMERS!!

 
 

6.2.	Customer Access

Should customer access be required, get the customer to download the application and hit <Enter>. You will be given the following screen:

 

In this specific example, send the string “dX5wdU8NAj4KFDA1FyUwTyJ3IH5wInRwJSAiIHNxJSUlInIkJHIkICd1IiMlInAi” in the body of an email to mark.hockings@tectrade.co.uk with the subject ‘tsmtools’. No more text should be added:

 

A reply will be AUTOMATICALLY generated from a rule in Outlook:

 

Take the code e.g “KDxLRvsQcv” and enter it into the tool at the prompt:

 


 
These codes are generated EVERY time the program runs. If you close the tools and try to use the code again it won’t work and you’ll need to request another code.

6.3.	Timeout

The program has a timeout coded into it. This is generally 60 days for a new version. After this time the application will give the following message:

 

If this happens a new compiled version should be requested from the author. New versions are not automatically compiled and you may be the first person to use it after the timeout period.
 

7.	Before You Start

7.1.	Menus

The following menu options are available. Press the corresponding key for sub-section you need. If the key is invalid the menu will simply redraw. ‘q’ from the main menu will end the program.


7.1.1.	Main Menu

 

7.1.2.	TSM Menu
 

7.1.3.	IBM Storage Tools and AIX Performance Scripts Menu

 

7.1.4.	Brocade Tools Menu

 
7.2.	Error trapping and some notes on error causes

Error trapping in storage tools is basic. Errors can be caused by:

•	A spreadsheet is open and storage tools is trying to write to it. This might happen if you’ve run the same query twice but opened the output file on the first run and left it open.
•	Not running ‘as Administrator’
•	A bug
•	Unsupported OS (32 bit?)
•	Security settings on the host machine
•	If the bundled client doesn’t work, try installing the latest TSM client and choosing the option to use it.
•	Powershell v2 is not installed (for client log access and WMI queries)
•	DSCLI is not installed (for DS8000 documentation)
•	XCLI is not installed (for XIV documentation)
•	TSM or storage credentials are wrong – check the status heading for clues!
•	Security policy.

Errors will generally cause the application to exit with the line “There has been an error of some kind” or to just quit if the error has not been trapped. Further work continues to be done on this but a certain amount of IT knowledge is assumed. Post all errors to the author or Chatter and a fix will be raised. Turnaround for such errors is usually quick.

7.3.	Output Directory

Unless specified otherwise, all output from the tool will go to the output directory. This is an area in the binary unpack folders and will change with each tools version. Hit ‘o’ to open this directory. You can sort the files by modification time to get the latest output. Files can be overwritten as they are identified by the date and the device name only.

An example is included below. 

 

7.4.	Customer Name

If you want the customer name or some other identification (like server name or site) on the output spreadsheets then use the ‘n’ option. In situations where it is required you may be prompted for it again, regardless of whether it has already been set:

 

 

The CUSTOMER: heading will be updated and remembered until the application is closed or the name is changed. 

 
 
8.	Using Storage Tools

Run the application ‘as administrator’, hit ‘enter’ on the ‘conditions of use’ and enter the password. 

8.1.	TSM MENU

From the main menu go to ‘TSM Tools’ option ‘t’. You will be asked to select the client to use:

  

Generally, use the bundled client. If there are issues then install a TSM client and opt to use that instead. You also have the option to specify a non-standard client location.

If not already set, you will prompted for a TSM server user name, password, server address and port (generally 1500)

You will be given the following menu:
 

The sections below describe the function and usage of each section. All output reports can be found in the output directory unless otherwise specified. Press ‘o’ from any menu to access this area.

8.1.1.	TSM Healthcheck

The healthcheck spreadsheet gives a detailed report on server statistics and configuration that can be used for troubleshooting or summary projects. This spreadsheet contains a large amount of information and it is recommended that this is run on all customer sites as a matter of course.

You will be prompted to report occupancy values in GB or TB. It is recommended to use GB unless the system has a number of PB. In such large systems errors have been observed running queries in GB.

 

The progress meter is worked out as a percentage of the total number of queries to run and not the time each query takes. Some queries run longer than others.

 

The spreadsheet can be found in the output directory. Hit ‘o’ from any menu.

8.1.2.	TSM Documentation

The documentation spreadsheet gives a detailed report on server configuration that can be used as an installation reference. This spreadsheet contains a large amount of information and it is recommended that this is run on all customer sites as a matter of course.

You will be prompted to report occupancy values in GB or TB. It is recommended to use GB unless the system has a number of PB. In such large systems errors have been observed running queries in GB.

 

The spreadsheet can be found in the output directory. Hit ‘o’ from any menu.


8.1.3.	TSM Backup Catalogue

WARNING: The backup catalogue requires a large amount of server (TSM) temporary database space due to the nature of the initial filespace query. Check the amount of free space in the database before running this function.

The backup catalogue gives a very detailed report on all filespaces, type, platform, their capacity, occupancy, policy, last backup, schedule association and makes some general assumptions on how large databases might be where applicable. In all it reports on 43 different catalogue values.

It is extremely useful for writing formal backup catalogues. Manually compiling such a catalogue is extremely time consuming and prone to error.






Because the initial filespace query can take sever minutes to several hours, you have the opportunity to use an existing query or run a new one. Select ‘new’ if this is the first time running a catalogue. If you have encountered errors running the catalogue due to some issue with the filespace names, it is possible to continue the query on an existing/edited filespace catalogue by selecting ‘existing’.  You may also elect to skip to archive processing, missing out backups altogether. 

 


 

You can edit the file and remove filespaces that you don’t wish to catalogue or that may be causing errors (e.g. filespaces with special characters or quotes MAY cause issues, although every step has been taken to make sure these characters are supported) 
 

The processing can be very time consuming:

 


 

The spreadsheet can be found in the output directory. Hit ‘o’ from any menu.

8.1.4.	TSM Deduplication Catalogue

The deduplication catalogue looks at space savings when using TSM deduplication. It will not report on external deduplication such as ProtecTIER or DataDomain. This option uses the latest IBM select statements with some additions to compare with REPORTING_MB from the occupancy tables. The spreadsheet will report on all nodes ordering them in ‘best’ and ‘worst’ for deduplication and compression. Some statistics are taken from the new OC tables in V7.1.5+

 



The spreadsheet can be found in the output directory. Hit ‘o’ from any menu.

8.1.5.	Node Activity Report (including VE)

This spreadsheet contains detailed node activity reports from the actlog. This can be used for identifying issues or verifying the backup settings such as incremental forever, compression, client side deduplication etc.

 



The output below is typical and shows all statistics for the backup as reported in the activity log.

 
 
The spreadsheet can be found in the output directory. Hit ‘o’ from any menu.
8.1.6.	TSM Missed Files Spreadsheet (With exclude list generation)

This option can be used to document missed file backups. It will also generate an exclude list so that problem files can be added to an option set or an include/exclude list.

 


 


 

There is a sorted and unsorted macro in the output directory. The macros look like this:

 

You will need to do a search and replace on the option set name or remove the optionset definition altogether if the idea is to use in a dsm.opt, dsm.sys or an include-exclude file.

The spreadsheet and macros can be found in the output directory. Hit ‘o’ from any menu.
 
8.1.7.	TSM Replication Report

The replication report has been recently updated and shows replication statistics vs amounts backed up/archived, local and remote data amounts and numbers of files. It does not require a login to the replication target.

 


 

The spreadsheet can be found in the output directory. Hit ‘o’ from any menu.
 


8.1.8.	TSM Helix Checks

Runs a set of checks post-installation for Helix deployments. This report needs to be updated to reflect the latest Helix standards, but is a good check of the basics until some time can be spent on updating it.

 

Set the units – use TB if there are errors.

 


 

The spreadsheet can be found in the output directory. Hit ‘o’ from any menu.

8.1.9.	TSM Filespace Catalogue

This creates backup and archive filespace catalogues in .csv format. These can be used to verify whether backups exist, what management class they are bound to and how many objects there are. This can be a lengthy query and may take some time to run. This is NOT the backup catalogue.

 

Backup:

 

Archive:

 


The .csv’s can be found in the output directory. Hit ‘o’ from any menu.
 

8.1.10.	TSM Macros 

This option creates a number of useful macros and .csv files in the output directory. These can be used to duplicate policy, nodes, option sets, paths, drives etc.

 



Generally the performance statistics are better, 

The files can be found in the output directory. Hit ‘o’ from any menu.
 
8.1.11.	TSM Drive and Process Graphs

This function will create graphs of TSM process and drive activity over different lengths of time. These are a subset of those produced for the TSM Micro Healthcheck.

 

Enter the customer name. This is required for the graphs and it will ask you (at present) regardless of whether the name is already set.

 

It will search for local and then remote libraries. Enter the library you require or <enter> for all.

 


An example of the output is below.
 

 

The graphs can be found in the output directory. Hit ‘o’ from any menu.
 
8.1.12.	TSM Command Line

This function gives TSM command line access to multiple TSM servers simultaneously without having to manually set up option files. It will also give you console access and comma-delimited sessions:

 

Quick connection test verifies connection and gives address and level:

 

For an interactive session choose ‘loop mode’. Then choose the colour of the window.

 

By changing the credentials you are able to log on to many servers at once:

 

Console sessions are non-interactive, listing the activity log in real time. They use slightly darker colours. This example is ‘yellow’ – using the loop and console windows as a ‘pair’ of colours makes it easier to tie up the two if running multiple server sessions:

 



Comma-delimited mode can be used to capture data for spreadsheets, perhaps where a bespoke query is required or for graphs:

 

8.1.13.	TSM Define Nodes from File

This option can be used to define nodes in large batches to TSM:

 

Open the output directory ‘o’ and edit the nodelist_smp.txt file. Save it as nodelist.txt when done editing it. The format of the file is described. 

 

 

Macros are created in the output directory that can be used to define the new nodes to TSM. A search and replace could also be used to turn the ‘define node’ into ‘update node’ as required.
8.1.14.	Return to Previous Menu

Return to main menu.

 
9.	MAIN Menu: TSM IBM Deduplication Statistics (BETA)

Runs IBM deduplication statistics based on their published PERL script. Probably limited use as the DB2 sections cannot be implemented easily without manual intervention. Needs more tests on a wider range of environments to see if it is useful:

 

Output to .txt file in output directory ‘o’.
 
10.	MAIN Menu: TSM Deduplication Statistics Detail per Node (BETA)

Uses DEDUPSTATS per node. 

Enter a search nodename e.g. “TST”

 

Copy the node you are interest in and hit ‘f’ to continue:

 

Enter the node name:
 

The program waits for GENERATE DEDUPSTATS to complete:

 

It writes the output to screen and CSV file then runs ‘DELETE DEDUPSTATS’ to clean up:

 

The stats are available in the output directory ‘o’

11.	MAIN Menu: TSM Micro Healthcheck

The TSM Micro Healthcheck is a work in progress. Essentially this tool uses analytics to make diagnostic statements about the TSM instance, make graphs and suggest recommendations. It is not a substitute for a manual healthcheck, but it can be a good starting point or suppliment. 

11.1.	Customer Name

Enter the name of the customer. This is required for the graphs and the Word document and will be requested even if already set.

 

There is a progress meter for the initial analysis and collection:

11.2.	Processing

 

You will be prompted for 1. local libraries and 2. remote libraries. You may not see one or the other depending on whether such libraries exist. Pressing <enter> will process all libraries:

 
11.3.	Choose Library (Local and Remote)

 

If there are no remotely controlled libraries the program will let you know:

 

If there ARE remote libraries then you will be prompted to enter the library details (no screenshot). The ip address of the library will be displayed if correctly set up.

11.4.	XML Output

 

The final output will be in Word XML format. Open the file, edit where appropriate and export as Word or PDF. format. 

If you need to move the files and open on another system, copy the .xml file and ALL of the .png files as a zip. The images are embedded links in the .xml and need to be in the same directory. This requirement is removed once the healthcheck is converted to PDF or another self-contained format. 

Office 2007 has been tested. Earlier versions do not work. There may be issues with later versions – please feedback any issues.

   

 

 

 

All images and spreadsheets can be found in the output directory by pressing ‘o’
 
12.	MAIN Menu: TSM for VE Sizing Tool

The TSM for VE sizing tool should be used in conjunction with the TSM sizing tool. 

Essentially this module uses the output from RVTools (www.robware.net) and processes it into a summary spreadsheet. It then attempts to use the IBM sizing recommendations to work out how many proxies and datamovers might be required under different load conditions (incremental forever, periodic fulls, backup windows, CBT resets, restore windows) – parameters are highly configurable.

 

12.1.	Processing the RVTools spreadsheet

Hit ‘r’ to begin processing the spreadsheet. The output directory will be opened automatically.

 

Enter the customer name:

 

Copy the RVTools spreadsheet to the output directory and enter the full name at the prompt. It MUST be in .xlsx format – the default is .xls. You will need to convert it.

 

 

Due to changes in the format of the RVTools output you must remove the tabs that are not required and ensure the tabs are in the correct order:

 

 

The program will parse the RVTools spreadsheet:

 

12.2.	Model Parameters

Once the spreadsheet processing is complete you need to set the model parameters. Sensible defaults have been chosen. You can run this step as many times as you like until it is correct. Once correct you can run the model. Several models can be run with different parameters and will be included in the output:

 

 

Check the parameters and run again as required. Use a data reduction ratio of 1:1 for no deduplication. For compression only choose ‘client side deduplication’ – the effect is the same.

Versions over 730 cannot be handled by the program. Again, use the TSM sizing tool for accurate TSM sizing predictions.

12.3.	Run the Model

Use the menu to run the model with the current parameters. You can then set different parameters and run the model again – the results will be appended and several scenarios can be compared:

 

When dealing with RDM’s it is important to choose the way VM capacities are dealt with as this can make a significant difference to the calculations. You may have to look at the RVTools spreadsheet to decide the best setting. 
As a rule of thumb:

1.	Use ‘d’ for high RDM values
2.	Use ‘p’ for low or zero RDM values
3.	Use ‘r’ if the intention is to convert all RDM’s to virtual datastore disk.

 

 

12.4.	Make the Spreadsheet (Final Step)

Once all models have been run, create the spreadsheet:

 

 

The first part of the spreadsheet is the summary of the environment:

 
The second part is the model settings:

 


 
The final part is the output summary. Several models/summary will be included if more than one model was run:

 
 
13.	MAIN Menu: TSM Accounting Log Processor

This module makes use of a Perl script found on the IBM site for processing the accounting log dsmaccnt.log. You will need to find this file on the server and load it into the output directory:

 


 

 

The report is in the output directory. There is also a .csv file which can be used to create graphs of client backup activity.

 


14.	SUB Menu: TSM Client Log File Access

This module uses Powershell V2 to access logs stored on TSM clients. This must be installed and in the path

 

If not already set, it will initially prompt for the TSM client. Use the bundled client if possible, although an installed version can be used. It will then prompt for the Domain Admin login. It is important that the user has permission to access the files on the client otherwise permission issues will present themselves. The Windows credentials will be displayed in the information line in the header:


 

The following options are available from this menu:

 
14.1.	Get a Log File

 

Search for a client in TSM:

 

 

Copy the IP address:

 

Choose the type of log file:

 

Enter the IP address:

The module will test if the client is ONLINE. If the client is OFFLINE then do not attempt to gather a log file unless you know the client is programmed not to respond to ICMP resquests.

Select the file to restore from the list:

 

 

The log file will be downloaded to the output directory and automatically opened. You will be given the option to restore another file from an up to date list or choose <enter> for none and you will be taken back to the main menu.

 


 

14.2.	Search for a Node

This just allows you to search for a node in TSM and get the IP address.

14.3.	Search for Node Errors in TSM

This is for TSM errors associated with the node. Ensure you use the TSM name here, not the IP address – it is looking for TSM nodenames, not DNS names.

 

The errors (if there are any) will be opened automatically. You will need to save the results if you want to keep them.



 


14.4.	Search for Node Errors in TSM

This module pulls out ALL node activity from the TSM activity log. Again, use the TSM client name and not the DNS name unless they are the same. The module gives you the option to search for the name in TSM:

 

14.5.	TSM Command Line

Basic access to the TSM command line – this was considered useful in the set of menus:

 

 
14.6.	Change the Drive Letter for Files

Use this option to change the drive where the files are stored. Non-standard paths within that drive are not supported at present:

 
 
15.	SUB Menu: IBM Storage Tools

These modules are used to document IBM storage units.

 

15.1.	V7000/V9000/SVC Documentation

You will require the v7000 user and password, the address of the cluster and the location of the SSH key if used:


 

15.2.	V7000U Documentation

You will require the v7000 user and password, the address of the cluster and the location of the SSH key if used:

 
15.3.	XIV Documentation

The XIV command line will need to be installed and working. ‘xcli’ will need to be in the path. Test from the command line.

<waiting for screenshot>

15.4.	DS8000 Documentation

The DS8000 command line will need to be installed and working. It will need to be in the path – test this by running ‘dscli’ on the command line.

 

 
16.	SUB Menu: Brocade Tools

 

16.1.	Brocade Documentation

Set the switch credentials when you enter the sub menu. This option will output the switch configuration to a spreadsheet.

16.2.	Brocade Analysis

For troubleshooting. Collects port errors and flags up ports that generate them.

16.3.	Command Line

Opens a plink/putty command line using the credentials you supplied.

16.4.	Switch Name Server Contents

Search for SAN devices.

17.	SUB Menu: Client Node WMI Processor Query


If this is required then please contact the author. It is in BETA at present.

18.	Appendix A – Change History


Newest Version 1.07 (release)
Created On: 14th Oct 2011
Last Updated On: 16th Sept 2014


v1.4 update: Added to -p menu option. Now creates Policy, node and option set macros
v1.5 update: Added date to filenames on servicedesk's request. Missed files spreadsheet pulldown menu changed.
v1.6 update: Bug fixes: Removed ping test due to ICMP over VPN not working. Various problems fixed after addition of date to file name.
v1.7 update: Added Entitled Occupancy query to both documentation and healthcheck
v1.8 update: Added some columns for copygroups. Added Audit Lic on startup. Added Filespace Occ report
v1.9 update: Added API/TDP guestimate for database sizes - divide occupancy by retver or retextra - requires some thought!
v2.0 update: Added in dedupe savings, detailed cap licensing breakdown and occupancy by stgpool and domain
v2.1 update: Filespace totals for presented storage estimations
v2.2 update: Added Backup Catalogue and additional console and commadelimited options
v2.3 update: Various bug fixes
v2.4 update: Added automation (-b flag) of backup catalogue. Added node creation macro from comma separated file (menu option "c"). Fixed some SQL weirdness with v6. Updated screen redraw.
v2.5 update: Added dedupe and occupancy on backup catalogue Note: This is still showing as v2.4 in heading. Added lock file warning for multiple sessions
v2.6 update: Changed format of spreadsheets more in line with current colour schemes. Made a few changes to the content of the documentation and healthcheck reports to avoid errors. Changing credentials within program now works.
v2.7 update: Changed calculation for occupancy to take into account archives. Spreadsheet now shows archive filespace occupancy. Changed colors again to exact specs in Tectrade guidelines.
v2.8 update: Changed colours again to make purple and grey primary. Dropped in Tectrade logo into cell C1
v2.9 update: You now have the option of opening the command windows in different colours. The loop versions of the colours are brighter than the console versions to help distinguish them. The new version of the perl packing program seems to be including more library stuff and the size of the file has increased to 27MB. Can't do much about this unfortunately.
v3.0 update: Fixed bug where 'change credentials' in command line menus wasn't changing tsm servername or port. Got the size of the binary back down to 11.3MB. Added Status and default MGMT class build macros as the lack of this was annoying.
v3.0.1 update: (tsmtools_neil.exe - temp update for Grey Comms) - backup catalogue options for not editing the node list and not regenerating the whole backup_cat.txt file. Not fully tested yet.
v3.1 update: Bug fixes
v3.2 update: Backup catalogue updates: Occ/filespace ratio - indication of 'versions' of filespace. Database size 'guess' Use with caution as figures need to verified by cross checking against known sizes.
v3.3 bug fix: Fixed bug in backup catalogue bombing out if management class in invalid.
v3.4 update: Added 'number of files' to backup catalogue. Added individual storage pool backup stats to healthcheck.
v3.5 update: Update backup catalogue for TSM 5.5 - bug due to query for reporting_mb
v3.6-7 <deleted>
v3.8 update: Attempted to fix an issue with v5 backup catalogue
v3.9: Added dedupe catalogue option 'o'. Updated Backup Catalogue to exclude copypool occupancy. This has a knock on effect on other occupancy related parameters such as database versions and filespace to occupancy ratio.
v4.0: Changed occupancy on dedupe cat to GB and all values to 2 decimal places. Added summed storage pool dedupe to end of spreadsheet. Added database filespace version guess.
v4.1: Added Client side dedupe and pending/delete stats to dedupe catalogue
v4.2: Added last filespace backup to dedupe spreadsheet. Added performance stats output - pulls timings from summary log and dumps them in the baclient directory as .csv for drawing graphs. Useful pre-post upgrades etc.
v4.2_LLoyds: Special version for Lloyds to help manage LTO5 migration. This will not do anything useful on anyone elses system.
v4.3: Added Dedupe by Domain to dedupe report. Added Node count and 'unique' node count by IP address to Health Check Report
v4.4: Highlighted the Inspected and Transferred bytes in the session output for the dedupe catalogue. You can work out the overall data reduction from this.
v4.5: Fixed occupancy queries for TSM 5.5 - didn't like '...from nodes d ....'. Maybe this has fixed same issue with TSM 6.1? Unable to test 6.1 at present. Also fixed issue with TSM 5.5 not able to use UNIQUE keyword. Changed to DISTINCT. Fixed Backup Catalogue error for 6.1 hopefully - filespace_id seems to be an integer in 5.5 and 6.1 and not in 6.2>. Cast the variable to CHAR. Added TSM scripts to general config macros.
v5.0: Intermediate (deleted)
v5.1 Beta Release: Standalone version. Does not require the TSM client to be installed. No longer puts files in 'baclient' directory - use the menu option 's' to get at the files. Waiting for feedback from the group. Last version still available for now.
v5.2: Beta Release: Trying some updates for TSM 5 Backup Catalogue.
v5.3: Beta Release: More tweaks for v5 catalogue. Compiled C++ .dll's into code after getting some errors when testing - this started after installing latest 6.3 client and using the standalone version. Errors have not re-occurred since doing this. Note: There may be an issue with duplicate lines in the output due to the way that some v5 instances populate the management class field in the backups table. I have noticed duplicate entries on the same filespace with the management class listed with the actual value (GENERAL_FILES for instance) and also as 'DEFAULT'. I have found no way to remove these duplicates during processing. You can remove them yourself by selecting all data and using the 'remove duplicates' in Excel.
v5.4: (release) Standalone version replaces all previous versions. Updated code to allow scheduling/automation of reports. Command arguement for baclient location removed - see "tsmtools.exe -u"
v5.5: (release) Added node replication option 'r'. Reorgainised menus a little. Automation of tsmtools fixed. Added warning splash screen for recent changes. Tidied up TSM 5.5 data gathering for IMS project. Added collection of all client options.
v6.0: Updated healthcheck and documentation reports. Corrected some bugs with reclamation and entitled occupancy using new IBM CRM macros
v6.1: Added some functionality to backup catalogue, fixing archives and allowing backups or archives to be skipped.
V6.2: Added more healthcheck queries
V6.3: Added SAN query and Server query into documentation report.
v6.4: Updated database and log stats to GB in all cases and added utilised space to avoid having to calculate it. Removed SAN query as it seems to cause a stack trace crash in dsmadmc.exe.
v6.5: Added SUMMARY table stats on all client and housekeeping processes into doc and healthcheck and added housekeeping entity failures to help narrow down specific issues, again into doc and healthcheck reports in cases where healthcheck will not run due to scale of environment.
v6.6: Added node 'contact' into association and filespace queries for service ops. Added Domain, IP addresses and hostnames into filespace and occupancy queries to help with backup catalogue process.
v6.7: Added security password
v6.8: Fixed command line and added dedupe report/remove backup cat
v6.9-v7.1: Various additions to healthcheck report. Added Servicedesk email to salesforce using -s command line option
v7.2: Added AES encryption to packaging.
v7.3: Added Migration per pool GB and number of tapes reclaimed. Fixed a few errors in some calculations using days instead of hours - rounding issue. All reports should be consistant now.
v7.4: Added "Are all storage pools being backed up" in healthcheck
v7.5-v7.7: Added password handling changes. There is now an internal password for Tectrade and a web password for customers.
v7.8: Added the option to choose what tsm client is used after some issues at IMS.
v7.9: Removed
v7.10: Updated documentation outputs to put scripts in correct order (line numbers were out of order)
v7.11: Removed .dll issues
v7.12: Fixed .dll issues
v7.13: Added TSM for VE queries from summary_extended
v7.14: Removed
v7.15: Various tidy ups - removed some stuff in 'get live data' and made changes to column headings for TSM for VE output.
v7.16: Version 7.15 had .dll issue again. Fixed the build script and deleted the erroneous line.
v7.17: Added port number to .xls files to stop from being written over if two servers on same address
v7.18: Added HELIX check RFE
v7.19: Added pvu stats to v6 healthcheck
v7.20: Added v7 support (basic)
v7.21: Removed - intermediate
v7.22: All spreadsheets new use new Excel::Writer::XLSX - this seems to be a direct swap. This may address the crashing issue on some systems and will allow for larger spreadsheets (over 65000 lines).
v7.23: Added in EXCLUDE Macro for client option sets based on the missed files spreadsheet 
v7.24: More file failure clauses added for 'f; option
v7.25-31 - tests
v7.32 - added response key authentication for isolated networks - internet key no longer works
v7.33 - some changes - last version of tsmtools - switching to storage tools
Storage Tools:
v1.01-02 deleted
v1.03: First release
v1.04: Updated to add in lscontroller in v7000 and v7000u documentation
v1.05-06: Deleted
v1.07: Added TSM for VE sizing tool
v1.08-v1.20: Intermediates and tests
v1.21: BETA - modifications to TSM for VE tool calcs and issues with RVTOOLS variable outputs. Addition of BETA version of Micro Dashboard - still a few issues but mainly stable
v1.22-v1.23: Intermediates and tests
v1.24: Working BETA of the micro healthcheck - please feed back issues (of course you will!)
v1.25-v1.30 Intermediates and tests
v1.31 - Stable BETA
v1.32-1.37: Intermediates and tests
v1.38: Gantt charts for drive mounts and processes added to Micro Healthcheck. TSM for VE sizing updated to cope with changing columns.
v1.39-1.46: Intermediates
v1.47: Client log file recovery, menu fixes. Some general tidying.
v1.48-1.53 - intermediates
v1.54 - Updates to client log file fetch - speeded up and refined process.
