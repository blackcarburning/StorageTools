##########################
## Release info
##########################

# debug
#use diagnostics -verbose;
#enable  diagnostics;
#use strict;

our $software_version="v2.95";
our $released="March 27th 2020";


##########################
## End Release info
##########################

### SETUP
### SETUP
### SETUP
### SETUP
### SETUP
### SETUP
### SETUP
### SETUP
### SETUP
### SETUP
### SETUP
### SETUP
### SETUP
### SETUP
### SETUP
### SETUP
### SETUP
### SETUP
### SETUP
### SETUP
### SETUP
### SETUP
### SETUP
### SETUP
### SETUP
### SETUP
### SETUP
### SETUP
### SETUP
### SETUP
### SETUP
### SETUP
### SETUP
### SETUP
### SETUP
### SETUP
### SETUP

##########################################################################
##### Set Some Dates for file naming
##########################################################################

my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime;
$year += 1900;
$mon += 1;
my $datetime = sprintf "%04d%02d%02d%02d%02d%02d", $year, $mon, $mday, $hour, $min, $sec;
print "$datetime\n";
use POSIX;
my $datetime2 = strftime( '%d_%m_%Y', localtime );
chomp $datetime2;

##########################################################################
##### Remove some plaintext code in uncompressed repository
##########################################################################

unlink ("$ENV{PAR_TEMP}\\inc\\lib\\STORAGE_TOOLS_$software_version.pl");


###########################################################################
##### For Testing
###########################################################################
##
## Change the paths to allow testing from the Perl Compiler.
## Requires the external TSM client to be used though
##

## When running from compressed in .exe....
our $host_ps_directory="$ENV{PAR_TEMP}\\inc\\inc";
our ${host_directory}="$ENV{PAR_TEMP}\\inc\\inc\\";
our ${baclient_directory}="$ENV{PAR_TEMP}\\inc\\inc\\";
our $inc_directory="$ENV{PAR_TEMP}\\inc\\inc\\";
our $cust_directory="$ENV{PAR_TEMP}\\inc\\inc\\";
our $autodeploy_dir="$ENV{PAR_TEMP}\\inc\\inc\\";

## When running from Perl editor....
# our $host_ps_directory="C:\\progra~1\\tivoli\\tsm\\baclient";
# our ${host_directory}="C:\\progra~1\\tivoli\\tsm\\baclient\\";
# our ${baclient_directory}="C:\\progra~1\\tivoli\\tsm\\baclient\\";
# our $inc_directory="C:\\progra~1\\tivoli\\tsm\\baclient\\";
# our $cust_directory="C:\\progra~1\\tivoli\\tsm\\baclient\\";
# our $autodeploy_dir="C:\\progra~1\\tivoli\\tsm\\baclient\\";

### VARIABLES
### VARIABLES
### VARIABLES
### VARIABLES
### VARIABLES
### VARIABLES
### VARIABLES
### VARIABLES
### VARIABLES
### VARIABLES
### VARIABLES
### VARIABLES
### VARIABLES
### VARIABLES
### VARIABLES
### VARIABLES
### VARIABLES
### VARIABLES
### VARIABLES
### VARIABLES
### VARIABLES
### VARIABLES
### VARIABLES
### VARIABLES
### VARIABLES
### VARIABLES
### VARIABLES
### VARIABLES
### VARIABLES
### VARIABLES
### VARIABLES
### VARIABLES
### VARIABLES
### VARIABLES
### VARIABLES
### VARIABLES
### VARIABLES

##########################################################################
## Initialise Variables
##
## Note: Due to inexperience I have used a large number of global variables to be able to access
## the data between subroutines. It is not clear to me how this can easily be avoided with this kind 
## of data gathering. It is accepted that this is not good practice.

## Misc
our $filter_range=99999;
our $attach_list="";
our $ba_client_type="Undefined!";
our $log_drive_letter="C";

## Users
our $windows_domain=""; 
our $windows_admin="";
our $domain_password="";
our $lm_user="";
our $lm_password="";
our $lm_server="";
our $lm_port="";		
our $tsm_user="";
our $v7000_user="";
## Various
our $health_or_doc="healthcheck";
our $image_dir="c:/";
## Graphs
our $datalist;
our $exp_time;
our $exp_objects;
our $mb_sec;
our $mbytes_sec;
our @data_max;
our $x_count;
our $maximum_y;

## Speadsheet parameters
our $max_second_axis;
our $length_f1=23;
our $length_f2=22;
our $length_f3=22;
our $length_f4=22;
our $length_f5=22;
our $length_f6=22;
our $length_f7=22;
our $length_f8=22;
our $length_f9=22;
our $length_f_10=22;
our $length_f_11=22;
our $length_f_12=22;
our $length_f_13=22;
our $length_f_14=22;
our $length_f_15=22;
our $length_f_16=22;
our $length_f_17=22;
our $length_f_18=22;
our $length_f_19=22;
our $length_f_20=22;
our $length_f_21=22;
our $length_f_22=22;
our $length_f_23=22;
our $length_f_24=22;
our $length_f_25=22;
our $length_f_26=22;
our $length_f_27=22;
our $length_f_28=22;
our $length_f_29=22;
our $length_f_30=22;
our $length_f_31=22;
our $length_f_32=22;
our $length_f_33=22;
our $length_f_34=22;
our $length_f_35=22;
our $length_f_36=22;
our $length_f_37=22;
our $length_f_38=22;
our $length_f_39=22;
our $length_f_40=22;
our $length_f_41=22;
## Various
our $customer_name="<Customer>";   
our $lockfile="";
our $actual_ver=6;
our $version=6;
our $TB_DIV=1;
our $TB_TITLE="GB";


#################### TSM FOR VE VARIABLES
## Global Variables We will need to make our calculations

our $total_number_of_vms=0;
our $total_switched_on=0;
our $total_switched_off=0;
our $total_suspended=0;
our $total_vm_cpu=0;
our $total_vm_memory=0;
our $total_vm_nics=0;
our $total_vm_disks=0;
our $total_provisioned_MB=0;
our $tabvInfo_total_inuse_MB=0;
our $total_unshared_MB=0;
our @unique_datacenters;
our @unique_clusters;
our @unique_hosts;
our @biggest_vm_list;
our $total_vm_version_at_7=0;
our $total_vm_version_gt_7=0;
our $total_vm_version_le_7=0;
our $unique_dc_size=0;
our $unique_cl_size=0;
our $unique_hs_size=0;
our $tools_not_installed=0;
our $tools_not_running=0;
our $tools_ok=0;
our $tools_old=0;
our $tools_unknown=0;
our $total_number_datastores=0;
our $total_capacity_datastores=0;
our $datastore_free_mb=0;
our $datastore_free_pct=0;
our $datastore_100GB_free=0;
our $datastore_10PCT_free=0;
our $datastore_capacity=0;
our $datastore_provisioned=0;
our $datastore_in_use=0;
our $datastore_total_capacity=0;
our ${datastore_total_in_use}=0;
our $datastore_total_provisioned=0;
our $datastore_disk_free_space=0;
our $disk_raw_mappings=0;
our $disk_total_capacity_raw_mappings=0;
our $disk_normal_mappings=0;
our $param_yearly_growth=0;
our $average_storage_per_vm=0;
our ${snapshot_total_storage_MB}=0;

## stats
our $stats_tsm_versions=31;
our $stats_annual_storage_growth=20;
our $stats_annual_vm_growth=20;
our $stats_daily_change_rate=2;
our $stats_backup_window=8;
our $stats_ss_full_backup_new_vms=0.01;
our $stats_ss_full_cbt=0.01;
our $stats_ss_full_restore=0.01;
our $stats_phase_in_window=8;
our $stats_phase_in_days=31;
our $stats_critical_vms_restore=20;
our $stats_critical_vms_RTO=72;
our $stats_vcpus_per_session=0.1;
our $stats_vcpus_per_GBH_on_backup=0.025;
our $stats_vcpus_per_GBH_on_restore=0.01;
our $stats_vcpus_per_proxy=4;
our $stats_max_throughput_per_proxy=350;
our $stats_max_throughput_per_inc_session=20; #backup rate for incrementals
our $stats_max_throughput_per_full_session=40; #backup rate for fulls
our $restore_rate=40; ## assume non-deduplicated - there is a check later
our $stats_days_between_fulls=0;
our $stats_client_side_reduction_ratio=1;
our $stats_client_side_rr_as_decimal=1;
our $has_process_been_run="no";
our $stats_max_throughput_per_tsm_server_1G=350;
## NOTE  10G rate assumes 70% capable throughput
our $stats_max_throughput_per_tsm_server_10G=3076;
our $number_of_top_vms_to_see=20;
our $is_deduplication_on="DEDUPE IS OFF";
our $stats_VMMaxparallel=4;
## Workload

our $workload_daily_inc_backup=0;
our $workload_aggregate_throughput_inc_backup_window=0;
our $workload_full_backup_new_vms=0;
our $workload_full_backup_cbt_vms=0;
our $workload_total_full_backup=0;
our $workload_total_full_throughput_backup=0;
our $workload_full_restore=0;
our $workload_total_full_throughput_restore=0;
our $workload_phase_in_daily=0;
our $workload_phase_in_throughput=0;
our $workload_critical_restore_amount=0;
our $workload_critical_restore_throughput=0;
our $workload_sessions_inc=0;
our $workload_sessions_full=0;
our $workload_sessions_restores=0;
our $workload_sessions_phasein_initial_full=0;
our $workload_sessions_critical_restore=0;
our $workload_sessions_concurrent_total=0;
our $workload_cpus_required=0;
our $workload_cpu_proxy_hosts_required=0;
our $workload_throughput_proxy_hosts_required=0;
our $workload_cluster_proxy_hosts_required=0;
our $tsm_psp_TB_year_0=0;
our $tsm_psp_TB_year_1=0;
our $tsm_psp_TB_year_2=0;
our $tsm_psp_TB_year_3=0;

####### END TSM FOR VE VARIABLES

### Dashboard Variables

		our $gr_title;
		our $gr_xlabel;
		our $gr_ylabel;
		our $gr_filename;
		our $gr_datasets;
		our @gr_legendkeys;
		our $gr_maxy;
		our @gr_dates;
		our @gr_data1;
		our @gr_data2;
		our @gr_data3;
		our @gr_data4;
		our @gr_data5;
		our @gr_data6;
		our @gr_data7;
		our @gr_data8;

### SUBROUTINES
### SUBROUTINES
### SUBROUTINES
### SUBROUTINES
### SUBROUTINES
### SUBROUTINES
### SUBROUTINES
### SUBROUTINES
### SUBROUTINES
### SUBROUTINES
### SUBROUTINES
### SUBROUTINES
### SUBROUTINES
### SUBROUTINES
### SUBROUTINES
### SUBROUTINES
### SUBROUTINES
### SUBROUTINES
### SUBROUTINES
### SUBROUTINES
### SUBROUTINES
### SUBROUTINES
### SUBROUTINES
### SUBROUTINES
### SUBROUTINES
### SUBROUTINES
### SUBROUTINES
### SUBROUTINES
### SUBROUTINES
### SUBROUTINES
### SUBROUTINES
### SUBROUTINES
### SUBROUTINES
### SUBROUTINES


sub SAN_devices {
	
		
		use Win32::Console::ANSI;
		use Term::ANSIColor;
		&draw_heading;
		print color 'bold green';
		print "\nListing All SAN devices known: \n\n";
		print color 'reset';		
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select * from SAN > ${host_directory}/${tsm_server}_ALL_SAN.txt");		
		system ("start ${host_directory}/${tsm_server}_ALL_SAN.txt");
		system("pause");
		
	}
	

sub table_query {
	
		
		use Win32::Console::ANSI;
		use Term::ANSIColor;
		&draw_heading;
		print color 'bold green';
		print "\nListing All Tables \n\n";
		print color 'reset';		
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select tabname from syscat.tables > ${host_directory}/${tsm_server}_ALL_TABLES.txt");		
		system ("start ${host_directory}/${tsm_server}_ALL_TABLES.txt");
		&draw_heading;
		TABLE:
		print color 'bold green';
		print "\nEnter Table Name: ";
		print color 'reset';
		$table_name = <STDIN>;
		chomp $table_name;
		print "File in form column name/type/length:\n\n";
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select colname,typename,length from syscat.columns where upper(tabname)='$table_name' > ${host_directory}/${tsm_server}${table_name}_COLUMNS.txt");		
		system ("start ${host_directory}/${tsm_server}${table_name}_COLUMNS.txt");
		print "'q' to quit...";
		$toquit = <STDIN>;
		chomp $toquit;
		if ("$toquit" ne "q") 
			{ 
			&draw_heading;
			goto TABLE;
			}
		
	}
	
	
sub text_editor {
	
		
		use Win32::Console::ANSI;
		use Term::ANSIColor;
		&draw_heading;
		print color 'bold green';
		print "\nEnter pre-text: ";
		print color 'reset';
		$pretext = <STDIN>;
		chomp $pretext;
		print color 'red';
		print "\nEnter select statement: ";
		print color 'reset';
		$select_statement = <STDIN>;
		chomp $select_statement;
		print color 'magenta';
		print "\nEnter post-text: ";
		print color 'reset';
		$posttext = <STDIN>;
		chomp $posttext;
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt $select_statement > ${host_directory}/${tsm_server}_MACRO_temp.txt");		
		open (DATA, "${host_directory}/${tsm_server}_MACRO_temp.txt") or &been_an_error;	
		@csvfile=<DATA>;  
		close DATA;
		open (OUTPUT_QUERY, ">${host_directory}/${tsm_server}_MACRO_QUERY_FINAL.txt") or &been_an_error;
		print color 'yellow';
	        print "'y' to add to add 'are you sure' reply otherwise 'n': ";
	        print color 'reset';
		$reply_y = <STDIN>;
		chomp $reply_y;
		foreach $element (@csvfile) {
		chomp $element;
		print OUTPUT_QUERY "$pretext $element $posttext\n";
			if ("$reply_y" eq "y") {
				print OUTPUT_QUERY "y\n";
			}
		
		}
		close OUTPUT_QUERY;
		close DATA;
		system ("start ${host_directory}/${tsm_server}_MACRO_QUERY_FINAL.txt");
	}
	

sub deduplication_summary {
	chdir ${host_directory};
	unlink ("${host_directory}/${tsm_server}_$health_or_doc.csv");
	
	@commands = (
	
	["Nodes with the best overall savings:-","NODE,STGPOOL_NAME,PROTECTED_GB,DEDUPSAVINGS_GB,COMPSAVINGS_GB,OVERALL_SAVINGS_GB,OVERALL_SAVINGS_PCT,REPORTING_GB","\"SELECT s.ENTITY,o.stgpool_name,(CAST(FLOAT(SUM(s.bytes_protected))/1024/1024/1024 AS DECIMAL(12,2))),(CAST(FLOAT(SUM(s.dedup_savings))/1024/1024/1024 AS DECIMAL(12,2))),(CAST(FLOAT(SUM(s.comp_savings))/1024/1024/1024 AS DECIMAL(12,2))),(CAST(FLOAT(SUM(s.comp_savings)+SUM(s.dedup_savings))/1024/1024/1024 AS DECIMAL(12,2))) ,COALESCE((CAST(FLOAT(SUM(s.dedup_savings)+SUM(s.comp_savings))/FLOAT(SUM(s.bytes_protected))*100 AS DECIMAL(5,2))),0), int(sum(o.reporting_mb/1024))  from summary_extended s, OCCUPANCY o WHERE (s.activity='BACKUP' or s.activity='ARCHIVE') and s.entity=o.node_name GROUP BY S.ENTITY, o.stgpool_name ORDER BY 6 DESC FETCH FIRST 1000 ROWS ONLY\""],
	["Best compressed nodes:-","NODE,STGPOOL_NAME,PROTECTED_GB,DEDUPSAVINGS_GB,COMPSAVINGS_GB,DEDUP_PCT,COMP_PCT,REPORTING_GB","\"SELECT s.ENTITY,o.stgpool_name, (CAST(FLOAT(SUM(s.bytes_protected))/1024/1024/1024 AS DECIMAL(12,2))), (CAST(FLOAT(SUM(s.dedup_savings))/1024/1024/1024 AS DECIMAL(12,2))) , (CAST(FLOAT(SUM(s.comp_savings))/1024/1024/1024 AS DECIMAL(12,2))), (CAST(FLOAT(SUM(s.dedup_savings))/FLOAT(SUM(s.bytes_protected))*100 AS DECIMAL(5,2))),COALESCE((CAST(FLOAT(SUM(s.comp_savings))/FLOAT(SUM(s.bytes_protected)-SUM(s.dedup_savings))*100 AS DECIMAL(5,2))),0),int(sum(o.reporting_mb/1024)) from summary_extended s, OCCUPANCY o WHERE (s.activity='BACKUP' or s.activity='ARCHIVE') and s.entity=o.node_name GROUP BY S.ENTITY, o.stgpool_name ORDER BY 7 DESC FETCH FIRST 1000 ROWS ONLY\""],	
	["Worst compressed nodes:-","NODE,STGPOOL_NAME,PROTECTED_GB,DEDUPSAVINGS_GB,COMPSAVINGS_GB,DEDUP_PCT,COMP_PCT,REPORTING_GB","\"SELECT s.ENTITY,o.stgpool_name, (CAST(FLOAT(SUM(s.bytes_protected))/1024/1024/1024 AS DECIMAL(12,2))), (CAST(FLOAT(SUM(s.dedup_savings))/1024/1024/1024 AS DECIMAL(12,2))), (CAST(FLOAT(SUM(s.comp_savings))/1024/1024/1024 AS DECIMAL(12,2))), (CAST(FLOAT(SUM(s.dedup_savings))/FLOAT(SUM(s.bytes_protected))*100 AS DECIMAL(5,2))),(CAST(FLOAT(SUM(s.comp_savings))/FLOAT(SUM(s.bytes_protected)-SUM(s.dedup_savings))*100 AS DECIMAL(5,2))),int(sum(o.reporting_mb/1024)) from summary_extended s, OCCUPANCY o WHERE (activity='BACKUP' or activity='ARCHIVE') and s.entity=o.node_name GROUP BY S.ENTITY, o.stgpool_name ORDER BY 7 ASC FETCH FIRST 1000 ROWS ONLY\""],
	["Best deduplicated nodes:-","NODE,STGPOOL_NAME,PROTECTED_GB,DEDUPSAVINGS_GB,COMPSAVINGS_GB,DEDUP_PCT,COMP_PCT,REPORTING_GB","\"SELECT s.ENTITY,o.stgpool_name,(CAST(FLOAT(SUM(s.bytes_protected))/1024/1024/1024 AS DECIMAL(12,2))), (CAST(FLOAT(SUM(s.dedup_savings))/1024/1024/1024 AS DECIMAL(12,2))), (CAST(FLOAT(SUM(s.comp_savings))/1024/1024/1024 AS DECIMAL(12,2))), COALESCE((CAST(FLOAT(SUM(s.dedup_savings))/FLOAT(SUM(s.bytes_protected))*100 AS DECIMAL(5,2))),0),(CAST(FLOAT(SUM(s.comp_savings))/FLOAT(SUM(s.bytes_protected)-SUM(s.dedup_savings))*100 AS DECIMAL(5,2))),int(sum(o.reporting_mb/1024)) from summary_extended s, OCCUPANCY o WHERE DEDUP_SAVINGS<>0 and (activity='BACKUP' or activity='ARCHIVE') and s.entity=o.node_name GROUP BY S.ENTITY, o.stgpool_name ORDER BY 6 DESC FETCH FIRST 1000 ROWS ONLY\""],
	["Worst deduplicated nodes:-","NODE,STGPOOL_NAME,PROTECTED_GB,DEDUPSAVINGS_GB,COMPSAVINGS_GB,DEDUP_PCT,COMP_PCT,REPORTING_GB","\"SELECT s.ENTITY,o.stgpool_name,(CAST(FLOAT(SUM(s.bytes_protected))/1024/1024/1024 AS DECIMAL(12,2))), (CAST(FLOAT(SUM(s.dedup_savings))/1024/1024/1024 AS DECIMAL(12,2))), (CAST(FLOAT(SUM(s.comp_savings))/1024/1024/1024 AS DECIMAL(12,2))), (CAST(FLOAT(SUM(s.dedup_savings))/FLOAT(SUM(s.bytes_protected))*100 AS DECIMAL(5,2))),(CAST(FLOAT(SUM(s.comp_savings))/FLOAT(SUM(s.bytes_protected)-SUM(s.dedup_savings))*100 AS DECIMAL(5,2))),int(sum(o.reporting_mb/1024)) from summary_extended s, OCCUPANCY o WHERE DEDUP_SAVINGS<>0 and (activity='BACKUP' or activity='ARCHIVE') and s.entity=o.node_name GROUP BY S.ENTITY, o.stgpool_name ORDER BY 6 ASC FETCH FIRST 1000 ROWS ONLY\""],
	["Storage pool space savings:-","STGPOOL_NAME,TOTAL_SAVED_GB,DEDUP_SAVED_GB,COMP_SAVED_GB,USED_SPACE_GB","\"select STGPOOL_NAME, (CAST(SPACE_SAVED_MB as FLOAT)/1024), (CAST(DEDUP_SPACE_SAVED_MB as FLOAT)/1024), (CAST(COMP_SPACE_SAVED_MB as FLOAT)/1024), ((CAST(EST_CAPACITY_MB as FLOAT)/1024)*PCT_UTILIZED/100) from stgpools where STG_TYPE='DIRECTORY' or STG_TYPE='CLOUD' order by 1 DESC\""],
	["Storage pool savings with percentages:-","STGPOOL_NAME,SPACE_SAVED_PCT,SPACE_SAVED_MB,USED_SPACE,DEDUP_SAVED_MB,DEDUP_SAVED_PCT,COMP_SAVED_MB,COMP_SAVED_PCT","\"select name, SPACE_SAVED_PCT, SPACE_SAVED_MB, USED_SPACE, DEDUP_SAVED_MB, DEDUP_SAVED_PCT, COMP_SAVED_MB, COMP_SAVED_PCT from TSMGUI_ALLSTG_GRID where STG_TYPE=101 or STG_TYPE=100 order by SPACE_SAVED_PCT DESC\""],
	
	
	
	
	        
	);
	$count=0;
	
	while ($commands[$count]){
		open (V6_DOCUMENTATION, ">>${host_directory}/${tsm_server}_$health_or_doc.csv") or &been_an_error;
		print V6_DOCUMENTATION $commands[$count][0];
		print V6_DOCUMENTATION "\n";
		print V6_DOCUMENTATION $commands[$count][1];
		print V6_DOCUMENTATION "\n";
		close (V6_DOCUMENTATION);
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt $commands[$count][2]  >> ${host_directory}/${tsm_server}_$health_or_doc.csv");
		print "\r\r\r\r\r\r\r\r\r\r";
		$arraysize=@commands;
		$factor=100/$arraysize;
		$percentage=int($count*$factor);
		print "$percentage";
		print "% complete";
		$count=$count+1;
		}
		print "\r\r\r\r\r\r\r\r\r\r";
		print "100% complete\n";
	} 

###########################################################################
## Subroutine:
## Name: deduplication_statistics (IBM)
## Use: 
###########################################################################

sub deduplication_per_node {
&draw_heading;

print "\n\n\n\nChecking number of container pools...\n";
$num_containers = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select count from stgpools where stg_type='DIRECTORY'");
if ($num_containers > 1)
{
        &draw_heading;
	print "\n\n\n\nThe following containers are defined:\n";
	qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select stgpool_name from stgpools where stg_type='DIRECTORY'");
	print "\n\nPlease enter name of container (there is no check at the moment so get it right!) >";	
	$containerpool = <STDIN>;
	chomp $containerpool;
}
if ($num_containers == 0)
{
        &draw_heading;
	print "\n\n\n\nThere are no container pools!!\nReturning to MAIN MENU....please wait....\n";
	sleep 3;
	goto MAIN_MENU;
}
else { print "Only one container!\n"; }
$containerpool = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select stgpool_name from stgpools where stg_type='DIRECTORY'");
chomp $containerpool;
while ($search_string ne "f") {
	&draw_heading;
	print "\n\n\n\nPlease enter node search string (\"f\" to continue to stats) >";	
	$search_string = <STDIN>;
	chomp $search_string;
	last if ($search_string eq "f");
	$searchit=uc $search_string;
	system("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -optfile=${host_directory}dsm_custom.opt select node_name, tcp_address, tcp_name, platform_name from nodes where node_name like '%$searchit%'");
        system ("pause");
        
        }

while ($node_string ne "c") {
	&draw_heading;
	print "\n\n\n\nPlease enter node to run DEDUPSTATS on (\"c\" to cancel) >";	
	our $node_string = <STDIN>;
	chomp $node_string;
	last if ($node_string eq "c");
	$nodeit=uc $node_string;
	$is_node_real=qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select count from nodes where node_name='$nodeit'");
	
	if ($is_node_real == 1) {
	
	print "Running Stats...\n";
	system("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -optfile=${host_directory}dsm_custom.opt generate dedupstats $containerpool $nodeit");	
	$process_running=100;
	print "Waiting for stats to finish....\n";
	while ($process_running > 0){
		$process_running=qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select count from processes where process='GENERATE DEDUPSTATS'");
		sleep 2;
	}
	last;
}
	else {
		print "No such node!! Try again.\n";
		system ("pause");
	}
}
&draw_heading;
open (DEDUPE_SUMMARY,">>${host_directory}${tsm_server}_DEDUPE_SUMMARY.csv") or &been_an_error;
print DEDUPE_SUMMARY "Date/Time,Storage Pool Name,Node Name,Filespace Name,FSID,Type,Total Data Protected pre Dedupe/Comp(MB),Total Space Used post Dedup/Comp (MB),Total Space Saved (MB),Total Saving Percentage,Deduplication Savings,Deduplication Percentage,Non-Deduplicated Extent Count,Non-Deduplicated Extent Space Used,Unique Extent Count,Unique Extent Space Used,Shared Extent Count,Shared Extent Data Protected,Shared Extent Space Used,Compression Savings,Compression Percentage,Compressed Extent Count,Uncompressed Extent count\n";
close (DEDUPE_SUMMARY);
print "\n\n\n\nWe have the following DEDUPSTATS for node $nodeit:\n";
print "Date/Time               Storage        Node Name      Filespace      FSID     Type    Tot % Saving  Tot (MB) Protected\n";
system("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -optfile=${host_directory}dsm_custom.opt q dedupstats $containerpool $nodeit");
system("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select * from dedupstats where node_name='$nodeit' order by date(date_time) >> ${host_directory}${tsm_server}_DEDUPE_SUMMARY.csv");
open (DEDUPE_SUMMARY,">>${host_directory}${tsm_server}_DEDUPE_SUMMARY.csv") or &been_an_error;
print DEDUPE_SUMMARY "\n\n";
close (DEDUPE_SUMMARY);
print "Full detailed output also saved to ${host_directory}${tsm_server}_DEDUPE_SUMMARY.csv\n";
system ("pause");
&draw_heading;
print "\n\n\n\nCleaning up node $nodeit:\n";
system("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -optfile=${host_directory}dsm_custom.opt del dedupstats $containerpool $nodeit");
system ("pause");
}

###########################################################################
## Subroutine:
## Name: deduplication_statistics (IBM)
## Use: 
###########################################################################

sub deduplication_statistics {

open (DEDUP_OUTPUT,">${host_directory}deduplication_statistics_${tsm_server}.txt") or &been_an_error; 
$dbName  = "TSMDB1";
$aliasName = "TSMDB1";
$dbInfo  = "NO";
$detailedDedupInfo = "NO";
#How many copies are kept of dedup data. This is usually no more than 1. 
$numDedupCopies = 1;

$admCmd = "${baclient_directory}dsmadmc -id=$tsm_user -pa=$tsm_password -datao=yes -optfile=${host_directory}dsm_custom.opt";
$admCmd2 = "${baclient_directory}dsmadmc -id=$tsm_user -pa=$tsm_password -datao=yes  -displaymode=list -optfile=${host_directory}dsm_custom.opt";


# Test the Tivoli Storage Manager server connection
@out = `$admCmd -displaymode=list "q stat"`;
($serverBanner) = grep {m/Storage Management Server for/} @out;
$serverBanner =~ s/  //g;
($serverName) = grep {m/Server Name:/} @out;
$serverName =~ s/  //g;

if ($serverName eq "")
{
  print "ERROR: unable to establish connection to the Tivoli Storage Manager server.  Did you\n";
  print "  forget to change variables at the top of the script?\n";
  exit (1);
}

#Test the DB2 connnection if required
if ( $detailedDedupInfo eq "YES" || $dbInfo eq "YES" ) 
{
  @out = `C:\\PROGRA~1\\Tivoli\\TSM\\db2\\BIN\\db2cmd -c -w -i db2 connect to $dbName`;
  ($dbConnect) = grep {m/Local database alias/} @out;
  if ($dbConnect eq "" ) 
  {
    print "Unable to connect to $dbName.\n";
    exit (2);
  }
  # else
  # {
    # print "Connected to DB2 database $dbName.\n";
    # @out = `C:\\PROGRA~1\\Tivoli\\TSM\\db2\\BIN\\db2cmd -c -w -i db2 set schema $aliasName`;
    # ($dbSchema) = grep {m/DB20000I/} @out;
    # if ( $dbSchema eq "" ) 
    # {
      # print "Could not set schema to $dbName.\n";
      # exit (3);
    # }
    # else
    # {
      # print "Set DB2 schema to $dbName database.\n";
    # }
  # }
}

else
{
  print "Detailed dedup extent info not requested. Edit db2Info variable for this info.\n";
}

# Print initial information including Tivoli Storage Manager server name, version, platform, and dedup relevant options
print DEDUP_OUTPUT "##############################################################################\n";
print DEDUP_OUTPUT "## Tivoli Storage Manager server deduplication and database report\n";
print DEDUP_OUTPUT "##\n";
print DEDUP_OUTPUT "## $serverBanner";
print DEDUP_OUTPUT "## $serverName";
$startTime = localtime();
print DEDUP_OUTPUT "## $startTime\n";
print DEDUP_OUTPUT "##\n";
print DEDUP_OUTPUT "##############################################################################\n";
print "== Please Wait....this may take some time==\n\n";

# Collect options relevant to dedup
@opts = `$admCmd -commadelimited "select option_name,option_value from options"`;
@opts = grep {m/dedup/i || m/numopen/i || m/maxsess/i} @opts;

print DEDUP_OUTPUT "\nDedup Related Options\n";
print DEDUP_OUTPUT "---------------------\n";
foreach $option (@opts)
{
  ($curOpt, $optValue) = split (',', $option);
  chomp($optValue);
  print DEDUP_OUTPUT "  $curOpt\t\t$optValue\n";
}


# Collect Tivoli Storage Manager database usage information
print DEDUP_OUTPUT "\nTivoli Storage Manager Database Information\n";
print DEDUP_OUTPUT "------------------------\n";
@out = `$admCmd2 "query db f=d"`;
print DEDUP_OUTPUT "DATABASE:\n";
@out = grep {m/size/i || m/space/i || m/pages/i} @out;
print DEDUP_OUTPUT "@out";

@out = `$admCmd2 "query log f=d"`;
print DEDUP_OUTPUT "ACTLOG and ARCHLOG:\n";
@out = grep {m/space/i || m/archive log/i} @out;
print DEDUP_OUTPUT "@out\n";

# capture the archive log path and query the file system to determine free space
@out = grep {s/\s+Archive Log Directory:\s+(\S+)\s+.*/$1/} @out;
$archDIR = $out[0];
chomp($archDIR);

# # attempt to figure out which file system holds the archlog directory
# print DEDUP_OUTPUT "ARCHLOG:\n";
# @allFS = `df`;
# @dirParts = split ('/', $archDIR);
# $path = "";
# foreach $dir (@dirParts)
# {
  # $path = $path."/".$dir; 
  # $path =~ s/\/\//\//g;
  # push (@pathList, $path);
# }

# for ($i=$#pathList; $i>=0; $i--)
# {
  # $path = $pathList[$i];
  # @cur = grep {m/$path/} @allFS;
  # if ($#cur > -1)
  # {
    # print DEDUP_OUTPUT "  File system:     $path\n";
    # print DEDUP_OUTPUT "  df output(512):  @cur\n";
    # last;
  # }
# }
if ($dbInfo eq "YES")
{
  $tables = `C:\\PROGRA~1\\Tivoli\\TSM\\db2\\BIN\\db2cmd -c -w -i db2 "select tu.name,cast(rows_in_table as bigint),cast(table_used_mb as bigint),cast(table_alloc_mb as bigint),cast(index_used_mb as bigint),cast(index_alloc_mb as bigint) from ( select substr(tabname,1,28) as name,bigint(card) as rows_in_table,bigint(float(t.npages)/(1024/(b.pagesize/1024))) as table_used_mb from syscat.tables t, syscat.tablespaces b where t.tbspace=b.tbspace and t.tabschema='TSMDB1' ) as tu, ( select substr(tabname,1,28) as name,bigint(sum(i.nleaf)*(b.pagesize/1024)/1024) as index_used_mb from syscat.indexes i, syscat.tablespaces b where i.tbspaceid=b.tbspaceid and i.tabschema='TSMDB1' group by tabname,pagesize ) as iu, ( select substr(tabname,1,28) as name,bigint(data_object_p_size/1024) as table_alloc_mb,bigint(index_object_p_size/1024) as index_alloc_mb from sysibmadm.admintabinfo ) as ta where tu.name=iu.name and tu.name=ta.name and (table_alloc_mb+index_alloc_mb)>5 order by table_alloc_mb desc,index_alloc_mb desc,tu.name with ur"`;
  print DEDUP_OUTPUT "$tables\n";
}
else
{
  print DEDUP_OUTPUT "Skipping detailed DB information per request.\n";
}


# Collect node information
print DEDUP_OUTPUT "\nClient Node Information\n";
print DEDUP_OUTPUT "-----------------------\n";
@out = `$admCmd -commadelimited "select node_name,platform_name,client_version,client_release,deduplication \
           from NODES where nodetype='CLIENT'"`;

$nodeCount = `$admCmd -commadelimited "select count(*) from NODES where nodetype='CLIENT'"`;
print DEDUP_OUTPUT "  Node Count:\t\t\t$nodeCount\n";

# Get counts of different dedup types
@dedupCount = grep {m/serveronly/i} @out;
$dsCount = $#dedupCount+1;
@dedupCount = grep {m/clientorserver/i} @out;
$dcCount = $#dedupCount+1;
print DEDUP_OUTPUT "  Dedup server only:\t\t$dsCount\n";
print DEDUP_OUTPUT "  Dedup client or server:\t$dcCount\n";

# Get groups for different platform types
@nodeTypes = ("AIX", "HPUX", "Linux86", "LinuxPPC", "Linux390", "Mac", "NetWare", "SUN", "WinNT", "TDP VMware", ,"LINUX X86-64", "VMware", "TSM4VE", "TDP MSSQL", "TDP Dom", "DP Oracle", "TDPO", "DB2");
%nodesByType = ();

print DEDUP_OUTPUT "  Node Count by type:\n";
foreach $type (@nodeTypes)
{
  next if ($type eq "");
  @nodeList = grep {m/$type/} @out;
  $count = $#nodeList +1;
  print DEDUP_OUTPUT "    $type:\t\t$count\n";
  @occPoolOut = `$admCmd -commadelimited "select sum(logical_mb),sum(reporting_mb),stgpool_name from occupancy where num_files>0 and stgpool_name in ( select stgpool_name from stgpools where deduplicate='YES') and node_name in (select node_name from nodes where platform_name like '%$type%') and NODE_NAME is not NULL group by stgpool_name"`;
  foreach $uniquePool (@occPoolOut)
  {
    ($logOcc,$rptOcc,$poolName) = split (',', $uniquePool);
    $poolName =~ s/^\s+//;
    if ( $logOcc > 0 && $rptOcc > 0 &&
         $rptOcc > $logOcc ) 
    {
      print DEDUP_OUTPUT "      Stats for Storage Pool:\t\t$poolName";
      $dedupSaving = $rptOcc - $logOcc;
      $dedupRatio = $dedupSaving / $rptOcc;
      $dedupPct = sprintf '%.2f%%', 100 * $dedupRatio;
      print DEDUP_OUTPUT "        Dedup Pct:\t\t$dedupPct\n";
      $nodeByType{$type} = @nodeList
    }
    elsif ( $rptOcc < $logOcc ) 
    {
      print DEDUP_OUTPUT "      Invalid occupancy for \t\t$poolName";
      print DEDUP_OUTPUT "      Repair Occupancy should be run for this pool.\n";
    }
    elsif ( $logOcc > 0 )
    {
      print DEDUP_OUTPUT "      No Storage Pool Dedup:\t\t$poolName";
      print DEDUP_OUTPUT "        Dedup Pct:\t\t0\n";
    }
  }
}


# Collect storage pool information
print DEDUP_OUTPUT "\nDeduplicated Storage pool Information\n";
print DEDUP_OUTPUT "-------------------------------------\n";
@out = `$admCmd -commadelimited "select stgpool_name,pooltype,devclass,est_capacity_mb,pct_utilized,nextstgpool,migdelay,reclaim,reclaimprocess,identifyprocess,space_saved_mb \
           from STGPOOLS where DEDUPLICATE='YES'"`;

foreach $pool (@out)
{
  ($name,$type,$devc,$estcap,$pctutil,$nextpool,$migdelay,$reclthresh,$reclproc,$identproc,$dedupsaved) = split (',', $pool);
  if ($name =~ "ANR2034E") { 
    print DEDUP_OUTPUT "\nWARNING: There are no deduplicated pools - this data contains no useful information...\n";
    last;
    }
  print DEDUP_OUTPUT "\nPool: $name\n  Type: $type\t\tEst. Cap. (MB): $estcap\t   Pct Util: $pctutil\n";
  print DEDUP_OUTPUT "  Reclaim Thresh: $reclthresh\tReclaim Procs: $reclproc\t\tNext Pool: $nextpool\n";
  print DEDUP_OUTPUT "  Identify Procs: $identproc\tDedup Saved(MB):$dedupsaved\n\n";

  # Get occupancy information for dedup pools
  $occ = `$admCmd -commadelimited "select sum(logical_mb),sum(reporting_mb) from occupancy where stgpool_name='$name' and NODE_NAME is not NULL"`;
  ($logOcc,$rptOcc) = split (',', $occ);

  if ( $logOcc > 0 ) 
  {
    if ( $rptOcc > $logOcc)
    {
      $dedupAmt = $rptOcc - $logOcc;    
    }
    else
    {
      $dedupAmt = 0;
    }
    chomp ($dedupAmt);
  }
  else
  {
    $logOcc = $dedupAmt = $rptOcc = 0;
  }

  print DEDUP_OUTPUT "  Logical stored (MB):\t\t$logOcc\n";
  print DEDUP_OUTPUT "  Dedup Not Stored (MB):\t$dedupAmt\n";
  print DEDUP_OUTPUT "  Total Managed (MB):\t\t$rptOcc\n";

  #Keep track of total dedup savings for stgpools#
  $totDedupSavings += $dedupAmt;

  # Get volume statistics for pool
  $vols = `$admCmd -commadelimited "select avg(cast(est_capacity_mb as bigint)),count(*) from volumes where stgpool_name='$name'"`;
  ($avgSize,$volCount) = split (',', $vols);
  chomp ($volCount);

  if ( $volCount <= 0 ) 
  {
    $avgSize = 0;
  }

  print DEDUP_OUTPUT "  Volume count:\t\t\t$volCount\n";
  print DEDUP_OUTPUT "  AVG volume size(MB):\t\t$avgSize\n";

  # If needed, get detailed dedup statistics for pool
  if ( $detailedDedupInfo eq "YES" )
  {  

    $poolId = `C:\\PROGRA~1\\Tivoli\\TSM\\db2\\BIN\\db2cmd -c -w -i db2 -x "select poolid from $aliasName.ss_pools where poolname='$name'"`;
    $chunks = `C:\\PROGRA~1\\Tivoli\\TSM\\db2\\BIN\\db2cmd -c -w -i db2 -x "select count_big(bfid)||',',sum(cast(size as bigint)) from $aliasName.bf_bitfile_extents where srvid=0 and poolid=$poolId for read only with ur"`;
    ($numChunks,$totalChunkSize) = split (',', $chunks);
    $numChunks =~ s/^\s+//;
    $totalChunkSize =~ s/^\s+//;
    chomp ($numChunks);
    chomp ($totalChunkSize);

    if ( $numChunks > 0 ) 
    {
      $avgChunkSize = int($totalChunkSize/$numChunks);
      print DEDUP_OUTPUT "  Number of chunks:\t\t$numChunks\n";
      print DEDUP_OUTPUT "  Avg chunk size:\t\t$avgChunkSize\n";

      #Keep track of total # of chunks#
      $totNumChunks += $numChunks;
      if ( $prevAvgChunkSize > 0 )
      {
        $totAvgChunkSize=($avgChunkSize+$prevAvgChunkSize)/2;
      }
      if ( $avgChunkSize > 0 )
      {
        $prevAvgChunkSize = $avgChunkSize;
      }
    }
  }
}

# <rggenis@us.ibm.com>
@months = qw(01 02 03 04 05 06 07 08 09 10 11 12);
@days = qw(00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31);
@hours = qw(00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23);
@seconds = qw(00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 57 55 56 57 58 59);
@weekDays = qw(Sun Mon Tue Wed Thu Fri Sat Sun);
($second, $minute, $hour, $dayOfMonth, $month, $yearOffset, $dayOfWeek, $dayOfYear, $daylightSavings) = localtime();
$year = 1900 + $yearOffset;
$theTime = "$year-$months[$month]-$days[$dayOfMonth] $hours[$hour]:$minute:$seconds[$second].000000";

if ( $days[$day] == 01 )
{
	($second, $minute, $hour, $dayOfMonth, $month, $yearOffset, $dayOfWeek, $dayOfYear, $daylightSavings) = localtime(time - 86400);	
	$year = 1900 + $yearOffset;
	$yestTime = "$year-$months[$month]-$days[$dayOfDay] $hours[$hour]:$minute:$seconds[$second].000000"; 
}
else
{
	$prevDay = $dayOfMonth - 1;
	$yestTime = "$year-$months[$month]-$days[$prevDay] $hours[$hour]:$minute:$seconds[$second].000000";
}

# Get ingestion and expiration statistics
$expired = `$admCmd -commadelimited "select sum(summary.affected) as FILES_LAST_24 from summary where start_time>='$yestTime' and start_time<='$theTime' and activity='EXPIRATION' and ENTITY is null"`;
$filesIngested = `$admCmd -commadelimited "select sum(summary.affected) as FILES_LAST_24 from summary where start_time>='$yestTime' and start_time<='$theTime' and ( activity='BACKUP' or activity='ARCHIVE' )"`;
$dataIngested = `$admCmd -commadelimited "select sum(summary.bytes) as GB_LAST_24 from summary where start_time>='$yestTime' and start_time<='$theTime' and ( activity='BACKUP' or activity='ARCHIVE' )"`;
$expired =~ s/^\s+//;
$filesIngested =~ s/^\s+//;
$dataIngested =~ s/^\s+//;

if($dataIngested > 1000000000)
{ 
   $dataIngested = ( sprintf( "%0.2f", $dataIngested/1000000000 )). " GB";                   
}
elsif ($dataIngested > 1000000)
{       
   $dataIngested = ( sprintf( "%0.2f", $dataIngested/1000000 )). " MB"; 
}
elsif ($dataIngested > 1000)
{
   $dataIngested = ( sprintf( "%0.2f", $dataIngested/1000 )). " KB"; 
}

print DEDUP_OUTPUT "\nData Ingestion and Expiration Stats";
print DEDUP_OUTPUT "\n-----------------------------------\n";
print DEDUP_OUTPUT "  Files ingested(last 24):\t\t$filesIngested";
print DEDUP_OUTPUT "  Files expired(last 24) :\t\t$expired";
print DEDUP_OUTPUT "  Total data ingested(last 24):\t\t$dataIngested\n";

# If needed, get the detailed dedup information for entire server 
if ( $detailedDedupInfo eq "YES" )
{
  $derefChunks = `C:\\PROGRA~1\\Tivoli\\TSM\\db2\\BIN\\db2cmd -c -w -i db2 -x "select count_big(bfid) from $aliasName.bf_dereferenced_chunks for read only with ur"`;
  $queuedChunks = `C:\\PROGRA~1\\Tivoli\\TSM\\db2\\BIN\\db2cmd -c -w -i db2 -x "select count_big(bfid) from $aliasName.bf_queued_chunks for read only with ur"`;
  $derefChunks =~ s/^\s+//;
  $queuedChunks =~ s/^\s+//;
  $totChunks = $queuedChunks + $derefChunks;
  chomp ($totChunks);
  print DEDUP_OUTPUT "\nDeduplication Deletion Statistics\n";
  print DEDUP_OUTPUT "------------------------------------\n";
  print DEDUP_OUTPUT "    Total Queued Deref Chunks   :\t\t$derefChunks";
  print DEDUP_OUTPUT "    Total In-flight Deref Chunks:\t\t$queuedChunks";
  print DEDUP_OUTPUT "    Total Dedup Deref Chunks    :\t\t$totChunks\n";

  print DEDUP_OUTPUT "\n\n\n----------------------------------------";
  print DEDUP_OUTPUT "\nFinal Dedup and Database Impact Report    ";
  print DEDUP_OUTPUT "\n----------------------------------------\n";
  print DEDUP_OUTPUT "\n  Deduplication Database Totals";
  print DEDUP_OUTPUT "\n  -----------------------------\n";
  print DEDUP_OUTPUT "      Total Dedup Chunks in DB   :\t\t$totNumChunks\n";
  print DEDUP_OUTPUT "      Average Dedup Chunk Size   :\t\t$totAvgChunkSize\n";

  $catalogImpact = $totNumChunks * 490;
  if ( $numDedupCopies > 0 )
  {
    $copyStgImpact = $numDedupCopies * 190 * $totNumChunks;
  }
  else
  {
    $copyStgImpact = 0;
  }
  $totDedupDbImpact = $catalogImpact + $copyStgImpact;
  $totDedupDbImpact =~ s/^\s+//;
  $totDedupSavings =~ s/^\s+//;
 
  if($totDedupDbImpact > 1000000000)
  { 
     $totDedupDbImpact = ( sprintf( "%0.2f", $totDedupDbImpact/1000000000 )). " GB";                   
  }
  elsif ($totDedupDbImpact > 1000000)
  {       
     $totDedupDbImpact = ( sprintf( "%0.2f", $totDedupDbImpact/1000000 )). " MB"; 
  }
  elsif ($totDedupDbImpact > 1000)
  {
     $totDedupDbImpact = ( sprintf( "%0.2f", $totDedupDbImpact/1000 )). " KB"; 
  }


  if ($totDedupSavings > 1000)
  {       
     $totDedupSavings = ( sprintf( "%0.2f", $totDedupSavings/1000 )). " GB";
  }
  else
  {
    $totDedupSavings = ( sprintf( "%0.2f", $totDedupSavings/1 )). " MB";
  }

  print DEDUP_OUTPUT "\n  Deduplication Impact to Database and Storage Pools";
  print DEDUP_OUTPUT "\n  ---------------------------------------------------\n";
  print DEDUP_OUTPUT "      Estimated DB Cost of Deduplication:\t\t$totDedupDbImpact\n";
  print DEDUP_OUTPUT "      Total Storage Pool Savings:\t\t$totDedupSavings\n";

  if ( $totChunks > 100000000 ) 
  {
    print DEDUP_OUTPUT "\n       NOTE:\n";
    print DEDUP_OUTPUT "         Database could be inflated due to Total Dedup Deref Chunks.\n";
    print DEDUP_OUTPUT "         Look at increasing DEDUPDELETIONTHREADS to 8 or 12.\n";
    print DEDUP_OUTPUT "         In addition, review APARS - IC81794 & IC81353.\n";
  }

}

}

###########################################################################
## Subroutine:
## Name: print_heading_in_csv
## Use: 
###########################################################################

sub print_heading_in_csv {
open (OUTPUT_SUMMARY,">${filename}_FINAL_SUMMARY.csv") or &been_an_error; 
print OUTPUT_SUMMARY ":-CUSTOMER\n$custname\n";
print OUTPUT_SUMMARY "\n";
print OUTPUT_SUMMARY "\n";
close (OUTPUT_SUMMARY);
}

###########################################################################
## Subroutine:
## Name: draw_disclaimer
## Use: 
###########################################################################

sub draw_disclaimer {
	&draw_heading;
print "======= PLEASE READ =======\n\n";

print "\n\nYou will need to run this program 'As Administrator' in MOST cases.\nOtherwise you will likely see a TSMUTIL1.dll runtime error after the 'bundled'\n client is selected.\n\nIf this is not acceptable you will need to install a client on the machine.\n\n";
system ("pause");
print "\n\nDid you read the above??\n\n";
system ("pause");
&draw_heading;
print "IMPORTANT NOTICE:\n\n";

print "Using, copying, modifying, (fully or partially) deconstructing, or distributing the \nintellectual property in this software and its documentation by non-employees \n(including ex-employees) is strictly prohibited without written permission \nfrom Tectrade Computers Ltd. If you find this software on a server it \nshould be deleted immediately.\n\n";

print "** WARNING **\n\n";

print "DO NOT RUN THIS SOFTWARE WITHOUT FIRST CONSULTING TECTRADE COMPUTERS LTD\n";
print "RUNNING THIS SOFTWARE WITHOUT SUCH GUIDANCE MAY RESULT IN DAMAGE TO BACKUP \nSYSTEMS, STORAGE SYSTEMS AND STORAGE AREA NETWORKS\n";
print "TECTRADE COMPUTERS LTD WILL NOT BE LIABLE TO ANY PARTY FOR DIRECT, \nINDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES, INCLUDING LOST PROFITS, \nARISING OUT OF THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION BY ANY PERSON NOT EMPLOYED BY \nTECTRADE OR ACTING WITHOUT SPECIFIC INSTRUCTIONS FROM TECTRADE.\n\n";
print "GNU General Public License applies and can be found at:\n";
print "http://dev.perl.org/licenses/gpl1.html\n\n";
system ("pause");

&draw_heading;


print "IMPORTANT NOTE 1 - \n\nIf you needed to enter a different user name to run the program as 'Administrator'\n";
print "then the output files will be found in the administrators path and not the users path.\n";
print "This may flag an error.You will then need to manually find the output directory.\n\n";
print "IMPORTANT NOTE 2 - \n\nIf connecting to an 8.1.2.0 server and above, a SSL certificate may be required\n";
print "it is suggested that if there are issues with the SSL configuration then use the \ninstalled client and not the bundled client.\n\n";
system ("pause");
}

###########################################################################
## Subroutine:
## Name: rerun_failed_backups
## Use: 
###########################################################################

sub rerun_failed_backups {

&draw_heading;
print "\n\nEnter number of hours to query events => ";
$answer=<STDIN>;
chomp $answer;
$cl_hours=$answer;
&draw_heading;

unlink ("${host_directory}/${tsm_server}_clf_list.mac");
open (MACROFILE,">>${host_directory}/${tsm_server}_clf_list.mac") or &been_an_error;
unlink ("${host_directory}/${tsm_server}_clf_list.txt");

@commands = (
	["\"select date(s.scheduled_start), time(s.scheduled_start), s.NODE_NAME, s.schedule_name, s.status, s.domain_name, c.action, c.subaction, c.options, c.objects from events s, client_schedules c where s.scheduled_start>'2000-01-01 00:00' and (s.scheduled_start >= current_timestamp-$cl_hours hours) and s.node_name is not null and c.schedule_name=s.schedule_name and s.status!='Pending' and s.status='Failed'\""],
		
	    );
	$count=0;	
	while ($commands[$count]){		
	system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt $commands[$count][0]  >> ${host_directory}/${tsm_server}_clf_list.txt");
		$count=$count+1;
				}



open (FAILEDCLIENTS, "<${host_directory}/${tsm_server}_clf_list.txt") or &been_an_error;
@clffile=<FAILEDCLIENTS>;  
close (FAILEDCLIENTS);	
	
	foreach $element (@clffile) {
	chomp $element;
	if ($element=~"ANR2034E") {
		print "\n\nThere are no FAILED backups in the last $cl_hours hours!...\n\n";
		system ("pause");
		goto MAIN_MENU;
	}
	($clf_date,$clf_time,$clf_nodename,$clf_schedname,$clf_status,$clf_domain,$clf_action,$clf_subaction,$clf_options,$clf_objects) = (split /,/,$element)[0,1,2,3,4,5,6,7,8,9];
	  
	chomp $clf_date;
	chomp $clf_time;
	chomp $clf_nodename;
	chomp $clf_schedname;
	chomp $clf_status;
	chomp $clf_domain;
	chomp $clf_action;
	
	chomp $clf_subaction;
	if ($clf_subaction ne "") { $clf_subaction="subaction=$clf_subaction" }
	chomp $clf_options;
	if ($clf_options ne "") { $clf_options="options='$clf_options'" }
	chomp $clf_objects;
	if ($clf_objects ne "") { $clf_objects="objects='$clf_objects'" }

&draw_heading;
print "\n\nDo you want to rerun this FAILED schedule?:\n\n$clf_date $clf_time $clf_nodename $clf_domain $clf_schedname\n\n";
print "y/n => ";
$answer=<STDIN>;
chomp $answer;
if ($answer eq "y") {
print MACROFILE "def clientaction $clf_nodename domain=$clf_domain action=$clf_action $clf_subaction $clf_options $clf_objects wait=no\n";
}
}
close (MACROFILE);
print "\n\nOpening macro file - edit and save as required:\n\n";
system ("start ${host_directory}/${tsm_server}_clf_list.txt");
system ("pause");

&draw_heading;
print "\n\nDo you want to run the FAILED schedule macro?:\n\n";
print "y/n => ";
$answer=<STDIN>;
chomp $answer;
if ($answer eq "y") {
system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt macro ${host_directory}/${tsm_server}_clf_list.txt");
}

&draw_heading;
print "\n\nAll actions Complete...\n\n";
system ("pause");
}

###########################################################################
## Subroutine:
## Name: rerun_missed_backups
## Use: 
###########################################################################

sub rerun_missed_backups {

&draw_heading;
print "\n\nEnter number of hours to query events => ";
$answer=<STDIN>;
chomp $answer;
$cl_hours=$answer;
&draw_heading;
if ($tsm_user eq ''){
		&draw_heading;
		&set_client;
		&draw_heading;
		&change_credentials;
		&make_options_file;
		&get_version;
}
unlink ("${host_directory}/${tsm_server}_clm_list.txt");
open (MACROFILE,">>${host_directory}/${tsm_server}_clm_list.txt") or &been_an_error;
unlink ("${host_directory}/${tsm_server}_clf_list.txt");

@commands = (
	["\"select date(s.scheduled_start), time(s.scheduled_start), s.NODE_NAME, s.schedule_name, s.status, s.domain_name, c.action, c.subaction, c.options, c.objects from events s, client_schedules c where s.scheduled_start>'2000-01-01 00:00' and (s.scheduled_start >= current_timestamp-$cl_hours hours) and s.node_name is not null and c.schedule_name=s.schedule_name and s.status!='Pending' and s.status='Missed'\""],
		
	    );
	$count=0;
	
	while ($commands[$count]){		
	system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt $commands[$count][0]  >> ${host_directory}/${tsm_server}_clf_list.txt");
		$count=$count+1;
				}


open (FAILEDCLIENTS, "<${host_directory}/${tsm_server}_clf_list.txt") or &been_an_error;
@clffile=<FAILEDCLIENTS>;  
close (FAILEDCLIENTS);		
	foreach $element (@clffile) {
	chomp $element;
	if ($element=~"ANR2034E") {
		print "\n\nThere are no MISSED backups in the last $cl_hours hours!...\n\n";
		system ("pause");
		goto MAIN_MENU;
	}
	($clf_date,$clf_time,$clf_nodename,$clf_schedname,$clf_status,$clf_domain,$clf_action,$clf_subaction,$clf_options,$clf_objects) = (split /,/,$element)[0,1,2,3,4,5,6,7,8,9];
	  
	chomp $clf_date;
	chomp $clf_time;
	chomp $clf_nodename;
	chomp $clf_schedname;
	chomp $clf_status;
	chomp $clf_domain;
	
	chomp $clf_subaction;
	if ($clf_subaction ne "") { $clf_subaction="subaction=$clf_subaction" }
	chomp $clf_options;
	if ($clf_options ne "") { $clf_options="options='$clf_options'" }
	chomp $clf_objects;
	if ($clf_objects ne "") { $clf_objects="objects='$clf_objects'" }

&draw_heading;
print "\n\nDo you want to rerun this MISSED schedule?:\n\n$clf_date $clf_time $clf_nodename $clf_domain $clf_schedname\n\n";
print "y/n => ";
$answer=<STDIN>;
chomp $answer;
if ($answer eq "y") {
print MACROFILE "def clientaction $clf_nodename domain=$clf_domain action=$clf_action $clf_subaction $clf_options $clf_objects wait=no\n";
}
}
close (MACROFILE);
print "\n\nOpening macro file - edit and save as required:\n\n";
system ("pause");
system ("start ${host_directory}/${tsm_server}_clm_list.txt");
system ("pause");
&draw_heading;
print "\n\nDo you want to run the MISSED schedule macro?:\n\n";
print "y/n => ";
$answer=<STDIN>;
chomp $answer;
if ($answer eq "y") {
system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt macro ${host_directory}/${tsm_server}_clm_list.txt");
}

&draw_heading;
print "\n\nComplete...\n";
system ("pause");
}

###########################################################################
## Subroutine:
## Name: make_process_graphs
## Use: Separate routing for creating process graphs
###########################################################################

sub make_process_graphs {
#use lib "$ENV{PAR_TEMP}\\inc\\lib";
use perlchartdir;
chdir ${host_directory};
print "\nProcessing summary graphs - this may take some time....\n";
&draw_heading;

	@commands = (
	
	["Process Activity for Last 24 Hours","\"select activity,year(start_time),month(start_time),day(start_time),hour(start_time),minute(start_time),second(start_time),year(end_time),month(end_time),day(end_time),hour(end_time),minute(end_time),second(end_time) from summary where (activity='EXPIRATION' or activity='FULL_DBBACKUP' or activity='MIGRATION' or activity='OFFSITE RECLAMATION' or activity='RECLAMATION' or activity='STGPOOL BACKUP' or activity='REPLICATION' or activity='IDENTIFY') and start_time>current_timestamp-24 hours order by activity\"","process","0x00ff00","process_24.csv","process_24.png","\"select distinct(activity) from summary where (activity='EXPIRATION' or activity='FULL_DBBACKUP' or activity='MIGRATION' or activity='OFFSITE RECLAMATION' or activity='RECLAMATION' or activity='STGPOOL BACKUP' or activity='REPLICATION' or activity='IDENTIFY') and start_time>current_timestamp-24 hours order by activity\"","process_24_avail.csv"],
	["Process Activity for Last 72 Hours","\"select activity,year(start_time),month(start_time),day(start_time),hour(start_time),minute(start_time),second(start_time),year(end_time),month(end_time),day(end_time),hour(end_time),minute(end_time),second(end_time) from summary where (activity='EXPIRATION' or activity='FULL_DBBACKUP' or activity='MIGRATION' or activity='OFFSITE RECLAMATION' or activity='RECLAMATION' or activity='STGPOOL BACKUP' or activity='REPLICATION' or activity='IDENTIFY') and start_time>current_timestamp-72 hours order by activity\"","process","0x00ff00","process_72.csv","process_72.png","\"select distinct(activity) from summary where (activity='EXPIRATION' or activity='FULL_DBBACKUP' or activity='MIGRATION' or activity='OFFSITE RECLAMATION' or activity='RECLAMATION' or activity='STGPOOL BACKUP' or activity='REPLICATION' or activity='IDENTIFY') and start_time>current_timestamp-72 hours order by activity\"","process_72_avail.csv"],
	["Process Activity for Last 1 Week","\"select activity,year(start_time),month(start_time),day(start_time),hour(start_time),minute(start_time),second(start_time),year(end_time),month(end_time),day(end_time),hour(end_time),minute(end_time),second(end_time) from summary where (activity='EXPIRATION' or activity='FULL_DBBACKUP' or activity='MIGRATION' or activity='OFFSITE RECLAMATION' or activity='RECLAMATION' or activity='STGPOOL BACKUP' or activity='REPLICATION' or activity='IDENTIFY') and start_time>current_timestamp-168 hours order by activity\"","process","0x00ff00","process_1week.csv","process_1week.png","\"select distinct(activity) from summary where (activity='EXPIRATION' or activity='FULL_DBBACKUP' or activity='MIGRATION' or activity='OFFSITE RECLAMATION' or activity='RECLAMATION' or activity='STGPOOL BACKUP' or activity='REPLICATION' or activity='IDENTIFY') and start_time>current_timestamp-168 hours order by activity\"","process_1week_avail.csv"],
	["Process Activity for Last 1 Month","\"select activity,year(start_time),month(start_time),day(start_time),hour(start_time),minute(start_time),second(start_time),year(end_time),month(end_time),day(end_time),hour(end_time),minute(end_time),second(end_time) from summary where (activity='EXPIRATION' or activity='FULL_DBBACKUP' or activity='MIGRATION' or activity='OFFSITE RECLAMATION' or activity='RECLAMATION' or activity='STGPOOL BACKUP' or activity='REPLICATION' or activity='IDENTIFY') and start_time>current_timestamp-744 hours order by activity\"","process","0x00ff00","process_1month.csv","process_1month.png","\"select distinct(activity) from summary where (activity='EXPIRATION' or activity='FULL_DBBACKUP' or activity='MIGRATION' or activity='OFFSITE RECLAMATION' or activity='RECLAMATION' or activity='STGPOOL BACKUP' or activity='REPLICATION' or activity='IDENTIFY') and start_time>current_timestamp-744 hours order by activity\"","process_1month_avail.csv"],
	
);

${command_count}=0;


while ($commands[${command_count}]){
	
	        unlink ("${host_directory}$commands[${command_count}][4]");
	        unlink ("${host_directory}$commands[${command_count}][7]");
                $commands[${command_count}][1] =~ s/qt/\\"/g; # Allows us to put quotes in the command
		system("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}\dsm_custom.opt $commands[${command_count}][1] >> ${host_directory}$commands[${command_count}][4]");
		system("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}\dsm_custom.opt $commands[${command_count}][6] >> ${host_directory}$commands[${command_count}][7]");


my @process_array_of_stuff;
my @process_array_of_starts;
my @process_array_of_ends;
my @process_array_of_tasks;
open(DRIVES, "<${host_directory}$commands[${command_count}][7]") or &been_an_error;
@process_array_of_stuff = <DRIVES>;
for(@process_array_of_stuff){s/,/=>/g}
close(DRIVES);
$count=0;
open (DRIVES, "<${host_directory}$commands[${command_count}][7]") or &been_an_error;
@drivefile=<DRIVES>;  
	
	foreach $bit (@drivefile) {
	      chomp $bit;
	     ($uniqprocess) = (split /,/,$bit)[0];
	     chomp $uniqprocess;
              

              
             
                        open (DATA, "${host_directory}$commands[${command_count}][4]") or &been_an_error;
                        @csvfile=<DATA>;  
                            foreach $element (@csvfile) {
                            chomp $element;
                            ($drive) = (split /,/,$element)[0];
                               chomp $drive;
                               
                              
                                    if ($drive eq $uniqprocess ) {                                   
                                    push (@process_array_of_tasks,$count);
                                    #print "==processing==please wait==";  
                                    }
                                    
                         close (DATA);
              
             }
             $count=$count+1;       
}
close (DRIVES); 
open (DATA, "${host_directory}$commands[${command_count}][4]") or &been_an_error;
	@csvfile=<DATA>;  
	
	foreach $element (@csvfile) {
	      chomp $element;
	     ($process,$start_year,$start_month,$start_day,$start_hour,$start_min,$start_sec,$end_year,$end_month,$end_day,$end_hour,$end_min,$end_sec ) = (split /,/,$element)[0,1,2,3,4,5,6,7,8,9,10,11,12];
              chomp $process;
              chomp $start_year;
              chomp $start_month;
              chomp $start_day;
              chomp $start_hour;
              chomp $start_min;
              chomp $start_sec;
              chomp $end_year;
              chomp $end_month;
              chomp $end_day;
              chomp $end_hour;
              chomp $end_min;
              chomp $end_sec;
  
my $holding_startDate = perlchartdir::chartTime($start_year,$start_month,$start_day,$start_hour,$start_min,$start_sec);
my $holding_endDate =  perlchartdir::chartTime($end_year,$end_month,$end_day,$end_hour,$end_min,$end_sec);

push (@process_array_of_starts, $holding_startDate);
push (@process_array_of_ends, $holding_endDate);

}


close (DATA);
my $c = new XYChart(1200, 768, 0xffffff, 0x000000, 1);
$c->addTitle("$commands[${command_count}][0]", "arial.ttf", 15, 0x000000)->setBackground(0xffffff);
$c->setPlotArea(180, 55, 800, 700, 0xffffff, 0xeeeeee, $perlchartdir::LineColor, 0xc0c0c0, 0xc0c0c0)->setGridWidth(2, 1, 1, 1);
$c->swapXY();
$c->yAxis()->setMultiFormat(perlchartdir::StartOfDayFilter(), "-<*font=arialbd.ttf*>{value|mmm d}", perlchartdir::StartOfHourFilter(), "-{value|hh}",0,true);
$c->setYAxisOnRight();
$c->xAxis()->setLabels([@process_array_of_stuff]);
$c->xAxis()->setReverse();
$c->xAxis()->setTickOffset(0.5);
#my $layer = $c->addBoxWhiskerLayer2([@array_of_starts], [@array_of_ends], undef, undef, undef,[0xcc0000]); # multi colours
my $layer = $c->addBoxWhiskerLayer([@process_array_of_starts], [@process_array_of_ends], undef, undef, undef,[$commands[${command_count}][3]]);
$layer->setXData([@process_array_of_tasks]);
$layer->setBorderColor($perlchartdir::SameAsMainColor);
$layer->setDataWidth(int(700 * 4.5 / 5 / scalar(@process_array_of_stuff)));
$c->makeChart("$commands[${command_count}][5]");


${command_count}=${command_count}+1;		
}
}

sub make_drive_graphs {
use perlchartdir;
chdir ${host_directory};

$are_there_local_libraries=qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select count from libraries where library_type!='SHARED'");
chomp $are_there_local_libraries;
print "\nThe number of  local libraries is: $are_there_local_libraries\n";

system ("pause");
if ($are_there_local_libraries gt "0") {
	
	
print "NOTE: Tape mounts are not recorded in the Summary table on library clients.\n";
print "\nThe following (local) libraries are available:\n";
system("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select library_name from libraries where library_type!='SHARED'");


print "\nEnter name of the (local) library <enter> for all > ";
$answer = <STDIN>;
chomp $answer;
$answer=uc $answer;
if ($answer ne "") { 
	$lib_specific_command="and library_name='$answer'";
	$library_heading="($answer)";}
else {
	$lib_specific_command="";	
	$library_heading="(All Libraries)";}
	@commands = (
	
	["Drive Utilisation for Last 24 Hours $library_heading","\"select drive_name,library_name,year(start_time),month(start_time),day(start_time),hour(start_time),minute(start_time),second(start_time),year(end_time),month(end_time),day(end_time),hour(end_time),minute(end_time),second(end_time) from summary where library_name in (select library_name from libraries where library_type!='SHARED') ${lib_specific_command} and activity='TAPE MOUNT' and start_time>current_timestamp-24 hours order by library_name,drive_name\"","drive","0x00ff00","drive_24.csv","drive_24.png","\"select distinct(drive_name),library_name from summary where library_name in (select library_name from libraries where library_type!='SHARED') ${lib_specific_command} and activity='TAPE MOUNT' and start_time>current_timestamp-24 hours order by library_name,drive_name\"","drive_24_avail.csv"],
	["Drive Utilisation for Last 72 Hours $library_heading","\"select drive_name,library_name,year(start_time),month(start_time),day(start_time),hour(start_time),minute(start_time),second(start_time),year(end_time),month(end_time),day(end_time),hour(end_time),minute(end_time),second(end_time) from summary where library_name in (select library_name from libraries where library_type!='SHARED') ${lib_specific_command} and activity='TAPE MOUNT' and start_time>current_timestamp-72 hours order by library_name,drive_name\"","drive","0xCC0033","drive_72.csv","drive_72.png","\"select distinct(drive_name),library_name from summary where library_name in (select library_name from libraries where library_type!='SHARED') ${lib_specific_command} and activity='TAPE MOUNT' and start_time>current_timestamp-72 hours order by library_name,drive_name\"","drive_72_avail.csv"],
	["Drive Utilisation for Last 7 Days $library_heading","\"select drive_name,library_name,year(start_time),month(start_time),day(start_time),hour(start_time),minute(start_time),second(start_time),year(end_time),month(end_time),day(end_time),hour(end_time),minute(end_time),second(end_time) from summary where library_name in (select library_name from libraries where library_type!='SHARED') ${lib_specific_command} and activity='TAPE MOUNT' and start_time>current_timestamp-168 hours order by library_name,drive_name\"","drive","0x0AC2FF","drive_7days.csv","drive_7days.png","\"select distinct(drive_name),library_name from summary where library_name in (select library_name from libraries where library_type!='SHARED') ${lib_specific_command} and activity='TAPE MOUNT' and start_time>current_timestamp-168 hours order by library_name,drive_name\"","drive_7days_avail.csv"],
	["Drive Utilisation for Last Month $library_heading","\"select drive_name,library_name,year(start_time),month(start_time),day(start_time),hour(start_time),minute(start_time),second(start_time),year(end_time),month(end_time),day(end_time),hour(end_time),minute(end_time),second(end_time) from summary where library_name in (select library_name from libraries where library_type!='SHARED') ${lib_specific_command} and activity='TAPE MOUNT' and start_time>current_timestamp-744 hours order by library_name,drive_name\"","drive","0x339966","drive_1month.csv","drive_1month.png","\"select distinct(drive_name),library_name from summary where library_name in (select library_name from libraries where library_type!='SHARED') ${lib_specific_command} and activity='TAPE MOUNT' and start_time>current_timestamp-744 hours order by library_name,drive_name\"","drive_1month_avail.csv"],
	
);

print "\nProcessing drive mounts $library_heading - this may take some time....\n";

${command_count}=0;


while ($commands[${command_count}]){
	
	        unlink ("${host_directory}$commands[${command_count}][4]");
	        unlink ("${host_directory}$commands[${command_count}][7]");
                $commands[${command_count}][1] =~ s/qt/\\"/g; # Allows us to put quotes in the command
		system("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt $commands[${command_count}][1] >> ${host_directory}$commands[${command_count}][4]");
		system("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt $commands[${command_count}][6] >> ${host_directory}$commands[${command_count}][7]");


my @array_of_stuff;
my @array_of_starts;
my @array_of_ends;
my @array_of_tasks;
open(DRIVES, "<${host_directory}$commands[${command_count}][7]") or &been_an_error;
@array_of_stuff = <DRIVES>;
for(@array_of_stuff){s/,/=>/g}
close(DRIVES);
$count=0;
open (DRIVES, "<${host_directory}$commands[${command_count}][7]") or &been_an_error;
@drivefile=<DRIVES>;  
	
	foreach $bit (@drivefile) {
	      chomp $bit;
	     ($uniqdrive,$uniqlibrary) = (split /,/,$bit)[0,1];
	     chomp $uniqdrive;
              chomp $uniqlibrary;

              
              $uniqref="$uniqlibrary-$uniqdrive";
                        open (DATA, "${host_directory}$commands[${command_count}][4]") or &been_an_error;
                        @csvfile=<DATA>;  
                            foreach $element (@csvfile) {
                            chomp $element;
                            ($drive,$library) = (split /,/,$element)[0,1];
                               chomp $drive;
                               chomp $library;
                               $ref="${library}-${drive}";
                                    if ($ref eq $uniqref ) {                                   
                                    push (@array_of_tasks,$count);
                                    #print @array_of_tasks;  
                                    }
                                    
                         close (DATA);
              
             }
             $count=$count+1;       
}
close (DRIVES); 
open (DATA, "${host_directory}$commands[${command_count}][4]") or &been_an_error;
	@csvfile=<DATA>;  
	
	foreach $element (@csvfile) {
	      chomp $element;
	     ($drive,$library,$start_year,$start_month,$start_day,$start_hour,$start_min,$start_sec,$end_year,$end_month,$end_day,$end_hour,$end_min,$end_sec ) = (split /,/,$element)[0,1,2,3,4,5,6,7,8,9,10,11,12,13];
              chomp $drive;
              chomp $library;
              chomp $start_year;
              chomp $start_month;
              chomp $start_hour;
              chomp $start_min;
              chomp $start_sec;
              chomp $end_year;
              chomp $end_month;
              chomp $end_hour;
              chomp $end_min;
              chomp $end_sec;
  
my $holding_startDate = perlchartdir::chartTime($start_year,$start_month,$start_day,$start_hour,$start_min,$start_sec);
my $holding_endDate =  perlchartdir::chartTime($end_year,$end_month,$end_day,$end_hour,$end_min,$end_sec);

push (@array_of_starts, $holding_startDate);
push (@array_of_ends, $holding_endDate);

}

my $c = new XYChart(1200, 768, 0xffffff, 0x000000, 1);
$c->addTitle("$commands[${command_count}][0]", "arial.ttf", 15, 0x000000)->setBackground(0xffffff);
$c->setPlotArea(180, 55, 800, 700, 0xffffff, 0xeeeeee, $perlchartdir::LineColor, 0xc0c0c0, 0xc0c0c0)->setGridWidth(2, 1, 1, 1);
$c->swapXY();
$c->yAxis()->setMultiFormat(perlchartdir::StartOfDayFilter(), "-<*font=arialbd.ttf*>{value|mmm d}", perlchartdir::StartOfHourFilter(), "-{value|hh}");
$c->setYAxisOnRight();
$c->xAxis()->setLabels([@array_of_stuff]);
$c->xAxis()->setReverse();
$c->xAxis()->setTickOffset(0.5);
#my $layer = $c->addBoxWhiskerLayer2([@array_of_starts], [@array_of_ends], undef, undef, undef,[0xcc0000]); # multi colours
my $layer = $c->addBoxWhiskerLayer([@array_of_starts], [@array_of_ends], undef, undef, undef,[$commands[${command_count}][3]]);
$layer->setXData([@array_of_tasks]);
$layer->setBorderColor($perlchartdir::SameAsMainColor);
$layer->setDataWidth(int(700 * 4.5 / 5 / scalar(@array_of_stuff)));
$c->makeChart("$commands[${command_count}][5]");


${command_count}=${command_count}+1;		
}
}
else {
	print "There are no locally controlled libraries. There may be remote libraries. Checking next....\n";
	system  ("pause");
}
}

###########################################################################
## Subroutine:
## Name: make_lm_graphs
## Use: Make Library Manager Graphs
###########################################################################

sub make_lm_graphs {
use perlchartdir;
chdir ${host_directory};

$are_there_shared_libraries=qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select count from libraries where library_type='SHARED'");
chomp $are_there_shared_libraries;
if ($are_there_shared_libraries gt "0") {
print "\nThe number of  local libraries is: $are_there_shared_libraries\n";

system ("pause");
print "\nThe following (remote) libraries are available:\n";
system("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select library_name from libraries where library_type='SHARED'");


print "\nEnter name of the (remote) library or <enter> for all or <s> for SKIP > ";
$answer = <STDIN>;
chomp $answer;
$answer=uc $answer;

if ($answer ne "s" ) {
&change_lm_credentials;
&make_lm_options_file;

if ($answer ne "") { 
	$lib_specific_command="and library_name='$answer'";
	$library_heading="($answer)";}
else {
	$lib_specific_command="";	
	$library_heading="(All Libraries)";}
	
	
	@commands = (
	
	["Drive Utilisation for Last 24 Hours $library_heading","\"select drive_name,library_name,year(start_time),month(start_time),day(start_time),hour(start_time),minute(start_time),second(start_time),year(end_time),month(end_time),day(end_time),hour(end_time),minute(end_time),second(end_time) from summary where library_name in (select library_name from libraries where library_type!='SHARED') ${lib_specific_command} and activity='TAPE MOUNT' and start_time>current_timestamp-24 hours order by library_name,drive_name\"","drive","0x00ff00","lm_drive_24.csv","lm_drive_24.png","\"select distinct(drive_name),library_name from summary where library_name in (select library_name from libraries where library_type!='SHARED') ${lib_specific_command} and activity='TAPE MOUNT' and start_time>current_timestamp-24 hours order by library_name,drive_name\"","lm_drive_24_avail.csv"],
	["Drive Utilisation for Last 72 Hours $library_heading","\"select drive_name,library_name,year(start_time),month(start_time),day(start_time),hour(start_time),minute(start_time),second(start_time),year(end_time),month(end_time),day(end_time),hour(end_time),minute(end_time),second(end_time) from summary where library_name in (select library_name from libraries where library_type!='SHARED') ${lib_specific_command} and activity='TAPE MOUNT' and start_time>current_timestamp-72 hours order by library_name,drive_name\"","drive","0xCC0033","lm_drive_72.csv","lm_drive_72.png","\"select distinct(drive_name),library_name from summary where library_name in (select library_name from libraries where library_type!='SHARED') ${lib_specific_command} and activity='TAPE MOUNT' and start_time>current_timestamp-72 hours order by library_name,drive_name\"","lm_drive_72_avail.csv"],
	["Drive Utilisation for Last 7 Days $library_heading","\"select drive_name,library_name,year(start_time),month(start_time),day(start_time),hour(start_time),minute(start_time),second(start_time),year(end_time),month(end_time),day(end_time),hour(end_time),minute(end_time),second(end_time) from summary where library_name in (select library_name from libraries where library_type!='SHARED') ${lib_specific_command} and activity='TAPE MOUNT' and start_time>current_timestamp-168 hours order by library_name,drive_name\"","drive","0x0AC2FF","lm_drive_7days.csv","lm_drive_7days.png","\"select distinct(drive_name),library_name from summary where library_name in (select library_name from libraries where library_type!='SHARED') ${lib_specific_command} and activity='TAPE MOUNT' and start_time>current_timestamp-168 hours order by library_name,drive_name\"","lm_drive_7days_avail.csv"],
	["Drive Utilisation for Last Month $library_heading","\"select drive_name,library_name,year(start_time),month(start_time),day(start_time),hour(start_time),minute(start_time),second(start_time),year(end_time),month(end_time),day(end_time),hour(end_time),minute(end_time),second(end_time) from summary where library_name in (select library_name from libraries where library_type!='SHARED') ${lib_specific_command} and activity='TAPE MOUNT' and start_time>current_timestamp-744 hours order by library_name,drive_name\"","drive","0x339966","lm_drive_1month.csv","lm_drive_1month.png","\"select distinct(drive_name),library_name from summary where library_name in (select library_name from libraries where library_type!='SHARED') ${lib_specific_command} and activity='TAPE MOUNT' and start_time>current_timestamp-744 hours order by library_name,drive_name\"","lm_drive_1month_avail.csv"],
	
);

print "\nProcessing drive mounts $library_heading - this may take some time....\n";

${command_count}=0;


while ($commands[${command_count}]){
	
	        unlink ("${host_directory}$commands[${command_count}][4]");
	        unlink ("${host_directory}$commands[${command_count}][7]");
                $commands[${command_count}][1] =~ s/qt/\\"/g; # Allows us to put quotes in the command
		system("${baclient_directory}/dsmadmc.exe -id=$lm_user -pa=$lm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_lm_custom.opt $commands[${command_count}][1] >> ${host_directory}$commands[${command_count}][4]");
		system("${baclient_directory}/dsmadmc.exe -id=$lm_user -pa=$lm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_lm_custom.opt $commands[${command_count}][6] >> ${host_directory}$commands[${command_count}][7]");


my @array_of_stuff;
my @array_of_starts;
my @array_of_ends;
my @array_of_tasks;
open(DRIVES, "<${host_directory}$commands[${command_count}][7]") or &been_an_error;
@array_of_stuff = <DRIVES>;
for(@array_of_stuff){s/,/=>/g}
close(DRIVES);
$count=0;
open (DRIVES, "<${host_directory}$commands[${command_count}][7]") or &been_an_error;
@drivefile=<DRIVES>;  
	
	foreach $bit (@drivefile) {
	      chomp $bit;
	     ($uniqdrive,$uniqlibrary) = (split /,/,$bit)[0,1];
	     chomp $uniqdrive;
              chomp $uniqlibrary;

              
              $uniqref="$uniqlibrary-$uniqdrive";
                        open (DATA, "${host_directory}$commands[${command_count}][4]") or &been_an_error;
                        @csvfile=<DATA>;  
                            foreach $element (@csvfile) {
                            chomp $element;
                            ($drive,$library) = (split /,/,$element)[0,1];
                               chomp $drive;
                               chomp $library;
                               $ref="${library}-${drive}";
                                    if ($ref eq $uniqref ) {                                   
                                    push (@array_of_tasks,$count);
                                    #print @array_of_tasks;  
                                    }
                                    
                         close (DATA);
              
             }
             $count=$count+1;       
}
close (DRIVES); 
open (DATA, "${host_directory}$commands[${command_count}][4]") or &been_an_error;
	@csvfile=<DATA>;  
	
	foreach $element (@csvfile) {
	      chomp $element;
	     ($drive,$library,$start_year,$start_month,$start_day,$start_hour,$start_min,$start_sec,$end_year,$end_month,$end_day,$end_hour,$end_min,$end_sec ) = (split /,/,$element)[0,1,2,3,4,5,6,7,8,9,10,11,12,13];
              chomp $drive;
              chomp $library;
              chomp $start_year;
              chomp $start_month;
              chomp $start_hour;
              chomp $start_min;
              chomp $start_sec;
              chomp $end_year;
              chomp $end_month;
              chomp $end_hour;
              chomp $end_min;
              chomp $end_sec;
  
my $holding_startDate = perlchartdir::chartTime($start_year,$start_month,$start_day,$start_hour,$start_min,$start_sec);
my $holding_endDate =  perlchartdir::chartTime($end_year,$end_month,$end_day,$end_hour,$end_min,$end_sec);

push (@array_of_starts, $holding_startDate);
push (@array_of_ends, $holding_endDate);

}

my $c = new XYChart(1200, 768, 0xffffff, 0x000000, 1);
$c->addTitle("$commands[${command_count}][0]", "arial.ttf", 15, 0x000000)->setBackground(0xffffff);
$c->setPlotArea(180, 55, 800, 700, 0xffffff, 0xeeeeee, $perlchartdir::LineColor, 0xc0c0c0, 0xc0c0c0)->setGridWidth(2, 1, 1, 1);
$c->swapXY();
$c->yAxis()->setMultiFormat(perlchartdir::StartOfDayFilter(), "-<*font=arialbd.ttf*>{value|mmm d}", perlchartdir::StartOfHourFilter(), "-{value|hh}");
$c->setYAxisOnRight();
$c->xAxis()->setLabels([@array_of_stuff]);
$c->xAxis()->setReverse();
$c->xAxis()->setTickOffset(0.5);
#my $layer = $c->addBoxWhiskerLayer2([@array_of_starts], [@array_of_ends], undef, undef, undef,[0xcc0000]); # multi colours
my $layer = $c->addBoxWhiskerLayer([@array_of_starts], [@array_of_ends], undef, undef, undef,[$commands[${command_count}][3]]);
$layer->setXData([@array_of_tasks]);
$layer->setBorderColor($perlchartdir::SameAsMainColor);
$layer->setDataWidth(int(700 * 4.5 / 5 / scalar(@array_of_stuff)));
$c->makeChart("$commands[${command_count}][5]");


${command_count}=${command_count}+1;		
}
}
}

### end of remote library
else {
	print "There are no remotely controlled libraries or elected to skip. Moving on....\n";
	system  ("pause");
}

}

# ###########################################################################
## Subroutine:
## Name: make_lm_graphs
## Use: Get the number of VM's in an RVTOOLS spreadsheet
###########################################################################

sub rvtools_num_vms {

$page_count=0;

open(XML, "<${filename}_sheet_0_tabvInfo.csv") or &been_an_error;
open (OUTPUT_SUMMARY,">>${filename}_FINAL_SUMMARY.csv") or &been_an_error; 

my @n = <XML>;
close(XML);
my $total_number_of_vms = @n-1;
	
print OUTPUT_SUMMARY "Number of VMS,$total_number_of_vms\n";
close (OUTPUT_SUMMARY);
}

###########################################################################
## Subroutine:
## Name: rvtools_sheet_4
## Use: Processes VM tools levels
###########################################################################

sub rvtools_sheet_4 {
	
open(XML, "<${filename}_sheet_4_tabvTools.csv") or &been_an_error; 
my $firstline = <XML>;
close (XML);
@header_array= split(/_del1m1t3r_/, $firstline);
$array_count=0;

foreach (@header_array) {
	if ($_ eq 'Tools') { $sheet4_item0=$array_count }
	

$array_count=$array_count+1;
}


open(XML, "<${filename}_sheet_4_tabvTools.csv") or &been_an_error;
open (OUTPUT_SUMMARY,">>${filename}_FINAL_SUMMARY.csv") or &been_an_error; 


	@csvfile=<XML>;  
	
	foreach $element (@csvfile) {
              next if 0..0;
	      chomp $element;
	     ($tools_state ) = (split /_del1m1t3r_/,$element)[$sheet4_item0];
              chomp $tools_state;
              
              
              if ($tools_state eq "toolsNotInstalled") { $tools_not_installed=$tools_not_installed+1 }
              if ($tools_state eq "toolsNotRunning") { $tools_not_running=$tools_not_running+1 }
              if ($tools_state eq "toolsOk") { $tools_ok=$tools_ok+1 }
              if ($tools_state eq "toolsOld") { $tools_old=$tools_old+1 }
              if ($tools_state eq "") { $tools_unknown=$tools_unknown+1 }
                         
}


## VM Tools
	
print OUTPUT_SUMMARY "VM Tools Not Installed (#),$tools_not_installed\n";
print OUTPUT_SUMMARY "VM Tools Not Running but OK (#),$tools_not_running\n";
print OUTPUT_SUMMARY "VM Tools Running and OK (#),$tools_ok\n";
print OUTPUT_SUMMARY "VM Tools Old (#),$tools_old\n";
print OUTPUT_SUMMARY "VM Tools State UNKNOWN (#),$tools_unknown\n";

close(XML);
close (OUTPUT_SUMMARY);

}

###########################################################################
## Subroutine:
## Name: rvtools_sheet_5
## Use: Processes VM capacities from Datastore Worksheet
###########################################################################



sub rvtools_sheet_5 {
	
open(XML, "<${filename}_sheet_5_tabvDatastore.csv") or &been_an_error; 
my $firstline = <XML>;
close (XML);
@header_array= split(/_del1m1t3r_/, $firstline);
$array_count=0;

foreach (@header_array) {
	if ($_ eq 'Capacity MB') { $sheet5_item0=$array_count }
	if ($_ eq 'Provisioned MB') { $sheet5_item1=$array_count }
	if ($_ eq 'In Use MB') { $sheet5_item2=$array_count }
	if ($_ eq 'Free MB') { $sheet5_item3=$array_count }
	if ($_ eq 'Free %') { $sheet5_item4=$array_count }
	

$array_count=$array_count+1;
}

###################

open(XML, "<${filename}_sheet_5_tabvDatastore.csv") or &been_an_error; 
open (OUTPUT_SUMMARY,">>${filename}_FINAL_SUMMARY.csv") or &been_an_error; 


	@csvfile=<XML>;  
	
	foreach $element (@csvfile) {
	$total_number_datastores=$total_number_datastores+1;
              
	      chomp $element;
	     ($datastore_capacity, $datastore_provisioned, $datastore_in_use,$datastore_free_MB,$datastore_free_pct ) = (split /_del1m1t3r_/,$element)[$sheet5_item0,$sheet5_item1,$sheet5_item2,$sheet5_item3,$sheet5_item4];
              chomp $datastore_free_MB;
              chomp $datastore_free_pct;
              chomp $datastore_capacity;
              chomp $datastore_provisioned;
              chomp $datastore_in_use;
              $datastore_free_MB =~ s/,//;
              $datastore_capacity =~ s/,//;
              $datastore_provisioned =~ s/,//;
              $datastore_in_use =~ s/,//;
              
              
              
              if ($datastore_free_MB <= 102400) {$datastore_100GB_free=$datastore_100GB_free+1;}
              if ($datastore_free_pct <= 10) { $datastore_10PCT_free=$datastore_10PCT_free+1; }
              if ($datastore_capacity ne "Capacity MB") { $datastore_total_capacity=$datastore_total_capacity+$datastore_capacity }  
              if ($datastore_provisioned ne "Provisioned MB") {$datastore_total_provisioned=$datastore_total_provisioned+$datastore_provisioned }
              if ($datastore_in_use ne "In Use MB") {${datastore_total_in_use}=${datastore_total_in_use}+$datastore_in_use }
          
}

## Conversions

$datastore_total_capacity=$datastore_total_capacity/1024; # to GB
$datastore_total_provisioned=$datastore_total_provisioned/1024; # TO GB
${datastore_total_in_use}=${datastore_total_in_use}/1024; #TO GB

$total_number_datastores=$total_number_datastores-1; # Correct for heading

printf OUTPUT_SUMMARY "Total Number of Datastores,%d \n",$total_number_datastores;
printf OUTPUT_SUMMARY "Total Capacity of Datastores (GB),%.2f \n",$datastore_total_capacity;
printf OUTPUT_SUMMARY "Total Capacity Provisioned in Datastores (GB),%.2f \n",$datastore_total_provisioned;
printf OUTPUT_SUMMARY "Total Capacity In Use in Datastores (GB),%.2f \n",${datastore_total_in_use};
printf OUTPUT_SUMMARY "Datastores with less than 100GB Free (#),%d \n",$datastore_100GB_free;
printf OUTPUT_SUMMARY "Datastores with less than 10 percent Free (#),%d \n",$datastore_10PCT_free;


close(XML);
close (OUTPUT_SUMMARY);

}

###########################################################################
## Subroutine:
## Name: rvtools_sheet_3
## Use: Processes VM snapshots
###########################################################################



sub rvtools_sheet_3 {
	
open(XML, "<${filename}_sheet_3_tabvSnapshot.csv") or &been_an_error; 
my $firstline = <XML>;
close (XML);
@header_array= split(/_del1m1t3r_/, $firstline);
$array_count=0;

foreach (@header_array) {
	if ($_ eq 'Size MB (total)') { $sheet3_item0=$array_count }
	

$array_count=$array_count+1;
}


open(XML, "<${filename}_sheet_3_tabvSnapshot.csv") or &been_an_error; 
open (OUTPUT_SUMMARY,">>${filename}_FINAL_SUMMARY.csv") or &been_an_error; 


	@csvfile=<XML>;  
	
	foreach $element (@csvfile) {
	
              
	      chomp $element;
	     ($snapshot_MB) = (split /_del1m1t3r_/,$element)[$sheet3_item0];
              chomp $snapshot_MB;
              
              
              
              
              
              if ($snapshot_MB ne "Size MB (total)") {${snapshot_total_storage_MB}=${snapshot_total_storage_MB}+$snapshot_MB;}
              
              
         
}

### Conversions
${snapshot_total_storage_MB}=${snapshot_total_storage_MB}/1024;

printf OUTPUT_SUMMARY "Total Snapshot Usage (GB),%.2f \n",${snapshot_total_storage_MB};


close(XML);
close (OUTPUT_SUMMARY);

}

###########################################################################
## Subroutine:
## Name: rvtools_sheet_1
## Use: Processes VM tabVdisk
###########################################################################

sub rvtools_sheet_1 {

open(XML, "<${filename}_sheet_1_tabvDisk.csv") or &been_an_error; 
my $firstline = <XML>;
close (XML);
@header_array= split(/_del1m1t3r_/, $firstline);
$array_count=0;

foreach (@header_array) {
	if ($_ eq 'Capacity MB') { $sheet1_item0=$array_count }
	if ($_ eq 'Raw') { $sheet1_item1=$array_count }

$array_count=$array_count+1;
}


open(XML, "<${filename}_sheet_1_tabvDisk.csv") or &been_an_error; 
open (OUTPUT_SUMMARY,">>${filename}_FINAL_SUMMARY.csv") or &been_an_error; 


	@csvfile=<XML>;  
	
	foreach $element (@csvfile) {
	
              
	      chomp $element;
	     ($raw_disk_capacity,$disk_mapping_type) = (split /_del1m1t3r_/,$element)[$sheet1_item0,$sheet1_item1];
              chomp $disk_mapping_type;
              chomp $raw_disk_capacity;
              
              
              
              
              if ($disk_mapping_type eq "True") {
              	$disk_raw_mappings=$disk_raw_mappings+1;
              	$disk_total_capacity_raw_mappings=$disk_total_capacity_raw_mappings+$raw_disk_capacity;
              	}
              if ($disk_mapping_type eq "False") {$disk_normal_mappings=$disk_normal_mappings+1;}
              
         
}

### Conversions
$disk_total_capacity_raw_mappings=$disk_total_capacity_raw_mappings/1024;

printf OUTPUT_SUMMARY "Total Raw Disk Mappings (#),%d \n",$disk_raw_mappings;
printf OUTPUT_SUMMARY "Total Raw Disk Capacity (GB),%.2f \n",$disk_total_capacity_raw_mappings;
printf OUTPUT_SUMMARY "Total VMFS Disk Mappings (#),%d \n",$disk_normal_mappings;


close(XML);
close (OUTPUT_SUMMARY);

}


###########################################################################
## Subroutine:
## Name: rvtools_sheet_0
## Use: Processes VM tabVInfo
###########################################################################

sub rvtools_sheet_0 {

##### Check format of spreadsheet


open(XML, "<${filename}_sheet_0_tabvInfo.csv") or &been_an_error; 
my $firstline = <XML>;
close (XML);
@header_array= split(/_del1m1t3r_/, $firstline);
$array_count=0;

foreach (@header_array) {
	if ($_ eq 'VM') { $sheet0_item0=$array_count }
	if ($_ eq 'Powerstate') { $sheet0_item1=$array_count }
	if ($_ eq 'CPUs') { $sheet0_item2=$array_count }
	if ($_ eq 'Memory') { $sheet0_item3=$array_count }
	if ($_ eq 'NICs') { $sheet0_item4=$array_count }
	if ($_ eq 'Disks') { $sheet0_item5=$array_count }
	if ($_ eq 'Provisioned MB') { $sheet0_item6=$array_count }
	if ($_ eq 'In Use MB') { $sheet0_item7=$array_count }
	if ($_ eq 'Unshared MB') { $sheet0_item8=$array_count }
	if ($_ eq 'Datacenter') { $sheet0_item9=$array_count }
	if ($_ eq 'Cluster') { $sheet0_item10=$array_count }
	if ($_ eq 'Host') { $sheet0_item11=$array_count }
	if ($_ eq 'VM Version') { $sheet0_item12=$array_count }

$array_count=$array_count+1;
}

###################
	      

open(XML, "<${filename}_sheet_0_tabvInfo.csv") or &been_an_error; 
open (OUTPUT_SUMMARY,">>${filename}_FINAL_SUMMARY.csv") or &been_an_error; 

@csvfile=<XML>;  
	
	foreach $element (@csvfile) {
              next if 0..0;
	      chomp $element;
	     ($vm_name,$power_state, $vm_cpu, $vm_memory, $vm_nics, $vm_disks, $provisioned_MB, $inuse_MB, $unshared_MB, $esx_datacenter, $esx_cluster, $esx_host, $vm_version ) = (split /_del1m1t3r_/,$element)[$sheet0_item0,$sheet0_item1,$sheet0_item2,$sheet0_item3,$sheet0_item4,$sheet0_item5,$sheet0_item6,$sheet0_item7,$sheet0_item8,$sheet0_item9,$sheet0_item10,$sheet0_item11,$sheet0_item12];
	     
	     
              chomp $vm_name;
              chomp $power_state;
              chomp $vm_cpu;
              chomp $vm_memory;
              chomp $vm_nics;
              chomp $vm_disks;
              chomp $provisioned_MB;
              chomp $inuse_MB;
              chomp $unshared_MB;
              chomp $vm_version;
              chomp $esx_datacenter;
              chomp $esx_cluster;
              chomp $esx_host;
              
              if ($inuse_MB > $biggest_size_of_biggest_vm) {
              	$biggest_size_of_biggest_vm=$inuse_MB;
              	$biggest_vm=$vm_name;
              }
              
              if ($power_state eq "poweredOn") { $total_switched_on=$total_switched_on+1 }
              if ($power_state eq "poweredOff") { $total_switched_off=$total_switched_off+1 }
              if ($power_state eq "suspended") { $total_suspended=$total_suspended+1 }
              $total_vm_cpu=$total_vm_cpu+$vm_cpu;
              $total_vm_memory=$total_vm_memory+$vm_memory;
              $total_vm_nics=$total_vm_nics+$vm_nics;
              $total_vm_disks=$total_vm_disks+$vm_disks;
              $total_provisioned_MB=$total_provisioned_MB+$provisioned_MB;
              $tabvInfo_total_inuse_MB=$tabvInfo_total_inuse_MB+$inuse_MB;
              $total_unshared_MB=$total_unshared_MB+$unshared_MB;
              ## TL 
              if ($vm_version eq "7" && $vm_version ne "VM Version") { $total_vm_version_at_7=$total_vm_version_at_7+1 }
              if ($vm_version gt "7" && $vm_version ne "VM Version") { $total_vm_version_gt_7=$total_vm_version_gt_7+1 }
              if ($vm_version lt "7"&& $vm_version ne "VM Version") { $total_vm_version_le_7=$total_vm_version_le_7+1 }
              
              ## DataCenters
              push(@unique_datacenters, $esx_datacenter); 
              ## Clusters
              push(@unique_clusters, $esx_cluster);
              ## Hosts
              push (@unique_hosts,$esx_host);
              ## Biggest VMs
              ${iu_GB}=${inuse_MB}/1024;
              push (@biggest_vm_list,${iu_GB});
}



## Provisioned resources

## Conversions
$total_vm_memory=$total_vm_memory/1024; # TO GB
$total_provisioned_MB=$total_provisioned_MB/1024;	# TO GB
$tabvInfo_total_inuse_MB=$tabvInfo_total_inuse_MB/1024; # TO GB

## Storage per VM



printf OUTPUT_SUMMARY "Number of VMS Switched On,%d \n",$total_switched_on;
printf OUTPUT_SUMMARY "Number of VMS Switched Off,%d \n",$total_switched_off;
printf OUTPUT_SUMMARY "Number of VMS Suspended,%d \n",$total_suspended;
printf OUTPUT_SUMMARY "Total Farm CPU (#Virtual),%.2f \n",$total_vm_cpu;
printf OUTPUT_SUMMARY "Total Farm Memory (GB),%.2f \n",$total_vm_memory;
printf OUTPUT_SUMMARY "Total Farm NICS (#Virtual),%d \n",$total_vm_nics;
printf OUTPUT_SUMMARY "Total Farm DISKS (#Virtual),%d \n",$total_vm_disks;
printf OUTPUT_SUMMARY "Total Farm Provisioned Disk from tabvInfo(Including RAW)(GB),%.2f \n",$total_provisioned_MB;
printf OUTPUT_SUMMARY "Total Farm Used Disk (Including RAW)(GB),%.2f \n",$tabvInfo_total_inuse_MB;


## Technology levels

printf OUTPUT_SUMMARY "Total VMs at TL version 7,%d \n",$total_vm_version_at_7;
printf OUTPUT_SUMMARY "Total VMs Greater Than TL version 7,%d \n",$total_vm_version_gt_7;
printf OUTPUT_SUMMARY "Total VMs Less Than TL version 7 (need upgrade!),%d \n",$total_vm_version_le_7;

## Datacenters, clusters and hosts

@unique_datacenters = grep { ! $seen{ $_ }++ } @unique_datacenters;
our $unique_dc_size = scalar (@unique_datacenters);
printf OUTPUT_SUMMARY "Total Number of Datacenters,%d \n",$unique_dc_size;

@unique_clusters = grep { ! $seen{ $_ }++ } @unique_clusters;
our $unique_cl_size = scalar (@unique_clusters);
printf OUTPUT_SUMMARY "Total Number of Clusters,%d \n",$unique_cl_size;

@unique_hosts = grep { ! $seen{ $_ }++ } @unique_hosts;
our $unique_hs_size = scalar (@unique_hosts);
printf OUTPUT_SUMMARY "Total Number of Hosts,%d \n",$unique_hs_size;

## VM Tools

close(XML);
close (OUTPUT_SUMMARY);

}


###########################################################################
## Subroutine:
## Name: rvtools_sheet_2
## Use: Processes VM Partitions
###########################################################################

sub rvtools_sheet_2 {

open(XML, "<${filename}_sheet_2_tabvPartition.csv") or &been_an_error; 
my $firstline = <XML>;
close (XML);
@header_array= split(/_del1m1t3r_/, $firstline);
$array_count=0;

foreach (@header_array) {
	if ($_ eq 'Capacity MB') { $sheet2_item0=$array_count }
	if ($_ eq 'Free MB') { $sheet2_item1=$array_count }

$array_count=$array_count+1;
}

open(XML, "<${filename}_sheet_2_tabvPartition.csv") or &been_an_error; 
open (OUTPUT_SUMMARY,">>${filename}_FINAL_SUMMARY.csv") or &been_an_error; 


	@csvfile=<XML>;  
	
	foreach $element (@csvfile) {
              next if 0..0;
	      chomp $element;
	     ($partition_capacity_mb,$free_MB) = (split /_del1m1t3r_/,$element)[$sheet2_item0,$sheet2_item1];
	     # Use line below if XdConfig does NOT exist
	     #($power_state, $vm_cpu, $vm_memory, $vm_nics, $vm_disks, $provisioned_MB, $inuse_MB, $unshared_MB, $esx_datacenter, $esx_cluster, $esx_host, $vm_version ) = (split /_del1m1t3r_/,$element)[2,6,7,8,9,22,23,24,27,28,29,31];
              chomp $partition_capacity_mb;
              chomp $free_MB;
	      $inuse_MB=$partition_capacity_mb-$free_MB;
              ${total_inuse_MB}=${total_inuse_MB}+$inuse_MB;
              
}



## Provisioned resources

## Conversions

${total_inuse_MB}=${total_inuse_MB}/1024; # TO GB




## Storage per VM

## Notes
## This includes RAW disk. The difficulty is that it is complex to work out the actual USED raw capacity. We can end up taking too much away from the total


printf OUTPUT_SUMMARY "Total Used Partion Space from vPartition table (GB),%.2f \n",${total_inuse_MB};

close(XML);
close (OUTPUT_SUMMARY);

}

###### parse the spreadsheet out

###########################################################################
## Subroutine:
## Name: xls_convert
## Use: process the tabs in rvtools output
###########################################################################

sub xls_convert {



use Spreadsheet::XLSX;
use File::Copy;
use Spreadsheet::XLSX;


&draw_heading;
print "\n#### IMPORTANT ####\n";
print "Open the spreadsheet and delete all tabs APART FROM:\ntabvInfo\ntabvDisk\ntabvPartition\ntabvSnapshot\ntabvTools\ntabvDatastore\n\n";
print "Ensure they are strictly in the ABOVE ORDER.\nSave the spreadsheet as an .xlsx in the output directory\nNOTE: This program will NOT WORK if these steps are not followed.";
print "\nPress <enter> when done. Ensure the speadsheet is saved and CLOSED!\n";
system ("pause");


@array_of_pages=('0','1','2','3','4','5');
our $page_count=0;

###############
### Tab Loop
###############


## This should be 21 for full version
## Change this number to reflect number of items in array_of_pages variable - if array has 2 members, "while ($page_count ne 2){" etc...
##
##

while ($page_count ne 6){
our $filename ="$cust_directory/$xlsname";
## remove the summary file - this is used later in the subroutines
#unlink ("${filename}.csv");

my $excel = Spreadsheet::XLSX -> new ($filename); 
my $sheet = ($excel->worksheets())[@array_of_pages[$page_count]];
## This is fine, but we need a fixed array of names for referencing later
#my $tabname=$sheet->{Name}; 
## So we do this...
our @tabs_in_spreadsheet=("tabvInfo","tabvDisk","tabvPartition","tabvSnapshot","tabvTools","tabvDatastore"); 
##
## delete the old one first if it exists
##
unlink ("${filename}_sheet_${page_count}_$tabs_in_spreadsheet[@array_of_pages[$page_count]].csv");
open(XML, ">${filename}_sheet_@array_of_pages[$page_count]_$tabs_in_spreadsheet[@array_of_pages[$page_count]].csv") or &been_an_error; 
## Gives file in form RVTools_IMS.xlsx_sheet_0_tabvInfo.csv
##################
### Worksheet loop
##################

my $count=0;
foreach my $row ($sheet -> {MinRow} .. $sheet -> {MaxRow}) { 
         #if ($count ne '0') 
         $sheet -> {MaxCol} ||= $sheet -> {MinCol}; 
         foreach my $col ($sheet -> {MinCol} ..  $sheet -> {MaxCol}) { 
                 my $cell = $sheet -> {Cells} [$row] [$col]; 
                 if ($cell) { 
                    print XML $cell -> {Val}; 
                  } 
                   unless($col == $sheet -> {MaxCol}) {print XML "_del1m1t3r_";} 
                    
                } 
            unless( $row == $sheet -> {MaxRow}){print XML "\n";} 
         #} 
         $count=$count+1;
}

close(XML);
print "Processed sheet @array_of_pages[$page_count] ($tabs_in_spreadsheet[@array_of_pages[$page_count]])\n"; 
$page_count=$page_count+1;
##################
### Worksheet loop
##################
}
###############
### Tab Loop
###############

}

###########################################################################
## Subroutine:
## Name: make_model 
## Use: RVTOOLS make model
###########################################################################

sub make_model {

&draw_heading;
		
########################
######################## Start Menu
########################
	use Term::Menu;
	my $prompt = new Term::Menu (
	beforetext => "OPTIONS REQUIRED:\n",
	aftertext => "\nChoose option then press <enter> => ",
	);
	our $usemenu = $prompt->menu(
        datastore  =>      			["Source is 80% of used Datastore? (Better for high RAW values)", 'd'],
        partition  =>      			["Source is used GB from Partition table less 60% RAW (For low RAW values)", 'p'],
        raw  =>      				["Source is used from Partion table (effectively converts RAW -> vRDM)", 'r'],
        
        );
     

if ($usemenu eq "datastore") {   
${total_inuse_MB}=(((${datastore_total_in_use}/100)*80)-${snapshot_total_storage_MB});
print "\nDatastore Source - Total data in use is ${total_inuse_MB}\n";
system ("pause");
}
if ($usemenu eq "partition") {   
$raw_adjuster=(($disk_total_capacity_raw_mappings/100)*60); ## Assume Raw volumes are 60% provisioned - the number is already converted to GB
${total_inuse_MB}=(${total_inuse_MB}-$raw_adjuster);
print "\nPartition Source - Total data in use is ${total_inuse_MB}\n";
system ("pause");
}
if ($usemenu eq "raw") {   
print "\nPartition + Raw Source - Total data in use is ${total_inuse_MB}\n";
system ("pause");
}


## If serverside deduplication then let's ignore it until the end and just apply compression to the storage pools 

 if ($client_side_deduplication_yes ne "0") {
 	$stats_client_side_rr_as_decimal=1;
 
 }

else {
	## Set deduplication ratio to decimal so I can use it
	$stats_client_side_rr_as_decimal=1/$stats_client_side_reduction_ratio;
}


## Work out the daily amount based on whether there are additional fulls too

if ($stats_days_between_fulls == 0 ) {
	$workload_daily_inc_backup=(((${total_inuse_MB}/100)*$stats_daily_change_rate));
	$tsm_full_adjuster=0;
	}
	else
	{

	$workload_daily_inc_backup=(((${total_inuse_MB}/100)*$stats_daily_change_rate)+($stats_client_side_rr_as_decimal*(${total_inuse_MB}/$stats_days_between_fulls))-(((${total_inuse_MB}/100)*$stats_daily_change_rate)/$stats_days_between_fulls));
	$tsm_full_adjuster=int($stats_tsm_versions/$stats_days_between_fulls);
	}

## Adjust Workloads for deduplication ratio - remember it's only on fulls! 
## There MAY be deduplication on incrementals but we assume there isn't for safety.

## Apply 3 years growth 
$workload_daily_inc_backup=$workload_daily_inc_backup*((1+($stats_annual_storage_growth/100))**3);

## Growth already applied to workload 	
$workload_aggregate_throughput_inc_backup_window=($workload_daily_inc_backup/$stats_backup_window);

## Apply 3 years growth
$workload_full_backup_new_vms=($stats_client_side_rr_as_decimal*((${total_inuse_MB}/100)*$stats_ss_full_backup_new_vms));
$workload_full_backup_new_vms=$workload_full_backup_new_vms*((1+($stats_annual_storage_growth/100))**3);

## Apply 3 years growth
$workload_full_backup_cbt_vms=(($stats_client_side_rr_as_decimal*(${total_inuse_MB}/100)*$stats_ss_full_cbt));
$workload_full_backup_cbt_vms=$workload_full_backup_cbt_vms*((1+($stats_annual_storage_growth/100))**3);

## Growth already applied
$workload_total_full_backup=($workload_full_backup_new_vms+$workload_full_backup_cbt_vms);

## Growth already applied
$workload_total_full_throughput_backup=($workload_total_full_backup/$stats_backup_window);

## Apply 3 years growth
$workload_full_restore=((${total_inuse_MB}/100)*$stats_ss_full_restore);
$workload_full_restore=$workload_full_restore*((1+($stats_annual_storage_growth/100))**3);

## Growth already applied
$workload_total_full_throughput_restore=($workload_full_restore/$stats_backup_window);

## No need for growth here - phase in
$workload_phase_in_daily=($stats_client_side_rr_as_decimal*(${total_inuse_MB}/$stats_phase_in_days));

## No need for growth here - phase in
$workload_phase_in_throughput=($workload_phase_in_daily/$stats_phase_in_window);

## Apply 3 years growth
$workload_critical_restore_amount=((${total_inuse_MB}/100)*$stats_critical_vms_restore);
$workload_critical_restore_amount=$workload_critical_restore_amount*((1+($stats_annual_storage_growth/100))**3);

## Growth already applied
$workload_critical_restore_throughput=($workload_critical_restore_amount/$stats_critical_vms_RTO);

### 	Sessions etc...

## Growth already applied
$workload_sessions_inc=($workload_aggregate_throughput_inc_backup_window/$stats_max_throughput_per_inc_session); #Are these numbers accurate
## Growth already applied
$workload_sessions_full=($workload_total_full_throughput_backup/$stats_max_throughput_per_full_session);
## Growth already applied
$workload_sessions_restores=($workload_total_full_throughput_restore/$stats_max_throughput_per_full_session);
## No need for growth here - phase in
$workload_sessions_phasein_initial_full=($workload_phase_in_throughput/$stats_max_throughput_per_full_session);
## Growth already applied
$workload_sessions_critical_restore=($workload_critical_restore_throughput/$stats_max_throughput_per_full_session);
## Growth already applied
$workload_sessions_concurrent_total=($workload_sessions_inc+$workload_sessions_full+$workload_sessions_restores+$workload_sessions_phasein_initial_full+$workload_sessions_critical_restore);
## Growth already applied
$workload_restore_sessions_concurrent_total=($workload_sessions_restores+$workload_sessions_critical_restore);
## Growth already applied
$workload_sum_of_restore_throughput=$workload_total_full_throughput_restore+$workload_critical_restore_throughput;



if ($stats_client_side_reduction_ratio == 1)
{
$proxies_from_cpu=(($workload_sessions_concurrent_total*$stats_vcpus_per_session)/$stats_vcpus_per_proxy);	

}
else 
{
$proxies_from_cpu=((($workload_total_full_throughput_backup + $workload_phase_in_throughput )*$stats_vcpus_per_GBH_on_backup) + (($workload_critical_restore_throughput + $workload_total_full_throughput_restore)*$stats_vcpus_per_GBH_on_restore))/$stats_vcpus_per_proxy;	
	
}

$proxies_from_throughput=(($workload_aggregate_throughput_inc_backup_window+$workload_total_full_throughput_restore+$workload_phase_in_throughput+$workload_critical_restore_throughput)/$stats_max_throughput_per_proxy);
$proxies_from_clusters=($unique_cl_size);

$number_of_tsm_servers_required_1G=(($workload_aggregate_throughput_inc_backup_window+$workload_total_full_throughput_restore+$workload_phase_in_throughput+$workload_critical_restore_throughput)/$stats_max_throughput_per_tsm_server_1G);
$number_of_tsm_servers_required_10G=(($workload_aggregate_throughput_inc_backup_window+$workload_total_full_throughput_restore+$workload_phase_in_throughput+$workload_critical_restore_throughput)/$stats_max_throughput_per_tsm_server_10G);
$no_phase_in_number_of_tsm_servers_required_1G=(($workload_aggregate_throughput_inc_backup_window+$workload_total_full_throughput_restore+$workload_critical_restore_throughput)/$stats_max_throughput_per_tsm_server_1G);
$no_phase_in_number_of_tsm_servers_required_10G=(($workload_aggregate_throughput_inc_backup_window+$workload_total_full_throughput_restore+$workload_critical_restore_throughput)/$stats_max_throughput_per_tsm_server_10G);



## Need to check this stuff - is this correct? 
$datamovers_required_for_restores=(($workload_critical_restore_throughput+$workload_total_full_throughput_restore)/$restore_rate)/$stats_VMMaxparallel;
$datamovers_required_for_backups=(($workload_aggregate_throughput_inc_backup_window+$workload_total_full_throughput_backup)/$stats_max_throughput_per_inc_session)/$stats_VMMaxparallel;
$proxies_required_because_of_restore_datamovers=$datamovers_required_for_restores/10;
$proxies_required_because_of_backup_datamovers=$datamovers_required_for_backups/10;

##
## PSP Calculations
##

## 1 Year - take account of over 365 versions

### Set the deduplication rate to account for client or serverside now

$stats_client_side_rr_as_decimal=1/$stats_client_side_reduction_ratio;


### If it's a disk only solution

if ($stats_days_between_fulls == 0 ) {
	
if ($stats_tsm_versions >= 366) {
	$tsm_psp_TB_year_1=int((((${total_inuse_MB}/100)*$stats_daily_change_rate)*(365-$tsm_full_adjuster))+($stats_client_side_rr_as_decimal*((((${total_inuse_MB}/100)*$stats_ss_full_cbt)*365)+(${total_inuse_MB}*$tsm_full_adjuster)+${total_inuse_MB})));
}
else {
	$tsm_psp_TB_year_1=int((((${total_inuse_MB}/100)*$stats_daily_change_rate)*($stats_tsm_versions-$tsm_full_adjuster))+($stats_client_side_rr_as_decimal*((((${total_inuse_MB}/100)*$stats_ss_full_cbt)*$stats_tsm_versions)+(${total_inuse_MB}*$tsm_full_adjuster)+${total_inuse_MB})));
	
}

## 2 Years

$new_storage_size=((${total_inuse_MB}/100)*$stats_annual_storage_growth)+${total_inuse_MB};
$tsm_psp_TB_year_2=int(((($new_storage_size/100)*$stats_daily_change_rate)*($stats_tsm_versions-$tsm_full_adjuster))+($stats_client_side_rr_as_decimal*(((($new_storage_size/100)*$stats_ss_full_cbt)*$stats_tsm_versions)+($new_storage_size*$tsm_full_adjuster)+$new_storage_size)));

## 3 Years

$new_storage_size=(($new_storage_size/100)*$stats_annual_storage_growth)+$new_storage_size;
$tsm_psp_TB_year_3=int(((($new_storage_size/100)*$stats_daily_change_rate)*($stats_tsm_versions-$tsm_full_adjuster))+($stats_client_side_rr_as_decimal*(((($new_storage_size/100)*$stats_ss_full_cbt)*$stats_tsm_versions)+($new_storage_size*$tsm_full_adjuster)+$new_storage_size)));

}

else {
	
if ($stats_tsm_versions >= 366) {
	$tsm_psp_TB_year_1=int((((${total_inuse_MB}/100)*$stats_daily_change_rate)*(365-$tsm_full_adjuster))+($stats_client_side_rr_as_decimal*((((${total_inuse_MB}/100)*$stats_ss_full_cbt)*365)+(${total_inuse_MB}*$tsm_full_adjuster)+${total_inuse_MB})));
}
else {
	$tsm_psp_TB_year_1=int((((${total_inuse_MB}/100)*$stats_daily_change_rate)*($stats_tsm_versions-$tsm_full_adjuster))+($stats_client_side_rr_as_decimal*((((${total_inuse_MB}/100)*$stats_ss_full_cbt)*$stats_tsm_versions)+(${total_inuse_MB}*$tsm_full_adjuster)+${total_inuse_MB})));
	
}

## 2 Years

$new_storage_size=((${total_inuse_MB}/100)*$stats_annual_storage_growth)+${total_inuse_MB};
$tsm_psp_TB_year_2=int(((($new_storage_size/100)*$stats_daily_change_rate)*($stats_tsm_versions-$tsm_full_adjuster))+($stats_client_side_rr_as_decimal*(((($new_storage_size/100)*$stats_ss_full_cbt)*$stats_tsm_versions)+($new_storage_size*$tsm_full_adjuster)+$new_storage_size)));

## 3 Years

$new_storage_size=(($new_storage_size/100)*$stats_annual_storage_growth)+$new_storage_size;
$tsm_psp_TB_year_3=int(((($new_storage_size/100)*$stats_daily_change_rate)*($stats_tsm_versions-$tsm_full_adjuster))+($stats_client_side_rr_as_decimal*(((($new_storage_size/100)*$stats_ss_full_cbt)*$stats_tsm_versions)+($new_storage_size*$tsm_full_adjuster)+$new_storage_size)));

}


########################################################################################
########################################################################################


# Restore point is 7 days

# The minimum days on disk required is 2 x days between fulls


if ($stats_days_between_fulls != 0 ) {
	
	$diskpool_size_if_using_fulls=2*($stats_days_between_fulls*($workload_daily_inc_backup+$workload_full_backup_new_vms+$workload_full_backup_cbt_vms));
	## Don't need these now as 3 yrs growth already built into workloads	
	#$diskpool_size_if_using_fulls=$diskpool_size_if_using_fulls+(($diskpool_size_if_using_fulls/100)*$stats_annual_storage_growth);	
	#$diskpool_size_if_using_fulls=$diskpool_size_if_using_fulls+(($diskpool_size_if_using_fulls/100)*$stats_annual_storage_growth);
	$diskpool_size_if_using_fulls=int($diskpool_size_if_using_fulls+(($diskpool_size_if_using_fulls/100)*20));
	
}
else {
	$diskpool_size_if_using_fulls="Not Applicable";
}
##

$proxies_on_cl_spare=$proxies_from_clusters*2;

	open (OUTPUT_SUMMARY,">>${filename}_FINAL_SUMMARY.csv") or &been_an_error;
	printf OUTPUT_SUMMARY "\n\n";

	printf OUTPUT_SUMMARY ":-MODEL SETTINGS ARE:\n";

	printf OUTPUT_SUMMARY "Number of Versions for TSM (Assume Days),%d \n",$stats_tsm_versions;
	printf OUTPUT_SUMMARY "Days Between Fulls (0=inc forever) %,%d \n",$stats_days_between_fulls;
	printf OUTPUT_SUMMARY "Client Side Data Reduction Ratio From Dedupe or Compression ($is_deduplication_on),%.1f \n",${stats_client_side_reduction_ratio};
	printf OUTPUT_SUMMARY "Annual Storage Growth %,%.1f \n",$stats_annual_storage_growth;
	printf OUTPUT_SUMMARY "Annual VM Growth %,%.1f \n",$stats_annual_vm_growth;
	printf OUTPUT_SUMMARY "Daily Change Rate %,%.1f \n",$stats_daily_change_rate;
	printf OUTPUT_SUMMARY "Daily Backup Window Hours,%.1f \n",$stats_backup_window;
	printf OUTPUT_SUMMARY "Steady State Full Backup of New VMs (factor),%.2f \n",$stats_ss_full_backup_new_vms;
	printf OUTPUT_SUMMARY "Steady State CBT Backup (factor),%.2f \n",$stats_ss_full_cbt;
	printf OUTPUT_SUMMARY "Steady State Full Restore (factor),%.2f \n",$stats_ss_full_restore;
	printf OUTPUT_SUMMARY "Phase in Backup Window Hours,%.1f \n",$stats_phase_in_window;
	printf OUTPUT_SUMMARY "Phase-in Days,%.1f \n",$stats_phase_in_days;
	printf OUTPUT_SUMMARY "Percentage Critical VMs to Restore %,%.1f \n",$stats_critical_vms_restore;
	printf OUTPUT_SUMMARY "RTO for Critical VM's Hours,%.1f \n",$stats_critical_vms_RTO;
	printf OUTPUT_SUMMARY "vCPUs per Session (used if DEDUPE is OFF),%.1f \n",$stats_vcpus_per_session;
	printf OUTPUT_SUMMARY "vCPUs per GB/h on Backup (used if DEDUPE is ON),%.1f \n",$stats_vcpus_per_GBH_on_backup;
	printf OUTPUT_SUMMARY "vCPUs per GB/h on Restore (used if DEDUPE is ON),%.1f \n",$stats_vcpus_per_GBH_on_restore;
	printf OUTPUT_SUMMARY "vCPUs per Proxy,%.1f \n",$stats_vcpus_per_proxy;
	printf OUTPUT_SUMMARY "Max Throughput per Proxy Machine GB/Hour,%.2f \n",$stats_max_throughput_per_proxy;
	printf OUTPUT_SUMMARY "Max Throughput per Datamover Session GB/Hour ($is_deduplication_on),%.2f \n",$stats_max_throughput_per_inc_session;
	printf OUTPUT_SUMMARY "Max Throughput per Full Datamover Session GB/Hour ($is_deduplication_on),%.2f \n",$stats_max_throughput_per_full_session;
	printf OUTPUT_SUMMARY "VMMaxparallel setting,%d \n",$stats_VMMaxparallel;
	printf OUTPUT_SUMMARY ":-MODEL Output\n";
	printf OUTPUT_SUMMARY "(TODAY) Adjusted Source Disk(GB),%.2f \n",${total_inuse_MB};
	printf OUTPUT_SUMMARY "(3 YR) Daily Normal Backup (Including FULLS if implemented) Workload GB,%.2f \n",$workload_daily_inc_backup;
	printf OUTPUT_SUMMARY "(3 YR) Daily Normal Backup (Including FULLS if implemented) Throughput GB/Hour,%.2f \n",$workload_aggregate_throughput_inc_backup_window;
	printf OUTPUT_SUMMARY "(3 YR) Daily Full Backup of New VMs Workload GB,%.2f \n",$workload_full_backup_new_vms;
	printf OUTPUT_SUMMARY "(3 YR) Daily Full Backup of CBT VMs Workload GB,%.2f \n",$workload_full_backup_cbt_vms;
	printf OUTPUT_SUMMARY "(3 YR) Daily Full VM Steady State Restore Workload GB,%.2f \n",$workload_full_restore;
	printf OUTPUT_SUMMARY "(3 YR) Daily Full VM Steady State Restore Throughput GB/Hour,%.2f \n",$workload_total_full_throughput_restore;
	printf OUTPUT_SUMMARY "Phase-In Daily VM Backup Workload GB,%.2f \n",$workload_phase_in_daily;
	printf OUTPUT_SUMMARY "Phase-In Daily VM Backup Throughput GB/Hour,%.2f \n",$workload_phase_in_throughput;
	printf OUTPUT_SUMMARY "(3 YR) Critical VM Restore Workload GB,%.2f \n",$workload_critical_restore_amount;
	printf OUTPUT_SUMMARY "(3 YR) Critical VM Restore Thoughput GB/Hour,%.2f \n",$workload_critical_restore_throughput;
	printf OUTPUT_SUMMARY "(3 YR) Sessions for Incremental Backups Sess/Hour,%.2f \n",$workload_sessions_inc;
	printf OUTPUT_SUMMARY "(3 YR) Sessions for Full Backups Sess/Hour,%.2f \n",$workload_sessions_full;
	printf OUTPUT_SUMMARY "(3 YR) Sessions for Restores Sess/Hour,%.2f \n",$workload_sessions_restores;
	printf OUTPUT_SUMMARY "(3 YR) Sessions for Phase In Backups Sess/Hour,%.2f \n",$workload_sessions_phasein_initial_full;
	printf OUTPUT_SUMMARY "(3 YR) Sessions for Critical Restores Sess/Hour,%.2f \n",$workload_sessions_critical_restore;
	printf OUTPUT_SUMMARY "(3 YR) Total Concurrent Sessions Sess/Hour,%.2f \n",$workload_sessions_concurrent_total;
	## Restore time for biggest VM
	
	$count=0;
	$bvm_as=((scalar @sorted_vm_list)-1);
	my @sorted_vm_list = sort { $b <=> $a } @biggest_vm_list;
	$time_to_restore_biggest_vm=$biggest_size_of_biggest_vm/$restore_rate;
		print OUTPUT_SUMMARY "Name of Biggest VM,\"$biggest_vm\"\n";
		print OUTPUT_SUMMARY "Size of Biggest VM (May include RAW mappings though...)(GB),$biggest_size_of_biggest_vm\n";
		while (($count ne $number_of_top_vms_to_see) && ($count ne $bvm_as))  {
				$cct=$count+1;
				$ttr=((@sorted_vm_list[$count]/$restore_rate));
				printf OUTPUT_SUMMARY "Time to restore biggest VM #$cct (hours @ $restore_rate GB/Hour),%.2f \n",$ttr;
				$count=$count+1;
		}

	###########
    
        printf OUTPUT_SUMMARY "(3 YR) Number of TSM Servers required with 1Gb interface (Includes Phase-In),%.2f \n",$number_of_tsm_servers_required_1G;
        printf OUTPUT_SUMMARY "(3 YR) Number of TSM Servers required with 10Gb interface (Includes Phase-In),%.2f \n",$number_of_tsm_servers_required_10G;
        printf OUTPUT_SUMMARY "(3 YR) Number of TSM Servers required with 1Gb interface (Without Phase-In),%.2f \n",$no_phase_in_number_of_tsm_servers_required_1G;
        printf OUTPUT_SUMMARY "(3 YR) Number of TSM Servers required with 10Gb interface (Without Phase-In),%.2f \n",$no_phase_in_number_of_tsm_servers_required_10G;
	# printf OUTPUT_SUMMARY "############################,DOUBLE # Proxy machines below to include SPARES/FALLBACK!";
	printf OUTPUT_SUMMARY "(3 YR) Number of Proxy Machines Based on CPU ($is_deduplication_on / Includes Phase-In. With $stats_vcpus_per_proxy VCPU's),%.1f \n",$proxies_from_cpu;
	printf OUTPUT_SUMMARY "(3 YR) Number of Proxy Machines Based on Total Throughput ( $is_deduplication_on / Includes Phase-In \@1Gb),%.1f \n",$proxies_from_throughput;
	printf OUTPUT_SUMMARY "(3 YR) Number of Proxy Machines Based on Number of Clusters,%d \n",$proxies_from_clusters;		
	printf OUTPUT_SUMMARY "(3 YR) Number of Proxy Machines Based on Critical Restore Datamovers ($is_deduplication_on / Without Phase-In),%.1f \n",$proxies_required_because_of_restore_datamovers;
	printf OUTPUT_SUMMARY "(3 YR) Number of Proxy Machines Based on Steady State Backups ($is_deduplication_on / Without Phase-In),%.1f \n",$proxies_required_because_of_backup_datamovers;
	
	printf OUTPUT_SUMMARY "(3 YR) Number of Datamovers Required for Critical Restores ($is_deduplication_on / VMMaxparallel $stats_VMMaxparallel / Without Phase-In \@1Gb ),%.1f \n",$datamovers_required_for_restores;
	printf OUTPUT_SUMMARY "(3 YR) Number of Datamovers Required for Steady State Backups ($is_deduplication_on / VMMaxparallel $stats_VMMaxparallel / Without Phase-In \@1Gb),%.1f \n",$datamovers_required_for_backups;
	$number_of_datamovers_on_hosts=($unique_hs_size*2);
	printf OUTPUT_SUMMARY "Number of Datamovers based on 2 x #Hosts TODAY (for reference/scheduling only - caution here!),%.1f \n",$number_of_datamovers_on_hosts;
	printf OUTPUT_SUMMARY "PSP After Year 1 (not including RDMs with reduction ratio of ${stats_client_side_reduction_ratio}:1) GB,%.1f \n",$tsm_psp_TB_year_1;
	printf OUTPUT_SUMMARY "PSP After Year 2 (not including RDMs with reduction ratio of ${stats_client_side_reduction_ratio}:1) GB,%.1f \n",$tsm_psp_TB_year_2;
	printf OUTPUT_SUMMARY "PSP After Year 3 (not including RDMs with reduction ratio of ${stats_client_side_reduction_ratio}:1) GB,%.1f \n",$tsm_psp_TB_year_3;
	$half_min_disk=$diskpool_size_if_using_fulls/2;
	printf OUTPUT_SUMMARY "Min Disk Pool Size 3 Yrs if using Fulls and Tape (+20%) GB,%.1f \n",$half_min_disk;
	printf OUTPUT_SUMMARY "Disk to Ensure last $stats_days_between_fulls days anways comes from disk (+20%) GB,%.1f \n",$diskpool_size_if_using_fulls;







our $tsm_psp_TB_year_0=0;
our $tsm_psp_TB_year_1=0;
our $tsm_psp_TB_year_2=0;
our $tsm_psp_TB_year_3=0;
	
	
close (OUTPUT_SUMMARY);
}

###########################################################################
## Subroutine:
## Name: reset_variables
## Use: Reset the stats variables for RVTOOLS
###########################################################################

sub reset_variables {
our $total_number_of_vms=0;
our $total_switched_on=0;
our $total_switched_off=0;
our $total_suspended=0;
our $total_vm_cpu=0;
our $total_vm_memory=0;
our $total_vm_nics=0;
our $total_vm_disks=0;
our $total_provisioned_MB=0;
our ${total_inuse_MB}=0;
our $total_unshared_MB=0;
our @unique_datacenters;
our @unique_clusters;
our @unique_hosts;
our $total_vm_version_at_7=0;
our $total_vm_version_gt_7=0;
our $total_vm_version_le_7=0;
our $unique_dc_size=0;
our $unique_cl_size=0;
our $unique_hs_size=0;
our $tools_not_installed=0;
our $tools_not_running=0;
our $tools_ok=0;
our $tools_old=0;
our $tools_unknown=0;
our $total_number_datastores=0;
our $total_capacity_datastores=0;
our $datastore_free_mb=0;
our $datastore_free_pct=0;
our $datastore_100GB_free=0;
our $datastore_10PCT_free=0;
our $datastore_capacity=0;
our $datastore_provisioned=0;
our $datastore_in_use=0;
our $datastore_total_capacity=0;
our ${datastore_total_in_use}=0;
our $datastore_total_provisioned=0;
our $datastore_disk_free_space=0;
our $disk_raw_mappings=0;
our $disk_total_capacity_raw_mappings=0;
our $disk_normal_mappings=0;
our $param_yearly_growth=0;
our $average_storage_per_vm=0;
our ${snapshot_total_storage_MB}=0;
our $biggest_size_of_biggest_vm=0;
our $biggest_vm="UNKNOWN";
our $client_side_deduplication_yes="0";
}

###########################################################################
## Subroutine:
## Name: rv_get_variables
## Use: Set the model parameters for RVTOOLS
###########################################################################

sub rv_get_variables {
&draw_heading;

print "\nEnter Number of Days (Less than 730 please!) to keep in TSM ($stats_tsm_versions) > ";
$answer = <STDIN>;
chomp $answer;
if ($answer ne "") { $stats_tsm_versions=$answer }

print "Enter Number of Days Between Fulls (0 for Incremental Forever) ($stats_days_between_fulls) > ";
$answer = <STDIN>;
chomp $answer;
if ($answer ne "") { $stats_days_between_fulls=$answer }

print "Enter Client Side Data Reduction Ratio From Dedupe or Comp (X:1) ($stats_client_side_reduction_ratio) > ";
$answer = <STDIN>;
chomp $answer;
if ($answer ne "") { $stats_client_side_reduction_ratio=$answer }

print "Client Side Deduplication (0=yes 1=server current=$client_side_deduplication_yes) > ";
$answer = <STDIN>;
chomp $answer;
if ($answer ne "") { $client_side_deduplication_yes=$answer }


print "Enter Annual Storage Growth ($stats_annual_storage_growth %) > ";
$answer = <STDIN>;
chomp $answer;
if ($answer ne "") { $stats_annual_storage_growth=$answer }


print "Enter Annual VM Growth ($stats_annual_vm_growth %) > ";
$answer = <STDIN>;
chomp $answer;
if ($answer ne "") { $stats_annual_vm_growth=$answer }


print "Enter Daily Change Rate ($stats_daily_change_rate %) > ";
$answer = <STDIN>;
chomp $answer;
if ($answer ne "") { $stats_daily_change_rate=$answer }

print "Enter Daily Backup Window ($stats_backup_window HOURS) > ";
$answer = <STDIN>;
chomp $answer;
if ($answer ne "") { $stats_backup_window=$answer }

print "Enter Steady State Daily VM Full Backup Factor ($stats_ss_full_backup_new_vms) > ";
$answer = <STDIN>;
chomp $answer;
if ($answer ne "") { $stats_ss_full_backup_new_vms=$answer }

print "Enter Steady State Daily VM Full Backup from CBT Factor ($stats_ss_full_cbt) > ";
$answer = <STDIN>;
chomp $answer;
if ($answer ne "") { $stats_ss_full_cbt=$answer }

print "Enter Steady State Daily VM Full Restore Factor ($stats_ss_full_restore) > ";
$answer = <STDIN>;
chomp $answer;
if ($answer ne "") { $stats_ss_full_restore=$answer }

print "Enter Phase In Backup Window ($stats_phase_in_window hours) > ";
$answer = <STDIN>;
chomp $answer;
if ($answer ne "") { $stats_phase_in_window=$answer }

print "Enter Phase In Days ($stats_phase_in_days days) > ";
$answer = <STDIN>;
chomp $answer;
if ($answer ne "") { $stats_phase_in_days=$answer }

print "Enter Percentage of Critical VM's to be Restored Immediately ($stats_critical_vms_restore %) > ";
$answer = <STDIN>;
chomp $answer;
if ($answer ne "") {  $stats_critical_vms_restore=$answer }

print "Enter RTO of Critical VM's to be Restored Immediately ($stats_critical_vms_RTO Hours) > ";
$answer = <STDIN>;
chomp $answer;
if ($answer ne "") {  $stats_critical_vms_RTO=$answer }

print "Enter vCPUs per session ($stats_vcpus_per_session CPUs) > ";
$answer = <STDIN>;
chomp $answer;
if ($answer ne "") {  $stats_vcpus_per_session=$answer }


print "Enter vCPUs per Proxy Host ($stats_vcpus_per_proxy CPUs) > ";
$answer = <STDIN>;
chomp $answer;
if ($answer ne "") {  $stats_vcpus_per_proxy=$answer }

print "Enter Throughput per Proxy Host ($stats_max_throughput_per_proxy GB/Hour) > ";
$answer = <STDIN>;
chomp $answer;
if ($answer ne "") {  $stats_max_throughput_per_proxy=$answer }

print "Enter VMMaxparallel Value ($stats_VMMaxparallel) > ";
$answer = <STDIN>;
chomp $answer;
if ($answer ne "") {  $stats_VMMaxparallel=$answer }


if ($stats_client_side_reduction_ratio == 1)
{
	$stats_max_throughput_per_inc_session=20;
	$stats_max_throughput_per_full_session=40;
	$restore_rate=40;
	$is_deduplication_on="DEDUPE IS OFF";
}
else {
	$stats_max_throughput_per_inc_session=10;
	$stats_max_throughput_per_full_session=20;
	$restore_rate=20;
	$is_deduplication_on="DEDUPE IS ON";	
}
##
## Take these stats out - we don't want anyone to change them
##	
# print "Enter Throughput per Incremental Backup Session ($stats_max_throughput_per_inc_session GB/Hour) > ";
# $answer = <STDIN>;
# chomp $answer;
# if ($answer ne "") {  $stats_max_throughput_per_inc_session=$answer }

# print "Enter Throughput per Full Backup/Restore Session ($stats_max_throughput_per_full_session GB/Hour) > ";
# $answer = <STDIN>;
# chomp $answer;
# if ($answer ne "") {  $stats_max_throughput_per_full_session=$answer }

print "How many 'TOP' VM restore sessions do you want to see? ($number_of_top_vms_to_see) > ";
$answer = <STDIN>;
chomp $answer;
if ($answer ne "") {  $number_of_top_vms_to_see=$answer }



&draw_heading;
print "Your settings are:\n\n";
print "TSM Versions=$stats_tsm_versions\n";
print "Days Between Fulls (0=inc forever)=$stats_days_between_fulls\n";
print "Client Side Data Reduction Ratio=${stats_client_side_reduction_ratio}:1\n";
print "Annual Storage Growth=$stats_annual_storage_growth %\n";
print "Annual VM Growth=$stats_annual_vm_growth %\n";
print "Daily Change Rate=$stats_daily_change_rate %\n";
print "Daily Backup Window=$stats_backup_window Hours\n";
print "Steady State Full Backup=$stats_ss_full_backup_new_vms (factor)\n";
print "Steady State CBT Backup=$stats_ss_full_cbt (factor)\n";
print "Steady State Full Restore=$stats_ss_full_restore (factor)\n";
print "Phase in Backup Window=$stats_phase_in_window Hours\n";
print "Phase in Days=$stats_phase_in_days Days\n";
print "Percentage Critical VMs to Restore=$stats_critical_vms_restore %\n";
print "RTO for Critical VM's=$stats_critical_vms_RTO Hours\n";
print "vCPUs per 'Session'=$stats_vcpus_per_session CPUs\n";
print "vCPUs per Proxy=$stats_vcpus_per_proxy CPUs\n";
print "Max Throughput per Proxy=$stats_max_throughput_per_proxy GB/Hour\n";
print "Max Throughput per Incremental 'Session' (Fixed - $is_deduplication_on)=$stats_max_throughput_per_inc_session GB/Hour\n";
print "Max Throughput per Full 'Session' (Fixed - $is_deduplication_on)=$stats_max_throughput_per_full_session GB/Hour\n";
print "VMMaxparallel setting=$stats_VMMaxparallel\n";
print "\n\nRun again if these are not correct!\n";
system ("pause");

}

###########################################################################
## Subroutine:
## Name: print_notes
## Use: Prints any initial notes when the program is run without -c flag
###########################################################################

sub print_notes {
	  

	print "\nPLEASE READ!!:\n";
	print "==============\n\n";
	print "Please ensure you are familiar with the terms of use before continuing.\n\n";
	print "StorageTools is standalone. It does not require the TSM BA Client\n";
	print "or Putty installed. The DSCLI and XIV command line packages will be required\n";
	print "for those units.\n\n";
	print "Use menu option 'o' to access the output files created.\n";
	print "The output directory is temporary, will change with each release\n";
	print "and is unique to each user.\n\n";
	print "** THIS PROGRAM IS CAPABLE OF MAKING SIGNIFICANT CHANGES TO LIVE ENVIRONMENTS **\n\n";
	system ("pause");
}


###########################################################################
## Subroutine:
## Name: authentication
## Use: Authentication routine
###########################################################################

sub authentication {

use Crypt::Lite;

my $key = "Frag1l3";
$crypt = Crypt::Lite->new( debug => 0 );
 
my @chars = ("A".."Z", "a".."z");
my $string;
$string .= $chars[rand @chars] for 1..10;
chomp $string;

print "Installed Version ${software_version} $released\n";
	print "\nPassword  >";
	ReadMode('noecho'); # don't echo
	my $letmein = <STDIN>;
	ReadMode(0);        # back to normal

my $password = $letmein;
$encrypted = $crypt->encrypt($string, $key);

chomp $letmein;
	 if ("$letmein" ne ""){
	 	
		print "\nPUBLIC PASSWORD REQUIRED: \n\nSend the following challenge code to mark.hockings\@tectrade.com:\n\n${encrypted}\n\nThis code should be the first line and the subject should be 'tsmtools'.\n\nIMPORTANT!!\n===========\n\nKEEP THIS WINDOW OPEN UNTIL YOU RECEIVE THE PUBLIC PASSWORD!\n";
                system ("pause");
                print "Enter the code recieved from Tectrade >";
                my $rec_code = <STDIN>;
                chomp $rec_code;
                               
                        if ($rec_code eq $string) {
                        print "\nValid Password! - this program will continue!!\n";
                        system ("pause");
                        }
                        else {
			print "Invalid Password - this program will exit!!\n";
			system ("pause");
			exit
			}
				
}
			
}

###########################################################################
## Subroutine:
## Name: TB_adjuster
## Use: Some issues have been observed using GB in the query with large instances
###########################################################################

sub TB_adjuster {
	
my $prompt = new Term::Menu (
	beforetext => "OPTIONS:\n",
	aftertext => "\nUnits for Occupancy => ",
	);
	our $answer = $prompt->menu(
        gigabytes  =>      		["Report in GB", 'g'],
        terabytes  =>      		["Report in TB", 't'],
        
        
            
  );         

if($answer eq "gigabytes"){ 
	
	our $TB_DIV=1;
	our $TB_TITLE="GB";
}
if($answer eq "terabytes"){ 
	our $TB_DIV=1024;
	our $TB_TITLE="TB";
}
}


###########################################################################
## Subroutine:
## Name: storage_credentials
## Use: set storage system credentials
###########################################################################

sub storage_credentials {
		use Win32::Console::ANSI;
		use Term::ANSIColor;
		#print color 'bold magenta';
		&draw_heading;
		print color 'bold green';
		print "\nplease enter storage user: ";
		print color 'reset';
		$v7000_user = <STDIN>;
		print color 'bold green';
		print "please enter the user password: ";
		print color 'reset';
		$v7000_pw = <STDIN>;
		print color 'bold green';
		print "Please enter storage cluster address: ";
		print color 'reset';		
		$v7000_address = <STDIN>;
		print color 'bold green';
		print "Please enter key location (V7000/SVC only <ENTER> for none:) ";
		print color 'reset';		
		$v7000_sshkey = <STDIN>;		
			
		chomp $v7000_user; 	# get rid of carriage returns
		chomp $v7000_pw; 	# get rid of carriage returns
		chomp $v7000_address;	# get rid of carriage returns
		chomp $v7000_sshkey;
		if ($v7000_sshkey ne "") {
			$v7000_keylocation="-i $v7000_sshkey";
			print "\nKey Location is $v7000_sshkey\n";
			print "plink flag is ${v7000_keylocation}\n";
			system ("pause");
		}
		else {
		$v7000_keylocation="";
		print "\nYou have chosen not to use an SSH key!\n";
		system ("pause");
	}
			
		
}

###########################################################################
## Subroutine:
## Name: storage_credentials
## Use: set storage system credentials
###########################################################################

sub brocade_credentials {
		use Win32::Console::ANSI;
		use Term::ANSIColor;
		#print color 'bold magenta';
		&draw_heading;
		print color 'bold green';
		print "\nplease enter switch user: ";
		print color 'reset';
		$brocade_user = <STDIN>;
		print color 'bold green';
		print "please enter the user password: ";
		print color 'reset';
		$brocade_pw = <STDIN>;
		print color 'bold green';
		print "Please enter switch address: ";
		print color 'reset';		
		$brocade_address = <STDIN>;
			
			
		chomp $brocade_user; 	# get rid of carriage returns$
		chomp $brocade_pw; 	# get rid of carriage returns
		chomp $brocade_address;	# get rid of carriage returns
		
		
		
	
			
		
}

###########################################################################
## Subroutine:
## Name: storage_credentials
## Use: set storage system credentials
###########################################################################

sub unix_credentials {
	
		use Win32::Console::ANSI;
		use Term::ANSIColor;
		#print color 'bold magenta';
		&draw_heading;
		print color 'bold green';
		print "\nplease enter unix user: ";
		print color 'reset';
		$unix_user = <STDIN>;
		print color 'bold green';
		ReadMode('noecho'); # don't echo
		$tsm_password = <STDIN>;
		ReadMode(0);        # back to normal
		print color 'reset';
		$unix_pw = <STDIN>;
		print color 'bold green';
		print "Please enter host address: ";
		print color 'reset';		
		$unix_address = <STDIN>;
			
			
		chomp $unix_user; 	# get rid of carriage returns$
		chomp $unix_pw; 	# get rid of carriage returns
		chomp $unix_address;	# get rid of carriage returns
		
		
		
	
			
		
}

###########################################################################
## Subroutine:
## Name: print_notes_storage
## Use: Print storage notes
###########################################################################

sub print_notes_storage {
	  

	print "\nPLEASE READ!!:\n";
	print "==============\n";
	print "You will need to know the user name, the storage unit address and\n";
	print "the location of the private key (for V7000 and SVC if implemented).\n";
	print "The DSCLI and the XIV command line will be required for those units\n";
	system ("pause");
}

###########################################################################
## Subroutine:
## Name: brocade_nameserver
## Use: Print storage notes
###########################################################################

sub brocade_nameserver {
	chdir ${host_directory};
	unlink ("${host_directory}/${brocade_address}_BRCD_nameserver.txt");

print "Running Fabric Name Server Query. Please Wait....\n";
system ("${inc_directory}plink.exe -l ${brocade_user} -pw \"${brocade_pw}\" ${brocade_address} nsshow >> ${host_directory}/${brocade_address}_BRCD_nameserver.rtf");
print "Printing....";
system ("start ${host_directory}/${brocade_address}_BRCD_nameserver.rtf");
system ("pause");

}

###########################################################################
## Subroutine:
## Name: brocade_stats
## Use: Print storage notes
###########################################################################


sub brocade_monitoring {

my $analyseanswer = new Term::Menu (
	beforetext => "Brocade Analysis MENU Options\n",
	aftertext => "\nChoose Analysis Option then press <enter> => ",
	);
	my $analyseanswer = $analyseanswer->menu(
        
        CURRENT  =>      	["ANALYSE CURRENT SWITCH", 'c'],
        BATCH  =>      		["BATCH ANALYSIS", 'b'], 
        
            
  );

if ($analyseanswer eq "BATCH") {
if (! -e "${host_directory}/SWITCH_FILE.txt"){
open (SWITCH_FILE, ">${host_directory}/SWITCH_FILE.txt")  or &been_an_error;
print SWITCH_FILE "switch1_user,password1,ip_address1\n";
print SWITCH_FILE "switch2_user,password2,ip_address2\n";
print SWITCH_FILE "switch3_user,password3,ip_address3\n";
close (SWITCH_FILE);
print "Edit the connection file and save it (please close too!!)....\n";
system ("${host_directory}\SWITCH_FILE.txt");
system ("pause");
}
}

if ($analyseanswer eq "CURRENT") {
	
open (SWITCH_FILE, ">${host_directory}/SWITCH_FILE.txt")  or &been_an_error;
print SWITCH_FILE "${brocade_user},${brocade_pw},${brocade_address}\n";
close (SWITCH_FILE);

}
chdir ${host_directory};

open (SWITCH_FILE, "<${host_directory}/SWITCH_FILE.txt")  or &been_an_error;
@switches=<SWITCH_FILE>;
close(SWITCH_FILE);
####
## Main Switch Loop
####
unlink ("${host_directory}/BROCADE_BASE_STATS.csv");
unlink ("${host_directory}/BROCADE_SUMMARY_STATS.txt");
open (SUMMARY_STATS, ">${host_directory}/BROCADE_SUMMARY_STATS.txt") or &been_an_error;

foreach $switchlogins (@switches) {
chomp $switchlogins;
($brocade_user,$brocade_pw,$brocade_address) = (split /,/,$switchlogins)[0,1,2];
chomp $brocade_user;
chomp $brocade_pw;
chomp $brocade_address;

print "Analysing the switch $brocade_address:\n\n";

### BROCADE STATS BASELINE 



##### BROCADE STATS RESET


for (my $count=0; $count <= 5; $count++) {
unlink ("${host_directory}/BROCADE_BASE_STATS.csv");
print "Resetting the port statistics for $brocade_address..please wait...\n";
system ("${inc_directory}plink.exe -l ${brocade_user} -pw \"${brocade_pw}\" ${brocade_address} statsclear");


##### WAIT FOR 15 SECONDS
print "Sleeping for 5 seconds.....\n";
sleep 5;
print "Querying port statistics from the last 5 seconds for $brocade_address..please wait...\n";
system ("${inc_directory}plink.exe -l ${brocade_user} -pw \"${brocade_pw}\" ${brocade_address} porterrshow >> ${host_directory}/BROCADE_BASE_STATS.csv");
system ("CLS");
print "The following ports on $brocade_address are showing traffic:\n\n";
open (FINAL_OUTPUT, "<${host_directory}/BROCADE_BASE_STATS.csv")  or &been_an_error;
my @lines = <FINAL_OUTPUT>;
close(FINAL_OUTPUT);

my @newlines;
foreach (@lines) {
		
	$_=~s/ {1,}/,/g;
	$_=~s/^,//g;
	
			
   push(@newlines,$_) if ($_ !~ /frames/ && $_ !~ /g_eof/ && $_ !~ /===/);
}	

open(FINAL_OUTPUT, ">${host_directory}/BROCADE_BASE_STATS.csv")  or &been_an_error;
print FINAL_OUTPUT @newlines;
close(FINAL_OUTPUT);

open(FINAL_OUTPUT, "<${host_directory}/BROCADE_BASE_STATS.csv")  or &been_an_error;
my @lines = <FINAL_OUTPUT>;
close(FINAL_OUTPUT);
foreach $element (@lines) {
chomp $element;

##### SET THE ERROR SWITCH
$thereareerrors="0";

($i_berr_port,$i_berr_ftx,$i_berr_frx,$i_berr_encin,$i_berr_crcerr,$i_berr_crcgeof,$i_berr_tooshort,$i_berr_toolong,$i_berr_badeof,$i_berr_encout,$i_berr_discc3,$i_berr_linkfail,$i_berr_losssync,$i_berr_losssig,$i_berr_frjt,$i_berr_fbsy,$i_berr_c3timetx, $i_berr_c3timerx,$i_berr_pcserr) = (split /,/,$element)[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18];

chomp $i_berr_port;
chomp $i_berr_ftx;
chomp $i_berr_frx;
chomp $i_berr_encin;
chomp $i_berr_crcerr;
chomp $i_berr_crcgeof;
chomp $i_berr_tooshort;
chomp $i_berr_toolong;
chomp $i_berr_badeof;
chomp $i_berr_encout;
chomp $i_berr_discc3;
chomp $i_berr_linkfail;
chomp $i_berr_losssync;
chomp $i_berr_losssig;
chomp $i_berr_frjt;
chomp $i_berr_fbsy;
chomp $i_berr_c3timetx;
chomp $i_berr_c3timerx;
chomp $i_berr_pcserr;

if ($i_berr_ftx =~ s/k//g) {$i_berr_ftx=$i_berr_ftx*1000};
if ($i_berr_ftx =~ s/m//g) {$i_berr_ftx=$i_berr_ftx*1000000};
if ($i_berr_ftx =~ s/g//g) {$i_berr_ftx=$i_berr_ftx*1000000000};

if ($i_berr_frx =~ s/k//g) {$i_berr_frx=$i_berr_frx*1000};
if ($i_berr_frx =~ s/m//g) {$i_berr_frx=$i_berr_frx*1000000};
if ($i_berr_frx =~ s/g//g) {$i_berr_frx=$i_berr_frx*1000000000};

if ($i_berr_encin =~ s/k//g) {$i_berr_encin=$i_berr_encin*1000};
if ($i_berr_encin =~ s/m//g) {$i_berr_encin=$i_berr_encin*1000000};
if ($i_berr_encin =~ s/g//g) {$i_berr_encin=$i_berr_encin*1000000000};

if ($i_berr_crcerr =~ s/k//g) {$i_berr_crcerr=$i_berr_crcerr*1000};
if ($i_berr_crcerr =~ s/m//g) {$i_berr_crcerr=$i_berr_crcerr*1000000};
if ($i_berr_crcerr =~ s/g//g) {$i_berr_crcerr=$i_berr_crcerr*1000000000};

if ($i_berr_crcgeof =~ s/k//g) {$i_berr_crcgeof=$i_berr_crcgeof*1000};
if ($i_berr_crcgeof =~ s/m//g) {$i_berr_crcgeof=$i_berr_crcgeof*1000000};
if ($i_berr_crcgeof =~ s/g//g) {$i_berr_crcgeof=$i_berr_crcgeof*1000000000};

if ($i_berr_tooshort =~ s/k//g) {$i_berr_tooshort=$i_berr_tooshort*1000};
if ($i_berr_tooshort =~ s/m//g) {$i_berr_tooshort=$i_berr_tooshort*1000000};
if ($i_berr_tooshort =~ s/g//g) {$i_berr_tooshort=$i_berr_tooshort*1000000000};

if ($i_berr_toolong =~ s/k//g) {$i_berr_toolong=$i_berr_toolong*1000};
if ($i_berr_toolong =~ s/m//g) {$i_berr_toolong=$i_berr_toolong*1000000};
if ($i_berr_toolong =~ s/g//g) {$i_berr_toolong=$i_berr_toolong*1000000000};

if ($i_berr_badeof =~ s/k//g) {$i_berr_badeof=$i_berr_badeof*1000};
if ($i_berr_badeof =~ s/m//g) {$i_berr_badeof=$i_berr_badeof*1000000};
if ($i_berr_badeof =~ s/g//g) {$i_berr_badeof=$i_berr_badeof*1000000000};

if ($i_berr_encout =~ s/k//g) {$i_berr_encout=$i_berr_encout*1000};
if ($i_berr_encout =~ s/m//g) {$i_berr_encout=$i_berr_encout*1000000};
if ($i_berr_encout =~ s/g//g) {$i_berr_encout=$i_berr_encout*1000000000};

if ($i_berr_discc3 =~ s/k//g) {$i_berr_discc3=$i_berr_discc3*1000};
if ($i_berr_discc3 =~ s/m//g) {$i_berr_discc3=$i_berr_discc3*1000000};
if ($i_berr_discc3 =~ s/g//g) {$i_berr_discc3=$i_berr_discc3*1000000000};

if ($i_berr_linkfail =~ s/k//g) {$i_berr_linkfail=$i_berr_linkfail*1000};
if ($i_berr_linkfail =~ s/m//g) {$i_berr_linkfail=$i_berr_linkfail*1000000};
if ($i_berr_linkfail =~ s/g//g) {$i_berr_linkfail=$i_berr_linkfail*1000000000};

if ($i_berr_losssync =~ s/k//g) {$i_berr_losssync=$i_berr_losssync*1000};
if ($i_berr_losssync =~ s/m//g) {$i_berr_losssync=$i_berr_losssync*1000000};
if ($i_berr_losssync =~ s/g//g) {$i_berr_losssync=$i_berr_losssync*1000000000};

if ($i_berr_losssig =~ s/k//g) {$i_berr_losssig=$i_berr_losssig*1000};
if ($i_berr_losssig =~ s/m//g) {$i_berr_losssig=$i_berr_losssig*1000000};
if ($i_berr_losssig =~ s/g//g) {$i_berr_losssig=$i_berr_losssig*1000000000};

if ($i_berr_frjt =~ s/k//g) {$i_berr_frjt=$i_berr_frjt*1000};
if ($i_berr_frjt =~ s/m//g) {$i_berr_frjt=$i_berr_frjt*1000000};
if ($i_berr_frjt =~ s/g//g) {$i_berr_frjt=$i_berr_frjt*1000000000};

if ($i_berr_fbsy =~ s/k//g) {$i_berr_fbsy=$i_berr_fbsy*1000};
if ($i_berr_fbsy =~ s/m//g) {$i_berr_fbsy=$i_berr_fbsy*1000000};
if ($i_berr_fbsy =~ s/g//g) {$i_berr_fbsy=$i_berr_fbsy*1000000000};

if ($i_berr_fbsy =~ s/k//g) {$i_berr_fbsy=$i_berr_fbsy*1000};
if ($i_berr_fbsy =~ s/m//g) {$i_berr_fbsy=$i_berr_fbsy*1000000};
if ($i_berr_fbsy =~ s/g//g) {$i_berr_fbsy=$i_berr_fbsy*1000000000};

if ($i_berr_c3timetx =~ s/k//g) {$i_berr_c3timetx=$i_berr_c3timetx*1000};
if ($i_berr_c3timetx =~ s/m//g) {$i_berr_c3timetx=$i_berr_c3timetx*1000000};
if ($i_berr_c3timetx =~ s/g//g) {$i_berr_c3timetx=$i_berr_c3timetx*1000000000};

if ($i_berr_c3timerx =~ s/k//g) {$i_berr_c3timerx=$i_berr_c3timerx*1000};
if ($i_berr_c3timerx =~ s/m//g) {$i_berr_c3timerx=$i_berr_c3timerx*1000000};
if ($i_berr_c3timerx =~ s/g//g) {$i_berr_c3timerx=$i_berr_c3timerx*1000000000};

if ($i_berr_pcserr =~ s/k//g) {$i_berr_pcserr=$i_berr_pcserr*1000};
if ($i_berr_pcserr =~ s/m//g) {$i_berr_pcserr=$i_berr_pcserr*1000000};
if ($i_berr_pcserr =~ s/g//g) {$i_berr_pcserr=$i_berr_pcserr*1000000000};




#if (($i_berr_ftx ne "0")&&($i_berr_ftx ne "")) { $thereareerrors="1"};
#if (($i_berr_frx ne "0")&&($i_berr_frx ne "")) { $thereareerrors="1" };
if (($i_berr_encin ne "0")&&($i_berr_encin ne "")) { $thereareerrors="1" };
if (($i_berr_crcerr ne "0")&&($i_berr_crcerr ne "")) { $thereareerrors="1" };
if (($i_berr_tooshort ne "0")&&($i_berr_tooshort ne "")) { $thereareerrors="1" };
if (($i_berr_toolong ne "0")&&($i_berr_toolong ne "")) { $thereareerrors="1" };
if (($i_berr_badeof ne "0")&&($i_berr_badeof ne "")) { $thereareerrors="1" };
if (($i_berr_encout ne "0")&&($i_berr_encout ne "")) { $thereareerrors="1" };
if (($i_berr_discc3 ne "0")&&($i_berr_discc3 ne "")){ $thereareerrors="1" };
if (($i_berr_linkfail ne "0")&&($i_berr_linkfail ne "")) { $thereareerrors="1" };
if (($i_berr_losssync ne "0")&&($i_berr_losssync ne "")) { $thereareerrors="1" };
if (($i_berr_losssig ne "0")&&($i_berr_losssig ne "")) { $thereareerrors="1" };
if (($i_berr_frjt ne "0")&&($i_berr_frjt ne "")) { $thereareerrors="1" };
if (($i_berr_fbsy ne "0")&&($i_berr_fbsy ne "")) { $thereareerrors="1" };
if (($i_berr_c3timetx ne "0")&&($i_berr_c3timetx ne "")) { $thereareerrors="1" };
if (($i_berr_c3timerx ne "0")&&($i_berr_c3timerx ne "")) { $thereareerrors="1" };
if (($i_berr_pcserr ne "0")&&($i_berr_pcserr ne "")) { $thereareerrors="1" };



if ($thereareerrors eq "1") {
print "\n** Port $i_berr_port on $brocade_address is accumulating errors (in last 5-15 seconds):\n";
print "== PORT:\t$i_berr_port\n";
print "REF FRAMES TX:\t$i_berr_ftx\n";
print "REF FRAMES RX:\t$i_berr_frx\n";
print "ENC in:\t\t$i_berr_encin\n";
print "CRC err:\t$i_berr_crcerr\n";
print "CRC g_eof:\t$i_berr_crcgeof\n";
print "TOO short:\t$i_berr_tooshort\n";
print "TOO long:\t$i_berr_toolong\n";
print "BAD eof:\t$i_berr_badeof\n";
print "ENC out:\t$i_berr_encout\n";
print "DISC C3:\t$i_berr_discc3\n";
print "LINK fail:\t$i_berr_linkfail\n";
print "LOSS sync:\t$i_berr_losssync\n";
print "LOSS signal:\t$i_berr_losssig\n";
print "FRJT:\t\t$i_berr_frjt\n";
print "FBSY:\t\t$i_berr_fbsy\n";
print "C3TIME TX:\t$i_berr_c3timetx\n";
print "C3TIME RX:\t$i_berr_c3timerx\n";
print "PCS err:\t$i_berr_pcserr\n\n";

print SUMMARY_STATS "\n** The following port on $brocade_address is accumulating errors (in last 5-15 seconds):\n";
print SUMMARY_STATS "Switch:\t\t$brocade_address\n";
print SUMMARY_STATS "PASS #:\t\t$count\n";
print SUMMARY_STATS "== PORT:\t$i_berr_port\n";
print SUMMARY_STATS "REF FRAMES TX:\t$i_berr_ftx\n";
print SUMMARY_STATS "REF FRAMES RX:\t$i_berr_frx\n";
print SUMMARY_STATS "ENC in:\t\t$i_berr_encin\n";
print SUMMARY_STATS "CRC err:\t$i_berr_crcerr\n";
print SUMMARY_STATS "CRC g_eof:\t$i_berr_crcgeof\n";
print SUMMARY_STATS "TOO short:\t$i_berr_tooshort\n";
print SUMMARY_STATS "TOO long:\t$i_berr_toolong\n";
print SUMMARY_STATS "BAD eof:\t$i_berr_badeof\n";
print SUMMARY_STATS "ENC out:\t$i_berr_encout\n";
print SUMMARY_STATS "DISC C3:\t$i_berr_discc3\n";
print SUMMARY_STATS "LINK fail:\t$i_berr_linkfail\n";
print SUMMARY_STATS "LOSS sync:\t$i_berr_losssync\n";
print SUMMARY_STATS "LOSS signal:\t$i_berr_losssig\n";
print SUMMARY_STATS "FRJT:\t\t$i_berr_frjt\n";
print SUMMARY_STATS "FBSY:\t\t$i_berr_fbsy\n";
print SUMMARY_STATS "C3TIME TX:\t$i_berr_c3timetx\n";
print SUMMARY_STATS "C3TIME RX:\t$i_berr_c3timerx\n";
print SUMMARY_STATS "PCS err:\t$i_berr_pcserr\n\n";
}

if ($thereareerrors eq "0") {

print "\nNo accumulating errors on port $i_berr_port on $brocade_address.\n";
print SUMMARY_STATS "\nNo accumulating errors on port $i_berr_port on $brocade_address.\n";
}
}
close (STATS_OUTPUT);
## For loop
}
## Main Loop
}
close (SUMMARY_STATS);
system ("start ${host_directory}/BROCADE_SUMMARY_STATS.txt");
system ("pause");
}


###########################################################################
## Subroutine:
## Name: brocade_documentation
## Use: Print storage notes
###########################################################################

sub brocade_documentation {
	chdir ${host_directory};
	unlink ("${host_directory}/${brocade_address}_$health_or_doc.csv");

### Version
unlink ("${host_directory}/brocade_temp.csv");
system ("echo Version Details;- >> ${host_directory}/brocade_temp.csv");
system ("${inc_directory}plink.exe -l ${brocade_user} -pw \"${brocade_pw}\" ${brocade_address} version >> ${host_directory}/brocade_temp.csv");
open(CSV_INPUT, "${host_directory}/brocade_temp.csv")  or &been_an_error;
my @lines = <CSV_INPUT>;
close(CSV_INPUT);
my @newlines;
foreach (@lines) {
	
	
	$_=~s/Kernel:/Kernel;-\n/g;
	$_=~s/Fabric OS:/Fabric OS;-\n/g;
	$_=~s/Made on:/Made on;-\n/g;
	$_=~s/Flash:/Flash;-\n/g;
	$_=~s/BootProm:/BootProm;-\n/g;
	
		
   push(@newlines,$_);
}	
open(FINAL_OUTPUT, ">>${host_directory}/${brocade_address}_$health_or_doc.csv")  or &been_an_error;
print FINAL_OUTPUT @newlines;
close(FINAL_OUTPUT);

### Version
unlink ("${host_directory}/brocade_temp.csv");
system ("echo IP Details;- >> ${host_directory}/brocade_temp.csv");
system ("${inc_directory}plink.exe -l ${brocade_user} -pw \"${brocade_pw}\" ${brocade_address} ipaddrshow >> ${host_directory}/brocade_temp.csv");
open(CSV_INPUT, "${host_directory}/brocade_temp.csv")  or &been_an_error;
my @lines = <CSV_INPUT>;
close(CSV_INPUT);
my @newlines;
foreach (@lines) {
	
	
	$_=~s/Ethernet IP Address:/Ethernet IP Address;-\n/g;
	$_=~s/Ethernet Subnetmask:/Ethernet Subnetmask;-\n/g;
	$_=~s/Gateway IP Address:/Gateway IP Address;-\n/g;
	$_=~s/DHCP:/DHCP;-\n/g;
	
	
		
   push(@newlines,$_);
}	
open(FINAL_OUTPUT, ">>${host_directory}/${brocade_address}_$health_or_doc.csv")  or &been_an_error;
print FINAL_OUTPUT @newlines;
close(FINAL_OUTPUT);
	
### Chassis
unlink ("${host_directory}/brocade_temp.csv");
system ("echo Chassis Details;- >> ${host_directory}/brocade_temp.csv");
system ("${inc_directory}plink.exe -l ${brocade_user} -pw \"${brocade_pw}\" ${brocade_address} chassisshow >> ${host_directory}/brocade_temp.csv");
open(CSV_INPUT, "${host_directory}/brocade_temp.csv")  or &been_an_error;
my @lines = <CSV_INPUT>;
close(CSV_INPUT);
my @newlines;
foreach (@lines) {
	
	
	$_=~s/CHASSIS\/WWN  Unit:/CHASSIS\/WWN  Unit;-\n/g;
	$_=~s/Header Version:/Header Version;-\n/g;
	$_=~s/Factory Part Num:/Factory Part Num;-\n/g;
	$_=~s/Factory Serial Num:/Factory Serial Num;-\n/g;
	$_=~s/Manufacture:/Manufacture;-\n/g;
	$_=~s/Update:/Update;-\n/g;
	$_=~s/Time Alive:/Time Alive;-\n/g;
	$_=~s/Time Awake:/Time Awake;-\n/g;
	$_=~s/ID:/ID;-\n/g;
	$_=~s/Part Num:/Part Num;-\n/g;
	$_=~s/Serial Num:/Serial Num;-\n/g;
	$_=~s/BootProm:/BootProm;-\n/g;
	
		
   push(@newlines,$_);
}	
open(FINAL_OUTPUT, ">>${host_directory}/${brocade_address}_$health_or_doc.csv")  or &been_an_error;
print FINAL_OUTPUT @newlines;
close(FINAL_OUTPUT);

### Switch WWN
unlink ("${host_directory}/brocade_temp.csv");
system ("echo Switch WWN;- >> ${host_directory}/brocade_temp.csv");
system ("${inc_directory}plink.exe -l ${brocade_user} -pw \"${brocade_pw}\" ${brocade_address} wwn >> ${host_directory}/brocade_temp.csv");
open(CSV_INPUT, "${host_directory}/brocade_temp.csv")  or &been_an_error;
my @lines = <CSV_INPUT>;
close(CSV_INPUT);
open(FINAL_OUTPUT, ">>${host_directory}/${brocade_address}_$health_or_doc.csv")  or &been_an_error;
print FINAL_OUTPUT @lines;
close(FINAL_OUTPUT);	

### Switch ISL
unlink ("${host_directory}/brocade_temp.csv");
system ("echo ISLs;- >> ${host_directory}/brocade_temp.csv");
system ("${inc_directory}plink.exe -l ${brocade_user} -pw \"${brocade_pw}\" ${brocade_address} islshow >> ${host_directory}/brocade_temp.csv");
open(CSV_INPUT, "${host_directory}/brocade_temp.csv")  or &been_an_error;
my @lines = <CSV_INPUT>;
close(CSV_INPUT);
open(FINAL_OUTPUT, ">>${host_directory}/${brocade_address}_$health_or_doc.csv")  or &been_an_error;
print FINAL_OUTPUT @lines;
close(FINAL_OUTPUT);	
	
### Zones, Aliases and Configs
unlink ("${host_directory}/brocade_temp.csv");
system ("echo Switch Config/Zones/Aliases;- >> ${host_directory}/brocade_temp.csv");
system ("${inc_directory}plink.exe -l ${brocade_user} -pw \"${brocade_pw}\" ${brocade_address} zoneshow >> ${host_directory}/brocade_temp.csv");
open(CSV_INPUT, "${host_directory}/brocade_temp.csv")  or &been_an_error;
my @lines = <CSV_INPUT>;
close(CSV_INPUT);
my @newlines;
foreach (@lines) {
	
	$_=~s/; /\n/g;
	$_=~s/cfg:/cfg;-\n/g;
	$_=~s/zone:/zone;-\n/g;
	$_=~s/alias:/alias;-\n/g;
	$_=~s/Defined configuration:/Defined configuration;-\n/g;
	$_=~s/Effective configuration:/Effective configuration;-\n/g;
		
   push(@newlines,$_);
}	
open(FINAL_OUTPUT, ">>${host_directory}/${brocade_address}_$health_or_doc.csv")  or &been_an_error;
print FINAL_OUTPUT @newlines;
close(FINAL_OUTPUT);


### Switch Ports
unlink ("${host_directory}/brocade_temp.csv");
system ("echo Ports;- >> ${host_directory}/brocade_temp.csv");
system ("${inc_directory}plink.exe -l ${brocade_user} -pw \"${brocade_pw}\" ${brocade_address} switchshow >> ${host_directory}/brocade_temp.csv");
open(CSV_INPUT, "${host_directory}/brocade_temp.csv")  or &been_an_error;
my @lines = <CSV_INPUT>;
close(CSV_INPUT);
my @newlines;
foreach (@lines) {	
	$_=~s/=//g;
	$_=~s/: /;-\n/g;	
	$_=~s/ {1,}/,/g;	
	$_=~s/^,//g;	
   push(@newlines,$_);
}	
open(FINAL_OUTPUT, ">>${host_directory}/${brocade_address}_$health_or_doc.csv")  or &been_an_error;
print FINAL_OUTPUT @newlines;
close(FINAL_OUTPUT);


### TSCLOCKSHOW
unlink ("${host_directory}/brocade_temp.csv");
system ("echo Ports;- >> ${host_directory}/brocade_temp.csv");
system ("${inc_directory}plink.exe -l ${brocade_user} -pw \"${brocade_pw}\" ${brocade_address} tsclockserver >> ${host_directory}/brocade_temp.csv");
open(CSV_INPUT, "${host_directory}/brocade_temp.csv")  or &been_an_error;
my @lines = <CSV_INPUT>;
close(CSV_INPUT);
my @newlines;
foreach (@lines) {	
	$_=~s/: /;-\n/g;	
	$_=~s/ {2,}/,/g;	
	$_=~s/^,//g;	
   push(@newlines,$_);
}	
open(FINAL_OUTPUT, ">>${host_directory}/${brocade_address}_$health_or_doc.csv")  or &been_an_error;
print FINAL_OUTPUT @newlines;
close(FINAL_OUTPUT);

### License
unlink ("${host_directory}/brocade_temp.csv");
system ("echo Ports;- >> ${host_directory}/brocade_temp.csv");
system ("${inc_directory}plink.exe -l ${brocade_user} -pw \"${brocade_pw}\" ${brocade_address} licenseshow >> ${host_directory}/brocade_temp.csv");
open(CSV_INPUT, "${host_directory}/brocade_temp.csv")  or &been_an_error;
my @lines = <CSV_INPUT>;
close(CSV_INPUT);
my @newlines;
foreach (@lines) {	
		
	$_=~s/ {2,}/,/g;	
	$_=~s/^,//g;	
   push(@newlines,$_);
}	
open(FINAL_OUTPUT, ">>${host_directory}/${brocade_address}_$health_or_doc.csv")  or &been_an_error;
print FINAL_OUTPUT @newlines;
close(FINAL_OUTPUT);


### CFGSIZE
unlink ("${host_directory}/brocade_temp.csv");
system ("echo CFGSIZE;- >> ${host_directory}/brocade_temp.csv");
system ("${inc_directory}plink.exe -l ${brocade_user} -pw \"${brocade_pw}\" ${brocade_address} cfgsize >> ${host_directory}/brocade_temp.csv");
open(CSV_INPUT, "${host_directory}/brocade_temp.csv")  or &been_an_error;
my @lines = <CSV_INPUT>;
close(CSV_INPUT);
my @newlines;
foreach (@lines) {	
	$_=~s/Zone DB max size - /Zone DB max size - ,/g;
	$_=~s/Available Zone DB size - /Available Zone DB size - ,/g;
	$_=~s/committed - /committed - ,/g;
	$_=~s/transaction - /transaction - ,/g;	
	$_=~s/ {2,}/,/g;	
	$_=~s/^,//g;	
   push(@newlines,$_);
}	
open(FINAL_OUTPUT, ">>${host_directory}/${brocade_address}_$health_or_doc.csv")  or &been_an_error;
print FINAL_OUTPUT @newlines;
close(FINAL_OUTPUT);

}

###########################################################################
## Subroutine:
## Name: v7000_u_documentation
## Use: v7000u documentation csv gather
###########################################################################

sub v7000_u_documentation {
	chdir ${host_directory};
	unlink ("${host_directory}/${v7000_address}_$health_or_doc.csv");


# system ("echo Cluster Details;- > ${host_directory}/${v7000_address}_$health_or_doc.csv");	
# system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lscluster -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
# system ("echo Cluster Address;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
# system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsclusterip -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo System;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${host_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lssystem -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");

system ("echo Controllers;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${host_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lscontroller -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Node Details;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsnode -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Candidate Nodes?;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsnodecandidate -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo IO Groups;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsiogrp -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo License Details;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lslicense -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Arrays;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsarray -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Array Member Disks;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsarraymember -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Drives;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsdrive -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Enclosures;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsenclosure -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Mdisk Groups (Storage Pools);- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsmdiskgrp -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Vdisks (Volumes);- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsvdisk -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Host->Vdisk Maps;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lshostvdiskmap -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Mdisks;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsmdisk -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Mdisks (Bytes);- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsmdisk -bytes -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Vdisk Copies (if any);- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsvdiskcopy -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Hosts;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lshost -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Host Mappings;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lshostvdiskmap -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo User Groups;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsusergrp -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo LSPORTFC;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsportfc -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo LSPORTIP;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsportip -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");

### lsportip Specifics

system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsportip -delim , -nohdr > ${host_directory}/host_temp.out");
open (HOSTS, "${host_directory}/host_temp.out") or &been_an_error;
@read_hosts=<HOSTS>;  
$compare="";
foreach $host_element (@read_hosts) {
	chomp $host_element;
	($host_id, $host_name) = (split /,/,$host_element)[0,1];	
	chomp $host_id;
	chomp $host_name;
	if (${compare} eq "${host_id}") {next}
system ("echo lsportip specifics ID (${host_id}) ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} lsportip -delim , $host_id >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	

close (HOSTS);
$compare="$host_id";
}


system ("echo Users;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsuser -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo SNMP Server;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lssnmpserver -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Quorum Disks;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsquorum -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Metro/Global Consistency Groups;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsrcconsistgrp -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Metro/Global Relationships;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsrcrelationship -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo iSCSI Port IP Details;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsportip -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo HBA Port Candidate (Unconfigured);- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lshbaportcandidate -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Flash Copy Mappings;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsfcmap -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Flash Copy Consistency Groups;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsfcconsistgrp -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Fibre Channel Connectivity;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsfabric -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Battery;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsenclosurebattery -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Site;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lssite -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");




### Extent Specifics - vdisk

system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsvdisk -delim , -nohdr > ${host_directory}/host_temp.out");
open (HOSTS, "${host_directory}/host_temp.out") or &been_an_error;
@read_hosts=<HOSTS>;  
foreach $host_element (@read_hosts) {
	chomp $host_element;
	($host_id, $host_name) = (split /,/,$host_element)[0,1];
	chomp $host_id;
	chomp $host_name;
system ("echo Vdisk Extent Specifics ${host_name} ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsvdiskextent -delim , $host_id >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	

close (HOSTS);
}


### Extent Specifics - mdisk

system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsmdisk -delim , -nohdr > ${host_directory}/host_temp.out");
open (HOSTS, "${host_directory}/host_temp.out") or &been_an_error;
@read_hosts=<HOSTS>;  
foreach $host_element (@read_hosts) {
	chomp $host_element;
	($host_id, $host_name) = (split /,/,$host_element)[0,1];
	chomp $host_id;
	chomp $host_name;
system ("echo Mdisk Extent Specifics ${host_name} ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsmdiskextent -delim , $host_id >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	

close (HOSTS);
}

#### Host Specifics 

system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lshost -delim , -nohdr > ${host_directory}/host_temp.out");
open (HOSTS, "${host_directory}/host_temp.out") or &been_an_error;
@read_hosts=<HOSTS>;  
foreach $host_element (@read_hosts) {
	chomp $host_element;
	($host_id, $host_name) = (split /,/,$host_element)[0,1];
	chomp $host_id;
	chomp $host_name;
system ("echo Host Specifics ${host_name} ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lshost -delim , $host_id >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	

close (HOSTS);
}


### Controller Specifics


system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lscontroller -delim , -nohdr > ${host_directory}/host_temp.out");
open (HOSTS, "${host_directory}/host_temp.out") or &been_an_error;
@read_hosts=<HOSTS>;  
foreach $host_element (@read_hosts) {
	chomp $host_element;
	($host_id, $host_name) = (split /,/,$host_element)[0,1];
	chomp $host_id;
	chomp $host_name;
system ("echo Controller Specifics ${host_name} ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lscontroller  -delim , $host_id >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	

close (HOSTS);
}


### Node VPD Specifics


system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsnode -delim , -nohdr > ${host_directory}/host_temp.out");
open (HOSTS, "${host_directory}/host_temp.out") or &been_an_error;
@read_hosts=<HOSTS>;  
foreach $host_element (@read_hosts) {
	chomp $host_element;
	($host_id, $host_name) = (split /,/,$host_element)[0,1];
	chomp $host_id;
	chomp $host_name;
system ("echo Node VPD ${host_name} ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsnodevpd -delim , $host_id >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	

close (HOSTS);
}



### Node mdisk Specifics


system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsmdisk -delim , -nohdr > ${host_directory}/host_temp.out");
open (HOSTS, "${host_directory}/host_temp.out") or &been_an_error;
@read_hosts=<HOSTS>;  
foreach $host_element (@read_hosts) {
	chomp $host_element;
	($host_id, $host_name) = (split /,/,$host_element)[0,1];
	chomp $host_id;
	chomp $host_name;
system ("echo Mdisk Specifics ${host_name} ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsmdisk -delim , $host_id >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	

close (HOSTS);
}




### Node Array Specifics


system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsarray -delim , -nohdr > ${host_directory}/host_temp.out");
open (HOSTS, "${host_directory}/host_temp.out") or &been_an_error;
@read_hosts=<HOSTS>;  
foreach $host_element (@read_hosts) {
	chomp $host_element;
	($host_id, $host_name) = (split /,/,$host_element)[0,1];
	chomp $host_id;
	chomp $host_name;
system ("echo Array Specifics ${host_name} ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsarray -delim , $host_id >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	

close (HOSTS);
}





### Node Hardware


system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsnode -delim , -nohdr > ${host_directory}/host_temp.out");
open (HOSTS, "${host_directory}/host_temp.out") or &been_an_error;
@read_hosts=<HOSTS>;  
foreach $host_element (@read_hosts) {
	chomp $host_element;
	($host_id, $host_name) = (split /,/,$host_element)[0,1];
	chomp $host_id;
	chomp $host_name;
system ("echo Node Hardware Specifics ${host_name} ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsnodehw -delim , $host_id >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	

close (HOSTS);
}


unlink ("${host_directory}/host_temp.out");

system ("echo FILER STARTS HERE;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");

system ("echo Filesystem to TSM and Node associations;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation}  lsbackupfs -Y >> ${host_directory}/${v7000_address}_$health_or_doc.csv"); 
system ("echo Current Configuration for Cluster;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation}  lscfg -v -Y >> ${host_directory}/${v7000_address}_$health_or_doc.csv"); 
system ("echo All Clusters;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation}  lscluster -v -Y >> ${host_directory}/${v7000_address}_$health_or_doc.csv"); 
system ("echo Disks in the Cluster;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation}  lsdisk -v -Y >> ${host_directory}/${v7000_address}_$health_or_doc.csv"); 
system ("echo Filesystems;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation}  lsfs -v -Y >> ${host_directory}/${v7000_address}_$health_or_doc.csv"); 
# system ("echo Filesets;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
# system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation}  lsfset -v -Y >> ${host_directory}/${v7000_address}_$health_or_doc.csv"); 
system ("echo Health;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation}  lshealth -Y >> ${host_directory}/${v7000_address}_$health_or_doc.csv"); 
system ("echo HSM Enabled Filesystems;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation}  lshsm -Y >> ${host_directory}/${v7000_address}_$health_or_doc.csv"); 
system ("echo HSM Status;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation}  lshsmstatus -Y -v >> ${host_directory}/${v7000_address}_$health_or_doc.csv"); 
system ("echo Mount Status of Filesystems;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation}  lsmount -v -Y >> ${host_directory}/${v7000_address}_$health_or_doc.csv"); 
system ("echo Nodes;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation}  lsnode -v -Y >> ${host_directory}/${v7000_address}_$health_or_doc.csv"); 
system ("echo Networks;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation}  lsnw -Y >> ${host_directory}/${v7000_address}_$health_or_doc.csv"); 
system ("echo DNS;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation}  lsnwdns -Y >> ${host_directory}/${v7000_address}_$health_or_doc.csv"); 
system ("echo Interfaces;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation}  lsnwinterface -x -Y >> ${host_directory}/${v7000_address}_$health_or_doc.csv"); 
system ("echo Service Addresses;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation}  lsnwmgt -Y >> ${host_directory}/${v7000_address}_$health_or_doc.csv"); 
system ("echo Policy;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation}  lspolicy -Y >> ${host_directory}/${v7000_address}_$health_or_doc.csv"); 
system ("echo Pools;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation}  lspool -Y >> ${host_directory}/${v7000_address}_$health_or_doc.csv"); 
# system ("echo Peer Snapshots;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
# system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation}  lspsnal -v -Y >> ${host_directory}/${v7000_address}_$health_or_doc.csv"); 
system ("echo Peer Snapshot Schedules;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation}  lspsnaptask -v -Y >> ${host_directory}/${v7000_address}_$health_or_doc.csv"); 
system ("echo Quotas- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation}  lsquota -Y >> ${host_directory}/${v7000_address}_$health_or_doc.csv"); 
system ("echo Replication Config;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation}  lsreplcfg -v -Y >> ${host_directory}/${v7000_address}_$health_or_doc.csv"); 
system ("echo Replication Relationships;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation}  lsreplfs -Y >> ${host_directory}/${v7000_address}_$health_or_doc.csv"); 
system ("echo Replication Targets;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation}  lsrepltarget -Y >> ${host_directory}/${v7000_address}_$health_or_doc.csv"); 
system ("echo Replication Schedules;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation}  lsrepltask -Y >> ${host_directory}/${v7000_address}_$health_or_doc.csv"); 
system ("echo Services;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation}  lsservice -Y >> ${host_directory}/${v7000_address}_$health_or_doc.csv"); 
system ("echo Session Policy;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation}  lssessionpolicy -Y >> ${host_directory}/${v7000_address}_$health_or_doc.csv"); 
system ("echo Snap Associations;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation}  lssnapassoc -Y >> ${host_directory}/${v7000_address}_$health_or_doc.csv"); 
system ("echo Snap Rules;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation}  lssnaprule -Y >> ${host_directory}/${v7000_address}_$health_or_doc.csv"); 
# system ("echo List Snaps;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
# system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation}  lssnapshot -v -Y >> ${host_directory}/${v7000_address}_$health_or_doc.csv"); 
system ("echo Registered Storage Systems;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation}  lsstoragesystem -Y >> ${host_directory}/${v7000_address}_$health_or_doc.csv"); 
system ("echo Defined TSM Nodes;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation}  lstsmnode -Y >> ${host_directory}/${v7000_address}_$health_or_doc.csv"); 
system ("echo Users;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation}  lsuser -Y >> ${host_directory}/${v7000_address}_$health_or_doc.csv"); 
system ("echo User Groups;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation}  lsusergrp -Y >> ${host_directory}/${v7000_address}_$health_or_doc.csv"); 

}

###########################################################################
## Subroutine:
## Name: v7000_documentation
## Use: v7000 documentation csv gather
###########################################################################

sub v7000_documentation {
	chdir ${host_directory};
	unlink ("${host_directory}/${v7000_address}_$health_or_doc.csv");

system ("echo System;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${host_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lssystem -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");

system ("echo Controllers;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${host_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lscontroller -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
# system ("echo Cluster Details;- > ${host_directory}/${v7000_address}_$health_or_doc.csv");	
# system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lscluster -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
# system ("echo Cluster Address;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
# system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsclusterip -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Node Details;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsnode -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Candidate Nodes?;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsnodecandidate -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo IO Groups;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsiogrp -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo License Details;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lslicense -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Arrays;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsarray -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Array Member Disks;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsarraymember -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Drives;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsdrive -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Enclosures;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsenclosure -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Controllers;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${host_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lscontroller -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Mdisk Groups (Storage Pools);- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsmdiskgrp -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Vdisks (Volumes);- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsvdisk -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Host->Vdisk Maps;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lshostvdiskmap -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Mdisks;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsmdisk -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Mdisks (Bytes);- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsmdisk -bytes -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Vdisk Copies (if any);- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsvdiskcopy -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Hosts;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lshost -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Host Mappings;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lshostvdiskmap -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo User Groups;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsusergrp -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo LSPORTFC;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsportfc -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo LSPORTIP;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsportip -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");

### lsportip Specifics

system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsportip -delim , -nohdr > ${host_directory}/host_temp.out");
open (HOSTS, "${host_directory}/host_temp.out") or &been_an_error;
@read_hosts=<HOSTS>;  
$compare="";
foreach $host_element (@read_hosts) {
	chomp $host_element;
	($host_id, $host_name) = (split /,/,$host_element)[0,1];	
	chomp $host_id;
	chomp $host_name;
	if ("${compare}" eq "${host_id}") {next}
system ("echo lsportip specifics ID (${host_id}) ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} lsportip -delim , $host_id >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	

close (HOSTS);
$compare="$host_id";
}



system ("echo Users;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsuser -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo SNMP Server;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lssnmpserver -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Quorum Disks;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsquorum -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Metro/Global Consistency Groups;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsrcconsistgrp -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Metro/Global Relationships;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsrcrelationship -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo iSCSI Port IP Details;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsportip -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo HBA Port Candidate (Unconfigured);- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lshbaportcandidate -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Flash Copy Mappings;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsfcmap -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Flash Copy Consistency Groups;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsfcconsistgrp -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Fibre Channel Connectivity;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsfabric -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Battery;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsenclosurebattery -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Site;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lssite -delim , >> ${host_directory}/${v7000_address}_$health_or_doc.csv");


### Extent Specifics - vdisk

system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsvdisk -delim , -nohdr > ${host_directory}/host_temp.out");
open (HOSTS, "${host_directory}/host_temp.out") or &been_an_error;
@read_hosts=<HOSTS>;  
foreach $host_element (@read_hosts) {
	chomp $host_element;
	($host_id, $host_name) = (split /,/,$host_element)[0,1];
	chomp $host_id;
	chomp $host_name;
system ("echo Vdisk Extent Specifics ${host_name} ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsvdiskextent -delim , $host_id >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	

close (HOSTS);
}


### Extent Specifics - mdisk

system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsmdisk -delim , -nohdr > ${host_directory}/host_temp.out");
open (HOSTS, "${host_directory}/host_temp.out") or &been_an_error;
@read_hosts=<HOSTS>;  
foreach $host_element (@read_hosts) {
	chomp $host_element;
	($host_id, $host_name) = (split /,/,$host_element)[0,1];
	chomp $host_id;
	chomp $host_name;
system ("echo Mdisk Extent Specifics ${host_name} ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsmdiskextent -delim , $host_id >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	

close (HOSTS);
}

### Free Extent Specifics - mdisk

system ("echo Mdisk Free Extents ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo mdisk ID, Free Extent >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsmdisk -delim , -nohdr > ${host_directory}/host_temp.out");
open (HOSTS, "${host_directory}/host_temp.out") or &been_an_error;
@read_hosts=<HOSTS>;  
foreach $host_element (@read_hosts) {
	chomp $host_element;
	($host_id, $host_name) = (split /,/,$host_element)[0,1];
	chomp $host_id;
	chomp $host_name;
	@freeextents=qx("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsfreeextents -nohdr -delim , ${host_id}");	
	$frxetetz=$freeextents[1];
	chomp $frxetetz;
	system ("echo ${host_id},${frxetetz} >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
close (HOSTS);
}


#### Host Specifics 

system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lshost -delim , -nohdr > ${host_directory}/host_temp.out");
open (HOSTS, "${host_directory}/host_temp.out") or &been_an_error;
@read_hosts=<HOSTS>;  
foreach $host_element (@read_hosts) {
	chomp $host_element;
	($host_id, $host_name) = (split /,/,$host_element)[0,1];
	chomp $host_id;
	chomp $host_name;
system ("echo Host Specifics ${host_name} ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lshost -delim , $host_id >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	

close (HOSTS);
}


### Controller Specifics


system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lscontroller -delim , -nohdr > ${host_directory}/host_temp.out");
open (HOSTS, "${host_directory}/host_temp.out") or &been_an_error;
@read_hosts=<HOSTS>;  
foreach $host_element (@read_hosts) {
	chomp $host_element;
	($host_id, $host_name) = (split /,/,$host_element)[0,1];
	chomp $host_id;
	chomp $host_name;
system ("echo Controller Specifics ${host_name} ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lscontroller  -delim , $host_id >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	

close (HOSTS);
}


### Node VPD Specifics


system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsnode -delim , -nohdr > ${host_directory}/host_temp.out");
open (HOSTS, "${host_directory}/host_temp.out") or &been_an_error;
@read_hosts=<HOSTS>;  
foreach $host_element (@read_hosts) {
	chomp $host_element;
	($host_id, $host_name) = (split /,/,$host_element)[0,1];
	chomp $host_id;
	chomp $host_name;
system ("echo Node VPD ${host_name} ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsnodevpd -delim , $host_id >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	

close (HOSTS);
}



### Node mdisk Specifics


system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsmdisk -delim , -nohdr > ${host_directory}/host_temp.out");
open (HOSTS, "${host_directory}/host_temp.out") or &been_an_error;
@read_hosts=<HOSTS>;  
foreach $host_element (@read_hosts) {
	chomp $host_element;
	($host_id, $host_name) = (split /,/,$host_element)[0,1];
	chomp $host_id;
	chomp $host_name;
system ("echo Mdisk Specifics ${host_name} ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsmdisk -delim , $host_id >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	

close (HOSTS);
}




### Node Array Specifics


system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsarray -delim , -nohdr > ${host_directory}/host_temp.out");
open (HOSTS, "${host_directory}/host_temp.out") or &been_an_error;
@read_hosts=<HOSTS>;  
foreach $host_element (@read_hosts) {
	chomp $host_element;
	($host_id, $host_name) = (split /,/,$host_element)[0,1];
	chomp $host_id;
	chomp $host_name;
system ("echo Array Specifics ${host_name} ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsarray -delim , $host_id >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	

close (HOSTS);
}





### Node Hardware


system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsnode -delim , -nohdr > ${host_directory}/host_temp.out");
open (HOSTS, "${host_directory}/host_temp.out") or &been_an_error;
@read_hosts=<HOSTS>;  
foreach $host_element (@read_hosts) {
	chomp $host_element;
	($host_id, $host_name) = (split /,/,$host_element)[0,1];
	chomp $host_id;
	chomp $host_name;
system ("echo Node Hardware Specifics ${host_name} ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation} svcinfo lsnodehw -delim , $host_id >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	

close (HOSTS);
}



unlink ("${host_directory}/host_temp.out");


}

###########################################################################
## Subroutine:
## Name: xiv_documentation
## Use: XIV documentation csv gather
###########################################################################

sub xiv_documentation {
	chdir ${host_directory};
	unlink ("${host_directory}/${v7000_address}_$health_or_doc.csv");


system ("echo Cluster Details;- > ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s cluster_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -Config;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s config_get >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Host Details;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s host_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -config_get ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s config_get >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Reservation Keys;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s reservation_key_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Volume Reservations;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s reservation_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Volume List;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s vol_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Consistency Group List;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s cg_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Snapshot Group List;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s snap_group_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Storage Pool List;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s pool_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Operational State;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s state_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo System Capacity List;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s system_capacity_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Current Time;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s time_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Status of Any Upgrade?;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s upgrade_get_status >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Upgrade Prerequisites;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s upgrade_validate_prerequisites >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Current Version;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s version_get >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo VPD Parameters;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s vpd_config_get >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Maint Module Parameters;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s mm_config_get >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Remote Target Connectivity Definitions;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s target_connectivity_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Remote Target List;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s target_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Remote Target Port List;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s target_port_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Mirror List;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s mirror_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Schedules;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s schedule_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Sync Job Status;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s sync_job_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo List Migration Status;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s dm_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Event Notification Destinations;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s dest_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Event Notification Destinations;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s dest_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Destination Groups;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s destgroup_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo Event Threshold List;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s event_threshold_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("echo -List SMS Gateways;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s smsgw_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -List SMTP Gateways;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s smtpgw_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -List IP Interface Configuration;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s ipinterface_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -Show Status of Ethernet Ports;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s ipinterface_list_ports >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -List Support Centers;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s support_center_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -Support Center Status;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s support_center_status >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -List Access Control;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s access_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -List LDAP Configuration;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s ldap_config_get >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -List Defined LDAP Servers;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s ldap_list_servers >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -List DLDAP Authentication Mode;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s ldap_mode_get >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -List User Groups;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s user_group_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -List Users;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s user_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -List FC Ports;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s fc_port_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -List FC Connectivity to Hosts;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s host_connectivity_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -Listing ATS Configuraion;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s ats_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -Listing CFs in System;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s cf_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -Listing Components in System;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s component_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -Listing Components Requiring Service;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s component_service_required_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -Listing DIMMS in System;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s dimm_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -Listing Maint Modules in System;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s mm_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -Listing NICS in System;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s nic_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -Rebuild or Redistribution Process?;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s monitor_redist >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -Listing Disks in System;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s disk_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -Listing Module Configuration;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s module_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -Listing Serial Console Status;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s serial_consoles_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -UPS Component Status;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s ups_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -Service Status;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s service_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -Switch Status;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s switch_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -PSUs in System;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s psu_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -System Trace Running?- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s traces_status_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -XIV Support Window;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s xiv_support_show >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -List Fans in System;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s fan_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -cod_list ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s cod_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -ssd_list ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s ssd_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -hca_list ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s hca_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -cna_list ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s cna_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -cpu_list ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s cpu_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -system_average_power_consumption ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s system_average_power_consumption >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -system_average_temperature ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s system_average_temperature >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -component_firmware_upgrade_status ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s component_firmware_upgrade_status >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -component_firmware_upgrade_progress ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s component_firmware_upgrade_progress >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -system_power_management_get ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s system_power_management_get >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -module_temperature_list ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s module_temperature_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -maintenance_urgency_list ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s maintenance_urgency_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -perf_class_list ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s perf_class_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -encrypt_keyserver_list ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s encrypt_keyserver_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -encrypt_recovery_key_status ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s encrypt_recovery_key_status >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -encrypt_recovery_key_list ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s encrypt_recovery_key_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -firmware_upgrade_status ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s firmware_upgrade_status >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -audit_config_get ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s audit_config_get >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -vol_default_ssd_caching_get ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s vol_default_ssd_caching_get >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -local_storage_show ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s local_storage_show >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -ib_port_list ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s ib_port_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -elicense_status_get ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s elicense_status_get >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -metadata_service_entry_list ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s metadata_service_entry_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -metadata_service_db_list ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s metadata_service_db_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -module_temperature_list ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s module_temperature_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -fc_connectivity_list ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s fc_connectivity_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -ip_access_group_address_list ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s ip_access_group_address_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -ip_access_group_list ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s ip_access_group_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -ipinterface_list_ips ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s ipinterface_list_ips >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -ipsec_connection_list ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s ipsec_connection_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -ipsec_list_tunnels ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s ipsec_list_tunnels >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -host_list_ports ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s host_list_ports >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -host_profile_list ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s host_profile_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -ldap_user_list role=readonly ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s ldap_user_list role=readonly >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -ldap_user_list role=storageadmin ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s ldap_user_list role=storageadmin >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -ldap_user_list role=securityadmin ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s ldap_user_list role=securityadmin >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -ldap_user_list role=storageintegrationadmin ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s ldap_user_list role=storageintegrationadmin >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -domain_list_users ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s domain_list_users >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -domain_list_objects ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s domain_list_objects >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -domain_global_list ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s domain_global_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -domain_list ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s domain_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -domain_policy_get ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s domain_policy_get >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -appadmin_capabilities_get ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s appadmin_capabilities_get >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -designate_msm_user_get ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s designate_msm_user_get >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -olvm_list ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s olvm_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -perf_class_list ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s perf_class_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("echo -xmirror_list ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s xmirror_list >> ${host_directory}/${v7000_address}_$health_or_doc.csv");


### Mapping Specifics (cluster)

system ("echo Cluster Mapping Specifics ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s cluster_list > ${host_directory}/host_temp.out");
open (HOSTS, "${host_directory}/host_temp.out") or &been_an_error;
@read_hosts=<HOSTS>;  
foreach $host_element (@read_hosts) {
	chomp $host_element;	
	($item_id) = (split /,/,$host_element)[0];
	chomp $item_id;
	$cluster_name=$item_id;
	$cluster_name=~s/"//g;
	#next if ($item_id eq "Name");
	
system ("echo Cluster mappings for cluster $cluster_name ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s mapping_list cluster=$item_id >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	


close (HOSTS);
}

### Mapping Specifics (hosts)

system ("echo Host Mapping Specifics ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s host_list > ${host_directory}/host_temp.out");
open (HOSTS, "${host_directory}/host_temp.out") or &been_an_error;
@read_hosts=<HOSTS>;  
foreach $host_element (@read_hosts) {
	chomp $host_element;
	
	($item_id) = (split /,/,$host_element)[0];
	chomp $item_id;
	$hh_name=$item_id;
	$hh_name=~s/"//g;
	#$item_id=~s/"//g;
	#next if ($item_id eq "Name");
	
system ("echo Host mappings for host $hh_name ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s mapping_list host=$item_id >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	


close (HOSTS);
}

### Snapshot Specifics (volumes)

system ("echo Snapshot Specifics ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s vol_list > ${host_directory}/host_temp.out");
open (HOSTS, "${host_directory}/host_temp.out") or &been_an_error;
@read_hosts=<HOSTS>;  
foreach $host_element (@read_hosts) {
	chomp $host_element;
	
	($item_id) = (split /,/,$host_element)[0];
	chomp $item_id;
	chomp $item_id;
	$ss_name=$item_id;
	$ss_name=~s/"//g;
	#$item_id=~s/"//g;
	#next if ($item_id eq "Name");

system ("echo Snapshots for volume $ss_name ;- >> ${host_directory}/${v7000_address}_$health_or_doc.csv");
system ("xcli -u ${v7000_user} -p \"${v7000_pw}\" -m ${v7000_address} -s snapshot_list vol=$item_id >> ${host_directory}/${v7000_address}_$health_or_doc.csv");	


close (HOSTS);
}

open(CSV_INPUT, "${host_directory}/${v7000_address}_$health_or_doc.csv")  or &been_an_error;
my @lines = <CSV_INPUT>;
close(CSV_INPUT);
my @newlines;
foreach (@lines) {
	
	
	$_=~s/,"//g;
	$_=~s/,/ /g;
	$_=~s/"/,/g;
	$_=~s/^,//g;
			
   push(@newlines,$_);
}	
open(FINAL_OUTPUT, ">${host_directory}/${v7000_address}_$health_or_doc.csv")  or &been_an_error;
print FINAL_OUTPUT @newlines;
close(FINAL_OUTPUT);

}	

###########################################################################
## Subroutine:
## Name: ds8000
## Use: ds8000 documentation csv gather
###########################################################################

sub ds8000 {


chdir ${host_directory};
unlink ("${host_directory}/${v7000_address}_$health_or_doc.csv");
open (FILE, ">>${host_directory}/${v7000_address}_$health_or_doc.csv") or &been_an_error;


print FILE "User Details;-\n";	
print FILE `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} lsuser -l -fmt delim -bnr off`;

print FILE "Keygroup;-\n";
print FILE `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} lskeygrp -fmt delim -bnr off`;


print FILE "Keymanager;-\n";	
print FILE `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} lskeymgr -fmt delim -bnr off`;

print FILE "Access;-\n";	
print FILE `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} lsaccess -fmt delim -bnr off`;

print FILE "IPSec;-\n";	
print FILE `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} lsipsec -fmt delim -bnr off`;

print FILE "Keys;-\n";
print FILE `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} lskey -fmt delim -bnr off`;

print FILE "DA;-\n";	
print FILE `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} lsda -l -fmt delim -bnr off`;

print FILE "Frames;-\n";	
print FILE `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} lsframe -l -fmt delim -bnr off`;

print FILE "Enclosures;-\n";	
print FILE `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} lsstgencl -l -fmt delim -bnr off`;

print FILE "HBAs;-\n";	
print FILE `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} lshba -l -fmt delim -bnr off`;

print FILE "Disks;-\n";	
print FILE `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} lsddm -l -fmt delim -bnr off`;

print FILE "Storage Complex;-\n";	
print FILE `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} showsp -bnr off`;

print FILE "VPN;-\n";	
print FILE `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} lsvpn -l -fmt delim -bnr off`;

print FILE "Storage Unit;-\n";	
print FILE `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} lssu -l -fmt delim -bnr off`;

print FILE "lsserver;-\n";	
print FILE `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} lsserver -l -fmt delim -bnr off`;


print FILE "lssi;-\n";	
print FILE `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} lssi -l -fmt delim -bnr off`;


print FILE "showsi;-\n";	
print FILE `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} showsi -bnr off`;


print FILE "IO Port;-\n";	
print FILE `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} lsioport -l -fmt delim -bnr off `;

print FILE "Host Connect;-\n";	
print FILE `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} lshostconnect -l -fmt delim -bnr off `;


##### Host Connect Specifics 

open (HOSTS, ">${host_directory}/host_temp.out") or &been_an_error;
print HOSTS `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} lshostconnect -l -fmt delim -bnr off -hdr off`;
close(HOSTS);
open (HOSTS, "<${host_directory}/host_temp.out") or &been_an_error;
@read_hosts=<HOSTS>;  
foreach $host_element (@read_hosts) {
	chomp $host_element;
	($host_name,$host_id) = (split /,/,$host_element)[0,1];
	chomp $host_id;
	chomp $host_name;
print FILE "Host Connect Specifics ${host_name} ;-\n";
print FILE `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} showhostconnect -bnr off $host_id`;	

close (HOSTS);
}


print FILE "Port Profiles;-\n";	
print FILE `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} lsportprof -fmt delim -bnr off`;


print FILE "Host Type SCSI Mask;-\n";	
print FILE `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} lshosttype -l -type scsimask  -fmt delim -bnr off`;


print FILE "Host Type SCSIMAP256;-\n";	
print FILE `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} lshosttype -l -type scsimap256  -fmt delim -bnr off`;


print FILE "ArraySite;-\n";	
print FILE `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} lsarraysite -fmt delim -bnr off`;


# #### Array Site Specifics 
open (HOSTS, ">${host_directory}/host_temp.out") or &been_an_error;
print HOSTS `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} lsarraysite -l -fmt delim -bnr off -hdr off`;
close(HOSTS);
open (HOSTS, "<${host_directory}/host_temp.out") or &been_an_error;
@read_hosts=<HOSTS>;  
foreach $host_element (@read_hosts) {
	chomp $host_element;
	($host_id,$host_name) = (split /,/,$host_element)[0,1];
	chomp $host_id;
	chomp $host_name;
print FILE "Arraysite Specifics ${host_name} ;-\n";
print FILE `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} showarraysite -bnr off $host_id`;	
}

print FILE "Arrays;-\n";	
print FILE `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} lsarray -l -fmt delim -bnr off`;

# #### Array Specifics 

open (HOSTS, ">${host_directory}/host_temp.out") or &been_an_error;
print HOSTS `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} lsarray -l -fmt delim -bnr off -hdr off`;
close(HOSTS);
open (HOSTS, "<${host_directory}/host_temp.out") or &been_an_error;
@read_hosts=<HOSTS>;  
foreach $host_element (@read_hosts) {
	chomp $host_element;
	($host_id,$host_name) = (split /,/,$host_element)[0,1];
	chomp $host_id;
	chomp $host_name;
print FILE "Array Specifics;-\n";
print FILE `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} showarray -bnr off $host_id`;	
}


############################



print FILE "Ranks;-\n";	
print FILE `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} lsrank -l  -fmt delim -bnr off`;


# #### Rank Specifics 

open (HOSTS, ">${host_directory}/host_temp.out") or &been_an_error;
print HOSTS `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} lsrank -l -fmt delim -bnr off -hdr off`;
close(HOSTS);
open (HOSTS, "<${host_directory}/host_temp.out") or &been_an_error;
@read_hosts=<HOSTS>;  
foreach $host_element (@read_hosts) {
	chomp $host_element;
	($host_id,$host_name) = (split /,/,$host_element)[0,1];
	chomp $host_id;
	chomp $host_name;
print FILE "Rank Specifics ${host_name} ;-\n";
print FILE `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} showrank -bnr off $host_id`;	
}



print FILE "Extent Pools;-\n";	
print FILE `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} lsextpool -l  -fmt delim -bnr off`;


# #### Extent Pool Specifics 

open (HOSTS, ">${host_directory}/host_temp.out") or &been_an_error;
print HOSTS `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} lsextpool -l -fmt delim -bnr off -hdr off`;
close(HOSTS);
open (HOSTS, "<${host_directory}/host_temp.out") or &been_an_error;
@read_hosts=<HOSTS>;  
foreach $host_element (@read_hosts) {
	chomp $host_element;
	($host_name,$host_id) = (split /,/,$host_element)[0,1];
	chomp $host_id;
	chomp $host_name;
print FILE "Rank Specifics ${host_name} ;-\n";
print FILE `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} showextpool -bnr off $host_id`;	
}

###


print FILE "Address Group;-\n";	
print FILE `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} lsaddressgrp -l -fmt delim -bnr off`;


print FILE "LSS-\n";	
print FILE `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} lslss -l  -fmt delim -bnr off`;


# #### LSS Specifics 

open (HOSTS, ">${host_directory}/host_temp.out") or &been_an_error;
print HOSTS `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} lslss -l  -fmt delim -bnr off -hdr off`;
close(HOSTS);
open (HOSTS, "<${host_directory}/host_temp.out") or &been_an_error;
@read_hosts=<HOSTS>;  
foreach $host_element (@read_hosts) {
	chomp $host_element;
	($host_id,$host_name) = (split /,/,$host_element)[0,1];
	chomp $host_id;
	chomp $host_name;
print FILE "LSS Specifics ${host_name} ;-\n";
print FILE `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} showlss -bnr off $host_id`;	
}


print FILE "FB Volumes;-\n";	
print FILE `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} lsfbvol -l  -fmt delim -bnr off`;


# #### FB Volume Specifics 

open (HOSTS, ">${host_directory}/host_temp.out") or &been_an_error;
print HOSTS `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} lsfbvol -fmt delim -bnr off -hdr off`;
close(HOSTS);
open (HOSTS, "<${host_directory}/host_temp.out") or &been_an_error;
@read_hosts=<HOSTS>;  
foreach $host_element (@read_hosts) {
	chomp $host_element;
	($host_name,$host_id) = (split /,/,$host_element)[0,1];
	chomp $host_id;
	chomp $host_name;
print FILE "FBVOL Specifics ${host_name} ;-\n";
print FILE `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} showfbvol -bnr off $host_id`;
print FILE "FBVOL (Flash) Specifics ${host_name} ;-\n";
print FILE `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} lsflash -l -bnr off $host_id`;
print FILE "FBVOL (PPRC path) Specifics ${host_name} ;-\n";

}


print FILE "Volume Groups;-\n";	
print FILE `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} lsvolgrp -l  -fmt delim -bnr off`;


# #### Volume Group Specifics 

open (HOSTS, ">${host_directory}/host_temp.out") or &been_an_error;
print HOSTS `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} lsvolgrp -l  -fmt delim -bnr off -hdr off`;
close(HOSTS);
open (HOSTS, "<${host_directory}/host_temp.out") or &been_an_error;
@read_hosts=<HOSTS>;  
foreach $host_element (@read_hosts) {
	chomp $host_element;
	($host_name,$host_id) = (split /,/,$host_element)[0,1];
	chomp $host_id;
	chomp $host_name;
print FILE "Volume Group Specifics ${host_name} ;-\n";
print FILE `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} showvolgrp -bnr off $host_id`;	
}


print FILE "Space Efficient Repos;-\n";	
print FILE `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} lssestg -l -fmt delim -bnr off`;

# #### SE Repos Specifics 

open (HOSTS, ">${host_directory}/host_temp.out") or &been_an_error;
print HOSTS `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} lssestg -l  -fmt delim -bnr off -hdr off`;
close(HOSTS);
open (HOSTS, "<${host_directory}/host_temp.out") or &been_an_error;
@read_hosts=<HOSTS>;  
foreach $host_element (@read_hosts) {
	chomp $host_element;
	($host_id,$host_name) = (split /,/,$host_element)[0,1];
	chomp $host_id;
	chomp $host_name;
print FILE "Space Efficient Repos Specifics ${host_id} ;-\n";
print FILE `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} showsestg -bnr off $host_id`;	
}

print FILE "PERF Group;-\n";	
print FILE `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} lsperfgrp -l  -fmt delim -bnr off`;


print FILE "RES Group;-\n";	
print FILE `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} lsresgrp -l  -fmt delim -bnr off`;

# #### RES Group Specifics 

open (HOSTS, ">${host_directory}/host_temp.out") or &been_an_error;
print HOSTS `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} lsresgrp -l  -fmt delim -bnr off -hdr off`;
close(HOSTS);
open (HOSTS, "<${host_directory}/host_temp.out") or &been_an_error;
@read_hosts=<HOSTS>;  
foreach $host_element (@read_hosts) {
	chomp $host_element;
	($host_id,$host_name) = (split /,/,$host_element)[0,1];
	chomp $host_id;
	chomp $host_name;
print FILE "RES Group Specifics ${host_name} ;-\n";
print FILE `dscli -user ${v7000_user} -passwd ${v7000_pw} -hmc1 ${v7000_address} showresgrp -bnr off $host_id`;	
}



####


close (FILE);
}


###########################################################################
## Subroutine:
## Name: set_client
## Use: set the type of TSM client to use
###########################################################################

sub set_client {
	

my $prompt = new Term::Menu (
	beforetext => "OPTIONS:\n",
	aftertext => "\nWhere is the TSM Client? => ",
	);
	our $answer = $prompt->menu(
        included  =>      		["Use bundled client in StorageTools?", 'b'],
        installed  =>      		["Use client already installed in default directory?", 'i'],
        other  =>      			["Use manually set directory?", 'm'],
        
            
  );         

if($answer eq "included"){ 
	
		our $host_ps_directory="$ENV{PAR_TEMP}\\inc\\inc";
		our ${host_directory}="$ENV{PAR_TEMP}\\inc\\inc\\";
		our $baclient_directory="$ENV{PAR_TEMP}\\inc\\inc\\";
		our $ba_client_type="Bundled";
	}

elsif($answer eq "installed"){ 
		our $host_ps_directory="$ENV{PAR_TEMP}\\inc\\inc";
		our ${host_directory}="$ENV{PAR_TEMP}\\inc\\inc\\";
		our $baclient_directory="C:\\progra~1\\tivoli\\tsm\\baclient";
		our $ba_client_type="Default Installed";
	}
	
elsif($answer eq "other"){ 
	&draw_heading;
	use Win32::Console::ANSI;
	use Term::ANSIColor;
	print color 'bold red';
	print "\nEnter TSM baclient directory (use forward slashes)";
	print color 'reset';
	print "(${host_directory})-> ";
	
	our $tsmhd=<STDIN>;
	chomp $tsmhd;

	if ("$tsmhd" ne "") {
		our ${baclient_directory}="$tsmhd";
		our $host_ps_directory="$ENV{PAR_TEMP}\\inc\\inc";
		our ${host_directory}="$ENV{PAR_TEMP}\\inc\\inc\\";	
	}
			if (-d "${baclient_directory}"){
			print "Directory exists!";
		
			}
			else {
			print "Directory does NOT exist. You need to set it again!!";
			}

print "\nBINARIES DIR set to \"${baclient_directory}\"\n";
our $ba_client_type="Manually Set Installed";
system ("pause");
	}
else {
		
		our $host_ps_directory="$ENV{PAR_TEMP}\\inc\\inc";
		our ${host_directory}="$ENV{PAR_TEMP}\\inc\\inc\\";
		our $baclient_directory="$ENV{PAR_TEMP}\\inc\\inc\\";
		our $ba_client_type="Bundled";
	}
}

###########################################################################
## Subroutine:
## Name: change_windows_creds
## Use: Set Windows credentials
###########################################################################

sub change_windows_creds {

print color 'bold green';	
print "\nPlease enter Windows Domain: ";
print color 'reset';
our $windows_domain = <STDIN>;
print color 'bold green';	
print "Please enter Domain Administrator: ";
print color 'reset';
our $windows_admin = <STDIN>;
print color 'bold green';	
print "Please enter password ";
print color 'reset';
system ("powershell \"read-host -assecurestring | convertfrom-securestring | out-file C:\\cred.txt\"");
print "Password set.\n";
chomp $windows_domain; 	# get rid of carriage returns
chomp $windows_admin; 	# get rid of carriage returns
chomp $domain_password;	# get rid of carriage returns	
}

###########################################################################
## Subroutine:
## Name: change_credentials
## Use: Change the TSM credentials
###########################################################################


sub change_credentials {
	CREDENTIALS:
		use Win32::Console::ANSI;
		use Term::ANSIColor;
		#print color 'bold magenta';
		&draw_heading;
		print color 'bold green';
		print "\nplease enter TSM administrator: ";
		print color 'reset';
		$tsm_user = <STDIN>;
		print color 'bold green';
		print "please enter TSM password: ";
		print color 'reset';
		ReadMode('noecho'); # don't echo
		$tsm_password = <STDIN>;
		ReadMode(0);        # back to normal
		TSM_ADDRESS:
		print color 'bold green';
		print "\nplease enter TSM server address: ";
		print color 'reset';
		$tsm_server = <STDIN>;
		print color 'bold green';
		print "please enter TSM server port: ";
		print color 'reset';
		$tsm_port = <STDIN>;
		chomp $tsm_user; 	# get rid of carriage returns
		chomp $tsm_password; 	# get rid of carriage returns
		chomp $tsm_server;	# get rid of carriage returns
		chomp $tsm_port;	# get rid of carriage returns	
		$p = Net::Ping->new();
	 if ($p->ping($tsm_server)){
		$tsm_ping="ALIVE";
			
		}
		else { 
		$tsm_ping="DEAD" 
		};
		
	if ($tsm_ping eq "DEAD" ) { 
		print "This TSM server \"$tsm_server\" may be OFFLINE (cannot ping)\nDo you want to reenter details (r) or continue (c)? >>";
		$pinganswer=<STDIN>;
		chomp $pinganswer;
		if ($pinganswer eq "r") {goto TSM_ADDRESS}
		if ($pinganswer eq "c") {print "Continuing with dubious address....\n"}
		}
		
	if ("$tsm_server" eq "" ) { goto TSM_ADDRESS;}
	&make_options_file;
	&get_version;
	if ($version eq "INVALID") 
	{ 
	print "Cannot log into TSM server or version not supported. Pointless continuing..\nHit <enter> to re-enter credentials:\n";
	system ("pause");
	goto CREDENTIALS;
	}
	
			
		chdir ${host_directory};		
		
}


###########################################################################
## Subroutine:
## Name: change_lm_credentials
## Use: Change the Library Manager credentials - this keeps 
## them separate to the main instance and is used for the Micro Healthcheck
###########################################################################

sub change_lm_credentials {
		use Win32::Console::ANSI;
		use Term::ANSIColor;
		#print color 'bold magenta';
		&draw_heading;
		print "### INFO ###\nThe library or drive you are querying belongs to another instance\nPlease enter the instance details below:\n\n";
		print color 'bold green';
		print "\nplease enter TSM administrator (for Library Manager): ";
		print color 'reset';
		$lm_user = <STDIN>;
		print color 'bold green';
		print "please enter TSM password (for Library Manager): ";
		print color 'reset';
		ReadMode('noecho'); # don't echo
		$lm_password = <STDIN>;
		ReadMode(0);        # back to normal
		print color 'bold green';
		print "\nplease enter TSM server address (for Library Manager): ";
		print color 'reset';
		$lm_server = <STDIN>;
		print color 'bold green';
		print "please enter TSM server port (for Library Manager): ";
		print color 'reset';
		$lm_port = <STDIN>;
		chomp $lm_user; 	# get rid of carriage returns
		chomp $lm_password; 	# get rid of carriage returns
		chomp $lm_server;	# get rid of carriage returns
		chomp $lm_port;	# get rid of carriage returns		
		chdir ${host_directory};		
		
}


###########################################################################
## Subroutine:
## Name: change_lm_credentials
## Use: Change the Library Manager credentials - this keeps 
## them separate to the main instance and is used for the Micro Healthcheck
###########################################################################

sub change_rep_credentials {
		use Win32::Console::ANSI;
		use Term::ANSIColor;
		#print color 'bold magenta';
		&draw_heading;
		print "### INFO ###\nPlease enter the details of the replication partner TSM instance:\n\n";
		print color 'bold green';
		print "\nplease enter TSM administrator (for Replication Partner): ";
		print color 'reset';
		$rep_user = <STDIN>;
		print color 'bold green';
		print "please enter TSM password (for Replication Partner): ";
		print color 'reset';
		ReadMode('noecho'); # don't echo
		$rep_password = <STDIN>;
		ReadMode(0);        # back to normal
		print color 'bold green';
		print "\nplease enter TSM server address (for Replication Partner): ";
		print color 'reset';
		$rep_server = <STDIN>;
		print color 'bold green';
		print "please enter TSM server port (for Replication Partner): ";
		print color 'reset';
		$rep_port = <STDIN>;
		chomp $lm_user; 	# get rid of carriage returns
		chomp $lm_password; 	# get rid of carriage returns
		chomp $lm_server;	# get rid of carriage returns
		chomp $lm_port;	# get rid of carriage returns		
		chdir ${host_directory};		
		
}


###########################################################################
## Subroutine:
## Name: draw_brocade_heading
## Use: draw the brocade heading 
###########################################################################
	
sub draw_brocade_heading {
  use Win32::Console::ANSI;
  use Term::ANSIColor;


	print color 'bold cyan';
	system ("cls");
print "Copyright Tectrade Computers Ltd";
print color 'reset'; 
print " - StorageTools.exe \nVERSION: $software_version $released BA Client: $ba_client_type\n";
print "------------------------------------------------------------------------------\n";



if ($brocade_address ne "") {print "Switch:\t\t-> $brocade_address\nCUSTOMER:\t-> ${customer_name}\n";}


}

###########################################################################
## Subroutine:
## Name: draw_stg_heading
## Use: draw the storage heading 
###########################################################################
	
sub draw_stg_heading {
  use Win32::Console::ANSI;
  use Term::ANSIColor;


	print color 'bold green';
	system ("cls");
print "Copyright Tectrade Computers Ltd";
print color 'reset'; 
print " - StorageTools.exe \nVERSION: $software_version $released BA Client: $ba_client_type\n";
print "------------------------------------------------------------------------------\n";



if ($v7000_address ne "") {print "V7000:\t\t-> $v7000_address\nCUSTOMER:\t-> ${customer_name}\n";}


}


###########################################################################
## Subroutine:
## Name: draw_ve_heading
## Use: draw the TSM fro VE heading 
###########################################################################
	
sub draw_ve_heading {
  use Win32::Console::ANSI;
  use Term::ANSIColor;


	print color 'bold blue';
	system ("cls");
print "Copyright Tectrade Computers Ltd";
print color 'reset'; 
print " - StorageTools.exe \nVERSION: $software_version $released BA Client: $ba_client_type\n";
print "------------------------------------------------------------------------------\n";



}


###########################################################################
## Subroutine:
## Name: draw_main_heading
## Use: draw the main heading
###########################################################################
	
sub draw_main_heading {
  use Win32::Console::ANSI;
  use Term::ANSIColor;


	print color 'bold red';
	system ("cls");
print "Copyright Tectrade Computers Ltd";
print color 'reset'; 
print " - StorageTools.exe \nVERSION: $software_version $released BA Client: $ba_client_type\n";
print "------------------------------------------------------------------------------\n";



}

###########################################################################
## Subroutine:
## Name: draw_windows_heading
## Use: draw the windows heading
###########################################################################
	
sub draw_windows_heading {
  use Win32::Console::ANSI;
  use Term::ANSIColor;


	print color 'bold yellow';
	system ("cls");
print "Copyright Tectrade Computers Ltd";
print color 'reset'; 
print " - StorageTools.exe \nVERSION: $software_version $released BA Client: $ba_client_type\n";
print "------------------------------------------------------------------------------\n";

#print "USAGE:		-> StorageTools.exe -u\n";
if ($tsm_server ne "") {print "Current Server:\t\t-> ${tsm_server} (TSM v$actual_ver)\nCUSTOMER:\t-> ${customer_name}\n";}
if ($lm_server ne "") {print "Current Library Manager:\t\t-> ${lm_server}\n";}
print color 'bold magenta';
print "DOMAIN:\t\t-> ${windows_domain}\tAdmin: ${windows_admin}\tDrive Letter: \"${log_drive_letter}:\"\n\n";
print color 'reset'; 

}

###########################################################################
## Subroutine:
## Name: draw_heading
## Use: draw the normal heading
###########################################################################

sub draw_heading {
  use Win32::Console::ANSI;
  use Term::ANSIColor;


	print color 'bold magenta';
	system ("cls");
print "Copyright Tectrade Computers Ltd";
print color 'reset'; 
print " - StorageTools.exe \nVERSION: $software_version $released BA Client: $ba_client_type\n";
print "------------------------------------------------------------------------------\n";
#print "USAGE:		-> StorageTools.exe -u\n";

if ($tsm_server ne "") {print "Current Server:\t\t-> ${tsm_server} (TSM v$actual_ver)\tCUSTOMER:\t-> ${customer_name}\n";}
if ($lm_server ne "") {print "Current Library Manager:\t\t-> ${lm_server}\n";}

}

###########################################################################
## Subroutine:
## Name: get_live_data
## Use: Gets some text files for the policy infomation 
###########################################################################

sub get_live_data {
	if ($version eq "6") {
		chdir ${host_directory};
		#system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select entity,timestampdiff(16,(start_time-current_timestamp)),timestampdiff(4,(end_time-start_time)),((bytes/1024/1024)/timestampdiff(2,(end_time-start_time))) from summary where activity='BACKUP' and bytes!=0 order by 2 > ${host_directory}/backup_data.txt");
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select timestampdiff(16,(start_time-current_timestamp)),timestampdiff(2,(end_time-start_time)),examined from summary where activity='EXPIRATION' > ${host_directory}/expiration_data.txt");
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select source_name, destination_name, library_name, device, source_type  from paths where destination_type='DRIVE' > ${host_directory}/path_data_drives.txt");
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select source_name, destination_name, library_name, device from paths where destination_type='LIBRARY' > ${host_directory}/path_data_libraries.txt");
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select tcp_address,node_name,platform_name from nodes where tcp_address is not NULL and tcp_address!='127.0.0.1' order by tcp_address > ${host_directory}/host_ip_addresses.txt");
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select library_name from libraries > ${host_directory}/library_names.txt");
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select domain_name, description from domains > ${host_directory}/domains.txt");
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select domain_name, set_name, description from policysets where set_name!='ACTIVE' > ${host_directory}/policysets.txt");
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select domain_name, set_name, class_name, description from mgmtclasses where set_name!='ACTIVE' > ${host_directory}/mgmt.txt");
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select domain_name, set_name, class_name, copygroup_name, VEREXISTS, VERDELETED, RETEXTRA, RETONLY, MODE, SERIALIZATION, FREQUENCY, DESTINATION, TOC_DESTINATION from bu_copygroups where set_name!='ACTIVE' > ${host_directory}/bu_copygroups.txt");
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select domain_name, set_name, class_name, copygroup_name, retver, SERIALIZATION, DESTINATION from ar_copygroups where set_name!='ACTIVE' > ${host_directory}/ar_copygroups.txt");
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select node_name, passexp, contact, domain_name, compression, archdelete, backdelete, option_set, nodetype, max_mp_allowed, keep_mp from nodes > ${host_directory}/detailed_nodes.txt");
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select node_name from nodes > ${host_directory}/nodenames.txt");
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select optionset_name, description from cloptsets > ${host_directory}/optionsets.txt");
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select optionset_name, option_name, option_value, force, seqnumber from clientopts > ${host_directory}/options.txt");
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select  (TIMESTAMPDIFF  (16,CHAR(current_timestamp-backup_end))), node_name, filespace_name, filespace_type, filespace_id from filespaces order by 1 desc > ${host_directory}/file_spaces.txt");	
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt q script f=m > ${host_directory}/scripts.txt");
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt q sched type=admin f=m > ${host_directory}/admin_schedules.txt");
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt q sched type=client f=m > ${host_directory}/client_schedules.txt");
		system ("echo $tsm_server >> ${host_directory}/host_ip_addresses.txt");
		#system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt audit lic");
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select domain_name, set_name, class_name from mgmtclasses where defaultmc='Yes' and set_name!='ACTIVE' > ${host_directory}/defmc.txt");
		}
	elsif ($version eq "5") {
		chdir ${host_directory};
		#system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select entity,int((start_time-current_timestamp)days),int((end_time-start_time)minutes),int((bytes/1024/1024)/decimal((end_time-start_time)seconds)) from summary where activity='BACKUP' and bytes!=0 order by 2 > ${host_directory}/backup_data.txt");
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select int((start_time-current_timestamp)days),int((end_time-start_time)seconds),examined from summary where activity='EXPIRATION' > ${host_directory}/expiration_data.txt");
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select source_name, destination_name, library_name, device, source_type  from paths where destination_type='DRIVE' > ${host_directory}/path_data_drives.txt");
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select source_name, destination_name, library_name, device from paths where destination_type='LIBRARY' > ${host_directory}/path_data_libraries.txt");
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select tcp_address,node_name,platform_name from nodes where tcp_address is not NULL and tcp_address!='127.0.0.1' order by tcp_address > ${host_directory}/host_ip_addresses.txt");
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select library_name from libraries > ${host_directory}/library_names.txt");
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select domain_name, description from domains > ${host_directory}/domains.txt");
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select domain_name, set_name, description from policysets where set_name!='ACTIVE' > ${host_directory}/policysets.txt");
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select domain_name, set_name, class_name, description from mgmtclasses where set_name!='ACTIVE' > ${host_directory}/mgmt.txt");
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select domain_name, set_name, class_name, copygroup_name, VEREXISTS, VERDELETED, RETEXTRA, RETONLY, MODE, SERIALIZATION, FREQUENCY, DESTINATION, TOC_DESTINATION from bu_copygroups where set_name!='ACTIVE' > ${host_directory}/bu_copygroups.txt");
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select domain_name, set_name, class_name, copygroup_name, retver, SERIALIZATION, DESTINATION from ar_copygroups where set_name!='ACTIVE' > ${host_directory}/ar_copygroups.txt");
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select node_name, passexp, contact, domain_name, compression, archdelete, backdelete, option_set, nodetype, max_mp_allowed, keep_mp from nodes > ${host_directory}/detailed_nodes.txt");
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select node_name from nodes > ${host_directory}/nodenames.txt");
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select optionset_name, description from cloptsets > ${host_directory}/optionsets.txt");
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select optionset_name, option_name, option_value, force, seqnumber from clientopts > ${host_directory}/options.txt");	
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select cast((CURRENT_TIMESTAMP-BACKUP_END)days as decimal(8,0)), node_name, filespace_name, filespace_type, filespace_id from filespaces ORDER BY 1 desc > ${host_directory}/file_spaces.txt");
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt q script f=m > ${host_directory}/scripts.txt");
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt q sched type=admin f=m > ${host_directory}/admin_schedules.txt");
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt q sched type=client f=m > ${host_directory}/client_schedules.txt");

		system ("echo $tsm_server >> ${host_directory}/host_ip_addresses.txt");
		#system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt audit lic");
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select domain_name, set_name, class_name from mgmtclasses where defaultmc='Yes' and set_name!='ACTIVE' > ${host_directory}/defmc.txt");
		}
	else {
		print "Not a supported version of TSM or no connection to TSM!!\n";
		print "If you are sure credentials are OK, look at permissions or location of baclient directory.";
		print "Version is: $actual_ver\n\n";
		cleanup;
		system ("pause");
		}
open (FINAL_OUTPUT, "<${host_directory}/admin_schedules.txt")  or &been_an_error;
my @lines = <FINAL_OUTPUT>;
close(FINAL_OUTPUT);

my @newlines;
foreach (@lines) {
		
	$_=~s/\@ServerCmd\@//g;
	$_=~s/OBJECTS/CMD/g;
	if ($_=~ /STARTDATE/) {
	$_="STARTDATE=TODAY type=admin";
        }
	
			
   push(@newlines,$_)
}	

open(FINAL_OUTPUT, ">${host_directory}/admin_schedules.txt")  or &been_an_error;
print FINAL_OUTPUT @newlines;
close(FINAL_OUTPUT);

open (FINAL_OUTPUT, "<${host_directory}/client_schedules.txt")  or &been_an_error;
my @lines = <FINAL_OUTPUT>;
close(FINAL_OUTPUT);

my @newlines;
foreach (@lines) {
		
	if ($_=~ /STARTDATE/) {
	$_="STARTDATE=TODAY";
        }
	
			
   push(@newlines,$_)
}	

open(FINAL_OUTPUT, ">${host_directory}/client_schedules.txt")  or &been_an_error;
print FINAL_OUTPUT @newlines;
close(FINAL_OUTPUT);


}



###########################################################################
## Subroutine:
## Name: batch_collection
## Use: This is no longer in use - coordinate batch collection of docs 
###########################################################################

sub batch_collection
{
	print "You need a file batch.txt in the output directory of the form:\n";
	print "user,password,tsm server address,port\n";
	print "\n\nYou can have as many entries as you like.\n";
	$tsm_old_user=$tsm_user;
	$tsm_old_password=$tsm_password;
	$tsm_old_server=$tsm_server;
	$tsm_old_port=$tsm_port;
	
	if (-e "${host_directory}/batch.txt") {

	open (BATCH_LIST, "<${host_directory}/batch.txt") or &been_an_error;
	@creds=<BATCH_LIST>;
	foreach $line_of_file (@creds) {
	    
	($tsm_user, $tsm_password, $tsm_server, $tsm_port) = (split /,/,$line_of_file)[0,1,2,3];
	
	chomp $tsm_user;
	chomp $tsm_password;
	chomp $tsm_server;
	chomp $tsm_port;
	make_options_file;
	get_version;
	&draw_heading;	
	#######
	## HC
	#######
		print "Performing Healthcheck.\nPlease Wait - this may take some time...\n";
		get_live_data;
		$health_or_doc="healthcheck";
		if ($version == 5) {
			version_5_healthcheck;
			
		}
		elsif ($version == 6) {
			version_6_healthcheck;
			
		}
		print "Done....\n";
		get_spreadsheet_params;
		print "Making Spreadsheet....\n";
		make_spreadsheet;
		print "Done....\n";
	#######
	## DOCS
	#######
		&draw_heading;
		print "Making Documentation.\nPlease Wait - this may take some time.....\n";
		get_live_data;
		$health_or_doc="documentation";
		if ($version == 5) {
			version_5_documentation;
			
		}
		elsif ($version == 6) {
			version_6_documentation;
			
		}
		
		
		print "Done....\n";
		get_spreadsheet_params;
		print "Making Spreadsheet....\n";
		make_spreadsheet;
		print "Done....\n";
	}
	
	}
	else {
		print "\nNo Batch File Defined!\n";
		system ("pause");
	}
	
}


###########################################################################
## Subroutine:
## Name: gd_data
## Use:  Micro Healthcheck collections
###########################################################################

sub gd_data {


unlink("${host_directory}/client_code_versions.csv");
unlink("${host_directory}/gd_top_10_offenders.csv");
unlink("${host_directory}/gd_top_10_missedoffenders.csv");
unlink("${host_directory}/gd_top_10_failedoffenders.csv");
unlink("${host_directory}/gd_top_20_highestocc.csv");


our $gd_managementsummary="";


##################
### Headings
##################

print "\nProcessing the XML spreadsheet - this may take some time....\n";

open(XML_INPUT, "${host_directory}/dash_template.xml") or &been_an_error;
my @lines = <XML_INPUT>;
close(XML_INPUT);

my @newlines;
foreach(@lines) {
   $_ =~ s/xxcustomernamexx/$customer_name/g;
   $_ =~ s/xxdatexx/$datetime2/g;
   $_ =~ s/xxtoolsversionxx/$software_version/g;   
   push(@newlines,$_);
}
	
open(XML_OUTPUT, ">${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
print XML_OUTPUT @newlines;
close(XML_OUTPUT);

#### end headings ######

##################
### Non Graph
##################


#################################
### Misc Stuff
#################################

####
## General Checks
####


### Table of Values


my $gd_procc_phy = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt SELECT INT(SUM(PHYSICAL_MB/1024)) FROM OCCUPANCY WHERE STGPOOL_NAME IN (SELECT STGPOOL_NAME FROM STGPOOLS WHERE POOLTYPE='PRIMARY')");
chomp $gd_procc_phy;
my $gd_procc_log = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt SELECT INT(SUM(LOGICAL_MB/1024)) FROM OCCUPANCY WHERE STGPOOL_NAME IN (SELECT STGPOOL_NAME FROM STGPOOLS WHERE POOLTYPE='PRIMARY')");
chomp $gd_procc_log;
my $gd_procc_rep = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt SELECT INT(SUM(REPORTING_MB/1024)) FROM OCCUPANCY WHERE STGPOOL_NAME IN (SELECT STGPOOL_NAME FROM STGPOOLS WHERE POOLTYPE='PRIMARY') and NODE_NAME is not NULL");
chomp $gd_procc_rep;

my $gd_cpocc_phy = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt SELECT INT(SUM(PHYSICAL_MB/1024)) FROM OCCUPANCY WHERE STGPOOL_NAME IN (SELECT STGPOOL_NAME FROM STGPOOLS WHERE POOLTYPE='COPY')");
chomp $gd_cpocc_phy;
my $gd_cpocc_log = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt SELECT INT(SUM(LOGICAL_MB/1024)) FROM OCCUPANCY WHERE STGPOOL_NAME IN (SELECT STGPOOL_NAME FROM STGPOOLS WHERE POOLTYPE='COPY')");
chomp $gd_cpocc_log;
my $gd_cpocc_rep = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt SELECT INT(SUM(REPORTING_MB/1024)) FROM OCCUPANCY WHERE STGPOOL_NAME IN (SELECT STGPOOL_NAME FROM STGPOOLS WHERE POOLTYPE='COPY') and NODE_NAME is not NULL");
chomp $gd_cpocc_rep;


my $gd_entocc = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select (sum(o.logical_mb)/1024) from occupancy o where o.node_name is not null and o.filespace_name is not null and o.stgpool_name in ( select s.stgpool_name from stgpools s where o.stgpool_name=s.stgpool_name and s.pooltype='PRIMARY') and o.filespace_name not in ('DocAve', 'ADSM.SERVER', '') and o.filespace_id in (select f.filespace_id from filespaces f where f.filespace_id=o.filespace_id and (f.filespace_type not in ('API:TSM HSM Client for Windows', 'API:FastBack')))");
chomp $gd_entocc;

my $gd_entsaveoccded = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select  ((sum(o.reporting_mb)-sum(o.logical_mb))/1024) from occupancy o where o.node_name is not null and o.filespace_name is not null and o.stgpool_name in ( select s.stgpool_name from stgpools s where o.stgpool_name=s.stgpool_name and s.pooltype='PRIMARY') and o.filespace_name not in ('DocAve', 'ADSM.SERVER', '') and o.filespace_name in (select f.filespace_name from filespaces f where f.node_name=o.node_name and f.filespace_id=o.filespace_id and (f.filespace_type not in ('API:TSM HSM Client for Windows', 'API:FastBack')))");
chomp $gd_entsaveoccded;

my $gd_entsaveoccact = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select (sum(o.logical_mb)/1024) from occupancy o where o.node_name is not null and o.filespace_name is not null and o.stgpool_name in ( select s.stgpool_name from stgpools s where o.stgpool_name=s.stgpool_name and s.pooltype in('COPY', 'ACTIVEDATA'))");
chomp $gd_entsaveoccact;

my $gd_entsaveoccvirt = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select ((sum(o.logical_mb)/1024)) from occupancy o where o.node_name is not null and o.filespace_name is not null and o.stgpool_name in ( select s.stgpool_name from stgpools s where o.stgpool_name=s.stgpool_name and s.pooltype='PRIMARY') and o.filespace_name in ('ADSM.SERVER')");
chomp $gd_entsaveoccvirt;

my $gd_entsaveoccshare = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select ((sum(o.logical_mb)/1024)) from occupancy o where o.node_name is not null and o.filespace_name is not null and o.stgpool_name in ( select s.stgpool_name from stgpools s where o.stgpool_name=s.stgpool_name and s.pooltype='PRIMARY') and o.filespace_name in ('DocAve')");
chomp $gd_entsaveoccshare;

my $gd_entsaveoccfast = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select ((sum(o.logical_mb)/1024)) from occupancy o where o.node_name is not null and o.filespace_name is not null and o.stgpool_name in ( select s.stgpool_name from stgpools s where o.stgpool_name=s.stgpool_name and s.pooltype='PRIMARY') and o.filespace_id in (select f.filespace_id from filespaces f where f.node_name=o.node_name and f.filespace_id=o.filespace_id and (f.filespace_type in ('API:FastBack')))");
chomp $gd_entsaveoccfast;

my $gd_entsaveocchsm = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select ((sum(o.logical_mb)/1024)) from occupancy o where o.node_name is not null and o.filespace_name is not null and o.stgpool_name in ( select s.stgpool_name from stgpools s where o.stgpool_name=s.stgpool_name and s.pooltype='PRIMARY') and o.filespace_id in (select f.filespace_id from filespaces f where f.node_name=o.node_name and f.filespace_id=o.filespace_id and (f.filespace_type in ('API:TSM HSM Client for Windows')))");
chomp $gd_entsaveocchsm;

my $gd_entsaveoccothded = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select ((sum(o.logical_mb)/1024)) from occupancy o where o.stgpool_name in ( select s.stgpool_name from stgpools s where o.stgpool_name=s.stgpool_name and s.pooltype='PRIMARY') and ( o.filespace_name is NULL or o.node_name is NULL )");
chomp $gd_entsaveoccothded;

my $gd_7daybackup = `${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt "SELECT cast((float(sum(bytes))/1024/1024/1024/7) as dec(8,2)) from summary where activity='BACKUP' and end_time>current_timestamp-168 hours"`;
chomp $gd_7daybackup;
my $gd_7dayarchive = `${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt "SELECT cast((float(sum(bytes))/1024/1024/1024/7) as dec(8,2)) from summary where activity='ARCHIVE' and end_time>current_timestamp-168 hours"`;
chomp $gd_7dayarchive;

open(XML_INPUT, "${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
my @lines = <XML_INPUT>;
close(XML_INPUT);

## Process the Non Graph Settings

# xxprocc_phyxx
# xxprocc_logxx
# xxprocc_repxx
# xxcpocc_phyxx
# xxcpocc_logxx
# xxcpocc_repxx

##xxentoccxx
##xxentsaveoccdedxx
##xxentsaveoccactxx
##xxentsaveoccvirtxx
##xxentsaveoccsharexx
##xxentsaveoccfastxx
##xxentsaveocchsmxx
##xxentsaveoccothdedxx

my @newlines;
foreach(@lines) {
   $_ =~ s/xxprocc_phyxx/$gd_procc_phy/g;
   $_ =~ s/xxprocc_logxx/$gd_procc_log/g;
   $_ =~ s/xxprocc_repxx/$gd_procc_rep/g;
   $_ =~ s/xxcpocc_phyxx/$gd_cpocc_phy/g;
   $_ =~ s/xxcpocc_logxx/$gd_cpocc_log/g;
   $_ =~ s/xxcpocc_repxx/$gd_cpocc_rep/g;
   
   $_ =~ s/xxentoccxx/$gd_entocc/g;
   $_ =~ s/xxentsaveoccdedxx/$gd_entsaveoccded/g;
   $_ =~ s/xxentsaveoccactxx/$gd_entsaveoccact/g;
   $_ =~ s/xxentsaveoccvirtxx/$gd_entsaveoccvirt/g;
   $_ =~ s/xxentsaveoccsharexx/$gd_entsaveoccshare/g;
   $_ =~ s/xxentsaveoccfastxx/$gd_entsaveoccfast/g;
   $_ =~ s/xxentsaveocchsmxx/$gd_entsaveocchsm/g;
   $_ =~ s/xxentsaveoccothdedxx/$gd_entsaveoccothded/g;
   
   $_ =~ s/xxbackedupinxx/$gd_7daybackup/g;
   $_ =~ s/xxarchivedinxx/$gd_7dayarchive/g;
   push(@newlines,$_);
}
	
open(XML_OUTPUT, ">${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
print XML_OUTPUT @newlines;
close(XML_OUTPUT);


## Actlog Retention

my $gd_actlogretention = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt SELECT ACTLOGRETENTION FROM  STATUS");
chomp $gd_actlogretention;

if ($gd_actlogretention < 30) {
	$gd_actlogrecommendation="The activity log retention setting is $gd_actlogretention days which is less than the recommended 30 days. It is recommended that this setting is changed to ensure proper troubleshooting is possible";
	$gd_managementsummary="$gd_managementsummary<w:br/>- The activity log setting is too low at $gd_actlogretention days and requires increasing to 30.";}
if ($gd_actlogretention == 30) {
	$gd_actlogrecommendation="The activity log retention setting is $gd_actlogretention days which is the recommended value.";}
if ($gd_actlogretention > 30) {
	$gd_actlogrecommendation="The activity log retention setting is $gd_actlogretention days which is greater than the recommended value and preferable (higher values are good).";}
	
## Expire Interval

my $gd_expinterval = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt SELECT option_value FROM OPTIONS WHERE OPTION_NAME = 'ExpInterval'");
chomp $gd_expinterval;
#$gd_expinterval=~s/OPTION_VALUE://;

if ($gd_expinterval < 0) {
	$gd_expintervalrecommend="The expire interval is set to $gd_expinterval. The recommended value is 0 which stops automatic expiration and should be changed.";
	$gd_managementsummary="$gd_managementsummary<w:br/>- The expire interval is set to $gd_expinterval - the recommended value is 0.";}
if ($gd_expinterval == 0) {
	$gd_expintervalrecommend="The expire interval setting is $gd_expinterval hours (no auto expiration) which is the recommended value.";}

## Client Accounting

my $gd_clientaccounting = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt SELECT ACCOUNTING FROM STATUS");
chomp $gd_clientaccounting;

if ($gd_clientaccounting eq "OFF") {
	$gd_accountingrecommend="Client Accounting is OFF. It is recommended this is switched ON";
	$gd_managementsummary="$gd_managementsummary<w:br/>- Client Accounting is OFF. It is recommended this is switched ON.";}
if ($gd_clientaccounting eq "ON") {
	$gd_accountingrecommend="Client Accounting is ON. This is the recommended value.";}

## Random Access Disk Volumes

my $gd_randomaccess = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt SELECT ACCOUNTING FROM STATUS");
chomp $gd_randomaccess;

if ($gd_randomaccess == 0) {
	$gd_randomrecommend="All random access volumes are ONLINE";}
if ($gd_randomaccess > 0) {
	$gd_randomrecommend="$gd_randomaccess random access volumes are OFFLINE. This should be investigated and rectified.";
	$gd_managementsummary="$gd_managementsummary<w:br/>- $gd_randomaccess random access volumes are OFFLINE. This should be investigated and rectified.";}


## DRM Check Label

my $gd_checklabel = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt SELECT CHECKLABEL FROM DRMSTATUS");
chomp $gd_checklabel;

if ($gd_checklabel eq  "No") {
	$gd_checklrecommend="The CHECKLABEL DRM setting is set to No. This is the recommended setting.";}
if ($gd_checklabel eq "Yes") {
	$gd_checklrecommend="The CHECKLABEL DRM setting is set to Yes. This may slow down the checking out of DRM tapes. It is recommended to set this to No.";
	$gd_managementsummary="$gd_managementsummary<w:br/>- The CHECKLABEL DRM setting is set to Yes. This may slow down the checking out of DRM tapes. It is recommended to set this to No.";}

## Drives ONLINE

my $gd_drivesonline = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select count from drives where online='NO'");
chomp $gd_drivesonline;

if ($gd_drivesonline == 0) {$gd_drivesonlinerecommend="All drives are online. There may still be paths offline so check the next section.";}

if ($gd_drivesonline == 1) {$gd_drivesonlinerecommend="Warning: There is 1 drive offline. Check for drive, library or SAN issues";
$gd_managementsummary="$gd_managementsummary<w:br/>- There is 1 drive offline. Check for drive, library or SAN issues.";}

if ($gd_drivesonline > 1) {$gd_drivesonlinerecommend="Warning: There are $gd_drivesonline drives offline . Check for drive, library or SAN issues";
$gd_managementsummary="$gd_managementsummary<w:br/>- There are $gd_drivesonline drives offline . Check for drive, library or SAN issues.";}
	

## Paths ONLINE

my $gd_pathsonline = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select count from paths where online='NO'");
chomp $gd_pathsonline;

if ($gd_pathsonline == 0) {$gd_pathsonlinerecommend="All paths are online. There may still be drives offline so check the previous section.";}

if ($gd_pathsonline == 1) {$gd_pathsonlinerecommend="Warning: There is 1 path offline. Check for drive, library or SAN issues";
$gd_managementsummary="$gd_managementsummary<w:br/>- There is 1 drive offline. Check for drive, library or SAN issues.";}
if ($gd_pathsonline > 1) {$gd_pathsonlinerecommend="Warning: There are $gd_pathsonline paths offline . Check for drive, library or SAN issues";
$gd_managementsummary="$gd_managementsummary<w:br/>- There are $gd_drivesonline drives offline . Check for drive, library or SAN issues.";}
	
## Nodes Defined and Unique

my $gd_definednodes = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select count from nodes");
chomp $gd_definednodes;
my $gd_uniquenodes = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select count(unique(TCP_ADDRESS)) from nodes");
chomp $gd_uniquenodes;
## Filespaces not being backed up

my $gd_filespaces = `${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt "select count FROM FILESPACEVIEW where TIMESTAMPDIFF  (16,CHAR(current_timestamp-backup_end)) >=30"`;
chomp $gd_filespaces;

if ($gd_filespaces == 0) {$gd_filespacerecommend="All filespaces have been backed up within the last 30 days.";}
if ($gd_filespaces == 1) {$gd_filespacerecommend="Warning: 1 filespace has not been backed up within the last 30 days. Check if this filespace is required and consider deleting from TSM to save space. Modify backup setting if the filespace is active.";
$gd_managementsummary="$gd_managementsummary<w:br/>- 1 filespace has not been backed up within the last 30 days. Check if this filespace is required and consider deleting from TSM to save space. Modify backup setting if the filespace is active.";}
if ($gd_filespaces > 1) {$gd_filespacerecommend="Warning: $gd_filespaces filespaces have not been backed up within the last 30 days. Check if these filespaces are required and consider deleting them from TSM to save space. Modify backup settings if the filespaces are active.";
$gd_managementsummary="$gd_managementsummary<w:br/>- $gd_filespaces filespaces have not been backed up within the last 30 days. Check if these filespaces are required and consider deleting them from TSM to save space. Modify backup settings if the filespaces are active.";}

open(XML_INPUT, "${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
my @lines = <XML_INPUT>;
close(XML_INPUT);

## Process the Non Graph Settings

my @newlines;
foreach(@lines) {
   $_ =~ s/xxactlogretentionxx/$gd_actlogrecommendation/g;
   $_ =~ s/xxexpireintervalxx/$gd_expintervalrecommend/g;
   $_ =~ s/xxclientaccountingxx/$gd_accountingrecommend/g;
   $_ =~ s/xxrandomaccessdiskvolumesxx/$gd_randomrecommend/g;
   $_ =~ s/xxdrmchecklabelxx/$gd_checklrecommend/g;
   $_ =~ s/xxdrivesonlinexx/$gd_drivesonlinerecommend/g;
   $_ =~ s/xxpathsonlinexx/$gd_pathsonlinerecommend/g;
   $_ =~ s/xxfilespacesnotbackedupxx/$gd_filespacerecommend/g;
   $_ =~ s/xxnodesdefinedxx/$gd_definednodes/g;
   $_ =~ s/xxnodesuniquexx/$gd_uniquenodes/g;
   
   
   push(@newlines,$_);
}
	
open(XML_OUTPUT, ">${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
print XML_OUTPUT @newlines;
close(XML_OUTPUT);




## Database
my $gd_numdatabasebackups = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt  select count from volhistory where type='BACKUPFULL'");
chomp $gd_numdatabasebackups;
our $gd_drmdbstatus = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt  select dbbexpiredays from drmstatus");
chomp $gd_drmdbstatus;
my $gd_drmdb24hours = `${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt  "select count from volhistory where type='BACKUPFULL' and date_time>current_timestamp-24 hours"`;
chomp $gd_drmdb24hours;

if ($gd_numdatabasebackups =~ m/ANR2940E/) {
	$gd_numdatabasebackups=0;
}

if ($gd_numdatabasebackups == 0 ) {
	$gd_numdbrecommendation="WARNING! There are no database backups currently. The ability to recover TSM is a disaster is currently severely compromised";
	$gd_managementsummary="$gd_managementsummary<w:br/>-  There are no no TSM database backups currently. This will make DR recovery impossible.";
}
else {
	if ($gd_numdatabasebackups < $gd_drmdbstatus && $gd_drmdbstatus >= 5 && $gd_numdatabasebackups != 0) {
		$gd_numdbrecommendation="The number of database backups is less than the required $gd_drmdbstatus. This suggests there is an issue with the db backup process.";
		$gd_managementsummary="$gd_managementsummary<w:br/>-  There are not enough TSM database backups at present.";
	}
	if ($gd_drmdbstatus < 5) {
		$gd_numdbrecommendation="The number of database backups that is required to be kept through the DRMSTATUS setting is too low at $gd_drmdbstatus. It should be set to a minimum of 5.";
	        $gd_managementsummary="$gd_managementsummary<w:br/>-  The DRMSTATUS is too low at $gd_drmdbstatus - this should be set at least 5 for DR recovery.";
	}

	if ($gd_numdatabasebackups > $gd_drmdbstatus && $gd_drmdbstatus >= 5) {
		$gd_numdbrecommendation="The number of database backups that is being kept ($gd_numdatabasebackups) is higher than that required to be kept through the DRMSTATUS setting ($gd_drmdbstatus). This should be investigated.";
		$gd_managementsummary="$gd_managementsummary<w:br/>-  There are more TSM database backups being kept than the DRMSTATUS would suggest. This may need investigating.";
	}
}

if ($gd_drmdb24hours == 0 ) { $gd_db24hoursrecommendation="There were no database backups within the last 24 hours. This is a risk and should be rectified by running a backup as soon as possible.";
$gd_managementsummary="$gd_managementsummary<w:br/>-  There were no TSM database backups within the last 24 hours.";
}
else {$gd_db24hoursrecommendation="";}


## Sessions

my $gd_maxschedsessions = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt  select MAXSCHEDSESSIONS from status");chomp $gd_maxschedsessions;

## Scratch Tape Warnings

my $gd_numscratchwarnings = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt  select count from actlog where (msgno='0692' or msgno='1403' or msgno='1404' or msgno='1405' or msgno='1407' or msgno='3516' or msgno='4583' or msgno='6984' or msgno='8945') ");
chomp $gd_numscratchwarnings;

if ($gd_numscratchwarnings == 0) { $gd_scratchrecommendations="There have been no warnings about lack of scratch tapes using analysis of the most common messages over the period of the activity log retention. If the administrator knows otherwise then more scratch should be freed up or added.";}
else { $gd_scratchrecommendations="There have been $gd_numscratchwarnings warnings about lack of scratch tapes in this environment using analysis of the most common messages over the period of the activity log retention. Action should be taken to make more scratch media available and reclamation and drm procedures should be reviewed. The maxscratch settings should be reviewed.";
$gd_managementsummary="$gd_managementsummary<w:br/>-  There have been warnings for scratch tapes. Review the number of tapes available and the maxscratch setting on the storage pools.";
}
## Code Level

my $gd_tsmcodelevel = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt  select version,release,level,sublevel from status");
chomp $gd_tsmcodelevel;
($gd_tsm_version,$gd_tsm_release,$gd_tsm_level,$gd_tsm_sublevel ) = (split /,/,$gd_tsmcodelevel)[0,1,2,3];
$gd_tsmcodelevel=~s/,/./g;

if ($gd_tsm_version < 7) {
	$gd_tsmcoderecommendation="The TSM code level is at version $gd_tsmcodelevel. Version $gd_tsm_version.x is no longer supported by IBM and an upgrade to the latest version of Spectrum Protect 7 or 8 is recommended.";
	$gd_managementsummary="$gd_managementsummary<w:br/>-  $gd_tsmcoderecommendation";
}

# if ($gd_tsm_version == 6 && $gd_tsm_release <= 1) {
	# $gd_tsmcoderecommendation="The TSM code level is at version $gd_tsmcodelevel. Version $gd_tsm_version.$gd_tsm_release.x.x is no longer supported by IBM (30 Apr 2014) and an upgrade to the latest version of 6 or 7 is recommended.";
	# $gd_managementsummary="$gd_managementsummary<w:br/>-  $gd_tsmcoderecommendation";
# }

# if ($gd_tsm_version == 6 && $gd_tsm_release == 2) {
	# $gd_tsmcoderecommendation="The TSM code level is at version $gd_tsmcodelevel. Version $gd_tsm_version.$gd_tsm_release.x.x is currently supported until 30 Apr 2015. An upgrade to a newer version should be planned for.";
	# $gd_managementsummary="$gd_managementsummary<w:br/>-  $gd_tsmcoderecommendation";
# }

# if ($gd_tsm_version == 6 && $gd_tsm_release > 2) {
	# $gd_tsmcoderecommendation="The TSM code level is at version $gd_tsmcodelevel. Version $gd_tsm_version.$gd_tsm_release.x.x is currently supported by IBM and no action is required, although keeping up to date with TSM server code levels is always recommended.";
	# $gd_managementsummary="$gd_managementsummary<w:br/>-  $gd_tsmcoderecommendation";
# }

if ($gd_tsm_version == 7  ) {
	$gd_tsmcoderecommendation="The TSM code level is at version $gd_tsmcodelevel. Version $gd_tsm_version.$gd_tsm_release.x.x is currently supported by IBM and no action is required, although keeping up to date with TSM server code levels is always recommended.";
	$gd_managementsummary="$gd_managementsummary<w:br/>-  $gd_tsmcoderecommendation";}


if ($gd_tsm_version == 8  ) {
	$gd_tsmcoderecommendation="The Spectrum Protect code level is at version $gd_tsmcodelevel. Version $gd_tsm_version.$gd_tsm_release.x.x is currently supported by IBM and no action is required, although keeping up to date with TSM server code levels is always recommended.";
	$gd_managementsummary="$gd_managementsummary<w:br/>-  $gd_tsmcoderecommendation";}
	
	if ($gd_tsm_version == 9  ) {
	$gd_tsmcoderecommendation="The Spectrum Protect code level is at version $gd_tsmcodelevel. Version $gd_tsm_version.$gd_tsm_release.x.x is currently supported by IBM and no action is required, although keeping up to date with TSM server code levels is always recommended.";
	$gd_managementsummary="$gd_managementsummary<w:br/>-  $gd_tsmcoderecommendation";}
	
## Tape Mounts


$gd_numberoftapedrives = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt  select count from drives");
chomp $gd_numberoftapedrives;

if ($gd_numberoftapedrives!=0) {
our $gd_totalmounttimeinminutes=`${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt  "select sum((end_time-start_time)minutes) from summary where activity='TAPE MOUNT' and start_time>current_timestamp-168 hours"`;
chomp $gd_totalmounttimeinminutes;

$gd_totalmountpercent=int(($gd_totalmounttimeinminutes/($gd_numberoftapedrives*10080))*100);

if ($gd_totalmountpercent < 50 ) {
	$gd_tapemountrecommendation="Drive utilisation is good at less than 50%. There are no recommendations here.";
}
if ($gd_totalmountpercent >= 50 && $gd_totalmountpercent < 75 ) {
	$gd_tapemountrecommendation="Drive utilisation is high at $gd_totalmountpercent. More drives may be required, however the utilisation of any disk pools or other client processes like HSM may need investigating.";
	$gd_managementsummary="$gd_managementsummary<w:br/>- $gd_tapemountrecommendation";
}
if ($gd_totalmountpercent >= 75) {
	$gd_tapemountrecommendation="Drive utilisation is extremely high at $gd_totalmountpercent. More drives will almost certainly be required if the current utilisation is typical. The utilisation of any disk pools or other client processes like HSM may need investigating.";
	$gd_managementsummary="$gd_managementsummary<w:br/>- $gd_tapemountrecommendation";
}

if ($gd_numberoftapedrives <= 2 ) {
	$gd_tapemountrecommendation="$gd_tapemountrecommendation. The number of drives is low at $gd_numberoftapedrives. Further analysis may be required as to whether this is enough mount points.";
	$gd_managementsummary="$gd_managementsummary<w:br/>- $gd_tapemountrecommendation";
}
}

else {
	$gd_tapemountrecommendation="======= There are no drives controlled by this instance - THE INFORMATION IN THIS SECTION CAN BE DELETED =======";
}
## End tape drives

open(XML_INPUT, "${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
my @lines = <XML_INPUT>;
close(XML_INPUT);

## Process the Non Graph Settings

my @newlines;
foreach(@lines) {
   $_ =~ s/xxdbbackupsxx/$gd_numdatabasebackups/g;
   $_ =~ s/xxdbdrmstatusxx/$gd_drmdbstatus/g;
   $_ =~ s/xxdbdrmrecommendationxx/$gd_numdbrecommendation/g; 
   $_ =~ s/xxdb24hournumxx/$gd_drmdb24hours/g;
   $_ =~ s/xxdb24hourrecommendationxx/$gd_db24hoursrecommendation/g;
   $_ =~ s/xxtsmcodeversionxx/$gd_tsmcodelevel/g;
   $_ =~ s/xxtsmcoderecommendationxx/$gd_tsmcoderecommendation/g;
   $_ =~ s/xxdrivenumbersxx/$gd_numberoftapedrives/g;
   $_ =~ s/xxdrivetotalmounttimexx/$gd_totalmounttimeinminutes/g;
   $_ =~ s/xxdriveoverallpercentagexx/$gd_totalmountpercent/g;
   $_ =~ s/xxdriverecommendationxx/$gd_tapemountrecommendation/g;
   $_ =~ s/xxmaxschedsessionssettingxx/$gd_maxschedsessions/g;
   $_ =~ s/xxhastherebeenascratchwarningxx/$gd_scratchrecommendations/g;
   
   push(@newlines,$_);
}
	
open(XML_OUTPUT, ">${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
print XML_OUTPUT @newlines;
close(XML_OUTPUT);


#################################
### Specific Stuff
#################################


### Client Code Levels

system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select client_version,count from nodes where client_version is not NULL group by client_version >> ${host_directory}/client_code_versions.csv");
open(BESPOKE_INPUT, "${host_directory}/client_code_versions.csv") or &been_an_error;
my @fail_lines = <BESPOKE_INPUT>;
close(BESPOKE_INPUT);
$count=0;
foreach $element (@fail_lines) {
              
              	
	      chomp $element;
	     ($gd_client_level,$gd_client_number ) = (split /,/,$element)[0,1];
              chomp $gd_client_level;
              chomp $gd_client_number;
              if ($gd_client_level<=6){ $gd_clientlevelrecommendation="There are unsupported client levels at version 5 or earlier. These should be upgraded as soon as is practical.";
              $gd_managementsummary="$gd_managementsummary<w:br/>- $gd_clientlevelrecommendation";
              }
              else { $gd_clientlevelrecommendation="There are no unsupported clients in the environment at present. This situation is ideal and requires no remedial action.";}
              ######
              open(XML_INPUT, "${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
	      my @lines = <XML_INPUT>;
              close(XML_INPUT);



## Process the Non Graph Settings

my @newlines;
foreach(@lines) {
   $_ =~ s/xxclientcoderecommendationxx/$gd_clientlevelrecommendation/g;
   push(@newlines,$_);
}
	
open(XML_OUTPUT, ">${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
print XML_OUTPUT @newlines;
close(XML_OUTPUT);
           

}

close (BESPOKE_INPUT);

## End 


### Start replication
## Note - this is a good template for table based queries of unknown length
###
system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -tabdelimited -optfile=${host_directory}dsm_custom.opt q replnode * >> ${host_directory}/gd_replnode.csv");
open(BESPOKE_INPUT, "${host_directory}/gd_replnode.csv") or &been_an_error;
my @fail_lines = <BESPOKE_INPUT>;
close(BESPOKE_INPUT);
$gd_repfinal="<w:tbl><w:tblPr><w:tblStyle w:val=\"TableGrid\"/><w:tblW w:w=\"10065\" w:type=\"dxa\"/><w:tblInd w:w=\"-34\" w:type=\"dxa\"/><w:tblLayout w:type=\"fixed\"/><w:tblLook w:val=\"04A0\" w:firstRow=\"1\" w:lastRow=\"0\" w:firstColumn=\"1\" w:lastColumn=\"0\" w:noHBand=\"0\" w:noVBand=\"1\"/></w:tblPr><w:tblGrid><w:gridCol w:w=\"1276\"/><w:gridCol w:w=\"1134\"/><w:gridCol w:w=\"2694\"/><w:gridCol w:w=\"1134\"/><w:gridCol w:w=\"1701\"/><w:gridCol w:w=\"1275\"/><w:gridCol w:w=\"851\"/></w:tblGrid><w:tr w:rsidR=\"00FD61F5\" w:rsidRPr=\"008A1085\" w:rsidTr=\"00FD61F5\"><w:tc><w:tcPr><w:tcW w:w=\"1276\" w:type=\"dxa\"/><w:shd w:val=\"clear\" w:color=\"auto\" w:fill=\"808080\" w:themeFill=\"background1\" w:themeFillShade=\"80\"/></w:tcPr><w:p w:rsidR=\"00FD61F5\" w:rsidRPr=\"008A1085\" w:rsidRDefault=\"00FD61F5\" w:rsidP=\"00E50147\"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr><w:r><w:rPr><w:b/></w:rPr><w:t>Node Name</w:t></w:r></w:p></w:tc><w:tc><w:tcPr><w:tcW w:w=\"1134\" w:type=\"dxa\"/><w:shd w:val=\"clear\" w:color=\"auto\" w:fill=\"808080\" w:themeFill=\"background1\" w:themeFillShade=\"80\"/></w:tcPr><w:p w:rsidR=\"00FD61F5\" w:rsidRPr=\"008A1085\" w:rsidRDefault=\"00FD61F5\" w:rsidP=\"00E50147\"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr><w:r><w:rPr><w:b/></w:rPr><w:t>Type</w:t></w:r></w:p></w:tc><w:tc><w:tcPr><w:tcW w:w=\"2694\" w:type=\"dxa\"/><w:shd w:val=\"clear\" w:color=\"auto\" w:fill=\"808080\" w:themeFill=\"background1\" w:themeFillShade=\"80\"/></w:tcPr><w:p w:rsidR=\"00FD61F5\" w:rsidRPr=\"008A1085\" w:rsidRDefault=\"00FD61F5\" w:rsidP=\"00E50147\"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr><w:r><w:rPr><w:b/></w:rPr><w:t>Filesystem</w:t></w:r></w:p></w:tc><w:tc><w:tcPr><w:tcW w:w=\"1134\" w:type=\"dxa\"/><w:shd w:val=\"clear\" w:color=\"auto\" w:fill=\"808080\" w:themeFill=\"background1\" w:themeFillShade=\"80\"/></w:tcPr><w:p w:rsidR=\"00FD61F5\" w:rsidRPr=\"008A1085\" w:rsidRDefault=\"00FD61F5\" w:rsidP=\"00E50147\"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr><w:r><w:rPr><w:b/></w:rPr><w:t>Files Local</w:t></w:r></w:p></w:tc><w:tc><w:tcPr><w:tcW w:w=\"1701\" w:type=\"dxa\"/><w:shd w:val=\"clear\" w:color=\"auto\" w:fill=\"808080\" w:themeFill=\"background1\" w:themeFillShade=\"80\"/></w:tcPr><w:p w:rsidR=\"00FD61F5\" w:rsidRPr=\"008A1085\" w:rsidRDefault=\"00FD61F5\" w:rsidP=\"00E50147\"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr><w:r><w:rPr><w:b/></w:rPr><w:t>Remote Server</w:t></w:r></w:p></w:tc><w:tc><w:tcPr><w:tcW w:w=\"1275\" w:type=\"dxa\"/><w:shd w:val=\"clear\" w:color=\"auto\" w:fill=\"808080\" w:themeFill=\"background1\" w:themeFillShade=\"80\"/></w:tcPr><w:p w:rsidR=\"00FD61F5\" w:rsidRPr=\"008A1085\" w:rsidRDefault=\"00FD61F5\" w:rsidP=\"00E50147\"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr><w:r><w:rPr><w:b/></w:rPr><w:t>Files Remote</w:t></w:r></w:p></w:tc><w:tc><w:tcPr><w:tcW w:w=\"851\" w:type=\"dxa\"/><w:shd w:val=\"clear\" w:color=\"auto\" w:fill=\"808080\" w:themeFill=\"background1\" w:themeFillShade=\"80\"/></w:tcPr><w:p w:rsidR=\"00FD61F5\" w:rsidRDefault=\"001C3E63\" w:rsidP=\"00E50147\"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr><w:r><w:rPr><w:b/></w:rPr><w:t>Diff</w:t></w:r></w:p></w:tc></w:tr>";

foreach $element (@fail_lines) {

              	
	      chomp $element;
	      $element =~ s/\"//g;
	      $element =~ s/,//g;
	      if ($element =~ /ANR1701E QUERY REPLNODE/) {
	      	$gd_repfinal="THERE ARE NO REPLICATING NODES - REMOVE THIS SECTION!";
	      	$gd_tableend="";
	      	last;
	      	
	      }
	      else {
	      
	     ($rep_node, $rep_type, $rep_fsname, $rep_fsid, $rep_fileonsource, $rep_destserver, $rep_filesondest) = (split /\t/,$element)[0,1,2,3,4,5,6];
              chomp $rep_node;
              chomp $rep_type;
              chomp $rep_fsname;
              chomp $rep_fsid;
              chomp $rep_fileonsource;
              chomp $rep_destserver;
              chomp $rep_filesondest;
              $rep_diff=$rep_fileonsource-$rep_filesondest;
              if ($rep_filesondest == "") {
              $rep_filesondest="NO FILES";
              }
              
              if ($rep_fileonsource == "") {
              $rep_fileonsource="NO FILES";
              }
              
              
              
              $gd_reprow="<w:tr w:rsidR=\"00FD61F5\" w:rsidTr=\"00FD61F5\"><w:tc><w:tcPr><w:tcW w:w=\"1276\" w:type=\"dxa\"/></w:tcPr><w:p w:rsidR=\"00FD61F5\" w:rsidRPr=\"00B7233F\" w:rsidRDefault=\"00FD61F5\" w:rsidP=\"00E50147\"><w:pPr><w:rPr><w:sz w:val=\"18\"/><w:szCs w:val=\"18\"/></w:rPr></w:pPr><w:proofErr w:type=\"spellStart\"/><w:r w:rsidRPr=\"00B7233F\"><w:rPr><w:sz w:val=\"18\"/><w:szCs w:val=\"18\"/></w:rPr><w:t>$rep_node</w:t></w:r><w:proofErr w:type=\"spellEnd\"/></w:p></w:tc><w:tc><w:tcPr><w:tcW w:w=\"1134\" w:type=\"dxa\"/></w:tcPr><w:p w:rsidR=\"00FD61F5\" w:rsidRPr=\"00B7233F\" w:rsidRDefault=\"00FD61F5\" w:rsidP=\"00E50147\"><w:pPr><w:rPr><w:sz w:val=\"18\"/><w:szCs w:val=\"18\"/></w:rPr></w:pPr><w:proofErr w:type=\"spellStart\"/><w:r w:rsidRPr=\"00B7233F\"><w:rPr><w:sz w:val=\"18\"/><w:szCs w:val=\"18\"/></w:rPr><w:t>$rep_type</w:t></w:r><w:proofErr w:type=\"spellEnd\"/></w:p></w:tc><w:tc><w:tcPr><w:tcW w:w=\"2694\" w:type=\"dxa\"/></w:tcPr><w:p w:rsidR=\"00FD61F5\" w:rsidRPr=\"00B7233F\" w:rsidRDefault=\"00FD61F5\" w:rsidP=\"00E50147\"><w:pPr><w:rPr><w:sz w:val=\"18\"/><w:szCs w:val=\"18\"/></w:rPr></w:pPr><w:proofErr w:type=\"spellStart\"/><w:r w:rsidRPr=\"00B7233F\"><w:rPr><w:sz w:val=\"18\"/><w:szCs w:val=\"18\"/></w:rPr><w:t>$rep_fsname</w:t></w:r><w:proofErr w:type=\"spellEnd\"/></w:p></w:tc><w:tc><w:tcPr><w:tcW w:w=\"1134\" w:type=\"dxa\"/></w:tcPr><w:p w:rsidR=\"00FD61F5\" w:rsidRPr=\"00B7233F\" w:rsidRDefault=\"00FD61F5\" w:rsidP=\"00E50147\"><w:pPr><w:rPr><w:sz w:val=\"18\"/><w:szCs w:val=\"18\"/></w:rPr></w:pPr><w:proofErr w:type=\"spellStart\"/><w:r w:rsidRPr=\"00B7233F\"><w:rPr><w:sz w:val=\"18\"/><w:szCs w:val=\"18\"/></w:rPr><w:t>$rep_fileonsource</w:t></w:r><w:proofErr w:type=\"spellEnd\"/></w:p></w:tc><w:tc><w:tcPr><w:tcW w:w=\"1701\" w:type=\"dxa\"/></w:tcPr><w:p w:rsidR=\"00FD61F5\" w:rsidRPr=\"00B7233F\" w:rsidRDefault=\"00FD61F5\" w:rsidP=\"00E50147\"><w:pPr><w:rPr><w:sz w:val=\"18\"/><w:szCs w:val=\"18\"/></w:rPr></w:pPr><w:proofErr w:type=\"spellStart\"/><w:r w:rsidRPr=\"00B7233F\"><w:rPr><w:sz w:val=\"18\"/><w:szCs w:val=\"18\"/></w:rPr><w:t>$rep_destserver</w:t></w:r><w:proofErr w:type=\"spellEnd\"/></w:p></w:tc><w:tc><w:tcPr><w:tcW w:w=\"1275\" w:type=\"dxa\"/></w:tcPr><w:p w:rsidR=\"00FD61F5\" w:rsidRPr=\"00B7233F\" w:rsidRDefault=\"00FD61F5\" w:rsidP=\"00E50147\"><w:pPr><w:rPr><w:sz w:val=\"18\"/><w:szCs w:val=\"18\"/></w:rPr></w:pPr><w:proofErr w:type=\"spellStart\"/><w:r w:rsidRPr=\"00B7233F\"><w:rPr><w:sz w:val=\"18\"/><w:szCs w:val=\"18\"/></w:rPr><w:t>$rep_filesondest</w:t></w:r><w:proofErr w:type=\"spellEnd\"/></w:p></w:tc><w:tc><w:tcPr><w:tcW w:w=\"851\" w:type=\"dxa\"/></w:tcPr><w:p w:rsidR=\"00FD61F5\" w:rsidRPr=\"00B7233F\" w:rsidRDefault=\"002E6E25\" w:rsidP=\"00E50147\"><w:pPr><w:rPr><w:sz w:val=\"18\"/><w:szCs w:val=\"18\"/></w:rPr></w:pPr><w:r><w:rPr><w:sz w:val=\"18\"/><w:szCs w:val=\"18\"/></w:rPr><w:t>$rep_diff</w:t></w:r><w:bookmarkStart w:id=\"0\" w:name=\"_GoBack\"/><w:bookmarkEnd w:id=\"0\"/></w:p></w:tc></w:tr>";
              $gd_repfinal=join "",$gd_repfinal,$gd_reprow;
              $gd_tableend="</w:tbl>";
              
	      
              ######
              }


}




$gd_repfinal=join "",$gd_repfinal,$gd_tableend;


              open(XML_INPUT, "${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
	      my @lines = <XML_INPUT>;
              close(XML_INPUT);



## Process the Non Graph Settings

my @newlines;
foreach(@lines) {
   $_ =~ s/xxnodereplicationsummaryxx/$gd_repfinal/g;
   
   push(@newlines,$_);
}
	
open(XML_OUTPUT, ">${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
print XML_OUTPUT @newlines;
close(XML_OUTPUT);
              ######
              
close (BESPOKE_INPUT);


## End replication


## Start Processor

system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -tabdelimited -optfile=${host_directory}dsm_custom.opt select proc_vendor, proc_brand, proc_model, sum(proc_count), sum(pvu) from PVUESTIMATE_DETAILS group by proc_vendor, proc_brand, proc_model >> ${host_directory}/gd_proc.csv");

open(BESPOKE_INPUT, "${host_directory}/gd_proc.csv") or &been_an_error;
my @fail_lines = <BESPOKE_INPUT>;
close(BESPOKE_INPUT);
$gd_procfinal="<w:tbl><w:tblPr><w:tblStyle w:val=\"TableGrid\"/><w:tblW w:w=\"9640\" w:type=\"dxa\"/><w:tblInd w:w=\"-34\" w:type=\"dxa\"/><w:tblLayout w:type=\"fixed\"/><w:tblLook w:val=\"04A0\" w:firstRow=\"1\" w:lastRow=\"0\" w:firstColumn=\"1\" w:lastColumn=\"0\" w:noHBand=\"0\" w:noVBand=\"1\"/></w:tblPr><w:tblGrid><w:gridCol w:w=\"1560\"/><w:gridCol w:w=\"1984\"/><w:gridCol w:w=\"2127\"/><w:gridCol w:w=\"1984\"/><w:gridCol w:w=\"1985\"/></w:tblGrid><w:tr w:rsidR=\"004E5004\" w:rsidRPr=\"008A1085\" w:rsidTr=\"004E5004\"><w:tc><w:tcPr><w:tcW w:w=\"1560\" w:type=\"dxa\"/><w:shd w:val=\"clear\" w:color=\"auto\" w:fill=\"808080\" w:themeFill=\"background1\" w:themeFillShade=\"80\"/></w:tcPr><w:p w:rsidR=\"004E5004\" w:rsidRPr=\"008A1085\" w:rsidRDefault=\"004E5004\" w:rsidP=\"00E50147\"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr><w:r><w:rPr><w:b/></w:rPr><w:t>Vendor</w:t></w:r></w:p></w:tc><w:tc><w:tcPr><w:tcW w:w=\"1984\" w:type=\"dxa\"/><w:shd w:val=\"clear\" w:color=\"auto\" w:fill=\"808080\" w:themeFill=\"background1\" w:themeFillShade=\"80\"/></w:tcPr><w:p w:rsidR=\"004E5004\" w:rsidRPr=\"008A1085\" w:rsidRDefault=\"004E5004\" w:rsidP=\"00E50147\"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr><w:r><w:rPr><w:b/></w:rPr><w:t>Brand</w:t></w:r></w:p></w:tc><w:tc><w:tcPr><w:tcW w:w=\"2127\" w:type=\"dxa\"/><w:shd w:val=\"clear\" w:color=\"auto\" w:fill=\"808080\" w:themeFill=\"background1\" w:themeFillShade=\"80\"/></w:tcPr><w:p w:rsidR=\"004E5004\" w:rsidRPr=\"008A1085\" w:rsidRDefault=\"004E5004\" w:rsidP=\"00E50147\"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr><w:r><w:rPr><w:b/></w:rPr><w:t>Model</w:t></w:r></w:p></w:tc><w:tc><w:tcPr><w:tcW w:w=\"1984\" w:type=\"dxa\"/><w:shd w:val=\"clear\" w:color=\"auto\" w:fill=\"808080\" w:themeFill=\"background1\" w:themeFillShade=\"80\"/></w:tcPr><w:p w:rsidR=\"004E5004\" w:rsidRPr=\"008A1085\" w:rsidRDefault=\"004E5004\" w:rsidP=\"00E50147\"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr><w:r><w:rPr><w:b/></w:rPr><w:t>Total Processors</w:t></w:r></w:p></w:tc><w:tc><w:tcPr><w:tcW w:w=\"1985\" w:type=\"dxa\"/><w:shd w:val=\"clear\" w:color=\"auto\" w:fill=\"808080\" w:themeFill=\"background1\" w:themeFillShade=\"80\"/></w:tcPr><w:p w:rsidR=\"004E5004\" w:rsidRPr=\"008A1085\" w:rsidRDefault=\"004E5004\" w:rsidP=\"00E50147\"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr><w:r><w:rPr><w:b/></w:rPr><w:t>Total PVU</w:t></w:r></w:p></w:tc></w:tr>";

foreach $element (@fail_lines) {

              	
	      chomp $element;
	      $element =~ s/\"//g;
	      $element =~ s/,//g;
	      if ($element =~ /ANR/ || $element =~ /ANS/) {
	      	$gd_procfinal="THERE IS NO PROCESSOR INFORMATION AVAILABLE - REMOVE THIS SECTION!";
	      	$gd_tableend="";
	      	last;
	      	
	      }
	      else {
	      
	     ($proc_vendor, $proc_brand, $proc_model, $proc_count, $proc_pvu) = (split /\t/,$element)[0,1,2,3,4];
              chomp $proc_vendor;
              chomp $proc_brand;
              chomp $proc_model;
              chomp $proc_count;
              chomp $proc_pvu;
                          
              
              $gd_procrow="<w:tr w:rsidR=\"004E5004\" w:rsidTr=\"004E5004\"><w:tc><w:tcPr><w:tcW w:w=\"1560\" w:type=\"dxa\"/></w:tcPr><w:p w:rsidR=\"004E5004\" w:rsidRPr=\"00B7233F\" w:rsidRDefault=\"004E5004\" w:rsidP=\"00E50147\"><w:pPr><w:rPr><w:sz w:val=\"18\"/><w:szCs w:val=\"18\"/></w:rPr></w:pPr><w:proofErr w:type=\"spellStart\"/><w:r w:rsidRPr=\"004E5004\"><w:rPr><w:sz w:val=\"18\"/><w:szCs w:val=\"18\"/></w:rPr><w:t>$proc_vendor</w:t></w:r><w:proofErr w:type=\"spellEnd\"/></w:p></w:tc><w:tc><w:tcPr><w:tcW w:w=\"1984\" w:type=\"dxa\"/></w:tcPr><w:p w:rsidR=\"004E5004\" w:rsidRPr=\"00B7233F\" w:rsidRDefault=\"004E5004\" w:rsidP=\"00E50147\"><w:pPr><w:rPr><w:sz w:val=\"18\"/><w:szCs w:val=\"18\"/></w:rPr></w:pPr><w:proofErr w:type=\"spellStart\"/><w:r w:rsidRPr=\"004E5004\"><w:rPr><w:sz w:val=\"18\"/><w:szCs w:val=\"18\"/></w:rPr><w:t>$proc_brand</w:t></w:r><w:proofErr w:type=\"spellEnd\"/></w:p></w:tc><w:tc><w:tcPr><w:tcW w:w=\"2127\" w:type=\"dxa\"/></w:tcPr><w:p w:rsidR=\"004E5004\" w:rsidRPr=\"00B7233F\" w:rsidRDefault=\"004E5004\" w:rsidP=\"00E50147\"><w:pPr><w:rPr><w:sz w:val=\"18\"/><w:szCs w:val=\"18\"/></w:rPr></w:pPr><w:proofErr w:type=\"spellStart\"/><w:r w:rsidRPr=\"004E5004\"><w:rPr><w:sz w:val=\"18\"/><w:szCs w:val=\"18\"/></w:rPr><w:t>$proc_model</w:t></w:r><w:proofErr w:type=\"spellEnd\"/></w:p></w:tc><w:tc><w:tcPr><w:tcW w:w=\"1984\" w:type=\"dxa\"/></w:tcPr><w:p w:rsidR=\"004E5004\" w:rsidRPr=\"00B7233F\" w:rsidRDefault=\"004E5004\" w:rsidP=\"00E50147\"><w:pPr><w:rPr><w:sz w:val=\"18\"/><w:szCs w:val=\"18\"/></w:rPr></w:pPr><w:proofErr w:type=\"spellStart\"/><w:r w:rsidRPr=\"004E5004\"><w:rPr><w:sz w:val=\"18\"/><w:szCs w:val=\"18\"/></w:rPr><w:t>$proc_count</w:t></w:r><w:proofErr w:type=\"spellEnd\"/></w:p></w:tc><w:tc><w:tcPr><w:tcW w:w=\"1985\" w:type=\"dxa\"/></w:tcPr><w:p w:rsidR=\"004E5004\" w:rsidRPr=\"00B7233F\" w:rsidRDefault=\"004E5004\" w:rsidP=\"00E50147\"><w:pPr><w:rPr><w:sz w:val=\"18\"/><w:szCs w:val=\"18\"/></w:rPr></w:pPr><w:proofErr w:type=\"spellStart\"/><w:r w:rsidRPr=\"004E5004\"><w:rPr><w:sz w:val=\"18\"/><w:szCs w:val=\"18\"/></w:rPr><w:t>$proc_pvu</w:t></w:r><w:proofErr w:type=\"spellEnd\"/></w:p></w:tc></w:tr>";
              
              $gd_procfinal=join "",$gd_procfinal,$gd_procrow;
              $gd_tableend="</w:tbl>";
	      
              ######
              }


}




$gd_procfinal=join "",$gd_procfinal,$gd_tableend;


              open(XML_INPUT, "${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
	      my @lines = <XML_INPUT>;
              close(XML_INPUT);



## Process the Non Graph Settings

my @newlines;
foreach(@lines) {
   $_ =~ s/xxprocessorsummaryxx/$gd_procfinal/g;
   
   push(@newlines,$_);
}
	
open(XML_OUTPUT, ">${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
print XML_OUTPUT @newlines;
close(XML_OUTPUT);
              ######
              
close (BESPOKE_INPUT);



### End Processor

### Start Performance


# @commands = (
	# ["\"SELECT date(start_time),activity, CAST(bytes/1024/1024 AS DEC(18,2)), processes,cast((CAST(bytes/1024/1024 AS DEC(18,2))/(TIMESTAMPDIFF(2,CHAR(end_time-start_time)))) AS dec (18,5)) FROM summary WHERE  bytes!=0 and end_time!=start_time and (start_time >= current_timestamp-168 hours) and activity !='IDENTIFY' and activity !='BACKUP' and activity !='ARCHIVE' and activity !='RESTORE' and activity !='RETRIEVE' and CAST(bytes/1024/1024 AS DEC(18,2)) !='0.00' order by 5 desc\""],
		
	    # );
# system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -tabdelimited -optfile=${host_directory}dsm_custom.opt $commands[0][0] > ${host_directory}/gd_perf.csv");	    
# open(BESPOKE_INPUT, "${host_directory}/gd_perf.csv") or &been_an_error;
# my @fail_lines = <BESPOKE_INPUT>;
# close(BESPOKE_INPUT);
# $gd_perffinal="<w:tbl><w:tblPr><w:tblStyle w:val=\"TableGrid\"/><w:tblW w:w=\"9640\" w:type=\"dxa\"/><w:tblInd w:w=\"-34\" w:type=\"dxa\"/><w:tblLayout w:type=\"fixed\"/><w:tblLook w:val=\"04A0\" w:firstRow=\"1\" w:lastRow=\"0\" w:firstColumn=\"1\" w:lastColumn=\"0\" w:noHBand=\"0\" w:noVBand=\"1\"/></w:tblPr><w:tblGrid><w:gridCol w:w=\"1560\"/><w:gridCol w:w=\"1984\"/><w:gridCol w:w=\"2127\"/><w:gridCol w:w=\"1984\"/><w:gridCol w:w=\"1985\"/></w:tblGrid><w:tr w:rsidR=\"004E5004\" w:rsidRPr=\"008A1085\" w:rsidTr=\"004E5004\"><w:tc><w:tcPr><w:tcW w:w=\"1560\" w:type=\"dxa\"/><w:shd w:val=\"clear\" w:color=\"auto\" w:fill=\"808080\" w:themeFill=\"background1\" w:themeFillShade=\"80\"/></w:tcPr><w:p w:rsidR=\"004E5004\" w:rsidRPr=\"008A1085\" w:rsidRDefault=\"00D136C1\" w:rsidP=\"00E50147\"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr><w:r><w:rPr><w:b/></w:rPr><w:t>Start Date</w:t></w:r></w:p></w:tc><w:tc><w:tcPr><w:tcW w:w=\"1984\" w:type=\"dxa\"/><w:shd w:val=\"clear\" w:color=\"auto\" w:fill=\"808080\" w:themeFill=\"background1\" w:themeFillShade=\"80\"/></w:tcPr><w:p w:rsidR=\"004E5004\" w:rsidRPr=\"008A1085\" w:rsidRDefault=\"00D136C1\" w:rsidP=\"00E50147\"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr><w:r><w:rPr><w:b/></w:rPr><w:t>Activity</w:t></w:r></w:p></w:tc><w:tc><w:tcPr><w:tcW w:w=\"2127\" w:type=\"dxa\"/><w:shd w:val=\"clear\" w:color=\"auto\" w:fill=\"808080\" w:themeFill=\"background1\" w:themeFillShade=\"80\"/></w:tcPr><w:p w:rsidR=\"004E5004\" w:rsidRPr=\"008A1085\" w:rsidRDefault=\"00D136C1\" w:rsidP=\"00E50147\"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr><w:r><w:rPr><w:b/></w:rPr><w:t>Processes</w:t></w:r></w:p></w:tc><w:tc><w:tcPr><w:tcW w:w=\"1984\" w:type=\"dxa\"/><w:shd w:val=\"clear\" w:color=\"auto\" w:fill=\"808080\" w:themeFill=\"background1\" w:themeFillShade=\"80\"/></w:tcPr><w:p w:rsidR=\"004E5004\" w:rsidRPr=\"008A1085\" w:rsidRDefault=\"00D136C1\" w:rsidP=\"00E50147\"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr><w:r><w:rPr><w:b/></w:rPr><w:t>MB Moved</w:t></w:r></w:p></w:tc><w:tc><w:tcPr><w:tcW w:w=\"1985\" w:type=\"dxa\"/><w:shd w:val=\"clear\" w:color=\"auto\" w:fill=\"808080\" w:themeFill=\"background1\" w:themeFillShade=\"80\"/></w:tcPr><w:p w:rsidR=\"004E5004\" w:rsidRPr=\"008A1085\" w:rsidRDefault=\"00D136C1\" w:rsidP=\"00E50147\"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr><w:r><w:rPr><w:b/></w:rPr><w:t>MB per Sec</w:t></w:r></w:p></w:tc></w:tr>";
# foreach $element (@fail_lines) {

              	
	      # chomp $element;
	      # $element =~ s/\"//g;
	      # $element =~ s/,//g;
	      # if ($element =~ /ANR/ || $element =~ /ANS/) {
	      	# $gd_perffinal="THERE IS NO PERFORMANCE INFORMATION AVAILABLE - REMOVE THIS SECTION!";
	      	# $gd_tableend="";
	      	# last;
	      	
	      # }
	      # else {
	      
	     # ($perf_date, $perf_act, $perf_mb, $perf_proc, $perf_msec) = (split /\t/,$element)[0,1,2,3,4];
              # chomp $perf_date;
              # chomp $perf_act;
              # chomp $perf_proc;
              # chomp $perf_mb;
              # chomp $perf_msec;
                           
              # $gd_perfrow="<w:tr w:rsidR=\"004E5004\" w:rsidTr=\"004E5004\"><w:tc><w:tcPr><w:tcW w:w=\"1560\" w:type=\"dxa\"/></w:tcPr><w:p w:rsidR=\"004E5004\" w:rsidRPr=\"00B7233F\" w:rsidRDefault=\"00D136C1\" w:rsidP=\"00E50147\"><w:pPr><w:rPr><w:sz w:val=\"18\"/><w:szCs w:val=\"18\"/></w:rPr></w:pPr><w:proofErr w:type=\"spellStart\"/><w:r><w:rPr><w:sz w:val=\"18\"/><w:szCs w:val=\"18\"/></w:rPr><w:t>$perf_date</w:t></w:r><w:proofErr w:type=\"spellEnd\"/></w:p></w:tc><w:tc><w:tcPr><w:tcW w:w=\"1984\" w:type=\"dxa\"/></w:tcPr><w:p w:rsidR=\"004E5004\" w:rsidRPr=\"00B7233F\" w:rsidRDefault=\"00D136C1\" w:rsidP=\"00E50147\"><w:pPr><w:rPr><w:sz w:val=\"18\"/><w:szCs w:val=\"18\"/></w:rPr></w:pPr><w:proofErr w:type=\"spellStart\"/><w:r><w:rPr><w:sz w:val=\"18\"/><w:szCs w:val=\"18\"/></w:rPr><w:t>$perf_act</w:t></w:r><w:proofErr w:type=\"spellEnd\"/></w:p></w:tc><w:tc><w:tcPr><w:tcW w:w=\"2127\" w:type=\"dxa\"/></w:tcPr><w:p w:rsidR=\"004E5004\" w:rsidRPr=\"00B7233F\" w:rsidRDefault=\"00D136C1\" w:rsidP=\"00E50147\"><w:pPr><w:rPr><w:sz w:val=\"18\"/><w:szCs w:val=\"18\"/></w:rPr></w:pPr><w:proofErr w:type=\"spellStart\"/><w:r><w:rPr><w:sz w:val=\"18\"/><w:szCs w:val=\"18\"/></w:rPr><w:t>$perf_proc</w:t></w:r><w:proofErr w:type=\"spellEnd\"/></w:p></w:tc><w:tc><w:tcPr><w:tcW w:w=\"1984\" w:type=\"dxa\"/></w:tcPr><w:p w:rsidR=\"004E5004\" w:rsidRPr=\"00B7233F\" w:rsidRDefault=\"00D136C1\" w:rsidP=\"00E50147\"><w:pPr><w:rPr><w:sz w:val=\"18\"/><w:szCs w:val=\"18\"/></w:rPr></w:pPr><w:proofErr w:type=\"spellStart\"/><w:r><w:rPr><w:sz w:val=\"18\"/><w:szCs w:val=\"18\"/></w:rPr><w:t>$perf_mb</w:t></w:r><w:proofErr w:type=\"spellEnd\"/></w:p></w:tc><w:tc><w:tcPr><w:tcW w:w=\"1985\" w:type=\"dxa\"/></w:tcPr><w:p w:rsidR=\"004E5004\" w:rsidRPr=\"00B7233F\" w:rsidRDefault=\"00D136C1\" w:rsidP=\"00E50147\"><w:pPr><w:rPr><w:sz w:val=\"18\"/><w:szCs w:val=\"18\"/></w:rPr></w:pPr><w:r><w:rPr><w:sz w:val=\"18\"/><w:szCs w:val=\"18\"/></w:rPr><w:t>$perf_msec</w:t></w:r><w:bookmarkStart w:id=\"0\" w:name=\"_GoBack\"/><w:bookmarkEnd w:id=\"0\"/></w:p></w:tc></w:tr>";
              # $gd_perffinal=join "",$gd_perffinal,$gd_perfrow;
              # $gd_tableend="</w:tbl>";
	      
              # ######
              # }


# }




# $gd_perffinal=join "",$gd_perffinal,$gd_tableend;


              # open(XML_INPUT, "${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
	      # my @lines = <XML_INPUT>;
              # close(XML_INPUT);



# ## Process the Non Graph Settings

# my @newlines;
# foreach(@lines) {
   # $_ =~ s/xxperfgraphxx/$gd_perffinal/g;
   
   # push(@newlines,$_);
# }
	
# open(XML_OUTPUT, ">${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
# print XML_OUTPUT @newlines;
# close(XML_OUTPUT);
              # ######
              
# close (BESPOKE_INPUT);



### End Performance


## Top 10 occupancy


system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select n.node_name, dom.domain_name, sum(n.num_files), sum(n.logical_mb)/1024 from occupancy n, nodes dom where n.node_name=dom.node_name group by n.node_name,dom.domain_name order by 4 desc >> ${host_directory}/gd_top_20_highestocc.csv");
open(BESPOKE_INPUT, "${host_directory}/gd_top_20_highestocc.csv") or &been_an_error;
my @fail_lines = <BESPOKE_INPUT>;
close(BESPOKE_INPUT);
$count=1;
foreach $element (@fail_lines) {
              if ($count < 21) {
              	
	      chomp $element;
	      if ($element =~ /ANR/ || $element =~ /ANS/) {
	      	$fail_client="NO DATA"; 
	      	$fail_times="NO DATA";
	      }
	      else {
	     ($occ_client,$occ_domain,$occ_files,$occ_GB) = (split /,/,$element)[0,1,2,3];
              chomp $occ_client;
              chomp $occ_domain;
              chomp $occ_files;
              chomp $occ_GB;
              ######
              }
              open(XML_INPUT, "${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
	      my @lines = <XML_INPUT>;
              close(XML_INPUT);



## Process the Non Graph Settings

my @newlines;
foreach(@lines) {
   $_ =~ s/xxoccname${count}xx/$occ_client/g;
   $_ =~ s/xxoccdomain${count}xx/$occ_domain/g;
   $_ =~ s/xxoccfiles${count}xx/$occ_files/g;
   $_ =~ s/xxoccgb${count}xx/$occ_GB/g;
   push(@newlines,$_);
}
	
open(XML_OUTPUT, ">${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
print XML_OUTPUT @newlines;
close(XML_OUTPUT);
              ######
  }
 $count=$count+1;
}

close (BESPOKE_INPUT);


## End Top 10 occupancy

## Top 10 offenders (failed)

system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select entity, count ENTITY from summary where activity='BACKUP' and SUCCESSFUL='NO' group by entity order by 2 desc >> ${host_directory}/gd_top_10_failedoffenders.csv");
open(BESPOKE_INPUT, "${host_directory}/gd_top_10_failedoffenders.csv") or &been_an_error;
my @fail_lines = <BESPOKE_INPUT>;
close(BESPOKE_INPUT);
$count=0;
foreach $element (@fail_lines) {
              if ($count < 11) {
              	
	      chomp $element;
	      if ($element =~ /ANR/ || $element =~ /ANS/) {
	      	$fail_client="NO DATA - no backups?"; 
	      	$fail_times="NO DATA - no backups?";
	      }
	      else {
	     ($fail_client,$fail_times ) = (split /,/,$element)[0,1];
              chomp $fail_client;
              chomp $fail_times;
              ######
              }
              open(XML_INPUT, "${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
	      my @lines = <XML_INPUT>;
              close(XML_INPUT);



## Process the Non Graph Settings

my @newlines;
foreach(@lines) {
   $_ =~ s/xxnodefail${count}xx/$fail_client/g;
   $_ =~ s/xxnodefailcount${count}xx/$fail_times/g;
   push(@newlines,$_);
}
	
open(XML_OUTPUT, ">${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
print XML_OUTPUT @newlines;
close(XML_OUTPUT);
              ######
  }
 $count=$count+1;
}

close (BESPOKE_INPUT);

## End 

## Missed

## Top 10 offenders (missed)

system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt \"select NODE_NAME, count(status) from events where scheduled_start>'2000-01-01 00:00' and (scheduled_start>=current_timestamp-720 hours) and node_name is not null and status!='Pending' and status='Missed' group by NODE_NAME,STATUS order by 2 desc\" >> ${host_directory}/gd_top_10_missedoffenders.csv");

open(BESPOKE_INPUT, "${host_directory}/gd_top_10_missedoffenders.csv") or &been_an_error;
my @fail_lines = <BESPOKE_INPUT>;
close(BESPOKE_INPUT);
$count=0;
foreach $element (@fail_lines) {
              if ($count < 11) {
              	
	      chomp $element;
	      if ($element =~ /ANR/ || $element =~ /ANS/) {
	      	$miss_client="NO DATA - no backups?"; 
	      	$miss_times="NO DATA - no backups?";
	      }
	      else {
	     ($miss_client,$miss_times ) = (split /,/,$element)[0,1];
              chomp $miss_client;
              chomp $miss_times;
              }
              ######
              open(XML_INPUT, "${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
	      my @lines = <XML_INPUT>;
              close(XML_INPUT);



## Process the Non Graph Settings

my @newlines;
foreach(@lines) {
   $_ =~ s/xxnodemiss${count}xx/$miss_client/g;
   $_ =~ s/xxnodemisscount${count}xx/$miss_times/g;
   push(@newlines,$_);
}
	
open(XML_OUTPUT, ">${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
print XML_OUTPUT @newlines;
close(XML_OUTPUT);
              ######
  }
 $count=$count+1;
}

close (BESPOKE_INPUT);

## end



###############################################
#### MAX and MINS Processing
###############################################

	
open (XML_DATA, "<${host_directory}/graph_maxmins.csv") or &been_an_error;
@creds=<XML_DATA>;
	foreach $line_of_file (@creds) {
	    
	($xml_title, $xml_maxdate1, $xml_maxdata1, $xml_mindate1,$xml_mindata1,$xml_maxdate2, $xml_maxdata2, $xml_mindate2,$xml_mindata2,$xml_maxdate3, $xml_maxdata3, $xml_mindate3,$xml_mindata3,$xml_units) = (split /,/,$line_of_file)[0,1,2,3,4,5,6,7,8,9,10,11,12,13];
chomp $xml_title;
chomp $xml_maxdate1; 
chomp $xml_maxdata1; 
chomp $xml_mindate1;
chomp $xml_mindata1;
chomp $xml_maxdate2;
chomp $xml_maxdata2;
chomp $xml_mindate2;
chomp $xml_mindata2;
chomp $xml_maxdate3; 
chomp $xml_maxdata3;
chomp $xml_mindate3;
chomp $xml_mindata3;
chomp $xml_units;


if ( $line_of_file =~ /ANR2034E/ || $line_of_file =~ /ANS8001I/ ) {

$xml_maxdata1=1; 
$xml_mindate1="XX-NO DATA REMOVE THIS SECTION-XX";
$xml_mindata1=1;
$xml_maxdate2="XX-NO DATA REMOVE THIS SECTION-XX";
$xml_maxdata=1;
$xml_mindate2="XX-NO DATA REMOVE THIS SECTION-XX";
$xml_mindata2=1;
$xml_maxdate3="XX-NO DATA REMOVE THIS SECTION-XX"; 
$xml_maxdata3=1;
$xml_mindate3="XX-NO DATA REMOVE THIS SECTION-XX";
$xml_mindata3=1;
$xml_units="XX-NO DATA REMOVE THIS SECTION-XX";
}




##################
### Database
##################

if ($xml_title eq "Database Utilisation" ) {

if ($xml_maxdata1 > 0) {	
$gd_dbpercent_util=int((100*$xml_mindata2)/$xml_maxdata1);
}
else {$gd_dbpercent_util="XX CANT CALC - divide by zero!!)";}

if ($gd_dbpercent_util > 80 ) {
	$gd_dbrecommendation="The database utilisation is too high at $gd_dbpercent_util percent. Make some more space available by adding additional filesystem space.";
	$gd_managementsummary="$gd_managementsummary<w:br/>- $gd_dbrecommendation";
}
else {
	$gd_dbrecommendation="The database utilisation is good at $gd_dbpercent_util percent. Action should be taken when it reaches 80 percent.";
}	
	
open(XML_INPUT, "${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
my @lines = <XML_INPUT>;
close(XML_INPUT);

my @newlines;
foreach(@lines) {

   $_ =~ s/xxdbavailablespacexx/$xml_maxdata1/g;
   $_ =~ s/xxdbusedspacexx/$xml_mindata2/g;
   $_ =~ s/xxdbusedpercentxx/$gd_dbpercent_util/g;   
   $_ =~ s/xxdbrecommendationsxx/$gd_dbrecommendation/g;
   push(@newlines,$_);
}


	
open(XML_OUTPUT, ">${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
print XML_OUTPUT @newlines;
close(XML_OUTPUT);

}

#################
## Reuse Delays
#################

if ($xml_title eq "Reuse Delay by Sequential Stgpool" ) {

if ($gd_drmdbstatus > $xml_maxdata1 ) {
	$gd_reuserecommendation="All reusedelays are lower than the number of database backups being kept. It is recommended that the offending pools are corrected for the best DR outcome.";
	$gd_managementsummary="$gd_managementsummary<w:br/>- $gd_reuserecommendation";
}
elsif ($gd_drmdbstatus > $xml_mindata1 && $gd_drmdbstatus <= $xml_maxdata1) {
	$gd_reuserecommendation="At least one storage pool has a reuse delay lower than the number of database backups being kept. It is recommended that the offending pool(s) are corrected for the best DR outcome.";
	$gd_managementsummary="$gd_managementsummary<w:br/>- $gd_reuserecommendation";
}
else {
	$gd_reuserecommendation="All storage pools are at or above the required reuse delay for the number of database backups that are being kept.";
}

open(XML_INPUT, "${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
my @lines = <XML_INPUT>;
close(XML_INPUT);

my @newlines;
foreach(@lines) {
if ($xml_mindate1 eq "XX-NO DATA REMOVE THIS SECTION-XX") {
		$_ =~ s/xxreusedelaytagxx/XXX REMOVE-THIS-SECTION-NO-SEQUENTIAL POOLS XXX/g;
		push(@newlines,$_);
}
else {
	$_ =~ s/xxreusedelayrecommendationxx/$gd_reuserecommendation/g;
	$_ =~ s/xxreusedelaytagxx//g;
	push(@newlines,$_);
}
}
	
open(XML_OUTPUT, ">${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
print XML_OUTPUT @newlines;
close(XML_OUTPUT);

}

##################
### Actlog
##################

### Note - work on the modified XML from this point onwards....


if ($xml_title eq "Active Log Utilisation" ) {
	if ($xml_mindata2 == 0) {
		$gd_actlogpercent_util=0;
	}
	else {
	$gd_actlogpercent_util=int((100*$xml_mindata2)/$xml_maxdata1);
	}
if ($gd_actlogpercent_util > 80 ) {
	$gd_actlogrecommendation="The active log utilisation is too high at $gd_actlogpercent_util percent. Make some more space available by adding additional filesystem space or by taking TWO database backups (to clear it down). Investigate the underlying causes.";
	$gd_managementsummary="$gd_managementsummary<w:br/>- $gd_actlogrecommendation";
}
else {
	$gd_actlogrecommendation="The active log utilisation is good at $gd_actlogpercent_util percent. Action should be taken if it is showing consistently high values. Issues are usually due to database or disk performance.";
}

open(XML_INPUT, "${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
my @lines = <XML_INPUT>;
close(XML_INPUT);

my @newlines;
foreach(@lines) {
   $_ =~ s/xxactlogavailablespacexx/$xml_maxdata1/g;
   $_ =~ s/xxactlogusedspacexx/$xml_mindata2/g;
   $_ =~ s/xxactlogusedpercentxx/$gd_actlogpercent_util/g;   
   $_ =~ s/xxactlogrecommendationsxx/$gd_actlogrecommendation/g;
   push(@newlines,$_);
}

	
open(XML_OUTPUT, ">${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
print XML_OUTPUT @newlines;
close(XML_OUTPUT);

}

####################
#### Backup Per Day
####################

if ($xml_title eq "Backup per Day (Max Last 60 Days)" ) {


open(XML_INPUT, "${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
my @lines = <XML_INPUT>;
close(XML_INPUT);

my @newlines;
foreach(@lines) {
	if ($xml_mindate1 eq "XX-NO DATA REMOVE THIS SECTION-XX") {
		$_ =~ s/xxdatabackeduptagxx/XXXREMOVE-THIS-SECTION-NO-DATAXXX/g;
		push(@newlines,$_);
}
else {
	our $gd_maxbackupperday=$xml_maxdata1;
	 $_ =~ s/xxdatabackeduptagxx//g;
	if ($xml_mindata1 > 0) {$gd_backuphiloratio=int($xml_maxdata1/$xml_mindata1)};
	if ($xml_mindata1 == 0) {$gd_backuphiloratio="INFINITE! (divide by zero....)"};
   $_ =~ s/xxbackupmaxxx/$xml_maxdata1/g;
   $_ =~ s/xxbackupdatemaxxx/$xml_maxdate1/g;
   $_ =~ s/xxbackupminxx/$xml_mindata1/g;   
   $_ =~ s/xxbackupdateminxx/$xml_mindate1/g;  
   $gd_backuprecommendation="Short-term high peaks should be investigated although underlying long-term trends are generally more important. The ratio of the highest load to the lowest is currently $gd_backuphiloratio:1";
   $_ =~ s/xxbackuprecommendationsxx/$gd_backuprecommendation/g;
   push(@newlines,$_);
}
}
	
open(XML_OUTPUT, ">${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
print XML_OUTPUT @newlines;
close(XML_OUTPUT);

}

####################
#### Archive Per Day
####################

if ($xml_title eq "Archive per Day (Max Last 60 Days)" ) {


open(XML_INPUT, "${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
my @lines = <XML_INPUT>;
close(XML_INPUT);

my @newlines;
foreach(@lines) {
	if ($xml_mindate1 eq "XX-NO DATA REMOVE THIS SECTION-XX") {
		$_ =~ s/xxdataarchivetagexx/XXXREMOVE-THIS-SECTION-NO-DATAXXX/g;
		push(@newlines,$_);
}
else {
	our $gd_maxarchiveperday=$xml_maxdata1;
	 $_ =~ s/xxdataarchivetagexx//g;
	if ($xml_mindata1 > 0) {$gd_archivehiloratio=int($xml_maxdata1/$xml_mindata1)};
	if ($xml_mindata1 == 0) {$gd_archivehiloratio="INFINITE! (divide by zero....)"};
   $_ =~ s/xxarchivemaxxx/$xml_maxdata1/g;
   $_ =~ s/xxarchivedatemaxxx/$xml_maxdate1/g;
   $_ =~ s/xxarchiveminxx/$xml_mindata1/g;   
   $_ =~ s/xxarchibedateminxx/$xml_mindate1/g;  
   $gd_archiverecommendation="As with backups, short-term high peaks with archives should be investigated although underlying long-term trends are generally more important. Archives may be ad-hoc and can take up more space in TSM than is planned for - talk to the data owners if this is the case. The ratio of the highest load to the lowest is currently $gd_archivehiloratio:1";
   $_ =~ s/xxarchiverecommendationxx/$gd_archiverecommendation/g;
   push(@newlines,$_);
}
}
	
open(XML_OUTPUT, ">${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
print XML_OUTPUT @newlines;
close(XML_OUTPUT);

}


####################
## Failed and Missed Backups
####################

if ($xml_title eq "Not Completed (Missed and Failed) vs Total (Max Last 60 Days)" ) {

open(XML_INPUT, "${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
my @lines = <XML_INPUT>;
close(XML_INPUT);
if ($xml_mindate1 ne "XX-NO DATA REMOVE THIS SECTION-XX") {
if ($xml_maxdata2 > 0 && $xml_mindata2 == 0) {
   $gd_backuprecommendation="There are sometimes missed or failed backups in this environment although sometimes all jobs complete successfully. Missed and failed backups should be investigated and minimised.";
   $gd_managementsummary="$gd_managementsummary<w:br/>- $gd_backuprecommendation";
   }
if ($xml_maxdata2 > 0 && $xml_mindata2 > 0) {
   $gd_backuprecommendation="There are always missed or failed backups in this environment. Missed and failed backups should be investigated and minimised.";
   $gd_managementsummary="$gd_managementsummary<w:br/>- $gd_backuprecommendation";
   }
if ($xml_maxdata2 == 0 && $xml_mindata2 == 0) {
   $gd_backuprecommendation="Backups in the sample period always complete. This is the ideal situation and no recommendations are needed to improve this.";
}
}
my @newlines;
foreach(@lines) {
if ($xml_mindate1 eq "XX-NO DATA REMOVE THIS SECTION-XX") {
	$_ =~ s/xxfailedmissedtagxx/XXX REMOVE-THIS-SECTION-NO-BACKUPS XXX/g;
	push(@newlines,$_);
}
else {
   $_ =~ s/xxfailedmissedtagxx//g;
   $_ =~ s/xxclientmaxscheduledxx/$xml_maxdata1/g;
   $_ =~ s/xxclientmaxdatescheduledxx/$xml_maxdate1/g;
   $_ =~ s/xxclientminscheduledxx/$xml_mindata1/g;   
   $_ =~ s/xxclientmindatescheduledxx/$xml_mindate1/g;  
   $_ =~ s/xxclientnotcompletemaxxx/$xml_maxdata2/g;
   $_ =~ s/xxclientnotcompletedatemaxxx/$xml_maxdate2/g;
   $_ =~ s/xxclientnotcompletedminxx/$xml_mindata2/g;   
   $_ =~ s/xxclientnotcompleteddateminxx/$xml_mindate2/g;
   $_ =~ s/xxclientnotcompleterecommendationsxx/$gd_backuprecommendation/g;
   push(@newlines,$_);
}
}
	
open(XML_OUTPUT, ">${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
print XML_OUTPUT @newlines;
close(XML_OUTPUT);

}

### Completed Backups

if ($xml_title eq "Completed Backups (Max Last 60 Days)" ) {

open(XML_INPUT, "${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
my @lines = <XML_INPUT>;
close(XML_INPUT);

my @newlines;
foreach(@lines) {
	if ($xml_mindate1 eq "XX-NO DATA REMOVE THIS SECTION-XX") {
		$_ =~ s/xxcompletedtagxx/XXX REMOVE-THIS-SECTION-NO-COMPLETED-BACKUPS XXX/g;
		push(@newlines,$_);
}
else {
	$_ =~ s/xxcompletedtagxx//g;
   $_ =~ s/xxcompletedclientmaxxx/$xml_maxdata1/g;
   $_ =~ s/xxcompletedclientdatemaxxx/$xml_maxdate1/g;
   $_ =~ s/xxcompletedclientminxx/$xml_mindata1/g;   
   $_ =~ s/xxcompletedclientdateminxx/$xml_mindate1/g;  
   push(@newlines,$_);
}
}
	
open(XML_OUTPUT, ">${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
print XML_OUTPUT @newlines;
close(XML_OUTPUT);

}

### Failed Backups

if ($xml_title eq "Failed Backups (Max Last 60 Days)" ) {

open(XML_INPUT, "${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
my @lines = <XML_INPUT>;
close(XML_INPUT);

my @newlines;
foreach(@lines) {
	if ($xml_mindate1 eq "XX-NO DATA REMOVE THIS SECTION-XX") {
		$_ =~ s/xxfailedtagxx/XXX REMOVE-THIS-SECTION-NO-FAILED-BACKUPS XXX/g;
		push(@newlines,$_);
}
else {
	$_ =~ s/xxfailedtagxx//g;
   $_ =~ s/xxfailedclientmaxxx/$xml_maxdata1/g;
   $_ =~ s/xxfailedclientdatemaxxx/$xml_maxdate1/g;
   $_ =~ s/xxfailedclientminxx/$xml_mindata1/g;   
   $_ =~ s/xxfailedclientdateminxx/$xml_mindate1/g;  
   push(@newlines,$_);
}
}
	
open(XML_OUTPUT, ">${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
print XML_OUTPUT @newlines;
close(XML_OUTPUT);

}

### Missed Backups

if ($xml_title eq "Missed Backups (Max Last 60 Days)" ) {

open(XML_INPUT, "${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
my @lines = <XML_INPUT>;
close(XML_INPUT);

my @newlines;
foreach(@lines) {
	if ($xml_mindate1 eq "XX-NO DATA REMOVE THIS SECTION-XX") {
		$_ =~ s/xxmissedtagxx/XXX REMOVE-THIS-SECTION-NO-MISSED-BACKUPS XXX/g;
		push(@newlines,$_);
}
else {
	$_ =~ s/xxmissedtagxx//g;
   $_ =~ s/xxmissedclientmaxxx/$xml_maxdata1/g;
   $_ =~ s/xxmissedclientdatemaxxx/$xml_maxdate1/g;
   $_ =~ s/xxmissedclientminxx/$xml_mindata1/g;   
   $_ =~ s/xxmissedclientdateminxx/$xml_mindate1/g;  
   push(@newlines,$_);
}
}
	
open(XML_OUTPUT, ">${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
print XML_OUTPUT @newlines;
close(XML_OUTPUT);

}


####################
#### Sessions
####################

if ($xml_title eq "Client Sessions (Backup or Archive)" ) {

open(XML_INPUT, "${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
my @lines = <XML_INPUT>;
close(XML_INPUT);

if ($xml_mindate1 ne "XX-NO DATA REMOVE THIS SECTION-XX") {
if ($xml_maxdata1 == 0) { $gd_maxsessionpercent=0; }
else { $gd_maxsessionpercent=int(($xml_maxdata1/$gd_maxschedsessions)*100);}
if ($gd_maxsessionpercent >= 100) {
   $gd_sessionrecommendation="The maximum number of scheduled sessions observed is $gd_maxsessionpercent percent of the maximum $gd_maxschedsessions. This instance is likely to be running more concurrent scheduled sessions than is allowed by the settings. Either increase the limit or consider spreading the scheduled sessions over a longer window to minimise the peaks.";
   $gd_managementsummary="$gd_managementsummary<w:br/>- $gd_sessionrecommendation";
   }
   if ($gd_maxsessionpercent >= 80 && $gd_maxsessionpercent < 100) {
   $gd_sessionrecommendation="The maximum number of scheduled sessions observed is $gd_maxsessionpercent percent of the maximum $gd_maxschedsessions. This is high. Monitor this ratio (keep it under 80%) and increase the maximum if loads are seen to be having an excessive impact on the server. Consider spreading schedules over a longer period.";
   $gd_managementsummary="$gd_managementsummary<w:br/>- $gd_sessionrecommendation";
   }
   if ($gd_maxsessionpercent < 80) {
   $gd_sessionrecommendation="The maximum number of scheduled sessions observed is $gd_maxsessionpercent percent of the maximum $gd_maxschedsessions. This does not represent an issue currently.";
   }
 } 
my @newlines;
foreach(@lines) {
	if ($xml_mindate1 eq "XX-NO DATA REMOVE THIS SECTION-XX") {
		$_ =~ s/xxclientsessiontagxx/XXX REMOVE-THIS-SECTION-NO-SESSIONS XXX/g;
		push(@newlines,$_);
}
else {

   $_ =~ s/xxclientsessiontagxx//g;
   $_ =~ s/xxmaximumsessionsxx/$xml_maxdata1/g;
   $_ =~ s/xxmaxsessionsdatexx/$xml_maxdate1/g;
   $_ =~ s/xxminsessionsxx/$xml_mindata1/g;   
   $_ =~ s/xxminsessiondatexx/$xml_mindate1/g;  
   $_ =~ s/xxsessionspercentxx/$gd_maxsessionpercent/g;  
   $_ =~ s/xxsessionsrecommendationsxx/$gd_sessionrecommendation/g;
   push(@newlines,$_);
}
}
	
open(XML_OUTPUT, ">${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
print XML_OUTPUT @newlines;
close(XML_OUTPUT);

}



####################
#### Onsite Offsite
####################

if ($xml_title eq "Primary vs Copypool Data (Bar)" ) {


open(XML_INPUT, "${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
my @lines = <XML_INPUT>;
close(XML_INPUT);


if ($xml_mindate1 eq "XX-NO DATA REMOVE THIS SECTION-XX") {
		$gd_offsitediffperc="NOT POSSIBLE TO CALC - Probably no offsite data";
}
else {

	$gd_offsitediffperc=(100-(100*($xml_maxdata2/$xml_maxdata1)));
		$gd_offsiteshortfall=int($xml_maxdata1-$xml_maxdata2);
}

   if ($gd_offsitediffperc eq "NOT POSSIBLE TO CALC - Probably no offsite data") { $gd_onsiteoffsiterecommendation="There doesn't appear to be any onsite or offsite data - please check this is an active instance!";  
   }
   elsif ($gd_offsitediffperc > 1 && $gd_offsitediffperc < 3) {
   $gd_onsiteoffsiterecommendation="There is a greater than 1% difference between the offsite vault and the onsite primary storage. The difference is still low and could be accounted for by the nightly backups. This needs to be monitored.";
   $gd_managementsummary="$gd_managementsummary<w:br/>- $gd_onsiteoffsiterecommendation";
   }
   elsif ($gd_offsitediffperc >= 3 ) {
   $gd_onsiteoffsiterecommendation="There is a greater than 3% difference between the offsite vault and the onsite primary storage. Check for issues with scratch media, mount points during housekeeping, long running housekeeping tasks or errors in the housekeeping scripts.";
   $gd_managementsummary="$gd_managementsummary<w:br/>- $gd_onsiteoffsiterecommendation";
   }
   elsif ($gd_offsitediffperc < 1 && $gd_offsitediffperc >= 0 ) {
   $gd_onsiteoffsiterecommendation="There are no recommendations here. The offsite/onsite difference is sufficiently small to be of no concern at present and can be accounted for by daily fluctuations.";
   }
   elsif ($gd_offsitediffperc  < 0 ) {
   $gd_onsiteoffsiterecommendation="There is currently more data offsite than onsite. This can be due to duplication of copypools, misconfiguration or old data. Further detailed investigation is required.";
   $gd_managementsummary="$gd_managementsummary<w:br/>- $gd_onsiteoffsiterecommendation";
   }
 
my @newlines;
foreach(@lines) {

if ($xml_mindate1 eq "XX-NO DATA REMOVE THIS SECTION-XX") {
		$gd_offsitediffperc="NOT POSSIBLE TO CALC - Probably no offsite data";
		$_ =~ s/xxonsiteoffsiterecommendationxx/$gd_onsiteoffsiterecommendation/g;
		$_ =~ s/xxonsiteoffsitetagxx/XXX REMOVE-THIS-SECTION-NO-ONSITE_OR_OFFSITE_DATA XXX/g;
		push(@newlines,$_);
}

else {
   $_ =~ s/xxonsiteoffsiterecommendationxx/$gd_onsiteoffsiterecommendation/g;
   $_ =~ s/xxonsiteoffsitetagxx//g;
   $_ =~ s/xxonsitedatagbxx/$xml_maxdata1/g; 
   $_ =~ s/xxoffsitegbxx/$xml_maxdata2/g;
   $_ =~ s/xxonsiteoffsitepercentxx/$gd_offsitediffperc/g;   
   $_ =~ s/xxonsiteoffsitediffxx/$gd_offsiteshortfall/g;
   push(@newlines,$_);
}
}
	
open(XML_OUTPUT, ">${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
print XML_OUTPUT @newlines;
close(XML_OUTPUT);

}

####################
#### Migration
####################

if ($xml_title eq "Migration Per Day (Max Last 60 Days)" ) {

open(XML_INPUT, "${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
my @lines = <XML_INPUT>;
close(XML_INPUT);

if ($xml_mindate1 eq "XX-NO DATA REMOVE THIS SECTION-XX") {
	our $gd_backupmigdiff="Not possible to Calc - Probably no Migration";
}
else {
our $gd_backupmigdiff=(100*($xml_maxdata1/$gd_maxbackupperday));
   if ($gd_backupmigdiff > 150 ) {
	$gd_onsiteoffsiterecommendation=" The maximum amount of data migrated over the sample period is significantly greater than the maximum amount backed up. This may suggest that migration is not controlled (on thresholds), is being manually run or migration struggles to complete each day. This should be investigated in more detail.";
	$gd_managementsummary="$gd_managementsummary<w:br/>- $gd_onsiteoffsiterecommendation";
	}
   else { $gd_datamigrationrecommendation="The maximum amount of data migrated daily over the period is within range of the maximum amount backed up, however this is a very basic check. Watch the patterns of migrations and ensure that migration is controlled by housekeeping. Migration should happen everyday and flush out the disk pools completely.";
   }
}
my @newlines;
foreach(@lines) {
	if ($xml_mindate1 eq "XX-NO DATA REMOVE THIS SECTION-XX") {
	$_ =~ s/xxmigrationtagxx/XXX REMOVE-THIS-SECTION-NO-MIGRATION-DATA XXX/g;
	push(@newlines,$_);
}
else {
   $_ =~ s/xxmigrationtagxx//g;	
   $_ =~ s/xxdatamigratedmaxxx/$xml_maxdata1/g; 
   $_ =~ s/xxdatamigrateddatemaxxx/$xml_maxdate1/g;
   $_ =~ s/xxdatamigratedminxx/$xml_mindata1/g;   
   $_ =~ s/xxdatamigrateddatexx/$xml_mindate1/g; 
   $_ =~ s/xxdatamigrationrecommendationxx/$gd_datamigrationrecommendation/g;
   push(@newlines,$_);
}
}
	
open(XML_OUTPUT, ">${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
print XML_OUTPUT @newlines;
close(XML_OUTPUT);

}


####################
#### Tape Mounts
####################

if ($xml_title eq "Drive Mounts for Last 7 Days" ) {

open(XML_INPUT, "${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
my @lines = <XML_INPUT>;
close(XML_INPUT);

my @newlines;
foreach(@lines) {
	if ($xml_mindate1 eq "XX-NO DATA REMOVE THIS SECTION-XX") {
		$_ =~ s/xxtapemounttagxx/XXX REMOVE-THIS-SECTION-PROBABLY NO LIBRARY XXX/g;
		push(@newlines,$_);
}
else {
	our $gd_backupmigdiff=(100*($xml_maxdata1/$gd_maxbackupperday));
   $_ =~ s/xxtapemounttagxx//g;
   $_ =~ s/xxdrivemountmaxxx/$xml_maxdata1/g;  
   $_ =~ s/xxdrivemountminxx/$xml_mindata1/g;   
   
   
   push(@newlines,$_);
}
}
	
open(XML_OUTPUT, ">${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
print XML_OUTPUT @newlines;
close(XML_OUTPUT);

}


####################
#### Reclamation
####################

if ($xml_title eq "Reclamation Per Day GB (Max Last 60 Days)" ) {

open(XML_INPUT, "${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
my @lines = <XML_INPUT>;
close(XML_INPUT);

my @newlines;
foreach(@lines) {
	if ($xml_mindate1 eq "XX-NO DATA REMOVE THIS SECTION-XX") {
		$_ =~ s/xxreclamationtagxx/XXX REMOVE-THIS-SECTION-NO-RECLAMATION-DATA XXX/g;
		push(@newlines,$_);
}
else {
   $_ =~ s/xxreclamationtagxx//g;
   $_ =~ s/xxreclaimmaxxx/$xml_maxdata1/g; 
   $_ =~ s/xxreclaimdatemaxxx/$xml_maxdate1/g;
   $_ =~ s/xxreclaimminxx/$xml_mindata1/g;   
   $_ =~ s/xxreclaimdateminxx/$xml_mindate1/g;
   
   push(@newlines,$_);
}
}
	
open(XML_OUTPUT, ">${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
print XML_OUTPUT @newlines;
close(XML_OUTPUT);

}

### # Reclaimed Volumes

if ($xml_title eq "Number of Reclaimed Volumes Per Day (Max Last 60 Days)" ) {

open(XML_INPUT, "${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
my @lines = <XML_INPUT>;
close(XML_INPUT);

my @newlines;
foreach(@lines) {
	if ($xml_mindate1 eq "XX-NO DATA REMOVE THIS SECTION-XX") {
		$_ =~ s/xxactualreclaimedvolstagxx/XXX REMOVE-THIS-SECTION-NO-RECLAMATION-DATA XXX/g;
		
		push(@newlines,$_);
	}
	else {
   $_ =~ s/xxactualreclaimedvolstagxx//g;	
   $_ =~ s/xxhighestnumreclvolumesxx/$xml_maxdata1/g; 
   $_ =~ s/xxhighestdatenumreclaimedvolsxx/$xml_maxdate1/g;
   $_ =~ s/xxlowestreclvolumesxx/$xml_mindata1/g;   
   $_ =~ s/xxlowestdatereclvolumesxx/$xml_mindate1/g;
   
   push(@newlines,$_);
}
}
	
open(XML_OUTPUT, ">${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
print XML_OUTPUT @newlines;
close(XML_OUTPUT);

}
############ # Primary Tapes
if ($xml_title eq "Primary (FULL) Reclaimable Volumes (>66%)" ) {

open(XML_INPUT, "${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
my @lines = <XML_INPUT>;
close(XML_INPUT);

if ($xml_maxdata1 > 20 ) {$gd_primaryreclrecommendation="There are over 20 (actually $xml_maxdata1) reclaimable volumes in the $xml_maxdate1 pool. This could be lower and should be investigated.";
		$gd_managementsummary="$gd_managementsummary<w:br/>-  The number of primary reclaimable volumes is high and reclamation should be investigated.";
		}
		else {$gd_primaryreclrecommendation="There are 20 or under (actually $xml_maxdata1) reclaimable volumes in the $xml_maxdate1 pool. Unless tapes are particularly tight, this is acceptable.";}

my @newlines;
foreach(@lines) {
	if ($xml_mindate1 eq "XX-NO DATA REMOVE THIS SECTION-XX") {
		$_ =~ s/xxonsitereclaimtagxx/XXX REMOVE-THIS-SECTION-NO-RECLAMATION-DATA XXX/g;
		push(@newlines,$_);
	}
	else {
   $_ =~ s/xxonsitereclaimtagxx//g;	
   $_ =~ s/xxonsitereclnumvolsxx/$xml_maxdata1/g; 
   $_ =~ s/xxonsitereclpoolnamexx/$xml_maxdate1/g;
   $_ =~ s/xxonsitereclrecommendationxx/$gd_primaryreclrecommendation/g;
   
   
   push(@newlines,$_);
}
}
	
open(XML_OUTPUT, ">${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
print XML_OUTPUT @newlines;
close(XML_OUTPUT);

}
### # Copy Tapes
if ($xml_title eq "Copy Reclaimable Volumes (>66%)" ) {

open(XML_INPUT, "${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
my @lines = <XML_INPUT>;
close(XML_INPUT);

if ($xml_maxdata1 > 20 ) {$gd_copyreclrecommendation="There are over 20 (actually $xml_maxdata1) reclaimable volumes in the $xml_maxdate1 pool. This could be lower and should be investigated.";
$gd_managementsummary="$gd_managementsummary<w:br/>- The number of copypool reclaimable volumes is high and reclamation should be investigated.";
}
else {$gd_copyreclrecommendation="There are 20 or under (actually $xml_maxdata1) reclaimable volumes in the $xml_maxdate1 pool. Unless tapes are particularly tight, this is acceptable.";
}

my @newlines;
foreach(@lines) {
if ($xml_mindate1 eq "XX-NO DATA REMOVE THIS SECTION-XX") {
		$_ =~ s/xxoffsitereclaimtagxx/XXX REMOVE-THIS-SECTION-NO-RECLAMATION-DATA XXX/g;
		push(@newlines,$_);
	}
	else {
   $_ =~ s/xxoffsitereclaimtagxx//g;
   $_ =~ s/xxoffsitereclnumvolsxx/$xml_maxdata1/g; 
   $_ =~ s/xxoffsitereclpoolnamexx/$xml_maxdate1/g;
   $_ =~ s/xxoffsitereclrecommendationxx/$gd_copyreclrecommendation/g;
   
   
   push(@newlines,$_);
}
}
	
open(XML_OUTPUT, ">${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
print XML_OUTPUT @newlines;
close(XML_OUTPUT);

}

}
### Finally, the management summary - this needs to be last
###
open(XML_INPUT, "${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
my @lines = <XML_INPUT>;
close(XML_INPUT);

my @newlines;
foreach(@lines) {
   $_ =~ s/xxmanagementsummaryxx/$gd_managementsummary/g;
   push(@newlines,$_);
}
	
open(XML_OUTPUT, ">${host_directory}/TSM_Micro_Healthcheck_${customer_name}.xml") or &been_an_error;
print XML_OUTPUT @newlines;
close(XML_OUTPUT);
###
}


###########################################################################
## Subroutine:
## Name: gd_draw
## Use:  Draw the graphs with GD
###########################################################################


sub gd_draw
{
	

use GD;      # for font names
use GD::Graph::lines;
use GD::Graph::bars;
use GD::Graph::pie;
use GD::Graph::lines3d;
use GD::Graph::bars3d;

$gr_title="${customer_name} - ${gr_title}";
if ($gr_maxy <= 5 ) { $gr_maxy=7 };

if ($gr_type eq "3dbars"){
our $graph = new GD::Graph::bars3d(800,800);
our $graph->set(
        title             => $gr_title,
        x_label           => $gr_xlabel,
        y_label           => $gr_ylabel,
        y_max_value       => $gr_maxy,
        y_tick_number     => 10,
        x_all_ticks       => 1,
        y_all_ticks       => 1,
        x_label_skip      => $gr_xskip,
        y_label_skip      => 1,
        x_labels_vertical => 1,
        show_values => 1,
        overwrite=> 1,
        shadow_depth => 0,
        dclrs => [@gr_color],
        
        transparent       => '0',
   bgclr             => 'white',
   boxclr            => 'white',
   fgclr             => 'black',
   labelclr => 'black', 
axislabelclr => 'black', 
legendclr => 'black', 
valuesclr => 'black',
textclr => 'black',


    );

$graph->set_legend_font(GD::gdFontMedium);
$graph->set_x_label_font(GD::gdFontMedium);
$graph->set_y_label_font(GD::gdFontMedium);


$graph->set_legend(@gr_legendkeys);
my $gd = $graph->plot( \@gr_darray );
open OUT, ">$gr_filename" or &been_an_error;
binmode(OUT);
print OUT $gd->png( );
close OUT;

}
if ($gr_type eq "pie") {



our @gr_darray = ([@gr_legendkeys], 
	    [@gr_data1],
	    [@gr_data2],
	    [@gr_data3], 
		# [ @gr_data4 ], 
		# [ @gr_data5 ], 
		# [ @gr_data6 ], 
		# [ @gr_data7 ], 	
		# [ @gr_data8 ],
		); 
	}
	else {
our @gr_darray = ([@gr_dates], 
	    [@gr_data1],
	    [@gr_data2],
	    [@gr_data3], 
		# [ @gr_data4 ], 
		# [ @gr_data5 ], 
		# [ @gr_data6 ], 
		# [ @gr_data7 ], 	
		# [ @gr_data8 ],
		); 
	}	 
	
	######### line

if ($gr_type eq "3dlines"){  
our $graph = new GD::Graph::lines3d(800,800);
our $graph->set(
        title             => $gr_title,
        x_label           => $gr_xlabel,
        y_label           => $gr_ylabel,
        y_max_value       => $gr_maxy,
        y_tick_number     => 10,
        x_all_ticks       => 1,
        y_all_ticks       => 1,
        x_label_skip      => $gr_xskip,
        y_label_skip      => 1,
        x_labels_vertical => 1,
        show_values => 1,
        overwrite=> 1,
        shadow_depth => 0,
        dclrs => [@gr_color],
        
        transparent       => '0',
   bgclr             => 'white',
   boxclr            => 'white',
   fgclr             => 'black',
   labelclr => 'black', 
axislabelclr => 'black', 
legendclr => 'black', 
valuesclr => 'black',
textclr => 'black',


    );
$graph->set_legend_font(GD::gdFontSmall);

$graph->set_legend(@gr_legendkeys);
our $gd = $graph->plot( \@gr_darray );
open OUT, ">$gr_filename" or &been_an_error;
binmode(OUT);
print OUT $gd->png( );
close OUT;
}


######### line

if ($gr_type eq "lines"){  
our $graph = new GD::Graph::lines(800,800);
our $graph->set(
        title             => $gr_title,
        x_label           => $gr_xlabel,
        y_label           => $gr_ylabel,
        y_max_value       => $gr_maxy,
        y_tick_number     => 10,
        x_all_ticks       => 1,
        y_all_ticks       => 1,
        x_label_skip      => $gr_xskip,
        y_label_skip      => 1,
        x_labels_vertical => 1,
        show_values => 1,
        overwrite=> 1,
        shadow_depth => 0,
        dclrs => [@gr_color],
        
        transparent       => '0',
   bgclr             => 'white',
   boxclr            => 'white',
   fgclr             => 'black',
   labelclr => 'black', 
axislabelclr => 'black', 
legendclr => 'black', 
valuesclr => 'black',
textclr => 'black',


    );
$graph->set_legend_font(GD::gdFontSmall);

$graph->set_legend(@gr_legendkeys);
our $gd = $graph->plot( \@gr_darray );
open OUT, ">$gr_filename" or &been_an_error;
binmode(OUT);
print OUT $gd->png( );
close OUT;
}

######### bar

if ($gr_type eq "bars"){
our $graph = new GD::Graph::bars(800,800);
our $graph->set(
        title             => $gr_title,
        x_label           => $gr_xlabel,
        y_label           => $gr_ylabel,
        y_max_value       => $gr_maxy,
        y_tick_number     => 10,
        x_all_ticks       => 1,
        y_all_ticks       => 1,
        x_label_skip      => $gr_xskip,
        y_label_skip      => 1,
        x_labels_vertical => 1,
        show_values => 1,
        overwrite=> 1,
        shadow_depth => 0,
        dclrs => [@gr_color],
        bgclr => white, 
        
        transparent       => '0',
   bgclr             => 'white',
   boxclr            => 'white',
   fgclr             => 'black',
   labelclr => 'black', 
axislabelclr => 'black', 
legendclr => 'black', 
valuesclr => 'black',
textclr => 'black',


    );

$graph->set_legend_font(GD::gdFontMedium);
$graph->set_x_label_font(GD::gdFontMedium);
$graph->set_y_label_font(GD::gdFontMedium);


$graph->set_legend(@gr_legendkeys);
my $gd = $graph->plot( \@gr_darray );
open OUT, ">$gr_filename" or &been_an_error;
binmode(OUT);
print OUT $gd->png( );
close OUT;

}

######## bars single

if ($gr_type eq "bars_single"){
our $graph = new GD::Graph::bars(800,800);
our $graph->set(
        title             => $gr_title,
        x_label           => $gr_xlabel,
        y_label           => $gr_ylabel,
        y_max_value       => $gr_maxy, 
        y_tick_number     => 10,        
        x_tick_number     => 0,
        x_all_ticks       => 0,
        y_all_ticks       => 1,
        x_label_skip      => $gr_xskip,
        y_label_skip      => 1,
        x_labels_vertical => 0,
        show_values => 1,
        overwrite=> 0,
        shadow_depth => 0,
        dclrs => [@gr_color],
        bgclr => white, 
        
        transparent       => '0',
   bgclr             => 'white',
   boxclr            => 'white',
   fgclr             => 'black',
   labelclr => 'black', 
axislabelclr => 'black', 
legendclr => 'black', 
valuesclr => 'black',
textclr => 'black',


    );
$graph->set_legend_font(GD::gdFontSmall);
$graph->set_legend(@gr_legendkeys);
my $gd = $graph->plot( \@gr_darray );
open OUT, ">$gr_filename" or &been_an_error;
binmode(OUT);
print OUT $gd->png( );
close OUT;

}


######### pie

if ($gr_type eq "pie"){
our $graph = new GD::Graph::pie(800,800);
our $graph->set(
        title             	=> $gr_title,      
        dclrs 			=> [@gr_color],
        labelclr 		=> white, 
	bgclr 			=> white,
        start_angle 		=> 45,
        '3d'           		=> 1,
        transparent       	=> '0',
	bgclr             	=> 'black',
	textclr 		=> 'white',

                
    );
    


my $gd = $graph->plot( \@gr_darray );
open OUT, ">$gr_filename" or &been_an_error;
binmode(OUT);
print OUT $gd->png( );
close OUT;
}

}

###########################################################################
## Subroutine:
## Name: graph_dashboard
## Use:  For the maximums and minimums
###########################################################################

sub graph_dashboard {

	unlink glob("${host_directory}*.png");
	chdir ${host_directory};
	
	@commands = (
	
	["Database Utilisation","","GB","DB_Util.png","1","2","\"select 'Database Utilisation',int(TOT_FILE_SYSTEM_MB/1024), int(USED_DB_SPACE_MB/1024) from db\"","Available_Space Used_Space","bars_single","green red"],
	["Client Code Versions","Version","Number Clients","Client_Versions.png","1","1","\"select client_version,count from nodes where client_version is not NULL group by client_version\"","Client_Version","bars","yellow"],
	["Active Log Utilisation","","GB","ACTLOG_Util.png","1","2","\"select 'ActLog Utilisation',int(TOTAL_SPACE_MB/1024), int(USED_SPACE_MB/1024) from log\"","Available_Space Used_Space","bars_single","green red"],
	["Backup per Day (Max Last 60 Days)","Date","GB","Backup_GB.png","1","2","\"SELECT date(start_time),cast(float(sum(bytes))/1024/1024/1024 as dec(8,0)) from summary where activity='BACKUP' and end_time>current_timestamp-1440 hours group by date(start_time)\"","Backup_GB","lines","blue"],
	["Archive per Day (Max Last 60 Days)","Date","GB","Archive_GB.png","1","2","\"SELECT date(start_time),cast(float(sum(bytes))/1024/1024/1024 as dec(8,0)) from summary where activity='ARCHIVE' and end_time>current_timestamp-1440 hours group by date(start_time)\"","Archive_GB","lines","gray"],
	["Storage Pool Backup Per Day (Max Last 60 Days)","Date","GB","Storage_Pool_GB.png","1","2","\"select date(start_time),cast(float(sum(bytes))/1024/1024/1024 as dec(8,0)) from summary where activity='STGPOOL BACKUP' and end_time>current_timestamp-1440 hours group by date(start_time)\"","Stgpool_GB","lines","green"],
	["Migration Per Day (Max Last 60 Days)","Date","GB","Migration_GB.png","1","2","\"select date(start_time),cast(float(sum(bytes))/1024/1024/1024 as dec(8,0)) from summary where activity='MIGRATION' and end_time>current_timestamp-1440 hours group by date(start_time)\"","Migration_GB","lines","purple"],
	["Reclamation Per Day GB (Max Last 60 Days)","Date","GB","Reclamation_GB.png","1","2","\"select date(start_time),cast(float(sum(bytes))/1024/1024/1024 as dec(8,0)) from summary where activity='RECLAMATION' and end_time>current_timestamp-1440 hours group by date(start_time)\"","Reclamation_GB","lines","orange"],	
	["Number of Reclaimed Volumes Per Day (Max Last 60 Days)","Date","Number of Volumes","Reclamation_Number_Volumes.png","1","2","\"select date(start_time),count FROM summary WHERE activity='RECLAMATION' and successful='YES' group by date(start_time)\"","Reclaimed_Volumes","bars","pink"],	
	["Completed Backups (Max Last 60 Days)","Date","Number Completed","Completed_Backups.png","1","2","\"select date(scheduled_start),count(status) from events where status='Completed' group by date(scheduled_start)\"","Completed_BU","bars","green"],
	["Failed Backups (Max Last 60 Days)","Date","Number Failed","Failed_Backups.png","1","2","\"select date(scheduled_start),count(status) from events where status='Failed' group by date(scheduled_start)\"","Failed_BU","bars","red"],
	["Missed Backups (Max Last 60 Days)","Date","Number Missed","Missed_Backups.png","1","2","\"select date(scheduled_start),count(status) from events where status='Missed' group by date(scheduled_start)\"","Missed_BU","bars","orange"],
	["Not Completed (Missed and Failed) vs Total (Max Last 60 Days)","Date","Number","Not_Completed_Backups.png","1","2","\"SELECT a.qtDateqt,b.qtTotal Client Schedulesqt,a.qtFailedqt FROM (SELECT DATE(scheduled_start) as qtDateqt,count(*) as qtFailedqt FROM events WHERE node_name IS NOT NULL AND (status='Failed' or status='Missed') GROUP BY DATE(scheduled_start)) as a, (SELECT DATE(scheduled_start) as qtDateqt, count(*) as qtTotal Client Schedulesqt FROM events WHERE node_name IS NOT NULL GROUP BY DATE(scheduled_start)) as b WHERE a.qtDateqt = b.qtDateqt ORDER BY qtDateqt asc\"","Total_Backups Not_Completed","lines","green red"],       
	["Primary vs Copypool Data (Bar)","Pool Type","GB","Onsite_vs_Offsite_Bar.png","1","2","\"select 'Pooltype',sum(backup_mb/1024),sum(backup_copy_mb/1024) from auditocc\"","Primary_Data Copy_Data","bars_single","green orange"],
	["Drive Mounts for Last 7 Days","Drive Name","Percentage of Available Time","Drive_Mounts.png","1","2","\"select drive_name,sum((end_time-start_time)minutes) from summary where activity='TAPE MOUNT' and start_time>current_timestamp-168 hours group by drive_name\"","Drive_Mounts","bars","purple"],
	["Volume Status by Library","Status","Volume Count","Library_Volumes.png","1","2","\"select library_name, status, count from libvolumes group by library_name,status\"","Library_Media_Status","bars","lgray"],	
	["Volume Access","Access","Volume Count","Volume_Access.png","1","2","\"select access,count from volumes group by access\"","Volume_Access","bars","yellow"],
	["Volume Read Errors","Type of Error","Volume Count","Volume_Read_Errors.png","1","2","\"select stgpool_name,sum(read_errors) from volumes  where stgpool_name in (select stgpool_name from stgpools where devclass_name!='DISK') GROUP by stgpool_name\"","Read_Errors","bars","lred"],
	["Volume Write Errors","Type of Error","Volume Count","Volume_Write_Errors.png","1","2","\"select stgpool_name,sum(write_errors) from volumes  where stgpool_name in (select stgpool_name from stgpools where devclass_name!='DISK') GROUP by stgpool_name\"","Write_Errors","bars","lorange"],	
	["Volumes per Device Class","Device Class","Volume Count","Volumes_Per_Devclass.png","1","2","\"SELECT devclass_name, COUNT(*) FROM volumes GROUP BY devclass_name\"","Device_Class_Name","bars","lgray"],
	["Primary (FULL) Reclaimable Volumes (>66%)","Poolname","Volume Count","Primary_Reclaim.png","1","2","\"SELECT stgpool_name,count from volumes where devclass_name !='DISK' and stgpool_name in (select stgpool_name from stgpools where pooltype='PRIMARY') and status='FULL' and pct_reclaim >=66 group by stgpool_name\"","Primary_Reclaimable_Volumes","bars","lgreen"],
	["Copy Reclaimable Volumes (>66%)","Poolname","Volume Count","Copy_Reclaim.png","1","2","\"SELECT stgpool_name,count from volumes where devclass_name !='DISK' and stgpool_name in (select stgpool_name from stgpools where pooltype='COPY') and pct_reclaim >=66 group by stgpool_name\"","Primary_Reclaimable_Volumes","bars","lblue"],
	["Scratch vs Maxscratch per Storage Pool","Pool","Number","Maxscratch.png","1","2","\"select stgpool_name, maxscratch, numscratchused from stgpools where maxscratch is not NULL\"","Maxscratch Numscratchused","bars","green orange"],
	["Housekeeping Failures (Totals Max 60 Days)","Activity","Number","Housekeeping.png","1","2","\"select activity,count from summary where activity != 'BACKUP' and activity != 'RESTORE' and activity != 'ARCHIVE' and activity !='RETRIEVE' and activity !='HSM-MIGRATE' and activity !='RECALL' and successful='NO' and end_time>current_timestamp-1440 hours group by activity\"","Housekeeping","bars","lred"],
	["Reuse Delay by Sequential Stgpool","Poolname","Reuse_delay","Reuse.png","1","2","\"SELECT STG.STGPOOL_NAME, STG.REUSEDELAY FROM STGPOOLS STG WHERE STG.DEVCLASS != 'DISK'\"","Storage_Pool","bars","cyan"],
	["Client Sessions (Backup or Archive)","Date","Number of Sessions","Client_Sessions.png","1","2","\"select date(start_time),count from summary where activity='BACKUP' or activity='ARCHIVE' group by date(start_time)\"","Client_Sessions","lines","yellow"],
	
	#### Bespoke Queries
	
	
	);
	
	## This count is used for percentage meter only
	$count=0;
	$gd_totalmounttimeinmins=0;
	unlink ("${host_directory}/graph_maxmins.csv");
	open (GR_MAXMINS, ">${host_directory}/graph_maxmins.csv") or &been_an_error;
	print GR_MAXMINS "gr_title,gr_mxdate1,gr_actmaxy1,gr_mindate1,gr_miny1,gr_maxdate2,gr_actmaxy2,gr_mindate2,gr_miny2,gr_maxdate3,gr_actmaxy3,gr_mindate3,gr_miny3,gr_ylabel\n";
	close (GR_MAXMINS);
	
	
	while ($commands[$count]){
		#$commands[$count][0];
		unlink ("${host_directory}/graph_temp.csv");
		our $gr_title=$commands[$count][0];
		our $gr_xlabel=$commands[$count][1];
		our $gr_ylabel=$commands[$count][2];
		our $gr_filename=$commands[$count][3];
		our $gr_xskip=$commands[$count][4];
		our $gr_datasets=$commands[$count][5];
		our @gr_legendkeys=split(' ',$commands[$count][7]);
		our $gr_type=$commands[$count][8];
		our @gr_color=split(' ',$commands[$count][9]);
		
		
		our $gr_maxdate1="";
		our $gr_actmaxy1=0;
		our $gr_mindate1="";
		
		our $gr_maxdate2="";
		our $gr_actmaxy2=0;
		our $gr_mindate2="";
	
		our $gr_maxdate3="";
		our $gr_actmaxy3=0;
		our $gr_mindate3="";
		
		our $gr_maxy=0;
		our $gr_miny=9999999999;
		our ${gr_miny1}=$gr_miny;
		our ${gr_miny2}=$gr_miny;
		our ${gr_miny3}=$gr_miny;
		our $gr_mndate="";
		our @gr_dates;
		our @gr_data1;
		our @gr_data2;
		our @gr_data3;
		our @gr_data4;
		our @gr_data5;
		our @gr_data6;
		our @gr_data7;
		our @gr_data8;
		
		## collect rest here
		
		
		$commands[$count][6] =~ s/qt/\\"/g; # Allows us to put quotes in the command
		
		system("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt $commands[$count][6] >> ${host_directory}/graph_temp.csv");
		open (GR_DATA, "<${host_directory}/graph_temp.csv") or &been_an_error; 
		open (GR_MAXMINS, ">>${host_directory}/graph_maxmins.csv") or &been_an_error;
		
		@gr_lines=<GR_DATA>;  
	
	                foreach $gr_element (@gr_lines) {
			chomp $gr_element;

			
		### maxs
			
		$gr_newdate = (split /,/,$gr_element)[0];
		$gr_newdata1 = (split /,/,$gr_element)[1];
		$gr_newdata2 = (split /,/,$gr_element)[2];
		$gr_newdata3 = (split /,/,$gr_element)[3];
		
		
			

		## Tape Mounts special case (below) - convert to percentage
		if ($gr_title eq "Drive Mounts for Last 7 Days") {
			$gr_maxy=100;
			
			$gr_newdata1=int(($gr_newdata1/10080)*100);
			
		}
		
		if ($gr_newdata1 > $gr_actmaxy1) {
		our $gr_actmaxy1=$gr_newdata1;
		our $gr_maxdate1=$gr_newdate;	
		}
		if ($gr_newdata2 > $gr_actmaxy2) {
		our $gr_actmaxy2=$gr_newdata2;
		our $gr_maxdate2=$gr_newdate;	
		}
		if ($gr_newdata3 > $gr_actmaxy3) {
		our $gr_actmaxy3=$gr_newdata3;
		our $gr_maxdate3=$gr_newdate;	
		}
		
		## Set the y axis maximum + 30%
		## Tape Mounts special case (below)
		
		
		if ($gr_title ne "Drive Mounts for Last 7 Days"){
		if ($gr_actmaxy1 > $gr_actmaxy2 && $gr_actmaxy1 > $gr_actmaxy3) {
			$gr_maxy=int($gr_actmaxy1+(30*$gr_actmaxy1/100))
		}
		if ($gr_actmaxy2 > $gr_actmaxy1 && $gr_actmaxy2 > $gr_actmaxy3) {
			$gr_maxy=int($gr_actmaxy2+(30*$gr_actmaxy2/100))
		}
		if ($gr_actmaxy3 > $gr_actmaxy1 && $gr_actmaxy3 > $gr_actmaxy2) {
			$gr_maxy=int($gr_actmaxy3+(30*$gr_actmaxy3/100))
		}
		
		}
		### mins are less complicated - just need these for the csv
		if ($gr_newdata1 < $gr_miny1) {
		$gr_miny1=$gr_newdata1;	
		our $gr_mindate1=$gr_newdate;
		}
		if ($gr_newdata2 < $gr_miny2) {
		$gr_miny2=$gr_newdata2;	
		our $gr_mindate2=$gr_newdate;
		}
		if ($gr_newdata3 < $gr_miny3) {
		$gr_miny3=$gr_newdata3;	
		our $gr_mindate3=$gr_newdate;
		}
		
	        
		
		
		
		push (@gr_dates, $gr_newdate);
		push (@gr_data1, $gr_newdata1);
		push (@gr_data2, $gr_newdata2);
		push (@gr_data3, $gr_newdata3);
		
		#
		## end collect
		}
		close (GR_DATA);
		print GR_MAXMINS "$gr_title,$gr_maxdate1,$gr_actmaxy1,$gr_mindate1,$gr_miny1,$gr_maxdate2,$gr_actmaxy2,$gr_mindate2,$gr_miny2,$gr_maxdate3,$gr_actmaxy3,$gr_mindate3,$gr_miny3,$gr_ylabel\n";
		gd_draw;
		our @gr_dates="";
		our @gr_data1="";
		our @gr_data2="";
		our @gr_data3="";
		our @gr_data4="";
		our @gr_data5="";
		our @gr_data6="";
		our @gr_data7="";
		our @gr_data8="";
		our $gr_title="";
		our $gr_maxdate1="";
		our $gr_actmaxy1=0;
		our $gr_mindate1="";
		our $gr_miny1=0;
		our $gr_maxdate2="";
		our $gr_actmaxy2=0;
		our $gr_mindate2="";
		our $gr_miny2=0;
		our $gr_maxdate3="";
		our $gr_actmaxy3=0;
		our $gr_mindate3="";
		our $gr_miny3=0;
		print "\r\r\r\r\r\r\r\r\r\r";
		$arraysize=@commands;
		$factor=100/$arraysize;
		$percentage=int($count*$factor);
		print "$percentage";
		print "% complete";
		$count=$count+1;
		unlink("${host_directory}/graph_temp.csv");
		}
		close (GR_MAXMINS);
		print "\r\r\r\r\r\r\r\r\r\r";
		print "100% complete\n";
		
			
}


###########################################################################
## Subroutine:
## Name: get_host_directory
## Use:  Change the host directory
###########################################################################

sub get_host_directory {
	use Win32::Console::ANSI;
	use Term::ANSIColor;
	print color 'bold red';
	print "\nEnter TSM baclient directory (use forward slashes)";
	print color 'reset';
	print "(${host_directory})-> ";
	
	our $tsmhd=<STDIN>;
	chomp $tsmhd;

	if ("$tsmhd" ne "") {
		${host_directory}="$tsmhd";
	}
	if (-d "${host_directory}"){
		print "Directory exists!";
		#######
		## clean up old xls files
		#######
		unlink glob("${host_directory}/${tsm_server}_*.xlsx");
	}
	else {
		print "Directory does NOT exist.";
	}

print "\nBINARIES DIR set to \"${host_directory}\"\n";
system ("pause");

}


###########################################################################
## Subroutine:
## Name: tsm_ve
## Use:  Create csv for TSM for VE activity in log
###########################################################################

sub tsm_ve {
	
	system ("cls");
	unlink("${host_directory}/${tsm_server}_$health_or_doc.csv");
	print "\n\n#########################################\n";
	print "##        Node Activity Catalogue         ##\n";
	print "#########################################\n\n\n";
	unlink ("${host_directory}/${tsm_server}_$health_or_doc.csv");
	open (BACKUP_CSV, ">${host_directory}/${tsm_server}_$health_or_doc.csv") or &been_an_error; 
	print BACKUP_CSV ":- TSM for VE - BACKUP Summary from ACTLOG\n";	
	print BACKUP_CSV "TIME,DATE,NODENAME, SCHEDULE NAME,MESSAGE,VALUE\n";
	print BACKUP_CSV "\n";
	###############################
### 

&draw_heading;
print "Enter number of hours for query: ";
our $ve_hours = <STDIN>;
chomp $ve_hours;
&draw_heading;
	
			print "\nCreating Node Activity Catalogue for period of last $ve_hours hours...\n";
			#system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt  \"select time(date_time), date(date_time), message from actlog where (MSGNO=4173 or msgno=4977 or msgno=4975 or msgno=4984 or msgno=4198 or msgno=4961 or msgno=4963 or msgno=4966 or msgno=4967 or msgno=4968 or msgno=4981 or msgno=4976 or msgno=4964) and message not like '%TSMDBMGR%' and (date_time>=current_timestamp-48 hours) order by 1 > ${host_directory}/tsm_ve.txt\"");
			@commands = (
	
				["Commands:-","\"select time(date_time), date(date_time), nodename, schedname, message from actlog where (msgno=4174 or MSGNO=4173 or msgno=4977 or msgno=4975 or msgno=4984 or msgno=4198 or msgno=4961 or msgno=4963 or msgno=4966 or msgno=4967 or msgno=4968 or msgno=4981 or msgno=4976 or msgno=4964) and message not like '%TSMDBMGR%' and (date_time>=current_timestamp-${ve_hours} hours) order by date_time\""],		
				["Commands:-","\"select time(date_time), date(date_time), nodename, schedname, message from actlog where (msgno=4174 or MSGNO=4173 or msgno=4977 or msgno=4975 or msgno=4984 or msgno=4198 or msgno=4961 or msgno=4963 or msgno=4966 or msgno=4967 or msgno=4968 or msgno=4981 or msgno=4976 or msgno=4964) and message not like '%TSMDBMGR%' and (date_time>=current_timestamp-${ve_hours} hours) order by date_time\""],		
	
				);
	
	system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt $commands[0][1]  >> ${host_directory}/tsm_ve.txt");
		
		
			############# NODE
		        #####################
			
			open (VE_FILE, "${host_directory}/tsm_ve.txt") or &been_an_error;
		
	                @read_dedupe=<VE_FILE>;  
	
	                foreach $dedupe_element (@read_dedupe) {
			chomp $dedupe_element;
			
	     
	
	
			($sess_time,$sess_date,$sess_nodename, $sess_schedname, $sess_message) = (split /,/,$dedupe_element)[0,1,2,3,4];
			$sess_message=~s/Successful Full VM backup of VMware Virtual Machine/SUCCESSFUL Full backup of VM/g;
			$sess_message=~s/: /,/g;
			$sess_message=~s/  //g;
			($mess_message, $mess_value) = (split /\(SESSION/,$sess_message)[0,1];
			$mess_value=~s/ //g;
			$mess_value=~s/%%/%/g;
			
			

			
		        
		        
		        
		        print BACKUP_CSV "$sess_time,$sess_date,$sess_nodename,$sess_schedname,$sess_id,$mess_message, $mess_value\n";
		        
		        
		    
		        }
		    
		         close (VE_FILE);
		         
		         
	close (BACKUP_CSV);
	print "......Complete!! \nMaking Spreadsheet\n";
				
	
	
}


###########################################################################
## Subroutine:
## Name: dedupe_catalogue
## Use:  Dedupe catalogue
###########################################################################


#select node_name, stgpool_name, filespace_name,int(sum(logical_mb)), int(sum(reporting_mb)) from occupancy where stgpool_name in (select stgpool_name from stgpools where pooltype='PRIMARY' ) group by node_name, stgpool_name,filespace_name order by node_name
sub dedupe_catalogue {
	
	system ("cls");
	print "\n\n#########################################\n";
	print "##        Dedupe Catalogue             ##\n";
	print "#########################################\n\n\n";
	unlink ("${host_directory}/${tsm_server}_$health_or_doc.csv");
	open (BACKUP_CSV, ">>${host_directory}/${tsm_server}_$health_or_doc.csv") or &been_an_error; 
	print BACKUP_CSV ":- Dedupe Catalogue by Node Parameters\n";
	print BACKUP_CSV "NODENAME,STGPOOL NAME,FILESPACE NAME,OCC GB (BEFORE DEDUPE),OCC GB (AFTER DEDUPE),DEDUPE RATIO (:1)\n";
	
			print "\nCreating Dedupe Catalogue! (May take a few minutes!!)\n";
			system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt  select node_name, stgpool_name, filespace_name,sum(logical_mb/1024), sum(reporting_mb/1024) from occupancy group by node_name, stgpool_name,filespace_name order by node_name > ${host_directory}/dedupe_cat_node.txt");
			system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt  select stgpool_name,sum(logical_mb/1024), sum(reporting_mb/1024) from occupancy group by stgpool_name > ${host_directory}/dedupe_cat_stgpool.txt");
			system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt  select time(date_time), date(date_time),session,nodename, message from actlog where msgno like '49%' and msgno!='4940' and msgno!='4941' and msgno!='4987' and nodename in (select nodename from actlog where message like '%dedup%') order by date_time desc > ${host_directory}/dedupe_cat_session.txt");
			system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt  select stgpool_name from stgpools where deduplicate='YES' > ${host_directory}/dedupe_cat_pools.txt");
			system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt  select c.pooltype, b.domain_name,sum(a.logical_mb/1024),sum(a.reporting_mb/1024) from occupancy a, nodes b, stgpools c where a.node_name=b.node_name and a.stgpool_name=c.stgpool_name group by b.domain_name, c.pooltype order by pooltype desc > ${host_directory}/dedupe_cat_domain.txt");
			
			############# NODE
		        #####################
			
			open (DEDUPE_FILE, "${host_directory}/dedupe_cat_node.txt") or &been_an_error;
	
			our @n = <DEDUPE_FILE>;
			close(DEDUPE_FILE);
			our $filter_num = (@n+8);
			our $filter_range = "'A8:F$filter_num'";
			chomp $filter_range;
			
			
			
			open (DEDUPE_FILE, "${host_directory}/dedupe_cat_node.txt") or &been_an_error;
	                @read_dedupe=<DEDUPE_FILE>;  
	
	                foreach $dedupe_element (@read_dedupe) {
			chomp $dedupe_element;
	     
	
	
			($node_name, $stgpool_name, $filespace_name, $logical_mb, $reporting_mb) = (split /,/,$dedupe_element)[0,1,2,3,4];
			
		        $logical_mb = sprintf "%.2f", $logical_mb;
		        $reporting_mb = sprintf "%.2f", $reporting_mb;
			if ($reporting_mb eq "0.00" || $logical_mb eq "0.00") {
				$dedupe_ratio="CAN'T CALC! (ZERO OCC)";
				print BACKUP_CSV "$node_name,$stgpool_name,$filespace_name,$reporting_mb,$logical_mb,$dedupe_ratio\n";
			}
			else {
			$dedupe_ratio=($reporting_mb/$logical_mb);
			chomp $dedupe_ratio;
			$dedupe_ratio = sprintf "%.2f", $dedupe_ratio;
		        
		        #$printed_dedupe="$dedupe_ratio:1";
		        print BACKUP_CSV "$node_name,$stgpool_name,$filespace_name,$reporting_mb,$logical_mb,$dedupe_ratio\n";
		        
		        }
		    
		        }
		    
		         close (DEDUPE_FILE);
		         
		        ############# END NODE
		        #####################
		        
		       
		        
		        ############# STGPOOL
		        #####################
		        
		        print BACKUP_CSV "\n:- Dedupe Catalogue by Stgpool Parameters\n";
	                print BACKUP_CSV "STGPOOL NAME,OCC GB (BEFORE DEDUPE),OCC GB (AFTER DEDUPE),DEDUPE RATIO (:1)\n";
			
			open (DEDUPE_STG_FILE, "${host_directory}/dedupe_cat_stgpool.txt") or &been_an_error;
	                @read_dedupe=<DEDUPE_STG_FILE>;  
	
	                foreach $dedupe_element (@read_dedupe) {
			chomp $dedupe_element;
	     
	
	
			($stgpool_name,$logical_mb, $reporting_mb) = (split /,/,$dedupe_element)[0,1,2];
			
		        $logical_mb = sprintf "%.2f", $logical_mb;
		        $reporting_mb = sprintf "%.2f", $reporting_mb;
			if ($reporting_mb eq "0.00" || $logical_mb eq "0.00") {
				$dedupe_ratio="CAN'T CALC! (ZERO OCC)";
			}
			else {
			$dedupe_ratio=($reporting_mb/$logical_mb);
			chomp $dedupe_ratio;
		        $dedupe_ratio = sprintf "%.2f", $dedupe_ratio;
		        
		        #$printed_dedupe="$dedupe_ratio:1";
		        print BACKUP_CSV "$stgpool_name,$reporting_mb,$logical_mb,$dedupe_ratio\n";
		        
		        }
		    
		        }
		    
		         close (DEDUPE_STG_FILE);
		        
		        #####################
		        ############# DOMAIN
		        
		        print BACKUP_CSV "\n:- Dedupe Catalogue by Domain Parameters\n";
	                print BACKUP_CSV "PRIMARY/COPY,DOMAIN,OCC GB (BEFORE DEDUPE),OCC GB (AFTER DEDUPE),DEDUPE RATIO (:1)\n";
			
			open (DEDUPE_DOM_FILE, "${host_directory}/dedupe_cat_domain.txt") or &been_an_error;
	                @read_dedupe=<DEDUPE_DOM_FILE>;  
	
	                foreach $dedupe_element (@read_dedupe) {
			chomp $dedupe_element;
	     
	
	
			($pool_type,$domain_name, $logical_mb, $reporting_mb) = (split /,/,$dedupe_element)[0,1,2,3];
			
		        $logical_mb = sprintf "%.2f", $logical_mb;
		        $reporting_mb = sprintf "%.2f", $reporting_mb;
			if ($reporting_mb eq "0.00" || $logical_mb eq "0.00") {
				$dedupe_ratio="CAN'T CALC! (ZERO OCC)";
			}
			else {
			$dedupe_ratio=($reporting_mb/$logical_mb);
			chomp $dedupe_ratio;
		        $dedupe_ratio = sprintf "%.2f", $dedupe_ratio;
		        
		        #$printed_dedupe="$dedupe_ratio:1";
		        print BACKUP_CSV "$pool_type,$domain_name,$reporting_mb,$logical_mb,$dedupe_ratio\n";
		        
		        }
		    
		        }
		    
		         close (DEDUPE_STG_FILE);
		        
		        ############# SESSION
		        #####################
		        
		        print BACKUP_CSV "\n:- Dedupe Catalogue by Session Parameters (24 Hours)\n";
	                print BACKUP_CSV "TIME,DATE,SESSION ID,NODENAME,MESSAGE,VALUE\n";
			
			open (DEDUPE_SESS_FILE, "${host_directory}/dedupe_cat_session.txt") or &been_an_error;
	                @read_dedupe=<DEDUPE_SESS_FILE>;  
	
	                foreach $dedupe_element (@read_dedupe) {
			chomp $dedupe_element;
			
	     
	
	
			($sess_time,$sess_date,$sess_id,$sess_nodename,$sess_message) = (split /,/,$dedupe_element)[0,1,2,3,4];
			$sess_message=~s/: /,/g;
			$sess_message=~s/  //g;
			($mess_message, $mess_value) = (split /\(SESSION/,$sess_message)[0,1];
			$mess_value=~s/ //g;
			$mess_value=~s/%%/%/g;
			

			
		        
		        
		        
		        print BACKUP_CSV "$sess_time,$sess_date,$sess_id,$sess_nodename,$mess_message, $mess_value\n";
		        
		        
		    
		        }
		    
		         close (DEDUPE_SESS_FILE);
		         
		         ############# DEDUPEPENDING
		        #####################
		        
		        
			
			open (DEDUPE_POOL_FILE, "${host_directory}/dedupe_cat_pools.txt") or &been_an_error;
	                @read_dedupe=<DEDUPE_POOL_FILE>;  
	
	                foreach $dedupe_element (@read_dedupe) {
	                chomp $dedupe_element;
	                ($dedupe_pool) = (split /,/,$dedupe_element)[0];
			chomp $dedupe_pool;
			
			system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt  show deduppending $dedupe_pool > ${host_directory}/dedupe_cat_pending.txt");   
		        open (PENDING_FILE,">>${host_directory}/dedupe_cat_pending.txt") or &been_an_error;
		        
		        print PENDING_FILE "\n\n";
		        close(PENDING_FILE);
		        	        
		        }
		    
		         close (DEDUPE_POOL_FILE);
		         
		        print BACKUP_CSV "\n:- Dedupe Pending\n";
	                print BACKUP_CSV "RESULTS,\n";
	                open (DEDUPE_PEND_FILE, "${host_directory}/dedupe_cat_pending.txt") or &been_an_error;
	                @read_dedupe=<DEDUPE_PEND_FILE>;  
	
	                foreach $dedupe_element (@read_dedupe) {
			chomp $dedupe_element;
			print BACKUP_CSV "$dedupe_element\n";
		        }
		        close (DEDUPE_PEND_FILE);
		        
		        
		        print BACKUP_CSV "\n\n:- Dedupe Delete\n";
	                print BACKUP_CSV "RESULTS,\n";
	                system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt  show dedupdelete > ${host_directory}/dedupe_cat_delete.txt");   
	                open (DEDUPE_DEL_FILE, "${host_directory}/dedupe_cat_delete.txt") or &been_an_error;
	                @read_dedupe=<DEDUPE_DEL_FILE>;  
	
	                foreach $dedupe_element (@read_dedupe) {
			chomp $dedupe_element;
			print BACKUP_CSV "$dedupe_element\n";
			}
		        close (DEDUPE_DEL_FILE);
		        
		        print BACKUP_CSV "\n\n:- Filespaces Days Since Backup\n";
	                print BACKUP_CSV "DAYS SINCE BACKUP,NODENAME,FILESPACE NAME,FILESPACE TYPE,FILESPACE ID\n";
	                system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt  select (TIMESTAMPDIFF  (16,CHAR(current_timestamp-backup_end))),node_name, filespace_name, filespace_type, FILESPACE_ID FROM FILESPACEVIEW order by 1 desc > ${host_directory}/dedupe_filespace_days.txt");   
	                open (FILESPACE_DAYS_FILE, "${host_directory}/dedupe_filespace_days.txt") or &been_an_error;
	                @read_dedupe=<FILESPACE_DAYS_FILE>;  
	
	                foreach $dedupe_element (@read_dedupe) {
			chomp $dedupe_element;
			print BACKUP_CSV "$dedupe_element\n";
			}
		        close (FILESPACE_DAYS_FILE);
		        
		        
	close (BACKUP_CSV);
	print "......Complete!! \nMaking Spreadsheet\n";
				
	
	
}	
	
###########################################################################
## Subroutine:
## Name: filespace_catalogue
## Use:  Filespace Catalogue
###########################################################################

sub filespace_catalogue {

&draw_heading;
open (FILESPACE_BACKUP_CSV, ">${host_directory}/FILESPACE_BACKUP_CATALOGUE_${datetime2}.csv") or &been_an_error;
print FILESPACE_BACKUP_CSV "Date,Nodename,Filespace Name,Class Name,Number of objects Backed Up\n";
close (FILESPACE_BACKUP_CSV);
open (FILESPACE_ARCHIVE_CSV, ">${host_directory}/FILESPACE_ARCHIVE_CATALOGUE_${datetime2}.csv") or &been_an_error;
print FILESPACE_ARCHIVE_CSV "Date,Nodename,Filespace Name,Class Name,Number of objects Archived\n";
close (FILESPACE_ARCHIVE_CSV);
	
	print "Running Filespace query...This may take some time!";
	if ($version eq '5') {
			print "\nVersion 5!\n";
			system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt  select cast(backup_date as date),node_name,FILESPACE_NAME,CLASS_NAME, count(ll_name) from backups group by node_name, FILESPACE_NAME, CLASS_NAME, cast(backup_date as date) ORDER BY 1,2  >> ${host_directory}/FILESPACE_BACKUP_CATALOGUE_${datetime2}.csv");
			system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt  select cast(archive_date as date),node_name,FILESPACE_NAME,CLASS_NAME, count(ll_name) from archives group by node_name, FILESPACE_NAME, CLASS_NAME, cast(archive_date as date) ORDER BY 1,2  >> ${host_directory}/FILESPACE_ARCHIVE_CATALOGUE_${datetime2}.csv");
	}
	if ($version eq '6') {
			print "\nVersion 6!\n";
			system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt  select date(backup_date),node_name,FILESPACE_NAME,CLASS_NAME, count(ll_name) from backups group by node_name, FILESPACE_NAME, CLASS_NAME, date(backup_date) ORDER BY NODE_NAME, DATE(backup_DATE)  >> ${host_directory}/FILESPACE_BACKUP_CATALOGUE_${datetime2}.csv");
			system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt  select date(archive_date),node_name,FILESPACE_NAME,CLASS_NAME, count(ll_name) from archives group by node_name, FILESPACE_NAME, CLASS_NAME, date(archive_date) ORDER BY NODE_NAME, DATE(archive_DATE)  >> ${host_directory}/FILESPACE_ARCHIVE_CATALOGUE_${datetime2}.csv");
	}
	
	
}	
			

###########################################################################
## Subroutine:
## Name: backup_catalogue
## Use:  Backup Catalogue
###########################################################################

sub backup_catalogue {
	
	system ("cls");
	$count=0;
	print "#########################################\n";
	print "##        Backup Catalogue             ##\n";
	print "#########################################\n\n\n";
	unlink ("${host_directory}/${tsm_server}_$health_or_doc.csv");
	open (BACKUP_CSV, ">>${host_directory}/${tsm_server}_$health_or_doc.csv") or &been_an_error; 
	print BACKUP_CSV ":- Backup Catalogue Parameters\n";
	print BACKUP_CSV "NODENAME,TYPE,FILESPACE,MGMT CLASS,DOMAIN,LAST ACCESS,SCHEDULE,ACTION,OPTIONS,SCHED START DATE,SCHED START TIME,DURATION,DUR UNITS,PERIOD,PERIOD UNITS,DAY OF WEEK,SCHEDULE STYLE,MULTIPLE SCHEDULES,STORAGE POOL,COLLOCATION,DEDUPLICATION,VERSION EXISTS,VERSION DELETED,RETAIN EXTRA,RETAIN ONLY,ARCHIVE RETVER,OCC TO FILESPACE UTIL RATIO,MODE,SERIALIZATION,FILESPACE TYPE,FILESPACE CAPACITY(GB),PERCENTAGE UTIL,FILESPACE UTIL (GB),DATABASE SIZE (GUESS),PRIMARY LOGICAL OCC (AFTER DEDUPE), PRIMARY OCC (BEFORE DEDUP),DEDUPE RATIO,OCCUPANCY NUMFILES,START BACKUP TIME,START BACKUP DATE,END BACKUP TIME,END BACKUP DATE,DAYS SINCE LAST BACKUP\n";
	
	print "\n\nMaking Backup Catalogue Spreadsheet:- \n\nTHIS MAY TAKE SEVERAL HOURS!\n\n";
	print "Note: Initial Data Collection will take 10-15 minutes \nthen there will be a % progress meter:\n\n";
		
	## First, make the raw material files and count the lines
	
my $prompt = new Term::Menu (
	beforetext => "OPTIONS:\n",
	aftertext => "\nDo you want to run a new BACKUP query or use an existing backup_cat.txt? => ",
	);
	our $answer = $prompt->menu(
        new  =>      		["new", 'n'],
        old  =>      		["existing", 'e'],
        skip  =>      		["skip to archives", 's'],
        
            
  );

print "Opening output directory....\n";
system ("start ${host_directory}");
system ("pause");
# yellow: e0
# red: c0
# blue: 90
# green: a0
# aqua: b0
# purple: d0
# inverse: f0
# normal 07

&draw_heading;
if($answer eq "new"){ 	
	print "Running backup query...This may take some time!";
	if ($version eq '5') {
			print "\nVersion 5 Catalogue!\n";
			system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt  select node_name, filespace_name, class_name from backups group by class_name, filespace_name, node_name > ${host_directory}/backup_cat.txt");
	}
	if ($version eq '6') {
			print "\nVersion 6 Catalogue!\n";
			system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt  select node_name, filespace_name, class_name from backups where char(filespace_id) !='888' group by class_name, filespace_name, node_name > ${host_directory}/backup_cat.txt");
	}
	
	print "Complete! You can now edit the file backup_cat.txt if you wish.\nRemove single quotes, &, *, % etc.\nPress <enter> once you are done!\n\n";	
	system ("pause");
}

if($answer eq "old"){ 
print "\n\nUsing existing file!\nYou can now edit the file backup_cat.txt if you wish.\nPress <enter> once you are done!\n\n";	
	system ("pause");
}
	print "Processing backup_cat.txt...\n";
####### Set up progress variables based on filespace
####################################################

if ($answer eq "old" || $answer eq "new") {
	open (NODECOUNT, "${host_directory}/backup_cat.txt") or &been_an_error;
	my @n = <NODECOUNT>;
	close(NODECOUNT);
	my $backup_num_nodes = @n;
	chomp $backup_num_nodes;
	
	$backup_type="BACKUP";
	open (BACKUP_FILE, "${host_directory}/backup_cat.txt") or &been_an_error;
	@read_backup=<BACKUP_FILE>;  
	
	foreach $backup_element (@read_backup) {
	chomp $backup_element;
	($backup_nodename, $backup_filespace_name, $backup_classname ) = (split /,/,$backup_element)[0,1,2];
	chomp $backup_nodename;
	chomp $backup_filespace_name;
	
	chomp $backup_classname;	
	
## Note: Get each 'bit' and pass into a variable. Then put a .csv line together and write to a file

#### Variables
#$backup_nodename
#$backup_type
#$backup_filespace_name	
#$backup_classname
#$backup_domain
#$backup_lastaccess
#$backup_schedule_name
#$backup_actions
#$backup_options
#$backup_startdate
#$backup_starttime
#$backup_duration
#$backup_durunits
#$backup_period
#$backup_perunits
#$backup_dayofweek
#$backup_schedstyle
#$multiple_schedules
#$backup_destination
#$backup_collocate
#$backup_dedupe
#$backup_verexists
#$backup_verdeleted
#$backup_retextra
#$backup_retonly
#$backup_retver
#$backup_mode
#$backup_serialization
#$backup_filespace_type
#$backup_filespace_capacity
#$backup_filespace_pct
#$backup_filespace_util
#$backup_filespace_backstart
#$backup_filespace_backend
#$occupancy_logical
#$occupancy_reporting

####### Get Domain
##################

my $backup_domain = `${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt  select domain_name from nodes where node_name='$backup_nodename'`;
chomp $backup_domain;	
my $backup_default_classname = `${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt  select class_name from mgmtclasses where defaultmc='Yes' and domain_name='$backup_domain' and set_name='ACTIVE'`;
chomp $backup_default_classname;


# sort out default reporting of classname in backup table
##########################################################
$def="";
if ($backup_classname eq $backup_default_classname) {
	 $def="(DEFAULT)";
	 }
if ($backup_classname eq "DEFAULT") {
	 $backup_classname="$backup_default_classname";
	 $def="(DEFAULT)";
	 }
	 
	 
######## Get Last Access
#########################

my $backup_lastaccess = `${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt  select LASTACC_TIME from nodes where node_name='$backup_nodename'`;
chomp $backup_lastaccess;
$backup_lastaccess=~s/\.00000//g;

######## Get First Access
#########################


####### Get Schedule details
############################

my $backup_schedule_details = `${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select a.node_name, t.schedule_name, t.action, t.options, t.startdate, t.starttime, t.duration, t.durunits, t.period, t.perunits, t.dayofweek, t.sched_style from client_schedules t, associations a where t.schedule_name=a.schedule_name and node_name='$backup_nodename' and (t.action!='ARCHIVE')`;
chomp $backup_schedule_details;
$backup_schedule_details=~ s/\"//g;
$backup_schedule_details=~ s/Mon,/Mon:/g;
$backup_schedule_details=~ s/Tue,/Tue:/g;
$backup_schedule_details=~ s/Wed,/Wed:/g;
$backup_schedule_details=~ s/Thu,/Thu:/g;
$backup_schedule_details=~ s/Fri,/Fri:/g;
$backup_schedule_details=~ s/Sat,/Sat:/g;
$backup_schedule_details=~ s/Sun,/Sun:/g;
$backup_schedule_details=~ s/:ENHANCED/,ENHANCED/g;
$backup_schedule_details=~ s/:CLASSIC/,CLASSIC/g;
open (LINECHECK, , ">>${host_directory}/linecheck.txt") or &been_an_error;
print LINECHECK $backup_schedule_details;
open my($fh), "<", \$backup_schedule_details;
my $first_line = <$fh>;
close $fh;
($backup_schedule_name, $backup_actions, $backup_options, $backup_startdate, $backup_starttime, $backup_duration, $backup_durunits, $backup_period, $backup_perunits, $backup_dayofweek, $backup_schedstyle ) = (split /,/,$first_line)[1,2,3,4,5,6,7,8,9,10,11];

####### Chomp the schedule style due to multiple schedule weirdness.
####################################################################

chomp $backup_schedstyle;
if ($backup_schedule_name eq '') {
	
	$backup_schedule_name="NO ASSOCIATION!!";
}
close (LINECHECK);
open (LINECHECK, "${host_directory}/linecheck.txt") or &been_an_error;
my @f = <LINECHECK>;
close(LINECHECK);
my $multiple_schedules = @f;
chomp $multiple_schedules;



if ($backup_schedule_name eq "NO ASSOCIATION!!" || $backup_schedule_name eq "1") {
	$multiple_schedules="";
}

if ($multiple_schedules > 1) {
	
	$number_schedules="$multiple_schedules";
	chomp $number_schedules;
	$multiple_schedules="MULTIPLE SCHEDULES!! ($number_schedules)";
	}
	else {
		$multiple_schedules="";
	}



# Copygroup
#################

my $backup_copygroup_details = `${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select destination,verexists,verdeleted,retextra,retonly,mode,serialization from bu_copygroups where class_name='$backup_classname' and domain_name='$backup_domain' and set_name='ACTIVE'`;
chomp $backup_copygroup_details;
($backup_destination, $backup_verexists, $backup_verdeleted, $backup_retextra, $backup_retonly, $backup_mode, $backup_serialization) = (split /,/,$backup_copygroup_details)[0,1,2,3,4,5,6];
if ($backup_serialization eq "" ) {
   $backup_destination="STG or COPYG INVALID!";
   $backup_verexists="STG or COPYG INVALID!";
   $backup_verdeleted="STG or COPYG INVALID!";
   $backup_retextra="STG or COPYG INVALID!";
   $backup_retonly="STG or COPYG INVALID!";
   $backup_mode="STG or COPYG INVALID!";
   $backup_serialization="STG or COPYG INVALID!";
   $backup_collocate="STG or COPYG INVALID!";
   $backup_dedupe="STGPOOL_INVALID!"
}

# Storage Pool
#################

if ($backup_destination ne "STG or COPYG INVALID!" ) {
	if ($version eq '5') {
		my $backup_stgpool_details = `${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select collocate from stgpools where stgpool_name='$backup_destination'`;
		chomp $backup_stgpool_details;
		($backup_collocate) = (split /,/,$backup_stgpool_details)[0];
		chomp $backup_collocate;
		$backup_dedupe="";
	}
	else {
		my $backup_stgpool_details = `${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select collocate, deduplicate from stgpools where stgpool_name='$backup_destination'`;
		chomp $backup_stgpool_details;
		($backup_collocate,$backup_dedupe) = (split /,/,$backup_stgpool_details)[0,1];
		chomp $backup_collocate;
		chomp $backup_dedupe;
	}
		

}


$backup_filespace_details = `${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select filespace_type,int(capacity/1024),pct_util,int((capacity/1024)/100*pct_util), time(backup_start),date(backup_start),time(backup_end), date(BACKUP_END),(days(current date) - days(date(BACKUP_END))) from filespaces where filespace_name='$backup_filespace_name' and node_name='$backup_nodename'`;
chomp $backup_filespace_details;
($backup_filespace_type, $backup_filespace_capacity, $backup_filespace_pct, $backup_filespace_util, $backup_filespace_backstime, $backup_filespace_backsdate,$backup_filespace_backetime,$backup_filespace_backedate, $backup_filespace_daysago) = (split /,/,$backup_filespace_details)[0,1,2,3,4,5,6,7,8];
chomp $backup_filespace_type;
chomp $backup_filespace_capacity;
chomp $backup_filespace_pct;
chomp $backup_filespace_util;
chomp $backup_filespace_backstime;
chomp $backup_filespace_backsdate;
chomp $backup_filespace_backetime;
chomp $backup_filespace_backedate;
chomp $backup_filespace_daysago;

#$backup_filespace_backstime
#$backup_filespace_backsdate
#$backup_filespace_backetime
#$backup_filespace_backedate
#$backup_filespace_daysago

##### Occupancy
###############

########################
###### START OF OCCUPANCY

if ($backup_destination ne "STG or COPYG INVALID!" ) {
	
if ($version eq '6') {		
my $occupancy_details = `${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select sum(logical_mb/1024),sum(reporting_mb/1024),sum(num_files) from occupancy where node_name='$backup_nodename' and filespace_name ='$backup_filespace_name' and type='Bkup' and stgpool_name in (select stgpool_name from stgpools where pooltype='PRIMARY') and NODE_NAME is not NULL`;
chomp $occupancy_details;
#print "\nstart\n$occupancy_details\nend\n";
($occupancy_logical, $occupancy_reporting,$occupancy_numfiles) = (split /,/,$occupancy_details)[0,1,2];
chomp $occupancy_logical;
chomp $occupancy_reporting;
chomp $occupancy_numfiles;
$occupancy_logical = sprintf "%.2f", $occupancy_logical;
$occupancy_reporting = sprintf "%.2f", $occupancy_reporting;
if ($occupancy_logical eq '0.00' || $occupancy_logical eq '') { $occupancy_deduperatio=1 }
	elsif ($occupancy_reporting eq '0.00' || $occupancy_reporting eq '') { $occupancy_deduperatio=1 }
	else { 
	#print "$occupancy_reporting divided by $occupancy_logical\n";
	$occupancy_deduperatio=($occupancy_reporting/$occupancy_logical) }
	$occupancy_deduperatio = sprintf "%.1f", $occupancy_deduperatio;
}


}

if ($version eq '5') {
	
my $occupancy_details = `${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select sum(logical_mb/1024),sum(num_files) from occupancy where node_name='$backup_nodename' and filespace_name ='$backup_filespace_name' and type='Bkup' and stgpool_name in (select stgpool_name from stgpools where pooltype='PRIMARY')`;
chomp $occupancy_details;
($occupancy_logical,$occupancy_numfiles) = (split /,/,$occupancy_details)[0,1];
chomp $occupancy_logical;
chomp $occupancy_numfiles;
$occupancy_logical = sprintf "%.2f", $occupancy_logical;
$occupancy_reporting="N/A v5!";
$occupancy_deduperatio="N/A v5!";
}



#############################
#### END OF OCCUPANCY SECTION
#############################




$backup_filespace_util =~ s/\s*$//;

if ($backup_filespace_type =~ m/API/ || $backup_filespace_type =~ m/VSS/ || $backup_filespace_type =~ m/ASR/ )
{
	$approx_versions="N/A API Filespace";
}

elsif (($backup_filespace_util eq '0' || $occupancy_logical eq '0.00') && ($backup_filespace_type !~ m/API:/ && $backup_filespace_type !~ m/VSS/ && $backup_filespace_type !~ m/ASR/)) 
{ 
	
	$approx_versions="N/A Zero Occ/FS Util";
	
}

elsif ($backup_filespace_util ne '0' && $occupancy_logical ne '0.00' && $backup_filespace_type !~ m/API:/)
{
	
	$approx_versions=($occupancy_logical/$backup_filespace_util);
	$approx_versions = sprintf "%.1f", $approx_versions;	
	
}	
##### API Database Guess

#########################
## Strip the white spaces out first
#############################
#$myString =~ s/\s*$//; 
$backup_verexists =~ s/\s*$//;
$backup_verdeleted =~ s/\s*$//;
$backup_retextra =~ s/\s*$//;
$backup_retonly =~ s/\s*$//;
$backup_retver =~ s/\s*$//;
#$backup_mode =~ s/\s*$//;
#$backup_serialization =~ s/\s*$//;
$backup_filespace_type =~ s/\s*$//;
#$backup_filespace_capacity =~ s/\s*$//;
$backup_filespace_pct =~ s/\s*$//;
$backup_filespace_util =~ s/\s*$//;

if ($backup_filespace_type =~ m/API:/ || $backup_filespace_name =~ m/Microsoft Exchange Writer/)
{ 
	#print "hurray! It is a Database";
	if ($backup_verexists eq 'NOLIMIT' && $backup_retextra eq 'NOLIMIT') {$backup_database_versions="UNKNOWN DUE TO NOLIMIT"}
	
	elsif ($backup_verexists eq 'STG or COPYG INVALID!') {
		#print "$backup_filespace_type\nhit condition 1";
		#print "FT:$backup_filespace_type\nBV:$backup_verexists\nRE:$backup_retextra\nOL$occupancy_logical\n";
		#system ("pause");
		$backup_database_versions=0;
		$units=" (Policy Invalid! MGMT Class does not exist)";
		}
	elsif ($occupancy_logical eq '0.00') {
		#print "$backup_filespace_type\nhit condition 1";
		#print "FT:$backup_filespace_type\nBV:$backup_verexists\nRE:$backup_retextra\nOL$occupancy_logical\n";
		#system ("pause");
		$backup_database_versions=0;
		$units=" (Zero Occ or Metadata)";
		}
	elsif ($backup_verexists eq 'NOLIMIT' && $backup_retextra ne 'NOLIMIT' && $backup_retextra ne '0') {
		#print "$backup_filespace_type\nhit condition 1";
		#print "FT:$backup_filespace_type\nBV:$backup_verexists\nRE:$backup_retextra\nOL$occupancy_logical\n";
		#system ("pause");
		$backup_database_versions=($occupancy_logical/$backup_retextra);
		$backup_database_versions = sprintf "%.1f", $backup_database_versions;
		$units=" (retained by days)";
		$approx_versions="$backup_versions$units";
		}
	elsif ($backup_verexists eq 'NOLIMIT' && $backup_retextra eq '0') {
		#print "$backup_filespace_type\nhit condition 2";
		#print "FT:$backup_filespace_type\nBV:$backup_verexists\nRE:$backup_retextra\nOL$occupancy_logical\n";
		#system ("pause");
		$backup_database_versions=$occupancy_logical;
		$backup_database_versions = sprintf "%.1f", $backup_database_versions;
		$units=" (one version - NOLIMIT:0)";
		}
	elsif (($backup_verexists eq '1') && ($backup_retextra eq '0')) {
		#print "$backup_filespace_type\nhit condition 3";
		#print "FT:$backup_filespace_type\nBV:\"$backup_verexists\"\nRE:\"$backup_retextra\"\nOL$occupancy_logical\n";
		#system ("pause");
		$backup_database_versions=$occupancy_logical;
		$units=" (1 version/ORA?/SP?)";
		}		
	elsif	($backup_verexists ne '1' && $backup_verexists ne 'NOLIMIT' && $backup_verexists ne '0' && $backup_retextra ne 'NOLIMIT' && $backup_retextra ne '0' ) {
		#print "$backup_filespace_type\nhit condition 4";
		#print "FT:\"$backup_filespace_type\"\nBV:\"$backup_verexists\"\nRE:\"$backup_retextra\"\nOL$occupancy_logical\n";
		#system ("pause");
		#print "\nBV:\"$backup_verexists\"\n";
		$backup_database_versions=($occupancy_logical/$backup_verexists);
		$backup_database_versions = sprintf "%.1f", $backup_database_versions;
		$units=" (retained by versions)";
		$approx_versions="$backup_versions$units";
		}
}
else {
	
	$backup_database_versions="NOT A DATABASE";
	$units="";
	}
#########################################

####### Make the CSV file ########
chomp $backup_nodename;
chomp $backup_type;
chomp $backup_filespace_name;
chomp $backup_classname;
chomp $def;
chomp $backup_domain;
chomp $backup_lastaccess;
chomp $backup_schedule_name;
chomp $backup_actions;
chomp $backup_options;
chomp $backup_startdate;
chomp $backup_starttime;
chomp $backup_duration;
chomp $backup_durunits;
chomp $backup_period;
chomp $backup_perunits;
chomp $backup_dayofweek;
chomp $backup_schedstyle;
chomp $multiple_schedules;
chomp $backup_destination;
chomp $backup_collocate;
chomp $backup_dedupe;
chomp $backup_verexists;
chomp $backup_verdeleted;
chomp $backup_retextra;
chomp $backup_retonly;
chomp $backup_retver;
chomp $backup_mode;
chomp $backup_serialization;
chomp $backup_filespace_type;
chomp $backup_filespace_capacity;
chomp $backup_filespace_pct;
chomp $backup_filespace_util;
chomp $occupancy_logical;
chomp $occupancy_reporting;
chomp $occupancy_deduperatio;
chomp $occupancy_numfiles;
chomp $backup_filespace_backstart;
chomp $backup_filespace_backend;
chomp $approx_versions;
chomp $backup_database_versions;
print BACKUP_CSV "$backup_nodename,$backup_type,$backup_filespace_name,$backup_classname $def,$backup_domain,$backup_lastaccess,$backup_schedule_name,$backup_actions,$backup_options,$backup_startdate,$backup_starttime,$backup_duration,$backup_durunits,$backup_period,$backup_perunits,$backup_dayofweek,$backup_schedstyle,$multiple_schedules,$backup_destination,$backup_collocate,$backup_dedupe,$backup_verexists,$backup_verdeleted,$backup_retextra,$backup_retonly,$backup_retver,$approx_versions,$backup_mode,$backup_serialization,$backup_filespace_type,$backup_filespace_capacity,$backup_filespace_pct%,$backup_filespace_util,$backup_database_versions$units,$occupancy_logical,$occupancy_reporting,$occupancy_deduperatio:1,$occupancy_numfiles,$backup_filespace_backstime,$backup_filespace_backsdate,$backup_filespace_backetime,$backup_filespace_backedate,$backup_filespace_daysago\n";
close(LINECHECK);
unlink("${host_directory}/linecheck.txt");

####### Percentage Meter
########################
 
print "\r\r\r\r\r\r\r\r\r\r";
		$factor=100/$backup_num_nodes;
		$percentage=int($count*$factor);
		print "$percentage";
		print "% complete";
		$count=$count+1;	
}

}

if ($answer eq "skip"){
	print "\nSkipping Backups...\n";
}

############################################################################################################################
############################################################################################################################
############################################################################################################################
############################################################################################################################
########################
##### Archive processing ==============================================================================================
#####=================================
#####===============
#####======
##====
system ("cls");

	print "#########################################\n";
	print "##        Backup Catalogue             ##\n";
	print "#########################################\n\n\n";
	print "\n\nMaking Archive Section:- \n\n";
	print "Note: Initial Data Collection may take a few minutes \nthen there will be a % progress meter:\n\n";
my $prompt = new Term::Menu (
	beforetext => "OPTIONS:\n",
	aftertext => "\nDo you want to run a new ARCHIVE query or use an existing archive_cat.txt? => ",
	);
	our $answer = $prompt->menu(
        new  =>      		["new", 'n'],
        old  =>      		["existing", 'e'],
        skip  =>      		["skip and end", 's'],
        
            
  );
if($answer eq "new" || $answer eq "old" ){ 	
print "\n\nRunning archive query...";
	our $any_archives = `${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt  select count(*) from archives`;
	if ($any_archives > 0) {
	system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt  select node_name, filespace_name, class_name from archives group by class_name, filespace_name, node_name > ${host_directory}/archive_cat.txt");
	print "Complete!!...\n\n";
	}
	else { print "\nNo Archives!!\n"; }
}	
	

if($answer eq "new" || $answer eq "old") {	

####### Set up progress variables based on filespace
####################################################
print BACKUP_CSV ":- Archive Catalogue Parameters\n";
print BACKUP_CSV "NODENAME,TYPE,FILESPACE,MGMT CLASS,DOMAIN,LAST ACCESS,SCHEDULE,ACTION,OPTIONS,SCHED START DATE,SCHED START TIME,DURATION,DUR UNITS,PERIOD,PERIOD UNITS,DAY OF WEEK,SCHEDULE STYLE,MULTIPLE SCHEDULES,STORAGE POOL,COLLOCATION,DEDUPLICATION,VERSION EXISTS,VERSION DELETED,RETAIN EXTRA,RETAIN ONLY,ARCHIVE RETVER,OCC TO FILESPACE UTIL RATIO,MODE,SERIALIZATION,FILESPACE TYPE,FILESPACE CAPACITY(GB),PERCENTAGE UTIL,FILESPACE UTIL (GB),DATABASE SIZE (GUESS),PRIMARY LOGICAL OCC (AFTER DEDUPE), PRIMARY OCC (BEFORE DEDUP),DEDUPE RATIO,OCCUPANCY NUMFILES,START BACKUP TIME,START BACKUP DATE,END BACKUP TIME,END BACKUP DATE,DAYS SINCE LAST BACKUP\n";

if ($any_archives > 0) {
	
	$count=0;
	open (NODECOUNT, "${host_directory}/archive_cat.txt") or &been_an_error;
	my @n = <NODECOUNT>;
	close(NODECOUNT);
	my $backup_num_nodes = @n;
	chomp $backup_num_nodes;
	
	
	
	
	
	$backup_type="ARCHIVE";
	close(BACKUP_FILE);
	open (BACKUP_FILE, "${host_directory}/archive_cat.txt") or &been_an_error;
	@read_backup=<BACKUP_FILE>;  
	
	foreach $backup_element (@read_backup) {
	     chomp $backup_element;
	     ($backup_nodename, $backup_filespace_name, $backup_classname ) = (split /,/,$backup_element)[0,1,2];
	chomp $backup_nodename;
	chomp $backup_filespace_name;
	chomp $backup_classname;
	
#### Variables
#$backup_nodename
#$backup_type
#$backup_filespace_name	
#$backup_classname
#$backup_domain
#$backup_lastaccess
#$backup_schedule_name
#$backup_actions
#$backup_options
#$backup_startdate
#$backup_starttime
#$backup_duration
#$backup_durunits
#$backup_period
#$backup_perunits
#$backup_dayofweek
#$backup_schedstyle
#$multiple_schedules
#$backup_destination
#$backup_collocate
#$backup_dedupe
#$backup_verexists
#$backup_verdeleted
#$backup_retextra
#$backup_retonly
#$backup_retver
#$backup_mode
#$backup_serialization
#$backup_filespace_type
#$backup_filespace_capacity
#$backup_filespace_pct
#$backup_filespace_util
#$backup_filespace_backstart
#$backup_filespace_backend

####### Get Domain
##################

my $backup_domain = `${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt  select domain_name from nodes where node_name='$backup_nodename'`;
chomp $backup_domain;
my $backup_default_classname = `${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt  select class_name from mgmtclasses where defaultmc='Yes' and domain_name ='$backup_domain' and set_name='ACTIVE'`;
chomp $backup_default_classname;


# sort out default reporting of classname in backup table
##########################################################
$def="";
if ($backup_classname eq $backup_default_classname) {
	 $def="(DEFAULT)";
	 }
if ($backup_classname eq "DEFAULT") {
	 $backup_classname="$backup_default_classname";
	 $def="(DEFAULT)";
	 }
	 
	 
######## Get Last Access
#########################

my $backup_lastaccess = `${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt  select LASTACC_TIME from nodes where node_name='$backup_nodename'`;
chomp $backup_lastaccess;
$backup_lastaccess=~s/\.00000//g;

####### Get Schedule details - no point
#######################################

#$backup_schedule_name="";
#$backup_actions="";
#$backup_options="";
#$backup_startdate="";
#$backup_starttime="";
#$backup_duration="";
#$backup_durunits="";
#$backup_period="";
#$backup_perunits="";
#$backup_dayofweek="";
#$backup_schedstyle="";

my $backup_schedule_details = `${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select a.node_name, t.schedule_name, t.action, t.options, t.startdate, t.starttime, t.duration, t.durunits, t.period, t.perunits, t.dayofweek, t.sched_style from client_schedules t, associations a where t.schedule_name=a.schedule_name and node_name='$backup_nodename' and t.action='ARCHIVE'`;
chomp $backup_schedule_details;
open (LINECHECK, , ">>${host_directory}/linecheck.txt") or &been_an_error;
print LINECHECK $backup_schedule_details;
open my($fh), "<", \$backup_schedule_details;
my $first_line = <$fh>;
close $fh;
($backup_schedule_name, $backup_actions, $backup_options, $backup_startdate, $backup_starttime, $backup_duration, $backup_durunits, $backup_period, $backup_perunits, $backup_dayofweek, $backup_schedstyle ) = (split /,/,$first_line)[1,2,3,4,5,6,7,8,9,10,11];

####### Chomp the schedule style due to multiple schedule weirdness.
####################################################################

chomp $backup_schedstyle;
if ($backup_schedule_name eq '') {
	
	$backup_schedule_name="NO ASSOCIATION!!";
}
close (LINECHECK);
open (LINECHECK, "${host_directory}/linecheck.txt") or &been_an_error;
my @f = <LINECHECK>;
close(LINECHECK);
my $multiple_schedules = @f;
chomp $multiple_schedules;



if ($backup_schedule_name eq "NO ASSOCIATION!!" || $backup_schedule_name eq "1") {
	$multiple_schedules="";
}

if ($multiple_schedules > 1) {
	
	$number_schedules="$multiple_schedules";
	chomp $number_schedules;
	$multiple_schedules="MULTIPLE SCHEDULES!! ($number_schedules)";
	}
	else {
		$multiple_schedules="";
	}



# Copygroup
#################

my $backup_copygroup_details = `${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select destination,retver,serialization from ar_copygroups where class_name ='$backup_classname' and domain_name ='$backup_domain' and set_name='ACTIVE'`;
chomp $backup_copygroup_details;
($backup_destination, $backup_retver, $backup_serialization) = (split /,/,$backup_copygroup_details)[0,1,2];
chomp $backup_destination;
chomp $backup_retver;
chomp $backup_serialization;

## If serialization is not set then it says that the storage pool is invalid. Can't use storage pool as it throws an ANS error and is difficult to process.

if ($backup_serialization eq "" ) {
	$backup_destination="STG or COPYG INVALID!";
	$backup_serialization="STG or COPYG INVALID!";
	$backup_collocate="STG or COPYG INVALID!";
	$backup_dedupe="STGPOOL_INVALID!";
	$backup_retver="STGPOOL_INVALID!";
}

## These things are zero for archives

$backup_verexists="";
$backup_verdeleted="";
$backup_retextra="";
$backup_retonly="";
$backup_mode="";

# Storage Pool
#################

if ($backup_destination ne "STG or COPYG INVALID!" ) {
	if ($version eq '5') {
		my $backup_stgpool_details = `${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select collocate from stgpools where stgpool_name='$backup_destination'`;
		chomp $backup_stgpool_details;
		($backup_collocate) = (split /,/,$backup_stgpool_details)[0];
		chomp $backup_collocate;
		$backup_dedupe="";
	}
	else {
		my $backup_stgpool_details = `${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select collocate, deduplicate from stgpools where stgpool_name='$backup_destination'`;
		chomp $backup_stgpool_details;
		($backup_collocate,$backup_dedupe) = (split /,/,$backup_stgpool_details)[0,1];
		chomp $backup_collocate;
		chomp $backup_dedupe;
	}
		

}
#### Filespace_name
###################

##$backup_filespace_details = `${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select filespace_type, int(capacity/1024),pct_util,int((capacity/1024)/100*pct_util), backup_start, backup_end from filespaces where filespace_name $my $backup_filespace_details'$backup_filespace_sub'  and node_name='$backup_nodename'`;
$backup_filespace_details = `${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select filespace_type,int(capacity/1024),pct_util,int((capacity/1024)/100*pct_util), time(backup_start),date(backup_start),time(backup_end), date(BACKUP_END),(days(current date) - days(date(BACKUP_END))) from filespaces where filespace_name='$backup_filespace_name' and node_name='$backup_nodename'`;
chomp $backup_filespace_details;
($backup_filespace_type, $backup_filespace_capacity, $backup_filespace_pct, $backup_filespace_util, $backup_filespace_backstime,$backup_filespace_backsdate,$backup_filespace_backetime,$backup_filespace_backedate,$backup_filespace_daysago) = (split /,/,$backup_filespace_details)[0,1,2,3,4,5,6,7,8];
chomp $backup_filespace_type;
chomp $backup_filespace_capacity;
chomp $backup_filespace_pct ;
chomp $backup_filespace_util ;
chomp $backup_filespace_backstime;
chomp $backup_filespace_backsdate;
chomp $backup_filespace_backetime;
chomp $backup_filespace_backedate;
chomp $backup_filespace_daysago;
#$backup_filespace_backstart=~ s/\.000000//g;
#$backup_filespace_backend=~ s/\.000000//g;

### Occupancy
#####################





########################
###### START OF OCCUPANCY

if ($backup_destination ne "STG or COPYG INVALID!" ) {
	
if ($version eq '6') {		
my $occupancy_details = `${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select sum(logical_mb/1024),sum(reporting_mb/1024),sum(num_files) from occupancy where node_name='$backup_nodename' and filespace_name ='$backup_filespace_name'  and type='Arch' and stgpool_name in (select stgpool_name from stgpools where pooltype='PRIMARY')`;
chomp $occupancy_details;
#print "\nstart\n$occupancy_details\nend\n";
($occupancy_logical, $occupancy_reporting,$occupancy_numfiles) = (split /,/,$occupancy_details)[0,1,2];
chomp $occupancy_logical;
chomp $occupancy_reporting;
chomp $$occupancy_numfiles;
$occupancy_logical = sprintf "%.2f", $occupancy_logical;
$occupancy_reporting = sprintf "%.2f", $occupancy_reporting;
if ($occupancy_logical eq '0.00' || $occupancy_logical eq '') { $occupancy_deduperatio=1 }
	elsif ($occupancy_reporting eq '0.00' || $occupancy_reporting eq '') { $occupancy_deduperatio=1 }
else { 
	#print "$occupancy_reporting divided by $occupancy_logical\n";
	$occupancy_deduperatio=($occupancy_reporting/$occupancy_logical) }
}
$occupancy_deduperatio = sprintf "%.1f", $occupancy_deduperatio;
#print "\nDedupe Ratio is: $occupancy_deduperatio\n";
if ($version eq '5') {
	
my $occupancy_details = `${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select int(logical_mb/1024) from occupancy where node_name='$backup_nodename' and filespace_name ='$backup_filespace_name'  and type='Arch' and stgpool_name in (select stgpool_name from stgpools where pooltype='PRIMARY')`;
($occupancy_logical) = (split /,/,$occupancy_details)[0];
chomp $occupancy_logical;
$occupancy_reporting="N/A v5!";
$occupancy_deduperatio="N/A v5!";
}

}
########################
###### END OF OCCUPANCY


####### Make the CSV file ########
chomp $backup_nodename;
chomp $backup_type;
chomp $backup_filespace_name;
chomp $backup_classname;
chomp $def;
chomp $backup_domain;
chomp $backup_lastaccess;
chomp $backup_schedule_name;
chomp $backup_actions;
chomp $backup_options;
chomp $backup_startdate;
chomp $backup_starttime;
chomp $backup_duration;
chomp $backup_durunits;
chomp $backup_period;
chomp $backup_perunits;
chomp $backup_dayofweek;
chomp $backup_schedstyle;
chomp $multiple_schedules;
chomp $backup_destination;
chomp $backup_collocate;
chomp $backup_dedupe;
chomp $backup_verexists;
chomp $backup_verdeleted;
chomp $backup_retextra;
chomp $backup_retonly;
chomp $backup_retver;
chomp $backup_mode;
chomp $backup_serialization;
chomp $backup_filespace_type;
chomp $backup_filespace_capacity;
chomp $backup_filespace_pct;
chomp $backup_filespace_util;
chomp $occupancy_logical;
chomp $occupancy_reporting;
chomp $occupancy_deduperatio;
chomp $occupancy_numfiles;
chomp $backup_filespace_backstart;
chomp $backup_filespace_backend;
print BACKUP_CSV "$backup_nodename,$backup_type,$backup_filespace_name,$backup_classname $def,$backup_domain,$backup_lastaccess,$backup_schedule_name,$backup_actions,$backup_options,$backup_startdate,$backup_starttime,$backup_duration,$backup_durunits,$backup_period,$backup_perunits,$backup_dayofweek,$backup_schedstyle,$multiple_schedules,$backup_destination,$backup_collocate,$backup_dedupe,$backup_verexists,$backup_verdeleted,$backup_retextra,$backup_retonly,$backup_retver,Not Applicable,$backup_mode,$backup_serialization,$backup_filespace_type,$backup_filespace_capacity,$backup_filespace_pct%,$backup_filespace_util,Not Applicable,$occupancy_logical,$occupancy_reporting,$occupancy_deduperatio:1,$occupancy_numfiles,$backup_filespace_backstart,$backup_filespace_backend\n";
close(LINECHECK);
unlink("${host_directory}/linecheck.txt");

####### Percentage Meter
########################
 
print "\r\r\r\r\r\r\r\r\r\r";
		
		$factor=100/$backup_num_nodes;
		$percentage=int($count*$factor);
		print "$percentage";
		print "% complete";
		$count=$count+1;	
}


}

if ($answer eq "skip"){
	print "\nSkipping Archives...!";
}

close(BACKUP_FILE);
close(BACKUP_CSV);
print "......Complete!!\n";
}
}


###########################################################################
## Subroutine:
## Name: make_log_powershell
## Use:  Client log file access
###########################################################################

sub make_log_powershell {

## open the output directory

system ("start ${host_directory}");

LOG_MENU:while (1) {
	
&draw_windows_heading;	
	use Term::Menu;
	
	my $logprompt = new Term::Menu (
	beforetext => "Menu Options\n",
	aftertext => "\nChoose Option then press <enter> => ",
	);
	my $loganswer = $logprompt->menu(
        OPENBADIR  =>      	["*** Access the Output Files Directory ***", 'o'],
        Change_Login =>      	["Change Windows Credentials", 'w'],
        Change_TSM =>      	["Change TSM Credentials", 'e'],
        Change_Drive => 	["Change the Drive letter for Files",'m'],
        Run_Collect =>      	["Get a Log File (option to not restore available)", 'c'],
        #Run_Service =>      	["Service Menu", 'u'],
        Search_Node =>      	["Search for a Node", 'n'],
        Search_Errors =>      	["Search for Node Errors in TSM", 's'],
        Show_Failed =>      	["Show Missed and Failed Backups (72 hours)", 'f'],
        Search_Activity =>      ["Search for Node Activity in TSM", 'a'],
        Search_Any =>      	["Grep style search in TSM", 'g'],
        #List_Files =>      	["List Log and Option Files", 'l'],
        TSM_command =>      	["TSM Command Line", 't'],
        Quit  =>      		["RETURN TO PREVIOUS MENU", 'x'], 
        
            
  );

##########################################################################
##### Menu Choices
##########################################################################


if($loganswer eq "TSM_command"){ 
	system ("start cmd.exe /T:07 /k ${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=no -optfile=${host_directory}dsm_custom.opt");
}


if($loganswer eq "Change_TSM"){ 
	&draw_windows_heading;
	&change_credentials;
	&make_options_file;
	&get_version;	
}

if($loganswer eq "Quit"){ 
	goto MAIN_MENU;
}

if($loganswer eq "Search_Node"){ 
        
	&draw_windows_heading;
	print "Please enter search string >";
	our $search_string = <STDIN>;
	chomp $search_string;
	$search_string=uc $search_string;
	system("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -optfile=${host_directory}dsm_custom.opt select node_name, tcp_address, tcp_name, platform_name from nodes where node_name like '%$search_string%'");
        system ("pause");
}

if($loganswer eq "Show_Failed"){ 
        
	&draw_windows_heading;
		@commands = (
	
	["FAILED Backups:","NODENAME,DATE,NUMBER OF TIMES FAILED","\"select NODE_NAME, scheduled_start, count(status) from events where scheduled_start>'2000-01-01 00:00' and (scheduled_start >= current_timestamp-72 hours) and node_name is not null and status!='Pending' and status='Failed' group by NODE_NAME, SCHEDULED_START, STATUS order by 3 desc\""],
	["MISSED Backups:","NODENAME,DATE,NUMBER OF TIMES MISSED","\"select NODE_NAME, scheduled_start, count(status) from events where scheduled_start>'2000-01-01 00:00' and (scheduled_start >= current_timestamp-72 hours) and node_name is not null and status!='Pending' and status='Missed' group by NODE_NAME, SCHEDULED_START, STATUS order by 3 desc\""],
	
);

${command_count}=0;
unlink("${host_directory}\missed_and_failed_${datetime2}.txt");

while ($commands[${command_count}]){
	
	        
                $commands[${command_count}][2] =~ s/qt/\\"/g; # Allows us to put quotes in the command
                open (MISSED_FAILED,">>${host_directory}\missed_and_failed_${datetime2}.txt") or &been_an_error;
                print MISSED_FAILED "\n$commands[${command_count}][0] \n\n";
                print MISSED_FAILED "$commands[${command_count}][1] \n";
                close (MISSED_FAILED);
		system("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}\dsm_custom.opt $commands[${command_count}][2] >> ${host_directory}\missed_and_failed_${datetime2}.txt");
		
		$command_count=$command_count+1;
}

system ("start ${host_directory}\missed_and_failed_${datetime2}.txt");

}

if($loganswer eq "Search_Errors"){ 
        
	&draw_windows_heading;
	print "Please enter search string for Node (ENTER for None) >";
	our $search_string = <STDIN>;
	chomp $search_string;
	$search_string=uc $search_string;
	if ($search_string ne "") {
	system("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -optfile=${host_directory}dsm_custom.opt select node_name, tcp_address, tcp_name, platform_name from nodes where node_name like '%$search_string%'");
        system ("pause");
        }
        print "Please enter TSM Nodename >";
	our $search_node = <STDIN>;
	chomp $search_node;
	$search_node=uc $search_node;
	print "Working...might take a while!\n";
	system("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select date_time,message from actlog where nodename is not NULL and severity='E' and nodename='${search_node}' order by date_time asc > ${host_directory}actlog_error_${search_node}_temp.txt");
        system("start ${host_directory}actlog_error_${search_node}_temp.txt");
        system ("pause");
}

if($loganswer eq "Search_Activity"){ 
        
	&draw_windows_heading;
	print "Please enter search string for Node (ENTER for none) >";
	our $search_string = <STDIN>;
	chomp $search_string;
	$search_string=uc $search_string;
	if ($search_string ne "") {
	system("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -optfile=${host_directory}dsm_custom.opt select node_name, tcp_address, tcp_name, platform_name from nodes where node_name like '%$search_string%'");
        system ("pause");
        }
        print "Please enter TSM Nodename >";
	our $search_node = <STDIN>;
	chomp $search_node;
	$search_node=uc $search_node;
	system("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select date_time,message from actlog where nodename is not NULL and nodename='${search_node}' order by date_time asc > ${host_directory}actlog_allact_${search_node}_temp.txt");
        system("start ${host_directory}actlog_allact_${search_node}_temp.txt");
}

if($loganswer eq "Search_Any"){ 
        
COMMANDGREPIN:
&draw_heading;
print "\nSyntax: <command> | grep <string1> | grep <string2> | grep <string3> etc....\n";
print "============================================================================\n\n";
print "<ENTER> to return to menu)\n\n";
print "Enter Command ($tsm_server)>";
$answer = <STDIN>;
chomp $answer;

($grep_command,$grep_1,$grep_2,$grep_3,$grep_4,$grep_5,$grep_6) = (split /\|/,$answer)[0,1,2,3,4,5,6];


chomp $grep_command;
if ($grep_command eq "") { goto LOG_MENU}
chomp $grep_1;
$grep_1=~s/grep //g;
$grep_1=~s/ //g;
chomp $grep_2;
$grep_2=~s/grep //g;
$grep_2=~s/ //g;
chomp $grep_3;
$grep_3=~s/grep //g;
$grep_3=~s/ //g;
chomp $grep_4;
$grep_4=~s/grep //g;
$grep_4=~s/ //g;
chomp $grep_5;
$grep_5=~s/grep //g;
$grep_5=~s/ //g;
chomp $grep_6;
$grep_6=~s/grep //g;
$grep_6=~s/ //g;
unlink ("${host_directory}/temp_command.txt");
open (OUTPUT,">${host_directory}/temp_command.txt") or &been_an_error;
system ("cls");
print "Running Query...\n";
@commands = (
	
				["\"$grep_command\""],		
	
				);
	
	$query_details=qx(${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=no -commadelimited -optfile=${host_directory}dsm_custom.opt $grep_command);


if ($grep_1 ne "" && $grep_2 ne "" && $grep_3 ne "" && $grep_4 ne "" && $grep_5 ne "" && $grep_6 ne "") {

		foreach (grep((m/$grep_1/i && m/$grep_2/i && m/$grep_3/i && m/$grep_4/i && m/$grep_5/i && m/$grep_6/i), split(/\n/, $query_details)))
		{
		print OUTPUT $_."\n";
		
		}

		}
		
		
if ($grep_1 ne "" && $grep_2 ne "" && $grep_3 ne "" && $grep_4 ne "" && $grep_5 ne "" && $grep_6 eq "") {

		foreach (grep((m/$grep_1/i && m/$grep_2/i && m/$grep_3/i && m/$grep_4/i && m/$grep_5/i), split(/\n/, $query_details))) 
		{
		print OUTPUT $_."\n";
		
		}

		}


if ($grep_1 ne "" && $grep_2 ne "" && $grep_3 ne "" && $grep_4 ne "" && $grep_5 eq "" && $grep_6 eq "") {

		foreach (grep((m/$grep_1/i && m/$grep_2/i && m/$grep_3/i && m/$grep_4/i), split(/\n/, $query_details))) 
		{
		print OUTPUT $_."\n";
		
		}

		}
		
		
if ($grep_1 ne "" && $grep_2 ne "" && $grep_3 ne "" && $grep_4 eq "" && $grep_5 eq "" && $grep_6 eq "") {

		foreach (grep((m/$grep_1/i && m/$grep_2/i && m/$grep_3/i), split(/\n/, $query_details))) 
		{
		print OUTPUT $_."\n";
		
		}

		}



if ($grep_1 ne "" && $grep_2 ne "" && $grep_3 eq "" && $grep_4 eq "" && $grep_5 eq "" && $grep_6 eq "") {

		foreach (grep((m/$grep_1/i && m/$grep_2/i), split(/\n/, $query_details))) 
		{
		print OUTPUT $_."\n";
		
		}

		}
		
		
if ($grep_1 ne "" && $grep_2 eq "" && $grep_3 eq "" && $grep_4 eq "" && $grep_5 eq "" && $grep_6 eq "") {

		foreach (grep(/($grep_1)/i, split(/\n/, $query_details))) 
		{
		print OUTPUT $_."\n";
		
		}

		}


if ($grep_1 eq "" && $grep_2 eq "" && $grep_3 eq "" && $grep_4 eq "" && $grep_5 eq "" && $grep_6 eq "") {

		foreach ($query_details) 
		{
		print OUTPUT $_."\n";
		
		}
		}


close (OUTPUT);
system ("start ${host_directory}/temp_command.txt");
		goto COMMANDGREPIN;
}

if($loganswer eq "Change_Drive"){ 
        
	&draw_windows_heading;
	print "Please enter New Drive Letter for Logs (uppercase, no colon) >";
	our $log_drive_letter = <STDIN>;
	chomp $log_drive_letter;

}


if($loganswer eq "OPENBADIR"){ 
        
	&draw_windows_heading;
	system ("start ${host_directory}");

}


if($loganswer eq "Change_Login"){ 
        
	&draw_windows_heading;
	&change_windows_creds;

}



RUN_COLLECT:if ($loganswer eq "Run_Collect"){ 
	&draw_windows_heading;
	print "Search for a client (copy address to clipboard)\n(ENTER=none.) >>>";
	our $search_string = <STDIN>;
	chomp $search_string;
	if ("$search_string" eq "" ) {
		goto MAIN_MENU;
	}

	$search_string=uc $search_string;
	$how_many_hits=qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -optfile=${host_directory}dsm_custom.opt select count from nodes where node_name like '%$search_string%'");      
	chomp $how_many_hits;
	if ($how_many_hits == 0){ 
		print "No nodes with that search string!\n";
		system ("pause");
		goto RUN_COLLECT;
		
	}
	system("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -optfile=${host_directory}dsm_custom.opt select node_name, tcp_address, tcp_name, platform_name from nodes where node_name like '%$search_string%'");
        system ("pause");
	&draw_windows_heading;
	use Net::Ping; 
	use Socket;   
       	use Term::Menu;
	
	my $typeprompt = new Term::Menu (
	beforetext => "MENU Options\n",
	aftertext => "\nChoose Option then press <enter> => ",
	);
	my $typeanswer = $typeprompt->menu(
        BACLIENT  =>      	["BACLIENT", 'b'],
        SQL  =>      		["SQL", 's'],
        ORACLE  =>      	["ORACLE", 'o'],
        TDPEXCHANGE  =>      	["EXCHANGE", 'e'],
                
  ); 
  
  if ("$typeanswer" eq "BACLIENT") { $base_directory="baclient" };
  if ("$typeanswer" eq "SQL") { $base_directory="TDPSql" };
  if ("$typeanswer" eq "ORACLE") { $base_directory="TDPOracle" };
  if ("$typeanswer" eq "TDPEXCHANGE") { $base_directory="TDPExchange" };
  if ("$typeanswer" eq "") { $base_directory="baclient" };
         
	&draw_windows_heading;
	print "Please enter Hostname or IP address of ONLINE Client: ";
	our $windows_host = <STDIN>;
	chomp $windows_host;
	
	if ($windows_host eq "") { 
		print "No such host - null string!\n";
		system ("pause");
		goto LOG_MENU;
	}
	
	 # $p = Net::Ping->new();
	 # if ($p->ping($windows_host)){
		# $can_ping="ALIVE";
			
		# }
		# else { 
		# $can_ping="DEAD" 
		# };
		
	# if ($can_ping eq "DEAD" ) { 
		# print "This client \"$windows_host\" is OFFLINE (cannot ping). Returning....\n";
		# system ("pause");
		# goto LOG_MENU;
		# }
	# if ($can_ping eq "ALIVE" ) { 
		# print "This client \"$windows_host\" is ONLINE (can ping!). Continuing....\n";
		# system ("pause");
		
		# }	
	if ("$windows_host" eq "" ) { goto LOG_MENU;}
	
GETFILES:
&draw_windows_heading;
	print "Creating Powershell script.....\n";
	open (IP_ARRAY,">${host_directory}/get_the_listing.ps1") or &been_an_error;
	print IP_ARRAY "\$password = get-content C:\\cred.txt | convertto-securestring\n";
	print IP_ARRAY "\$credentials = new-object -typename System.Management.Automation.PSCredential -argumentlist \"$windows_domain\\$windows_admin\",\$password\n";
	print IP_ARRAY "\$error.clear()\n";	
	
	print IP_ARRAY "\$Job = Start-Job {Get-ChildItem \"\\\\${windows_host}\\$log_drive_letter\$\\program files\\tivoli\\tsm\\$base_directory\" -Force -Name -Filter *.opt} -Credential \$credentials\n";	
	print IP_ARRAY "\$Job | Wait-Job\n";
	print IP_ARRAY "\$FileText = \$Job | Receive-Job\n";
	print IP_ARRAY "Write-Output \$FileText\n";
	
	print IP_ARRAY "\$Job = Start-Job {Get-ChildItem \"\\\\${windows_host}\\$log_drive_letter\$\\program files\\tivoli\\tsm\\$base_directory\" -Force -Name -Filter *.log} -Credential \$credentials\n";	
	print IP_ARRAY "\$Job | Wait-Job\n";
	print IP_ARRAY "\$FileText = \$Job | Receive-Job\n";
	print IP_ARRAY "Write-Output \$FileText\n";
	
	close (IP_ARRAY);

&draw_windows_heading;
print "Running Powershell....\n";
print "\n########## The following Files are Available >>>>\n";
system ("powershell ${host_directory}/get_the_listing.ps1");
unlink ("${host_directory}/get_the_listing.ps1");

print "Enter Filename to restore (e.g. dsm.opt / <Enter> for none):";
	our $restore_name = <STDIN>;
	chomp $restore_name;
if ("$restore_name" ne "") {
	print "Attempting to restore \"$restore_name\"...\n";
	print "Creating Powershell script.....\n";
	open (IP_ARRAY,">${host_directory}/get_the_data.ps1") or &been_an_error;
	print IP_ARRAY "\$password = get-content C:\\cred.txt | convertto-securestring\n";
	print IP_ARRAY "\$credentials = new-object -typename System.Management.Automation.PSCredential -argumentlist \"$windows_domain\\$windows_admin\",\$password\n";
	print IP_ARRAY "    \$error.clear()\n";


	print IP_ARRAY "\$Job = Start-Job {Get-Content -Force -ReadCount 0 \"\\\\${windows_host}\\$log_drive_letter\$\\program files\\tivoli\\tsm\\$base_directory\\$restore_name\"} -Credential \$credentials\n";
	print IP_ARRAY "\$Job | Wait-Job\n";
	print IP_ARRAY "\$FileText = \$Job | Receive-Job\n";
	print IP_ARRAY "Write-Output \$FileText \| Out-File ${host_directory}\\${windows_host}.$restore_name.$datetime2.copy\n";
	print IP_ARRAY "${host_directory}\\${windows_host}.$restore_name.$datetime2.copy\n";

	close (IP_ARRAY);


print "Running Powershell....\n";
system ("powershell ${host_directory}/get_the_data.ps1");
unlink ("${host_directory}/get_the_data.ps1");
print "Done!\n";
system ("pause");
goto GETFILES;
}
else {
	print "Doin' Nothing...\n";
	system ("pause");
}

## Run_Collect Brace	
}


#

# RUN_SERVICE:
# if ($loganswer eq "Run_Service"){ 
	# &draw_windows_heading;
	# print "Search for a client (copy address to clipboard)\n(ENTER=none.) >>>";
	# our $search_string = <STDIN>;
	# chomp $search_string;
# if ("$search_string" ne "" ) {
		
	

	# $search_string=uc $search_string;
	# $how_many_hits=qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -optfile=${host_directory}dsm_custom.opt select count from nodes where node_name like '%$search_string%'");      
	# chomp $how_many_hits;
	# if ($how_many_hits == 0){ 
		# print "No nodes with that search string!\n";
		# system ("pause");
		# goto RUN_SERVICE;
		
	# }
	# system("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -optfile=${host_directory}dsm_custom.opt select node_name, tcp_address, tcp_name, platform_name from nodes where node_name like '%$search_string%'");
        # system ("pause");
   # }
	# &draw_windows_heading;
	# use Net::Ping; 
	# use Socket;   
       	# use Term::Menu;
	
	# my $typeprompt = new Term::Menu (
	# beforetext => "MENU OPTIONS:\n",
	# aftertext => "\nChoose then press <enter> => ",
	# );
	# my $typeanswer = $typeprompt->menu(
        # QUERY  =>      		["QUERY", 'q'],
        # STOP  =>      		["STOP", 'p'],
        # START  =>      		["START", 's'],
        # RESTART  =>      	["RESTART", 'r'],
                
  # ); 

	# &draw_windows_heading;
	# print "Please enter Hostname or IP address of ONLINE Client: ";
	# our $windows_host = <STDIN>;
	# chomp $windows_host;
	
	# if ($windows_host eq "") { 
		# print "No such host - null string!\n";
		# system ("pause");
		# goto LOG_MENU;
	# }
	
	 # $p = Net::Ping->new();
	 # if ($p->ping($windows_host)){
		# $can_ping="ALIVE";
			
		# }
		# else { 
		# $can_ping="DEAD" 
		# };
		
	# if ($can_ping eq "DEAD" ) { 
		# print "This client \"$windows_host\" is OFFLINE (cannot ping). Returning....\n";
		# system ("pause");
		# goto LOG_MENU;
		# }
	# if ($can_ping eq "ALIVE" ) { 
		# print "This client \"$windows_host\" is ONLINE (can ping!). Continuing....\n";
		# system ("pause");
		
		# }	
	# if ("$windows_host" eq "" ) { goto LOG_MENU;}

  
  # if ($typeanswer eq "QUERY" || $typeanswer eq "") {  
  	        # unlink ("${host_directory}/service_query.txt");
  	# unlink ("${host_directory}/service_full.txt");
	# print "Running Service Query on $windows_host...\n(You MAY be prompted for the Windows password on first run)\n";
	# system ("runas /noprofile /savecreds /user:$windows_domain\\$windows_admin  \"cmd /C sc \\\\$windows_host query | find /I \\\"TSM\\\" | find \\\"SERVICE_NAME:\\\" >${host_directory}/service_query.txt\"");	
	# &draw_windows_heading;
	
	
# while (not -e "${host_directory}/service_query.txt") {
   
   # print "Waiting for schedule query to complete...\n";
   # sleep 5;
# }
 

	# open (DATA, "${host_directory}/service_query.txt") or die "broken\n";
	# print "here...";
	# @creds=<DATA>;
	# foreach $line_of_file (@creds) {
	 # print "$line_of_file\n";
	# ($name_field, $tsm_service_name) = (split /: /,$line_of_file)[0,1];
	
	# chomp $name_field;
	# chomp $tsm_service_name;
	# system ("runas /noprofile /savecreds /user:$windows_domain\\$windows_admin  \"cmd /C sc \\\\$windows_host query \\\"$tsm_service_name\\\" >>${host_directory}/service_full.txt\"");
	# &draw_windows_heading;
	# sleep 3;
	# }
	
	# print "Done...\n";
	# close (DATA);
	# print "Opening Current TSM Services...\n\n";
	# system ("start ${host_directory}/service_full.txt");
	# system ("pause");
	# goto LOG_MENU;
# };

  # if ($typeanswer eq "STOP" || $typeanswer eq "START" || $typeanswer eq "RESTART") {  

	# &draw_windows_heading;
	
	# print "\n########## The following Services are Available >>>>\n";
	# system ("powershell ${host_directory}/query_schedulers.ps1");
	# unlink ("${host_directory}/query_schedulers.ps1");

	# print "Enter Schedule Name to $typeanswer <Enter> for none):";
	# our $schedule_name = <STDIN>;
	# chomp $schedule_name;
	
	
	# if ("$schedule_name" ne "") {
	# print "Attempting to $typeanswer \"$schedule_name\"...\n";
		
	
	# if ($typeanswer eq "START"){
	
	# }	

	# if ($typeanswer eq "STOP"){
	
	# }

	# if ($typeanswer eq "RESTART"){
	
	# }
	


	# close (IP_ARRAY);
	# print "Running Powershell....\n";
	# system ("powershell ${host_directory}/change_schedule.ps1");
	# unlink ("${host_directory}/change_schedule.ps1");
	# print "Done!\n";
	# system ("pause");
	# goto LOG_MENU;
# }
# else {
	# print "Doin' Nothing...\n";
	# system ("pause");
# }

# ## if schedule is valid or not
# }
	
# ## RUN Service Brace
# }

# Log Menu Brace
}
	
## Function Brace
}

###########################################################################
## Subroutine:
## Name: make_backup_graphs
## Use:  Make backup graphs
###########################################################################

sub make_backup_graphs {
	
	use GD::Graph::bars; 
	require 'save.pl'; 
	print STDERR "Processing sample.....\n"; 
	@data = ( 
		[ @datelist ], 
		[ @datalist ],
		[ @mbytes_sec ], 	
		); 

$my_graph = new GD::Graph::bars(1024,768); 
$my_graph->set( 
	x_label => 'Days ago (0=today)', 
	y1_label => 'Time Taken for ' . $node_name . ' to Backup(minutes)', 
	y2_label => 'MB per sec for ' . $node_name . ' to Backup', 
	title => 'Client Backup Time vs Day', 
	y1_max_value => int($maximum_y+5),
	y2_max_value => int($max_second_axis+5),
	y_min_value => 0, 
	y_tick_number => 10, 
	two_axes => 1,
	bar_spacing => 1,
	##x_label_skip => ($x_count/10), 
	x_label_skip => 1, 
	transparent => 0,
	bar_spacing => 20, 
	overwrite => 1,
	shadow_depth => 0, 
	shadowclr => 'dred',
	long_ticks => 1,
	show_values => 1,
 ); 

$my_graph->set_legend('Time Taken (minutes)', 'MB per Second');
#$my_graph->set(logo => 'c:/tectradelogo.gif');
#$my_graph->set(logo_resize => 0.5);
#$my_graph->set(logo_position => 'LL');
$my_graph->plot(\@data); 
save_chart($my_graph, "${host_directory}/$tsm_server-$node_name"); 
print "\n\nThe image has been saved to: ${image_dir}${tsm_server}-${node_name}.gif\n\n\n\n\n";
system ("pause");
} 

###########################################################################
## Subroutine:
## Name: make_ip_address_array
## Use:  mis-named. Gets processor data
###########################################################################

sub make_ip_address_array {

&draw_heading;
print "please enter Windows Domain: ";
our $windows_domain = <STDIN>;
print "please enter Domain Administrator: ";
our $windows_admin = <STDIN>;
print "please enter password ";
system ("powershell \"read-host -assecurestring | convertfrom-securestring | out-file C:\\cred.txt\"");
print "password set.\n";
chomp $windows_domain; 	# get rid of carriage returns
chomp $windows_admin; 	# get rid of carriage returns
chomp $domain_password;	# get rid of carriage returns

print "If you need NON-TSM nodes added to this query, edit host_ip_addresses.txt now\n";
print "Keep the same IP_ADDRESS,NODENAME,PLATFORM comma separtated format (make it up!!\n)";
system("pause");



print "Creating Powershell script. \nThis may take several minutes. Please wait......\n\n";
	
#### Define modules to use
	
	 use Net::Ping; 
	 use Socket;   
	 $p = Net::Ping->new();
	 
#### Open some files

	open (IP_ADDRESSES,"<${host_directory}/host_ip_addresses.txt") or &been_an_error;
	open (IP_ARRAY,">${host_directory}/host_ip_address_array.ps1") or &been_an_error;
	print IP_ARRAY "\$password = get-content C:\\cred.txt | convertto-securestring\n";
	print IP_ARRAY "\$credentials = new-object -typename System.Management.Automation.PSCredential -argumentlist \"$windows_domain\\$windows_admin\",\$password\n";
	print IP_ARRAY "New-Item $host_ps_directory\\wmi_collection.csv -type file -force\n";
	print IP_ARRAY "\"IP ADDRESS;DNS NAME;PING ALIVE;TSM NODENAME;PLATFORM NAME;MANUFACTURER;MODEL;CORE COUNT(2008+);PHYS PROCESSORS(XP/2003=LOGICAL 2008=SOCKETS);LOGICAL PROCESSORS(XP/2003 NA 2008=LOGICAL);PROCESSOR NAME;SPEED;GB RAM;OS;SERVICE PACK\" | out-File $host_ps_directory\\wmi_collection.csv -append -encoding \"ASCII\"\n";
	@ip_address_list=<IP_ADDRESSES>;
	
#### Get the ip address and TSM nodename
	
	foreach $ip_line (@ip_address_list) {
		($ip_addrs, $tsm_nodename, $platform_name) = (split /,/,$ip_line)[0,1,2];
		$ip_addrs =~ s/ //g;
		print "\.";
		chomp $ip_addrs;
		chomp $tsm_nodename;
		chomp $platform_name;
#### Get DNS
		
		if (gethostbyaddr(inet_aton($ip_addrs), AF_INET)){
			$dns_name = gethostbyaddr(inet_aton($ip_addrs), AF_INET);
		}
			else 
			{
			$dns_name = "DNS UNRESOLVABLE";
		}

#### Get Ping
#print "Pinging $tsm_nodename ($ip_addrs/$dns_name)";
		if ($p->ping($ip_addrs)){
			$can_ping="ALIVE";
			print IP_ARRAY "    \$error.clear()\n";
			print IP_ARRAY "    get-wmiobject -computer $ip_addrs -cred \$credentials -class win32_computersystem\n";
			print IP_ARRAY "    if (!\$error)\n";
			print IP_ARRAY "    {";
			print IP_ARRAY "        \$computerSystem = get-wmiobject win32_computersystem -computer $ip_addrs -cred \$credentials\n";
			print IP_ARRAY "        \$operatingsystem = get-wmiobject win32_operatingsystem -computer $ip_addrs -cred \$credentials\n";
			print IP_ARRAY "        \$processor = get-wmiobject win32_processor -computer $ip_addrs -cred \$credentials\n";        
			print IP_ARRAY "        \$manufacturer = \$computerSystem.manufacturer\n";
			print IP_ARRAY "        \$model = \$computerSystem.model\n";
			print IP_ARRAY "        \$os = \$operatingsystem.caption\n";
			print IP_ARRAY "        \$servicePack = \$operatingsystem.servicepackmajorversion\n";
			print IP_ARRAY "        \$coreCount = @(\$processor)[0].NumberOfCores\n";
			print IP_ARRAY "        \$processorCount = \$computerSystem.NumberOfProcessors\n";
			print IP_ARRAY "        \$logicalCount = \$computerSystem.NumberOfLogicalProcessors\n";
			print IP_ARRAY "        \$procName = @(\$processor)[0].name\n";
			print IP_ARRAY "        \$procSpeed = @(\$processor)[0].currentclockspeed\n";
			print IP_ARRAY "        \$ram = [int]\$operatingsystem.totalvisiblememorysize \/ 1048576\n";       
			print IP_ARRAY "        \$computerinfo = \"$ip_addrs;$dns_name;$can_ping;$tsm_nodename;$platform_name;\$manufacturer;\$model;\$coreCount;\$processorCount;\$logicalCount;\$procName;\$procSpeed;\$ram;\$os;\$servicePack\"\n";       
			print IP_ARRAY "        Write-Host \$computerInfo\n";
			print IP_ARRAY "    	}\n";
			print IP_ARRAY "    else\n";
			print IP_ARRAY "    	{\n";        
			print IP_ARRAY "       \$computerinfo = \"$ip_addrs;$dns_name;$can_ping;$tsm_nodename;$platform_name;UNKNOWN;UNKNOWN;1;1;1;UNKNOWN;UNKNOWN;0;UNKNOWN;UNKNOWN\"\n";
			print IP_ARRAY "    	}\n";
			print IP_ARRAY "    \$computerInfo | out-File -Filepath $host_ps_directory\\wmi_collection.csv -append -encoding \"ASCII\"\n";
			}
			
		else
		{
			$can_ping="SWITCHED OFF!";
			      
			print IP_ARRAY "       \$computerinfo = \"$ip_addrs;$dns_name;$can_ping;$tsm_nodename;$platform_name;UNKNOWN;UNKNOWN;1;1;1;UNKNOWN;UNKNOWN;0;UNKNOWN;UNKNOWN\"\n";
			print IP_ARRAY "    \$computerInfo | out-File -Filepath $host_ps_directory\\wmi_collection.csv -append -encoding \"ASCII\"\n";
		}
		
		
}
		
		
	$p->close();
	close (IP_ADDRESSES);
	close (IP_ARRAY);

system ("cls");
print "\nReady to run Powershell Script!\n\n";
print "This will take up to 1 hour and may produce errors if:\n";
print "1. Machine is switched off during query\n";
print "2. Machine can't be queried with WMI\n\n";
print "To make the spreadsheet, return to the menu and select option.\n";
system ("pause");
print "\nPlease wait....\n";

system ("powershell ${host_directory}/host_ip_address_array.ps1");


}


###########################################################################
## Subroutine:
## Name: make performance data
## Use:  gets a collection of perf csv's - no graph processing
###########################################################################

sub make_performance_data {
chdir ${host_directory};
system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select date(start_time), activity, entity, (sum(minute(end_time-start_time)))  from summary where activity='MIGRATION' group by date(start_time), activity, entity order by date(start_time) > ${host_directory}/${tsm_server}_MIGRATION_PERF.csv");
system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select date(start_time), activity, entity, (sum(minute(end_time-start_time)))  from summary where activity='STGPOOL BACKUP' group by date(start_time), activity, entity order by date(start_time) > ${host_directory}/${tsm_server}_STGPOOL_PERF.csv");
system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select date(start_time), activity, entity, (sum(minute(end_time-start_time)))  from summary where activity='FULL_DBBACKUP' group by date(start_time), activity, entity order by date(start_time) > ${host_directory}/${tsm_server}_DBBACKUP_PERF.csv");
system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select date(start_time), activity, (sum(minute(end_time-start_time)))  from summary where activity='RECLAMATION' group by date(start_time), activity order by date(start_time) > ${host_directory}/${tsm_server}_RECLAMATION_PERF.csv");
system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select date(start_time), activity, (sum(minute(end_time-start_time)))  from summary where activity='OFFSITE RECLAMATION' group by date(start_time), activity order by date(start_time) > ${host_directory}/${tsm_server}_OFFSITE_RECLAMATION_PERF.csv");
system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select date(start_time), activity, entity, (sum(minute(end_time-start_time)))  from summary where activity='BACKUP' group by date(start_time), activity, entity order by date(start_time) > ${host_directory}/${tsm_server}_NODEBACKUP_PERF.csv");
system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select date(start_time),drive_name,(sum(minute(end_time-start_time))) from summary where activity='TAPE MOUNT' group by date(start_time), drive_name order by date(start_time) > ${host_directory}/${tsm_server}_TAPEMOUNT_PERF.csv");
system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select library_name,drive_name,date(start_time),time(start_time),date(end_time),time(end_time) from summary where activity='TAPE MOUNT' and start_time>current_timestamp-48 hours > ${host_directory}/${tsm_server}_DRIVE_USAGE_48_HOURS.csv");
}


###########################################################################
## Subroutine:
## Name: make_path_macro
## Use:  gets macros for various items
###########################################################################

sub make_path_macro {
chdir ${host_directory};
open (PATHS_MACRO_CREATE, ">${host_directory}/${tsm_server}_path_MACRO_CREATE.txt") or &been_an_error;
open (PATHS_MACRO_DELETE, ">${host_directory}/${tsm_server}_path_MACRO_DELETE.txt") or &been_an_error;

#########################
## Add Library Create
#########################

open (PATHS_LIBRARIES, "<${host_directory}/path_data_libraries.txt") or &been_an_error;
@path_data_libraries=<PATHS_LIBRARIES>;
if (scalar(@path_data_libraries)==0) { 
	&draw_heading;
	print "No Data for $node_name!!\n\n";
	print "Please try another server.\n\n\n";
	$no_data_for_node=1;
	system ("pause");	
	}

foreach $line_of_file (@path_data_libraries) {      
	($source_name, $destination_name, $library_name, $device_name) = (split /,/,$line_of_file)[0,1,2,3];
	chomp $source_name;
	chomp $destination_name;
	chomp $library_name;
	chomp $device_name;
	chomp $source_type;
	
	print PATHS_MACRO_CREATE "def libr $destination_name libt=scsi shared=yes\n";
	print PATHS_MACRO_CREATE "commit\n";
	print PATHS_MACRO_CREATE "def path $source_name $destination_name SRCT=server DESTT=library device=$device_name online=yes autodetect=yes\n";
	print PATHS_MACRO_CREATE "commit\n";
	
	}	
our $no_data_for_node=0;
close (PATHS_LIBRARIES);

##############################
## Add Drive create and delete
##############################

open (PATHS_DRIVES, "<${host_directory}/path_data_drives.txt") or &been_an_error;
@path_data_drives=<PATHS_DRIVES>;
if (scalar(@path_data_drives)==0) { 
	&draw_heading;
	print "No Data for $node_name!!\n\n";
	print "Please try another server.\n\n\n";
	$no_data_for_node=1;
	system ("pause");	
	}

foreach $line_of_file (@path_data_drives) {      
	($source_name, $destination_name, $library_name, $device_name, $source_type) = (split /,/,$line_of_file)[0,1,2,3,4];
	chomp $source_name;
	chomp $destination_name;
	chomp $library_name;
	chomp $device_name;
	chomp $source_type;
	
	print PATHS_MACRO_CREATE "def drive $library_name $destination_name\n";
	print PATHS_MACRO_CREATE "commit\n";
	print PATHS_MACRO_CREATE "def path $source_name $destination_name SRCT=$source_type DESTT=drive library=$library_name device=$device_name online=yes autodetect=yes\n";
	print PATHS_MACRO_CREATE "commit\n";
	print PATHS_MACRO_DELETE "del path $source_name $destination_name SRCT=$source_type DESTT=drive library=$library_name\n";
	print PATHS_MACRO_DELETE "commit\n";
	print PATHS_MACRO_DELETE "del drive $library_name $destination_name\n";
	print PATHS_MACRO_DELETE "commit\n";
	}
	our $no_data_for_node=0;

##############################
## Add library delete
##############################

open (PATHS_LIBRARIES, "<${host_directory}/path_data_libraries.txt") or &been_an_error;
@path_data_libraries=<PATHS_LIBRARIES>;
if (scalar(@path_data_libraries)==0) { 
	&draw_heading;
	print "No Data for $node_name!!\n\n";
	print "Please try another server.\n\n\n";
	$no_data_for_node=1;
	system ("pause");	
	}

foreach $line_of_file (@path_data_libraries) {      
	($source_name, $destination_name, $library_name, $device_name) = (split /,/,$line_of_file)[0,1,2,3];
	chomp $source_name;
	chomp $destination_name;
	chomp $library_name;
	chomp $device_name;
	chomp $source_type;
	
	print PATHS_MACRO_DELETE "del path $source_name $destination_name SRCT=server DESTT=library\n";
	print PATHS_MACRO_DELETE "commit\n";
	print PATHS_MACRO_DELETE "del library $destination_name\n";
	print PATHS_MACRO_DELETE "commit\n";
	}	
	
	close (PATHS_LIBRARIES);
	close (PATHS_DRIVES);close (PATHS_LIBRARIES);
	close (PATHS_MACRO_CREATE);
	close (PATHS_MACRO_DELETE);
	; 
}


#############################
# Make Node Replication Macros
#############################

sub setup_node_replication {
	

chdir ${host_directory};

## Enable or Disable replication

open (REPLICATION_ENABLE, ">${host_directory}/${tsm_server}_REPLICATION_ENABLE.txt") or &been_an_error;
open (REPLICATION_DISABLE, ">${host_directory}/${tsm_server}_REPLICATION_DISABLE.txt") or &been_an_error;
open (REPLICATION_SYNCSEND, ">${host_directory}/${tsm_server}_REPLICATION_SYNCSEND.txt") or &been_an_error;
open (REPLICATION_SYNCRECEIVE, ">${host_directory}/${tsm_server}_SYNCRECEIVE.txt") or &been_an_error;

## Backup options

open (REPLICATION_BK_ALL_DATA, ">${host_directory}/${tsm_server}_REPLICATION_BK_ALL_DATA.txt") or &been_an_error;
open (REPLICATION_BK_ACTIVE_DATA, ">${host_directory}/${tsm_server}_REPLICATION_BK_ACTIVE_DATA.txt") or &been_an_error;
open (REPLICATION_BK_ACTIVE_DATA_HIGH_PRIORITY, ">${host_directory}/${tsm_server}_REPLICATION_BK_ACTIVE_DATA_HIGH_PRIORITY.txt") or &been_an_error;
open (REPLICATION_BK_ALL_DATA_HIGH_PRIORITY, ">${host_directory}/${tsm_server}_REPLICATION_BK_ALL_DATA_HIGH_PRIORITY.txt") or &been_an_error;
open (REPLICATION_BK_DEFAULT, ">${host_directory}/${tsm_server}_REPLICATION_BK_DEFAULT.txt") or &been_an_error;
open (REPLICATION_BK_NONE, ">${host_directory}/${tsm_server}_REPLICATION_BK_NONE.txt") or &been_an_error;

## Archive Options

open (REPLICATION_AR_ALL_DATA, ">${host_directory}/${tsm_server}_REPLICATION_AR_ALL_DATA.txt") or &been_an_error;
open (REPLICATION_AR_ALL_DATA_HIGH_PRIORITY, ">${host_directory}/${tsm_server}_REPLICATION_AR_ALL_DATA_HIGH_PRIORITY.txt") or &been_an_error;
open (REPLICATION_AR_DEFAULT, ">${host_directory}/${tsm_server}_REPLICATION_AR_DEFAULT.txt") or &been_an_error;
open (REPLICATION_AR_NONE, ">${host_directory}/${tsm_server}_REPLICATION_AR_NONE.txt") or &been_an_error;

## Space Managed Options

open (REPLICATION_SP_ALL_DATA, ">${host_directory}/${tsm_server}_REPLICATION_SP_ALL_DATA.txt") or &been_an_error;
open (REPLICATION_SP_ALL_DATA_HIGH_PRIORITY, ">${host_directory}/${tsm_server}_REPLICATION_SP_ALL_DATA_HIGH_PRIORITY.txt") or &been_an_error;
open (REPLICATION_SP_DEFAULT, ">${host_directory}/${tsm_server}_REPLICATION_SP_DEFAULT.txt") or &been_an_error;
open (REPLICATION_SP_NONE, ">${host_directory}/${tsm_server}_REPLICATION_SP_NONE.txt") or &been_an_error;


### NODES

open (NODES_FILE, "<${host_directory}/nodenames.txt") or &been_an_error;
@repnodes=<NODES_FILE>;
foreach $line_of_file (@repnodes) {      
	($replnode) = (split /,/,$line_of_file)[0];
	chomp $replnode;

## General switches

	print REPLICATION_ENABLE "update node $replnode REPLState=enabled\n";
	print REPLICATION_DISABLE "update node $replnode REPLState=disabled\n";
	print REPLICATION_SYNCSEND "update node $replnode REPLMode=SYNCSEND\n";
	print REPLICATION_SYNCRECEIVE "update node $replnode REPLMode=SYNCRECEIVE\n";

## Backup 

	print REPLICATION_BK_ALL_DATA "update node $replnode BKREPLRuledefault=ALL_DATA\n";
	print REPLICATION_BK_ACTIVE_DATA "update node $replnode BKREPLRuledefault=ACTIVE_DATA\n";
	print REPLICATION_BK_ACTIVE_DATA_HIGH_PRIORITY "update node $replnode BKREPLRuledefault=ACTIVE_DATA_HIGH_PRIORITY\n";
	print REPLICATION_BK_ALL_DATA_HIGH_PRIORITY "update node $replnode BKREPLRuledefault=ALL_DATA_HIGH_PRIORITY\n";
	print REPLICATION_BK_DEFAULT "update node $replnode BKREPLRuledefault=DEFAULT\n";
	print REPLICATION_BK_NONE "update node $replnode BKREPLRuledefault=NONE\n";

## Archive

	print REPLICATION_AR_ALL_DATA "update node $replnode ARREPLRuledefault=ALL_DATA\n";
	print REPLICATION_AR_ALL_DATA_HIGH_PRIORITY "update node $replnode ARREPLRuledefault=ALL_DATA_HIGH_PRIORITY\n";
	print REPLICATION_AR_DEFAULT "update node $replnode ARREPLRuledefault=DEFAULT\n";
	print REPLICATION_AR_NONE "update node $replnode ARREPLRuledefault=NODE\n";

## Space Managed

	print REPLICATION_SP_ALL_DATA "update node $replnode SPREPLRuledefault=ALL_DATA\n";
	print REPLICATION_SP_ALL_DATA_HIGH_PRIORITY "update node $replnode SPREPLRuledefault=ALL_DATA_HIGH_PRIORITY\n";
	print REPLICATION_SP_DEFAULT "update node $replnode SPREPLRuledefault=DEFAULT\n";
	print REPLICATION_SP_NONE "update node $replnode SPREPLRuledefault=NONE\n";
	}
	
## Close it up

	close (REPLICATION_ENABLE);
	close (REPLICATION_DISABLE);
	close (REPLICATION_SYNCSEND);
	close (REPLICATION_SYNCRECEIVE);
	close (REPLICATION_BK_ALL_DATA);
	close (REPLICATION_BK_ACTIVE_DATA);
	close (REPLICATION_BK_ACTIVE_DATA_HIGH_PRIORITY);
	close (REPLICATION_BK_ALL_DATA_HIGH_PRIORITY);
	close (REPLICATION_BK_DEFAULT);
	close (REPLICATION_BK_NONE);
	close (REPLICATION_AR_ALL_DATA);
	close (REPLICATION_AR_ALL_HIGH_PRIORITY);
	close (REPLICATION_AR_DEFAULT);
	close (REPLICATION_AR_NONE);
	close (REPLICATION_SP_ALL_DATA);
	close (REPLICATION_SP_ALL_HIGH_PRIORITY);
	close (REPLICATION_SP_DEFAULT);
	close (REPLICATION_SP_NONE);
}

#############################
# Make Policy Macro
#############################
sub make_policy_macro {
	

chdir ${host_directory};
open (DOMAIN_MACRO_CREATE, ">${host_directory}/${tsm_server}_DOMAIN_MACRO_CREATE.txt") or &been_an_error;
open (NODES_MACRO_CREATE, ">${host_directory}/${tsm_server}_NODES_MACRO_CREATE.txt") or &been_an_error;
open (POLICY_MACRO_CREATE, ">${host_directory}/${tsm_server}_POLICY_MACRO_CREATE.txt") or &been_an_error;
open (MGMTCLASS_MACRO_CREATE, ">${host_directory}/${tsm_server}_MGMTCLASS_MACRO_CREATE.txt") or &been_an_error;
open (DEF_MGMTCLASS_MACRO_CREATE, ">${host_directory}/${tsm_server}_DEF_MGMTCLASS_MACRO_CREATE.txt") or &been_an_error;
open (BU_COPYG_MACRO_CREATE, ">${host_directory}/${tsm_server}_BU_COPYG_MACRO_CREATE.txt") or &been_an_error;
open (AR_COPYG_MACRO_CREATE, ">${host_directory}/${tsm_server}_AR_COPYG_MACRO_CREATE.txt") or &been_an_error;
open (POLICY_ACTIVATE_MACRO_CREATE, ">${host_directory}/${tsm_server}_POLICY_ACTIVATE_MACRO_CREATE.txt") or &been_an_error;
open (OPTIONSET_MACRO_CREATE, ">${host_directory}/${tsm_server}_OPTIONSET_MACRO_CREATE.txt") or &been_an_error;
open (OPTIONS_MACRO_CREATE, ">${host_directory}/${tsm_server}_OPTIONS_MACRO_CREATE.txt") or &been_an_error;
open (STATUS_TUNING_CREATE, ">${host_directory}/${tsm_server}_STATUS_TUNING_MACRO_CREATE.txt") or &been_an_error;

#open (CLIENT_SCHED_CREATE, ">${host_directory}/${tsm_server}_CLIENT_SCHEDULES_CREATE.txt");
#open (ADMIN_SCHED_CREATE, ">${host_directory}/${tsm_server}_ADMIN_SCHEDULES_CREATE.txt");

#########################
## CREATE FILES
#########################

#### Status Tuning

#print STATUS_TUNING_CREATE "set servername $tsm_server\n";
print STATUS_TUNING_CREATE "reg lic file=tsmee.lic\n";
print STATUS_TUNING_CREATE "commit\n";
print STATUS_TUNING_CREATE "set accounting on\n";
print STATUS_TUNING_CREATE "SET EVENTRETENTION 60\n";
print STATUS_TUNING_CREATE "set actlogret 31\n";
print STATUS_TUNING_CREATE "setopt expint 0\n";
print STATUS_TUNING_CREATE "setopt commtimeout 3600\n";
print STATUS_TUNING_CREATE "setopt idletimeout 60\n";
print STATUS_TUNING_CREATE "setopt maxsessions 100\n";
print STATUS_TUNING_CREATE "setopt NUMOPENVOLSALLOWED 100\n";
print STATUS_TUNING_CREATE "set maxschedsessions 95\n";
print STATUS_TUNING_CREATE "set drmdbb 7\n";
print STATUS_TUNING_CREATE "set eventret 31\n";
print STATUS_TUNING_CREATE "set drmfileprocess yes\n";
print STATUS_TUNING_CREATE "set drmplanprefix C:\\TSM_PLANFILES\\SERVER1\\TECPOC01\n";
print STATUS_TUNING_CREATE "set drminstrprefix C:\\TSM_PLANFILES\\SERVER1\INSTRUCTIONS\tecpoc01\n";
print STATUS_TUNING_CREATE "set serverpassword H0cusp0cus\n";
print STATUS_TUNING_CREATE "setopt deduprequiresbackup no\n";
print STATUS_TUNING_CREATE "update admin tectrade H0cusp0cus\n";
print STATUS_TUNING_CREATE "update admin tt_collector H0cusp0cus\n";
print STATUS_TUNING_CREATE "update admin admin Pa55word\n";
print STATUS_TUNING_CREATE "commit\n";
close(STATUS_TUNING_CREATE);

open (FILESPACE_FILE, "<${host_directory}/file_spaces.txt") or &been_an_error;
@filespaces=<FILESPACE_FILE>;
foreach $line_of_file (@filespaces) {      
	($days_since_backup, $node_name, $filespace_name, $filespace_type, $filespace_id ) = (split /,/,$line_of_file)[0,1,2,3,4];
	chomp $days_since_backup;
	chomp $node_name;
	chomp $filespace_name;
	chomp $filespace_type;
	chomp $filespace_id;
	print FILESPACE_DELETE "/* FILESPACE: $filespace_name   DAYS SINCE BACKUP: $days_since_backup */\n";
	print FILESPACE_DELETE "delete filespace $node_name $filespace_id type=any data=any nametype=FSID codetype=both wait=yes\n";
	print FILESPACE_DELETE "commit\n";
	}	
	close (FILESPACE_FILE);
	
### DOMAINS

open (DOMAINS_FILE, "<${host_directory}/domains.txt") or &been_an_error;
@domains=<DOMAINS_FILE>;
foreach $line_of_file (@domains) {      
	($domain_name, $description) = (split /,/,$line_of_file)[0,1];
	chomp $domain_name;
	chomp $description;
	
	print DOMAIN_MACRO_CREATE "define domain $domain_name desc=\"$description\"\n";
	print DOMAIN_MACRO_CREATE "commit\n";
	}	
	close (DOMAINS_FILE);


	
### POLICY

open (POLICY_FILE, "<${host_directory}/policysets.txt") or &been_an_error;
@policysets=<POLICY_FILE>;
foreach $line_of_file (@policysets) {      
	($domain_name, $policyset_name, $description) = (split /,/,$line_of_file)[0,1,2];
	chomp $domain_name;
	chomp $policyset_name;
	chomp $description;
	
	print POLICY_MACRO_CREATE "define policyset $domain_name $policyset_name desc=\"$description\"\n";
	print POLICY_MACRO_CREATE "commit\n";
	print POLICY_ACTIVATE_MACRO_CREATE "activate policyset $domain_name $policyset_name\n";
	print POLICY_ACTIVATE_MACRO_CREATE "commit\n";
	}	
	close (POLICY_FILE);


### MGMT

open (MGMT_FILE, "<${host_directory}/mgmt.txt") or &been_an_error;
@mgmtclasses=<MGMT_FILE>;
foreach $line_of_file (@mgmtclasses) {      
	($domain_name, $policyset_name, $mgmtclass_name, $description) = (split /,/,$line_of_file)[0,1,2,3];
	chomp $domain_name;
	chomp $policyset_name;
	chomp $mgmtclass_name;
	chomp $description;	
	print MGMTCLASS_MACRO_CREATE "define mgmt $domain_name $policyset_name $mgmtclass_name desc=\"$description\"\n";
	print MGMTCLASS_MACRO_CREATE "commit\n";
	}	
	close (MGMT_FILE);

### DEF MGMTCLASS

# ASsign DEFMGmtclass--domain_name--policy_set_name--class_name
open (MGMT_FILE, "<${host_directory}/defmc.txt") or &been_an_error;
@mgmtclasses=<MGMT_FILE>;
foreach $line_of_file (@mgmtclasses) {      
	($domain_name, $policyset_name, $mgmtclass_name) = (split /,/,$line_of_file)[0,1,2];
	chomp $domain_name;
	chomp $policyset_name;
	chomp $mgmtclass_name;
	print DEF_MGMTCLASS_MACRO_CREATE "ASsign DEFMGmtclass $domain_name $policyset_name $mgmtclass_name\n";
	print DEF_MGMTCLASS_MACRO_CREATE "commit\n";
	}	
	close (MGMT_FILE);
	
# ASsign DEFMGmtclass--domain_name--policy_set_name--class_name
### BU COPYGROUPS

open (BU_COPYG_FILE, "<${host_directory}/bu_copygroups.txt") or &been_an_error;
@bucopygroups=<BU_COPYG_FILE>;
foreach $line_of_file (@bucopygroups) {      
	($domain_name, $policyset_name, $mgmtclass_name, $copygroup_name, $verexists_name, $verdeleted_name, $retextra_name, $retonly_name, $mode_name, $serialization_name, $frequency_name, $destination_name, $toc_name) = (split /,/,$line_of_file)[0,1,2,3,4,5,6,7,8,9,10,11,12];
	chomp $domain_name;
	chomp $policyset_name;
	chomp $mgmtclass_name;
	chomp $copygroup_name;
	chomp $verexists_name;
	chomp $verdeleted_name;
	chomp $retextra_name;
	chomp $retonly_name;
	chomp $mode_name;
	chomp $serialization_name;
	chomp $frequency_name;
	chomp $destination_name;
	chomp $toc_name;
	if ("$toc_name" eq "") {
	$toc_label="";
	}
	else {
	$toc_label="tocdestination=";
	}
	 
	
	print BU_COPYG_MACRO_CREATE "DEFine COpygroup $domain_name $policyset_name $mgmtclass_name $copygroup_name Type=Backup DESTination=$destination_name FREQuency=$frequency_name VERExists=$verexists_name VERDeleted=$verdeleted_name RETExtra=$retextra_name RETOnly=$retonly_name MODE=$mode_name SERialization=$serialization_name $toc_label$toc_name\n";
	print BU_COPYG_MACRO_CREATE "commit\n";
	}	
	close (BU_COPYG_FILE);
	
### AR COPYGROUPS

open (AR_COPYG_FILE, "<${host_directory}/ar_copygroups.txt") or &been_an_error;
@arcopygroups=<AR_COPYG_FILE>;
foreach $line_of_file (@arcopygroups) {      
	($domain_name, $policyset_name, $mgmtclass_name, $copygroup_name, $retver_name, $serialization_name, $destination_name) = (split /,/,$line_of_file)[0,1,2,3,4,5,6];
	chomp $domain_name;
	chomp $policyset_name;
	chomp $mgmtclass_name;
	chomp $copygroup_name;
	chomp $retver_name;
	chomp $serialization_name;
	chomp $destination_name;
	
	print AR_COPYG_MACRO_CREATE "DEFine COpygroup $domain_name $policyset_name $mgmtclass_name $copygroup_name Type=archive DESTination=$destination_name retver=$retver_name\n";
	print AR_COPYG_MACRO_CREATE "commit\n";
	}	
	close (AR_COPYG_FILE);
	
### NODES

open (NODES_FILE, "<${host_directory}/detailed_nodes.txt") or &been_an_error;
@detailed_nodes=<NODES_FILE>;
foreach $line_of_file (@detailed_nodes) {      
	($node_name, $pass_exp_name, $contact_name, $domain_name, $compression_name, $arch_delete_name, $back_delete_name, $cloptset_name, $type_name, $maxnum_mp_name, $keepmp_name) = (split /,/,$line_of_file)[0,1,2,3,4,5,6,7,8,9,10];
	chomp $node_name;
	chomp $pass_exp_name;
	chomp $contact_name;
	chomp $domain_name;
	chomp $compression_name;
	chomp $arch_delete_name;
	chomp $back_delete_name;
	chomp $cloptset_name;
	chomp $type_name;
	chomp $maxnum_mp_name;
	chomp $keepmp_name;
	
	print NODES_MACRO_CREATE "reg node $node_name $node_name passexp=$pass_exp_name userid=$node_name contact=\"$contact_name\" domain=$domain_name compression=$compression_name archdelete=$arch_delete_name backdelete=$back_delete_name clopset=$cloptset_name type=$type_name maxnummp=$maxnum_mp_name keepmp=$keepmp_name\n";
	print NODES_MACRO_CREATE "commit\n";
	}	
	close (NODES_FILE);
	
### OPTION SETS

open (OPTIONSET_FILE, "<${host_directory}/optionsets.txt") or &been_an_error;
@optionsets=<OPTIONSET_FILE>;
foreach $line_of_file (@optionsets) {      
	($optionset_name, $description_name) = (split /,/,$line_of_file)[0,1];
	chomp $optionset_name;
	chomp $description_name;
	
	print OPTIONSET_MACRO_CREATE "define cloptset $optionset_name desc=\"$description_name\"\n";
	print OPTIONSET_MACRO_CREATE "commit\n";
	}	
	close (OPTIONSET_MACRO_CREATE);
	
	open (OPTIONS_FILE, "<${host_directory}/options.txt") or &been_an_error;
@options=<OPTIONS_FILE>;
foreach $line_of_file (@options) {      
	($optionset_name, $option_name, $option_value_name, $force_name, $seq_name) = (split /,/,$line_of_file)[0,1,2,3,4];
	chomp $optionset_name;
	chomp $option_name;
	chomp $option_value_name;
	chomp $force_name;
	chomp $seq_name;
	
	print OPTIONS_MACRO_CREATE "define clientopt $optionset_name $option_name \"$option_value_name\" force=$force_name seq=$seq_name\n";
	print OPTIONS_MACRO_CREATE "commit\n";
	}	
	close (OPTIONS_MACRO_CREATE);
		
	#######################	
	
	close (DOMAIN_MACRO_CREATE);
	close (POLICY_MACRO_CREATE);
	close (MGMTCLASS_MACRO_CREATE);
	close (POLICY_ACTIVATE_MACRO_CREATE);
	close (BU_COPYG_MACRO_CREATE);
	close (AR_COPYG_MACRO_CREATE);
	close (NODES_MACRO_CREATE);
	close (OPTIONSET_MACRO_CREATE);
	close (OPTIONS_MACRO_CREATE);
	close (FILESPACE_DELETE);
	
	
	print "\nThe macros have been saved...";
}

###########################################################################
## Subroutine:
## Name: def_nodes
## Use:  create nodes from seed file
###########################################################################

sub defnodes {
	
&draw_heading;	

print "Create 'nodelist.txt' file in output directory:\nFormat is:\n\n";
print "nodename1,password1,domain1,cloptset1\n";
print "nodename2,password2,domain2,cloptset2\n";
print "\n\n";
print "A sample has been created as nodelist_smp.txt in output directory\n";

open (SAMPLE, ">${host_directory}/nodelist_smp.txt") or &been_an_error;
print SAMPLE "nodename1,tivoli,gold,WINDOWS\n";
print SAMPLE "nodename2,tivoli,silver (this one has no optionset)\n";
print SAMPLE "nodename3,tivoli,bronze,SQL\n";

print "The output directory will now open:\n";
system ("pause");
system ("start ${host_directory}");

#print "\n\nWARNING: nodelist_smp.txt will be \nremoved at the end of this subroutine\n";

chdir ${host_directory};
open (NODE_CREATE, ">${host_directory}/${tsm_server}_DEFINE_NODES_FROM_LIST.txt") or &been_an_error;
open (NODE_DELETE, ">${host_directory}/${tsm_server}_DELETE_NODES_FROM_LIST.txt") or &been_an_error;
#########################
## CREATE FILES
#########################

### NODES (from list)
if (-e "${host_directory}/nodelist.txt") {

	open (NODE_LIST, "<${host_directory}/nodelist.txt") or &been_an_error;
	@nodes=<NODE_LIST>;
	foreach $line_of_file (@nodes) {    
	($cr_nodename, $cr_password, $cr_domain,$cr_cloptset) = (split /,/,$line_of_file)[0,1,2,3];
	
	chomp $cr_nodename;
	chomp $cr_password;
	chomp $cr_domain;
	chomp $cr_cloptset;
	#print "\"$cr_nodename\",\"$cr_password\",\"$cr_domain\",\"$cr_cloptset\"\n";
	if ($cr_cloptset eq '') { 
		$cr_opt="";
		}
	else { $cr_opt="cloptset=";}
	print NODE_CREATE "REG NODE $cr_nodename $cr_password userid=none passexp=9999 contact=\"Tectrade Computers Ltd\" backdelete=yes archdelete=yes type=client $cr_opt$cr_cloptset maxnummp=1 domain=$cr_domain deduplication=clientorserver\n";
	print NODE_CREATE "commit\n";
	print NODE_DELETE "rem node $cr_nodename\n";
	print NODE_DELETE "commit\n";
	}
	close (NODE_LIST);
}	
	else {
		print "\n\nNo nodelist.txt file to process...doesn't matter!";
	     }

	close (NODES_CREATE);
	close (NODES_DELETE);
	close (SAMPLE);
	#unlink ("${host_directory}/nodelist_smp.txt"); 
	
	print "\nFinished...\nMacro saved to:\n${host_directory}/${tsm_server}_DEFINE_NODES_FROM_LIST.txt\n";
	system ("pause");
}











###########################################################################
## Subroutine:
## Name: accounting_log_process
## Use:  base routine for accnt - THIS IS EXTERNAL ROUTINE FROM WEB 
###########################################################################

sub accounting_log_process {
	
	#use Time::Local;


require "ctime.pl";
require "timelocal.pl";

#____________________________Governing definitions________________________________________
$report_filename = "${host_directory}TSM_ACCOUNTING_REPORT.txt";	# Define the name of the output report.
					# If already existing, the original will be
					# preserved by renaming, then a new one produced.
$debug = 0;				# Set 1 to show progress.
sub ascending  { $a <=> $b; }	# For doing an ascending numerical sort.

# Filtration timestamps which may be overridden by specifying from- and to- time
# values as invocation options.
$from_datestamp = 0;   $to_datestamp = 99999999999999;

$GB = 1073741824;   $BYTES_IN_GB = 1073741824;
$MB = 1048576;   $BYTES_IN_MB = 1048576;
$KB = 1024;   $BYTES_IN_KB = 1024;


#___________________________________Preliminaries___________________________________________
# Get current date-time:
($timenow_wkday,$timenow_mon,$timenow_mday,$timenow_time,$timenow_year) = split(' ',&ctime(time));


# Associative array for translating month name to a number.  Month numbers are
# defined as 2-digit literals to facilitate sorting and date comparision, as
# in "19930617" as a month-day-year combo.
%mon_to_num = ( "Jan","01", "Feb","02", "Mar","03", "Apr","04", "May","05", "Jun","06",
                "Jul","07", "Aug","08", "Sep","09", "Oct","10", "Nov","11", "Dec","12");
#printf("yyyymmdd hh:mm:ss = %s/%s/%s %s.  Weekday = %s.  Month name = %s.\n",
#       $timenow_year, $mon_to_num{$timenow_mon}, $timenow_mday, $timenow_time,
#       $timenow_wkday, $timenow_mon);


#______________________________Process invocation options__________________________________
# Set defaults.
$default_logfile = "${host_directory}dsmaccnt.log";
$arg_file="$default_logfile";
if (! &Validate_Filename($arg_file))
	 {
	 printf("Quitting because of failed validation on file name '%s'.\n",$arg_file);
	 exit(1);
	 }
	       push(@arg_files,$arg_file);
$default_wkday = "any";    $arg_wkday = $default_wkday;
$default_month = "any";    $arg_month = $default_month;
$default_mday  = "any";    $arg_mday  = $default_mday;
$default_year  = "any";    $arg_year  = $default_year;
$default_fromyear  = "any";   $arg_fromyear  = $default_fromyear;
$default_frommonth = "any";   $arg_frommonth = $default_frommonth;
$default_fromday   = "any";   $arg_fromday   = $default_fromday;
$default_fromhour  = "any";   $arg_fromhour  = $default_fromhour;
$default_frommin   = "any";   $arg_frommin   = $default_frommin;
$default_fromsec   = "any";   $arg_fromsec   = $default_fromsec;
$default_toyear    = "any";   $arg_toyear    = $default_toyear;
$default_tomonth   = "any";   $arg_tomonth   = $default_tomonth;
$default_today     = "any";   $arg_today     = $default_today;
$default_tohour    = "any";   $arg_tohour    = $default_tohour;
$default_tomin     = "any";   $arg_tomin     = $default_tomin;
$default_tosec     = "any";   $arg_tosec     = $default_tosec;
$sortby_name = 0;   $sortby_size = 1;   # Default is to sort by size.
	
$argc = $#ARGV + 1;

# If no invocation operands, we will subsequently try Stdin as data source.
while ($#ARGV > -1)
   {
   $word = shift(@ARGV);  # Take the leftmost word.

   if (($argc == 1)  &&  (($word =~ m|help|i)  ||  ($word =~ m|-help|i)))
      {
      &Show_Usage_From_Prolog();   exit(0);
      }
   elsif (($word eq "wkday")  ||  ($word eq "weekday"))
      {
      if ($#ARGV == -1)
         {
         printf("Keyword '%s' found, but no weekday name follows it.\n", $word);
         exit(1);
         }
      else
         {
         $_ = shift(@ARGV);  # Take the next token as weekday name.
         ARG_WKDAY:
            {
            # Look for days of the week:
            /^[Mm][Oo][Nn].*/  &&  do {$arg_wkday = "Mon"; last ARG_WKDAY; };
            /^[Tt][Uu][Ee].*/  &&  do {$arg_wkday = "Tue"; last ARG_WKDAY; };
            /^[Ww][Ee][Dd].*/  &&  do {$arg_wkday = "Wed"; last ARG_WKDAY; };
            /^[Tt][Hh][Uu].*/  &&  do {$arg_wkday = "Thu"; last ARG_WKDAY; };
            /^[Ff][Rr][Ii].*/  &&  do {$arg_wkday = "Fri"; last ARG_WKDAY; };
            /^[Ss][Aa][Tt].*/  &&  do {$arg_wkday = "Sat"; last ARG_WKDAY; };
            /^[Ss][Uu][Nn].*/  &&  do {$arg_wkday = "Sun"; last ARG_WKDAY; };
            # None of the above, so reject.
            printf("Weekday name value '%s' not recognized.\n",$_);   exit(1);
            }
         }
      } # end of "weekday" parameter processing
   elsif (($word eq "mon")  ||  ($word eq "month"))
      {
      if ($#ARGV == -1)
         {
         printf("Keyword '%s' found, but no month name follows it.\n", $word);
         exit(1);
         }
      else
         {
         $_ = shift(@ARGV);  # Take the next token as month name.
         ARG_MONTH:
            {
	    # Spell out the month names - looks better in header than 3-char abbrev.
            /^[Jj][Aa][Nn].*/  &&  do {$arg_month = "January";   last ARG_MONTH; };
            /^[Ff][Ee][Bb].*/  &&  do {$arg_month = "February";  last ARG_MONTH; };
            /^[Mm][Aa][Rr].*/  &&  do {$arg_month = "March";     last ARG_MONTH; };
            /^[Aa][Pp][Rr].*/  &&  do {$arg_month = "April";     last ARG_MONTH; };
            /^[Mm][Aa][Yy].*/  &&  do {$arg_month = "May";       last ARG_MONTH; };
            /^[Jj][Uu][Nn].*/  &&  do {$arg_month = "June";      last ARG_MONTH; };
            /^[Jj][Uu][Ll].*/  &&  do {$arg_month = "July";      last ARG_MONTH; };
            /^[Aa][Uu][Gg].*/  &&  do {$arg_month = "August";    last ARG_MONTH; };
            /^[Ss][Ee][Pp].*/  &&  do {$arg_month = "September"; last ARG_MONTH; };
            /^[Oo][Cc][Tt].*/  &&  do {$arg_month = "October";   last ARG_MONTH; };
            /^[Nn][Oo][Vv].*/  &&  do {$arg_month = "November";  last ARG_MONTH; };
            /^[Dd][Ee][Cc].*/  &&  do {$arg_month = "December";  last ARG_MONTH; };
            # None of the above, so reject.
            printf("Month name value '%s' not recognized.\n",$_);   exit(1);
            }
         }
      } # end of month parameter processing
   elsif ($word eq "day")
      {
      if ($#ARGV == -1)
         {
         printf("Keyword '%s' found, but no day-of-month number follows it.\n", $word);
         exit(1);
         }
      else
         {
         $arg_mday = shift(@ARGV);  # Take the next token as day number.
         if ($arg_mday =~ /\D/)
            {
            printf("Ahem...your given day of month value, '%s', is not numeric.\n",
                   $arg_mday);
            exit 1;
            }
         elsif ( ($arg_mday < 1)  ||  ($arg_mday > 31) )
            {
            printf("Ahem...your given day of month value, '%s', is not in range 1-31.\n",
                   $arg_mday);
            exit 1;
            }
         }
      } # end of "day" parameter processing
   elsif ($word eq "year")
      {
      if ($#ARGV == -1)
         {
         printf("Keyword '%s' found, but no year value follows it.\n", $word);
         exit(1);
         }
      else
         {
         $arg_year = shift(@ARGV);  # Take the next token as year.
         if ($arg_year =~ /\D/)
            {
            printf("Ahem...your given year value, '%s', is not numeric.\n",
                   $arg_year);
            exit 1;
            }
         elsif ( ($arg_year < 1111)  ||  ($arg_year > 9999) )
            {
            printf("Ahem...your given year value, '%s', is not a 4-digit number.\n",
                   $arg_year);
            exit 1;
            }
         }
      } # end of "year" parameter processing
   elsif ($word eq "fromyear")
      {
      if ($#ARGV == -1)
         {
         printf("Keyword '%s' found, but no year value follows it.\n", $word);
         exit(1);
         }
      else
         {
	 #_______________________________Evaluate "fromyear year_value"_____________________________________
         $arg_fromyear = shift(@ARGV);  # Take the next token as value.
	 if (length($arg_fromyear) != 4)
	    {
	    printf(STDERR "fromyear value '%s' is not 4 digits - quitting\n", $arg_fromyear);
	    exit(1);
	    }
	 # Value is 4 characters.  See if digits.
	 if ($arg_fromyear !~ /(\d\d\d\d)/)
	    {
	    printf(STDERR "fromyear value '%s' is not 4 digits - quitting\n", $arg_fromyear);
	    exit(1);
            }
	 # The value is 4 digits.  Assure reasonable.
	 if ($arg_fromyear > $timenow_year)
	    {
	    printf(STDERR "fromyear value '%s' is beyond this year, %s, which doesn't make sense - quitting\n",
		   $arg_fromyear, $timenow_year);
	    exit(1);
            }
	 # (We don't check for the from-year being below any value, because it doesn't matter.)
	 # The value seems reasonable.
	 $from_specified = 1;
         }
      } # end of "fromyear" parameter processing
   elsif ($word eq "frommonth")
      {
      if ($#ARGV == -1)
         {
         printf("Keyword '%s' found, but no month value follows it.\n", $word);
         exit(1);
         }
      else
         {
	 #___________________________Evaluate "frommonth month_value"_______________________________________
         $arg_frommonth = shift(@ARGV);  # Take the next token as value.
	 if ($arg_frommonth =~ /\d+/)	# Numeric month.
	    {
	    #_____________________________Evaluate numeric month value____________________________________
	    # Month value should then be 1 or 2 digits, from 1 - 12.
	    if (($arg_frommonth < 1)  ||  ($arg_frommonth > 12))
	       {
	       printf(STDERR "Numeric frommonth value '%s' is not 1-12 - quitting\n", $arg_frommonth);
	       exit(1);
	       }
	    # The month number is 1 - 12; convert to zero-basis month number, for later feeding to timelocal().
	    $arg_frommonthnum = $arg_frommonth - 1;
	    }
	 else				# Alphabetic month.
	    {
	    #_________________________Evaluate alphabetic month value____________________________
	    # Convert month name to zero-basis month number, for later feeding to timelocal().
	    ARG_FROMMONTH:
               {
	       $arg_frommonth =~ /^[Jj][Aa][Nn].*/  &&  do {$arg_frommonthnum = 0;   last ARG_FROMMONTH; };
	       $arg_frommonth =~ /^[Ff][Ee][Bb].*/  &&  do {$arg_frommonthnum = 1;   last ARG_FROMMONTH; };
	       $arg_frommonth =~ /^[Mm][Aa][Rr].*/  &&  do {$arg_frommonthnum = 2;   last ARG_FROMMONTH; };
	       $arg_frommonth =~ /^[Aa][Pp][Rr].*/  &&  do {$arg_frommonthnum = 3;   last ARG_FROMMONTH; };
	       $arg_frommonth =~ /^[Mm][Aa][Yy].*/  &&  do {$arg_frommonthnum = 4;   last ARG_FROMMONTH; };
	       $arg_frommonth =~ /^[Jj][Uu][Nn].*/  &&  do {$arg_frommonthnum = 5;   last ARG_FROMMONTH; };
	       $arg_frommonth =~ /^[Jj][Uu][Ll].*/  &&  do {$arg_frommonthnum = 6;   last ARG_FROMMONTH; };
	       $arg_frommonth =~ /^[Aa][Uu][Gg].*/  &&  do {$arg_frommonthnum = 7;   last ARG_FROMMONTH; };
	       $arg_frommonth =~ /^[Ss][Ee][Pp].*/  &&  do {$arg_frommonthnum = 8;   last ARG_FROMMONTH; };
	       $arg_frommonth =~ /^[Oo][Cc][Tt].*/  &&  do {$arg_frommonthnum = 9;   last ARG_FROMMONTH; };
	       $arg_frommonth =~ /^[Nn][Oo][Vv].*/  &&  do {$arg_frommonthnum = 10;  last ARG_FROMMONTH; };
	       $arg_frommonth =~ /^[Dd][Ee][Cc].*/  &&  do {$arg_frommonthnum = 11;  last ARG_FROMMONTH; };
	       # None of the above, so reject.
	       printf("frommonth name value '%s' not recognized - needs to be like Jan, February, etc.\n",
		      $arg_frommonth);
	       exit(1);
	       }
	    }
	 $from_specified = 1;
	 }
      } # end of "frommonth" parameter processing
   elsif ($word eq "fromday")
      {
      if ($#ARGV == -1)
         {
         printf("Keyword '%s' found, but no day value follows it.\n", $word);
         exit(1);
         }
      else
         {
	 #___________________________Evaluate "fromday day_value"_________________________________
         $arg_fromday = shift(@ARGV);  # Take the next token as value.
	 if ($arg_fromday =~ /\d+/)	# Numeric day.
	    {
	    #_________________________Evaluate numeric day value________________________________
	    # Day value should then be 1 or 2 digits, from 1 - 31.
	    if (($arg_fromday < 1)  ||  ($arg_fromday > 31))
	       {
	       printf(STDERR "Numeric fromday value '%s' is not 1-31 - quitting\n", $arg_fromday);
	       exit(1);
	       }
	    # The day number is 1 - 31.
	    $arg_fromdaynum = $arg_fromday;
	    }
	 else				# Alphabetic day.
	    {
	    printf("fromday value '%s' is not numeric (1-31) - quitting.\n",
		   $arg_fromday);
	    exit(1);
	    }
	 $from_specified = 1;
	 }
      } # end of "fromday" parameter processing
   elsif ($word eq "fromtime")
      {
      if ($#ARGV == -1)
         {
         printf("Keyword '%s' found, but no time value follows it.\n", $word);
         exit(1);
         }
      else
         {
	 #_______________________________Evaluate "fromtime time_value"_____________________________________
         $arg_fromtime = shift(@ARGV);  # Take the next token as value.
         ARG_FROMTIME:
	    {
	    $arg_fromtime =~ /(\d{1,2}):(\d{1,2}):(\d{1,2})/  &&  do { $arg_fromhour = $1; $arg_frommin = $2;
								       $arg_fromsec = $3; last ARG_FROMTIME; };
	    $arg_fromtime =~ /(\d{1,2}):(\d{1,2})/  &&  do { $arg_fromhour = $1; $arg_frommin = $2;
							     last ARG_FROMTIME; };
	    $arg_fromtime =~ /(\d{1,2})/  &&  do { $arg_fromhour = $1; last ARG_FROMTIME; };
            # None of the above, so reject.
            printf("Fromtime value '%s' not recognized.\n", $arg_fromtime);   exit(1);
            }
	 # Assure validity:
	 if ($arg_fromhour ne "any")
	    {
	    if ($arg_fromhour  >  23)
	       {
	       printf(STDERR "fromtime hour value '%s' is invalid - quitting\n", $arg_fromhour);   exit(1);
	       }
	    }
	 if ($arg_frommin ne "any")
	    {
	    if ($arg_frommin  >  59)
	       {
	       printf(STDERR "fromtime minute value '%s' is invalid - quitting\n", $arg_frommin);   exit(1);
	       }
	    }
	 if ($arg_fromsec ne "any")
	    {
	    if ($arg_fromsec  >  59)
	       {
	       printf(STDERR "fromtime second value '%s' is invalid - quitting\n", $arg_fromsec);   exit(1);
	       }
	    }
	 #printf("Fromtime '%s' interpreted to %s:%s:%s.\n", $arg_fromtime, $arg_fromhour, $arg_frommin, $arg_fromsec);
	 $from_specified = 1;
         }
      } # end of "fromtime" parameter processing
   elsif ($word eq "toyear")
      {
      if ($#ARGV == -1)
         {
         printf("Keyword '%s' found, but no year value follows it.\n", $word);
         exit(1);
         }
      else
         {
	 #_______________________________Evaluate "toyear year_value"_____________________________________
         $arg_toyear = shift(@ARGV);  # Take the next token as value.
	 if (length($arg_toyear) != 4)
	    {
	    printf(STDERR "toyear value '%s' is not 4 digits - quitting\n", $arg_toyear);
	    exit(1);
	    }
	 # Value is 4 characters.  See if digits.
	 if ($arg_toyear !~ /(\d\d\d\d)/)
	    {
	    printf(STDERR "toyear value '%s' is not 4 digits - quitting\n", $arg_toyear);
	    exit(1);
            }
	 # The value is 4 digits.  Assure reasonable.
	 if ($arg_toyear > $timenow_year)
	    {
	    printf(STDERR "toyear value '%s' is beyond this year, %s, which doesn't make sense - quitting\n",
		   $arg_toyear, $timenow_year);
	    exit(1);
            }
	 # The value seems reasonable.
	 $to_specified = 1;
         }
      } # end of "toyear" parameter processing
   elsif ($word eq "tomonth")
      {
      if ($#ARGV == -1)
         {
         printf("Keyword '%s' found, but no month value follows it.\n", $word);
         exit(1);
         }
      else
         {
	 #_______________________________Evaluate "tomonth month_value"_____________________________________
         $arg_tomonth = shift(@ARGV);  # Take the next token as value.
	 if ($arg_tomonth =~ /\d+/)	# Numeric month.
	    {
	    #_____________________________Evaluate numeric month value____________________________________
	    # Month value should then be 1 or 2 digits, to 1 - 12.
	    if (($arg_tomonth < 1)  ||  ($arg_tomonth > 12))
	       {
	       printf(STDERR "Numeric tomonth value '%s' is not 1-12 - quitting\n", $arg_tomonth);
	       exit(1);
	       }
	    # The month number is 1 - 12; convert to zero-basis month number, for later feeding to timelocal().
	    $arg_tomonthnum = $arg_tomonth - 1;
	    }
	 else				# Alphabetic month.
	    {
	    #_________________________Evaluate alphabetic month value________________________________
	    # Convert month name to zero-basis month number, for later feeding to timelocal().
	    ARG_TOMONTH:
               {
	       $arg_tomonth =~ /^[Jj][Aa][Nn].*/  &&  do {$arg_tomonthnum = 0;   last ARG_TOMONTH; };
	       $arg_tomonth =~ /^[Ff][Ee][Bb].*/  &&  do {$arg_tomonthnum = 1;   last ARG_TOMONTH; };
	       $arg_tomonth =~ /^[Mm][Aa][Rr].*/  &&  do {$arg_tomonthnum = 2;   last ARG_TOMONTH; };
	       $arg_tomonth =~ /^[Aa][Pp][Rr].*/  &&  do {$arg_tomonthnum = 3;   last ARG_TOMONTH; };
	       $arg_tomonth =~ /^[Mm][Aa][Yy].*/  &&  do {$arg_tomonthnum = 4;   last ARG_TOMONTH; };
	       $arg_tomonth =~ /^[Jj][Uu][Nn].*/  &&  do {$arg_tomonthnum = 5;   last ARG_TOMONTH; };
	       $arg_tomonth =~ /^[Jj][Uu][Ll].*/  &&  do {$arg_tomonthnum = 6;   last ARG_TOMONTH; };
	       $arg_tomonth =~ /^[Aa][Uu][Gg].*/  &&  do {$arg_tomonthnum = 7;   last ARG_TOMONTH; };
	       $arg_tomonth =~ /^[Ss][Ee][Pp].*/  &&  do {$arg_tomonthnum = 8;   last ARG_TOMONTH; };
	       $arg_tomonth =~ /^[Oo][Cc][Tt].*/  &&  do {$arg_tomonthnum = 9;   last ARG_TOMONTH; };
	       $arg_tomonth =~ /^[Nn][Oo][Vv].*/  &&  do {$arg_tomonthnum = 10;  last ARG_TOMONTH; };
	       $arg_tomonth =~ /^[Dd][Ee][Cc].*/  &&  do {$arg_tomonthnum = 11;  last ARG_TOMONTH; };
	       # None of the above, so reject.
	       printf("tomonth name value '%s' not recognized - needs to be like Jan, February, etc.\n",
		      $arg_tomonth);
	       exit(1);
	       }
	    }
	 $to_specified = 1;
	 }
      } # end of "tomonth" parameter processing
   elsif ($word eq "today")
      {
      if ($#ARGV == -1)
         {
         printf("Keyword '%s' found, but no day value follows it.\n", $word);
         exit(1);
         }
      else
         {
	 #_____________________________Evaluate "today day_value"_______________________________
         $arg_today = shift(@ARGV);  # Take the next token as value.
	 if ($arg_today =~ /\d+/)	# Numeric day.
	    {
	    #_________________________Evaluate numeric day value______________________________
	    # Day value should then be 1 or 2 digits, to 1 - 31.
	    if (($arg_today < 1)  ||  ($arg_today > 31))
	       {
	       printf(STDERR "Numeric today value '%s' is not 1-31 - quitting\n", $arg_today);
	       exit(1);
	       }
	    # The day number is 1 - 31.
	    $arg_todaynum = $arg_today;
	    }
	 else				# Alphabetic day.
	    {
	    printf("today value '%s' is not numeric (1-31) - quitting.\n",
		   $arg_today);
	    exit(1);
	    }
	 $to_specified = 1;
	 }
      } # end of "today" parameter processing
   elsif ($word eq "totime")
      {
      if ($#ARGV == -1)
         {
         printf("Keyword '%s' found, but no time value follows it.\n", $word);
         exit(1);
         }
      else
         {
	 #_______________________________Evaluate "totime time_value"_________________________________
         $arg_totime = shift(@ARGV);  # Take the next token as value.
         ARG_TOTIME:
	    {
	    $arg_totime =~ /(\d{1,2}):(\d{1,2}):(\d{1,2})/  &&  do { $arg_tohour = $1; $arg_tomin = $2;
								     $arg_tosec = $3; last ARG_TOTIME; };
	    $arg_totime =~ /(\d{1,2}):(\d{1,2})/  &&  do { $arg_tohour = $1; $arg_tomin = $2;
							   last ARG_TOTIME; };
	    $arg_totime =~ /(\d{1,2})/  &&  do { $arg_tohour = $1; last ARG_TOTIME; };
            # None of the above, so reject.
            printf("Totime value '%s' not recognized.\n", $arg_totime);   exit(1);
            }
	 # Assure validity:
	 if ($arg_tohour ne "any")
	    {
	    if ($arg_tohour  >  23)
	       {
	       printf(STDERR "totime hour value '%s' is invalid - quitting\n", $arg_tohour);   exit(1);
	       }
	    }
	 if ($arg_tomin ne "any")
	    {
	    if ($arg_tomin  >  59)
	       {
	       printf(STDERR "totime minute value '%s' is invalid - quitting\n", $arg_tomin);   exit(1);
	       }
	    }
	 if ($arg_tosec ne "any")
	    {
	    if ($arg_tosec  >  59)
	       {
	       printf(STDERR "totime second value '%s' is invalid - quitting\n", $arg_tosec);   exit(1);
	       }
	    }
	 $to_specified = 1;
         }
      } # end of "totime" parameter processing
   elsif ($word eq "sortby")
      {
      if ($#ARGV == -1)
         {
         printf("Keyword '%s' found, but neither 'name' nor 'size' follows it.\n", $word);
         exit(1);
         }
      else
         {
         $arg_sortby = shift(@ARGV);  # Take the next token as value.
         $sortby_name = 0;   $sortby_size = 0;   # Reset possibilities so that only
						 # one may prevail.
         ARG_SORTBY:
            {
            $arg_sortby =~ /^[Nn][Aa][Mm][Ee]/  &&  do {$sortby_name = 1; last ARG_SORTBY; };
            $arg_sortby =~ /^[Uu][Ss][Ee][Rr]/  &&  do {$sortby_name = 1; last ARG_SORTBY; };
            $arg_sortby =~ /^[Ss][Ii][Zz][Ee]/  &&  do {$sortby_size = 1; last ARG_SORTBY; };
            # None of the above, so reject.
            printf("Sortby value '%s' not recognized.\n",$arg_sortby);   exit(1);
            }
         }
      } # end of "sortby" parameter processing
   else
      {
      #_______________________________Process apparent file name_________________________________
    
      if (! &Validate_Filename($arg_file))
	 {
	 printf("Quitting because of failed validation on file name '%s'.\n",$arg_file);
	 exit(1);
	 }
	 else
	 { 
	 $arg_file = $word;  # Take the token as file name.
         printf("Processing file name '%s'.\n", $arg_file);		   # Cannot continue.
	 }
      push(@arg_files,$arg_file);	# Accumulate file names for later processing, after all
					# arguments have been received and evaluated.
      }
   }

#________________________Check consistency of some parameters___________________________
# If lower items in the time composite are specified, those above must be.
if ($arg_frommonth ne "any")
   {
   if ($arg_fromyear eq "any")
      {
      printf(STDERR "frommonth specified, but not encompassing year - quitting.\n");
      exit(1);
      }
   }
if ($arg_fromday ne "any")
   {
   if ($arg_frommonth eq "any")
      {
      printf(STDERR "fromday specified, but not encompassing month - quitting.\n");
      exit(1);
      }
   if ($arg_fromyear eq "any")
      {
      printf(STDERR "fromday specified, but not encompassing year - quitting.\n");
      exit(1);
      }
   }
if ($arg_fromhour ne "any")
   {
   if ($arg_fromday eq "any")
      {
      printf(STDERR "fromhour specified, but not encompassing day - quitting.\n");
      exit(1);
      }
   if ($arg_frommonth eq "any")
      {
      printf(STDERR "fromhour specified, but not encompassing month - quitting.\n");
      exit(1);
      }
   if ($arg_fromyear eq "any")
      {
      printf(STDERR "fromhour specified, but not encompassing year - quitting.\n");
      exit(1);
      }
   }
if ($arg_frommin ne "any")
   {
   if ($arg_fromhour eq "any")
      {
      printf(STDERR "frommin specified, but not encompassing hour - quitting.\n");
      exit(1);
      }
   if ($arg_fromday eq "any")
      {
      printf(STDERR "frommin specified, but not encompassing day - quitting.\n");
      exit(1);
      }
   if ($arg_frommonth eq "any")
      {
      printf(STDERR "frommin specified, but not encompassing month - quitting.\n");
      exit(1);
      }
   if ($arg_fromyear eq "any")
      {
      printf(STDERR "frommin specified, but not encompassing year - quitting.\n");
      exit(1);
      }
   }
if ($arg_fromsec ne "any")
   {
   if ($arg_frommin eq "any")
      {
      printf(STDERR "fromsec specified, but not encompassing minute - quitting.\n");
      exit(1);
      }
   if ($arg_fromhour eq "any")
      {
      printf(STDERR "fromsec specified, but not encompassing hour - quitting.\n");
      exit(1);
      }
   if ($arg_fromday eq "any")
      {
      printf(STDERR "fromsec specified, but not encompassing day - quitting.\n");
      exit(1);
      }
   if ($arg_frommonth eq "any")
      {
      printf(STDERR "fromsec specified, but not encompassing month - quitting.\n");
      exit(1);
      }
   if ($arg_fromyear eq "any")
      {
      printf(STDERR "fromsec specified, but not encompassing year - quitting.\n");
      exit(1);
      }
   }

if ($arg_tomonth ne "any")
   {
   if ($arg_toyear eq "any")
      {
      printf(STDERR "tomonth specified, but not encompassing year - quitting.\n");
      exit(1);
      }
   }
if ($arg_today ne "any")
   {
   if ($arg_tomonth eq "any")
      {
      printf(STDERR "today specified, but not encompassing month - quitting.\n");
      exit(1);
      }
   if ($arg_toyear eq "any")
      {
      printf(STDERR "today specified, but not encompassing year - quitting.\n");
      exit(1);
      }
   }
if ($arg_tohour ne "any")
   {
   if ($arg_today eq "any")
      {
      printf(STDERR "tohour specified, but not encompassing day - quitting.\n");
      exit(1);
      }
   if ($arg_tomonth eq "any")
      {
      printf(STDERR "tohour specified, but not encompassing month - quitting.\n");
      exit(1);
      }
   if ($arg_toyear eq "any")
      {
      printf(STDERR "tohour specified, but not encompassing year - quitting.\n");
      exit(1);
      }
   }
if ($arg_tomin ne "any")
   {
   if ($arg_tohour eq "any")
      {
      printf(STDERR "tomin specified, but not encompassing hour - quitting.\n");
      exit(1);
      }
   if ($arg_today eq "any")
      {
      printf(STDERR "tomin specified, but not encompassing day - quitting.\n");
      exit(1);
      }
   if ($arg_tomonth eq "any")
      {
      printf(STDERR "tomin specified, but not encompassing month - quitting.\n");
      exit(1);
      }
   if ($arg_toyear eq "any")
      {
      printf(STDERR "tomin specified, but not encompassing year - quitting.\n");
      exit(1);
      }
   }
if ($arg_tosec ne "any")
   {
   if ($arg_tomin eq "any")
      {
      printf(STDERR "tosec specified, but not encompassing minute - quitting.\n");
      exit(1);
      }
   if ($arg_tohour eq "any")
      {
      printf(STDERR "tosec specified, but not encompassing hour - quitting.\n");
      exit(1);
      }
   if ($arg_today eq "any")
      {
      printf(STDERR "tosec specified, but not encompassing day - quitting.\n");
      exit(1);
      }
   if ($arg_tomonth eq "any")
      {
      printf(STDERR "tosec specified, but not encompassing month - quitting.\n");
      exit(1);
      }
   if ($arg_toyear eq "any")
      {
      printf(STDERR "tosec specified, but not encompassing year - quitting.\n");
      exit(1);
      }
   }

# If any from- time specified, construct composite to override default from_timestamp.
if ($from_specified)
   {
   if ($debug)  { printf("arg_fromsec = %s, arg_frommin = %s, arg_fromhour = %s, arg_fromday = %s,\n"
		       ." arg_frommonth = %s, arg_fromyear = %s\n",
		        $arg_fromsec, $arg_frommin, $arg_fromhour, $arg_fromday, $arg_frommonth, $arg_fromyear); }
   # Note that timelocal() has had historic defects, the worse in having the hour base-1 instead of base-0, such
   # that it was previously necessary to subtract 1 from the clock hour for its processing to come out right.
   # It appears that the function's authors finally have it right, so I removed the compensations.
   $from_secssince1970 = &timelocal($arg_fromsec   eq "any" ? 0  : $arg_fromsec,		# Base value: 0
				    $arg_frommin   eq "any" ? 0  : $arg_frommin,		# Base value: 0
				    $arg_fromhour  eq "any" ? 0  : $arg_fromhour,		# Base value: 0
				    $arg_fromday   eq "any" ? 1  : $arg_fromday,		# Base value: 1
				    $arg_frommonth eq "any" ? 0  : $arg_frommonthnum,		# Base value: 0
				    $arg_fromyear  eq "any" ? 0  : $arg_fromyear - 1900);	# Base value: 1
   $from_datestamp = &Secs_to_YYYYMMDDhhmmss($from_secssince1970);
   $from_datestamp_text = &Sub_Secs_to_DateTime($from_secssince1970);
   if ($debug)  { printf("from_secssince1970 resolves to '%s'; interprets to %s\n",
			$from_secssince1970, $from_datestamp); }
   }
else
   {
   $from_datestamp = "Any_Time";   $from_datestamp_text = "Any_Time";
   }

# If any to- time specified, construct composite to override default to_timestamp.
if ($to_specified)
   {
   @days_in_month = (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
   if ($debug)  { printf("arg_tosec = %s, arg_tomin = %s, arg_tohour = %s, arg_today = %s,\n"
		       ." arg_tomonth = %s, arg_toyear = %s\n",
		        $arg_tosec, $arg_tomin, $arg_tohour, $arg_today, $arg_tomonth, $arg_toyear); }
   # Note that the "to" values cannot be simply the maximum for the item: they must be
   # the maximum within the context of any chosen values.  For example, if 'tomonth'
   # were specified by the invoker, it would be inappropriate to let the day number become
   # 31; it should instead be the maximum value for that month.  Letting the day number be
   # 31 for February would result in timelocal returning a timestamp for March 3rd.
   if ($arg_toyear  eq "any")
      { $to_year = $timenow_year - 1900; }	# No year specified, so use this year.
   else  { $to_year = $arg_toyear - 1900; }	# Year specified, so use that.
   if ($arg_tomonth eq "any")
      {		# No month specified: use this month if no year specified; else use max month.
      if ($arg_toyear eq "any")  { $to_month = $timenow_mon; }
      else { $to_month = 11; }			# Maximum month number (range 0-11).
      }
   else { $to_month = $arg_tomonthnum; }	# Use specified month.
   if ($arg_today eq "any")
      {		# No day specified: use the maximum for the above-chosen month.
      # To do this we have to accommodate leap year...
      if ($to_month == 1)	# If February, 29 days on leap year, else 28...
	 {
	 if (&Is_Leapyear($to_year))  { $to_day = 29; }  else { $to_day = 28; }
	 }
      else  { $to_day = $days_in_month[$to_month]; }	# Else use last day in non-leapyear month.
      }
   else  { $to_day = $arg_today; }		# Day specified, so use it.
   # Note that timelocal() has had historic defects, the worse in having the hour base-1 instead of base-0, such
   # that it was previously necessary to subtract 1 from the clock hour for its processing to come out right.
   # It appears that the function's authors finally have it right, so I removed the compensations.
   if ($arg_tohour eq "any")  { $to_hour = 23; }  else  { $to_hour = $arg_tohour; }
   if ($arg_tomin  eq "any")  { $to_min  = 59; }  else  { $to_min  = $arg_tomin;  }
   if ($arg_tosec  eq "any")  { $to_sec  = 59; }  else  { $to_sec  = $arg_tosec;  }

   # Note that timelocal() seems to have a defect in making the hour base-1 instead of base-0, necessitating
   # subtracting 1 from the clock hour for its processing to come out right.
   $to_secssince1970 = &timelocal($to_sec, $to_min, $to_hour, $to_day, $to_month, $to_year);

   $to_datestamp = &Secs_to_YYYYMMDDhhmmss($to_secssince1970);
   $to_datestamp_text = &Sub_Secs_to_DateTime($to_secssince1970);
   if ($debug)  { printf("to_secssince1970 resolves to '%s'; interprets to %s",
		        $to_secssince1970, $to_datestamp); }
   }
else
   {
   $to_datestamp = "Any_Time";   $to_datestamp_text = "Any_Time";
   }

# Assure that to-time is not less than from-time:
if ($to_datestamp < $from_datestamp)
   {
   printf(STDERR "to-time (%s) is less than from-time (%s) - quitting\n",
	  $to_datestamp, $from_datestamp);
   exit(1);
   }


#_________________With all args now in and validated, process per data source________________
printf("\nReporting ADSM sessions, from %s to %s\n", $from_datestamp_text, $to_datestamp_text);

if (@arg_files)
   {
   #_______________________Process file names from command line___________________________
   foreach $arg_file (@arg_files)   { &Absorb_Data_Source($arg_file); }
   }
else
   {
   #___________No names were not supplied on cmdline - see if Stdin has data____________
   # We'll take either redirected or piped Stdin.  (Stdin being the terminal is too
   # lame to be considered worthy.)
   if ((-f STDIN)  ||  (-p STDIN))
      {
      if (-f STDIN)  { printf("\nTaking data from file redirected to Stdin...\n"); }
      if (-p STDIN)  { printf("\nTaking data from pipe to Stdin...\n"); }

      #_____________________Use Stdin as the source of the data_____________________
      $arg_file = "-";
      # Getting to here means we got usable usernames via Stdin.
      # Variable $arg_file is now ready for later processing.
      $rc = &Absorb_Data_Source($arg_file);
      if ($rc == 0)
	 {
	 print(STDERR "No data supplied through Stdin - quitting.\n");
	 exit(1);
	 }
      }
   else
      {
      print(STDERR "Data not supplied via named files or Stdin - quitting.\n");
      exit(1);
      }
   }

&Summarize_Data();


#______________________________Program done________________________________
exit 0;



#=================================  Subroutine Absorb_Data_Source  =====================================
sub Absorb_Data_Source
#
# Subroutine to process data from one input file to output file.
#
# INVOCATION:  $? = &Absorb_Data_Source(FileName);
#
# RETURNS:  Number of data lines processed.
#
   {

   #___________________________________________Local definitions________________________________________________________
   local($arg_file) = scalar($_[0]);				# Grab the given file name.
   if (! defined($first_time_through))  { $first_time_through = 1; }	# Turned off after first time through.

   $nodename_column_title1      = " ";          $nodename_column_title2      = "NODENAME";
   $opsys_column_title1         = " ";          $opsys_column_title2         = "OPSYS";
   $sessions_column_title1      = " ";          $sessions_column_title2      = "SESSIONS";
   $backup_obj_column_title1    = "BACKUP";     $backup_obj_column_title2    = "OBJECTS";
   $backup_kb_column_title1     = "BACKUP";     $backup_kb_column_title2     = "KB";
   $restore_obj_column_title1   = "RESTORE";    $restore_obj_column_title2   = "OBJECTS";
   $restore_kb_column_title1    = "RESTORE";    $restore_kb_column_title2    = "KB";
   $archive_obj_column_title1   = "ARCHIVE";    $archive_obj_column_title2   = "OBJECTS";
   $archive_kb_column_title1    = "ARCHIVE";    $archive_kb_column_title2    = "KB";
   $retrieve_obj_column_title1  = "RETRIEVE";   $retrieve_obj_column_title2  = "OBJECTS";
   $retrieve_kb_column_title1   = "RETRIEVE";   $retrieve_kb_column_title2   = "KB";
   $hsmstore_obj_column_title1  = "HSM-IN";     $hsmstore_obj_column_title2  = "OBJECTS";
   $hsmstore_kb_column_title1   = "HSM-IN";     $hsmstore_kb_column_title2   = "KB";
   $hsmrecall_obj_column_title1 = "HSM-OUT";    $hsmrecall_obj_column_title2 = "OBJECTS";
   $hsmrecall_kb_column_title1  = "HSM-OUT";    $hsmrecall_kb_column_title2  = "KB";
   $nodeobjs_column_title1      = " ";          $nodeobjs_column_title2      = "OBJECTS";
   $nodesesskb_column_title1    = "SESSION";    $nodesesskb_column_title2    = "KB";
   $nodedatakb_column_title1    = "DATA";       $nodedatakb_column_title2    = "KB";
   $sesssecs_column_title1      = "SESSION";    $sesssecs_column_title2      = "SECONDS";
   $idlesecs_column_title1      = "IDLEWAIT";   $idlesecs_column_title2      = "SECONDS";
   $commsecs_column_title1      = "COMMWAIT";   $commsecs_column_title2      = "SECONDS";
   $mediasecs_column_title1     = "MEDIAWAIT";  $mediasecs_column_title2     = "SECONDS";

   # For aligned reporting later, we will be keeping track of the maximum width of any column element, and
   # here start with the column titles, determining which of the over-under pair is larger.
   $maxlen_nodename       = ($l1 = length($nodename_column_title1))      > ($l2 = length($nodename_column_title2))      ? $l1 : $l2;
   $maxlen_opsyses        = ($l1 = length($opsys_column_title1))	 > ($l2 = length($opsys_column_title2))         ? $l1 : $l2;
   $maxlen_sessions       = ($l1 = length($sessions_column_title1))      > ($l2 = length($sessions_column_title2))      ? $l1 : $l2;
   $maxlen_backup_objs    = ($l1 = length($backup_obj_column_title1))    > ($l2 = length($backup_obj_column_title2))    ? $l1 : $l2;
   $maxlen_backup_kb      = ($l1 = length($backup_kb_column_title1))     > ($l2 = length($backup_kb_column_title2))     ? $l1 : $l2;
   $maxlen_restore_objs   = ($l1 = length($restore_obj_column_title1))   > ($l2 = length($restore_obj_column_title2))   ? $l1 : $l2;
   $maxlen_restore_kb     = ($l1 = length($restore_kb_column_title1))    > ($l2 = length($restore_kb_column_title2))    ? $l1 : $l2;
   $maxlen_archive_objs   = ($l1 = length($archive_obj_column_title1))   > ($l2 = length($archive_obj_column_title2))   ? $l1 : $l2;
   $maxlen_archive_kb     = ($l1 = length($archive_kb_column_title1))    > ($l2 = length($archive_kb_column_title2))    ? $l1 : $l2;
   $maxlen_retrieve_objs  = ($l1 = length($retrieve_obj_column_title1))  > ($l2 = length($retrieve_obj_column_title2))  ? $l1 : $l2;
   $maxlen_retrieve_kb    = ($l1 = length($retrieve_kb_column_title1))   > ($l2 = length($retrieve_kb_column_title2))   ? $l1 : $l2;
   $maxlen_hsmstore_objs  = ($l1 = length($hsmstore_obj_column_title1))  > ($l2 = length($hsmstore_obj_column_title2))  ? $l1 : $l2;
   $maxlen_hsmstore_kb    = ($l1 = length($hsmstore_kb_column_title1))   > ($l2 = length($hsmstore_kb_column_title2))   ? $l1 : $l2;
   $maxlen_hsmrecall_objs = ($l1 = length($hsmrecall_obj_column_title1)) > ($l2 = length($hsmrecall_obj_column_title2)) ? $l1 : $l2;
   $maxlen_hsmrecall_kb   = ($l1 = length($hsmrecall_kb_column_title1))  > ($l2 = length($hsmrecall_kb_column_title2))  ? $l1 : $l2;
   $maxlen_node_objs      = ($l1 = length($nodeobjs_column_title1))      > ($l2 = length($nodeobjs_column_title2))      ? $l1 : $l2;
   $maxlen_nodesess_kb    = ($l1 = length($nodesesskb_column_title1))    > ($l2 = length($nodesesskb_column_title2))    ? $l1 : $l2;
   $maxlen_nodedata_kb    = ($l1 = length($nodedatakb_column_title1))    > ($l2 = length($nodedatakb_column_title2))    ? $l1 : $l2;
   $maxlen_sesssecs       = ($l1 = length($sesssecs_column_title1))      > ($l2 = length($sesssecs_column_title2))      ? $l1 : $l2;
   $maxlen_idlesecs       = ($l1 = length($idlesecs_column_title1))      > ($l2 = length($idlesecs_column_title2))      ? $l1 : $l2;
   $maxlen_commsecs       = ($l1 = length($commsecs_column_title1))      > ($l2 = length($commsecs_column_title2))      ? $l1 : $l2;
   $maxlen_mediasecs      = ($l1 = length($mediasecs_column_title1))     > ($l2 = length($mediasecs_column_title2))     ? $l1 : $l2;

   #_____________________________________________Preliminaries______________________________________________
   # Before getting into time-consuming stuff which would be wasted if we could not proceed, perform some
   # dependency checks now.
   if ($first_time_through)
      {
      # Initial first and last year,month,day,hour,minute,second values, to detect extremes.
      $earliest_datestamp = 99999999999999;   $latest_datestamp = 0;
      # Initialize other min, max values:
      $queue_stay_time_min = 9999999;   $queue_stay_time_max = 0;
      $file_size_min = 9999999;   $file_size_max = 0;

      if (length($arg_mday) < 2)
	 { $arg_mday = " ".$arg_mday; }	# Account for leading blank which actually
					# appears in record, for grep to find it.

      $first_time_through = 0;	# Reset it.
      }

   #_______________________________Assimilate the accounting records________________________________________
   # Refer to the ADSM System Administration Guide for layout.
   # In general, the record contains 30 double-quoted entries, separated by two spaces.

   $current_time = time();		# For detecting bogus time values.
   printf("Current timestamp is '%s' (%s)\n",$current_time,&Sub_Secs_to_DateTime($current_time));

   print("Now assimilating ADSM accounting records...\n");
   %all_printers = ();		# Init. array null.
   $line_number = 0;		# To count the lines.
   open(ACCTFILE,"<$arg_file") || die "Unable to open ADSM accounting file '$arg_file'";

##   
## Here is the data collection
##
   
   while (<ACCTFILE>)
      {
      # The ADSM accounting file line will contain fields as specified below,
      # each separated by a comma.
      chomp($line = $_);		# Take the line and remove line-end \n.
      $line_number++;		# Count each line.
      #printf("'%s'\n",$line);  # Diagnostic.

      if ($debug)  { printf("%s\n", $line); }
      # Watch out for the data record version having changed from what this script
      # was programmed to handle:
      #if ((substr($line,0,2) ne "5,")		# What ADSMv2 had.
	#  &&  (substr($line,0,2) ne "3,"))	# What ADSMv3 has.
	 #{
	 #printf("ADSM accounting record %u does not begin with a recognized product level identifier\n"
	#	." indicating that the record layout version differs from what this script was\n"
	#	." programmed to handle.  Needs investigation.  Quitting.\n\a",
	#	$line_number);
	 #exit(1);
	 #}

      # Parse the record...
      ($product_level,			# Field  1: Product level
       $product_sublevel,		# Field  2: Product sublevel
       $product_name,			# Field  3: Product name, 'ADSM'
       $acctg_date,			# Field  4: Date of accounting (mm/dd/yyyy).  Has leading zeroes.
       $acctg_time,			# Field  5: Time of accounting (hh:mm:ss).  Has leading zeroes.
       $client_nodename,		# Field  6: Node name of ADSM client
       $client_owner,			# Field  7: Client owner name (Unix).  Often empty, but otherwise will contain a
					#	    Unix username.
       $client_platform,		# Field  8: Client platform (actually, opsys, like "AIX", "Linux").
       $auth_method,			# Field  9: Authentication method used
       $comm_method,			# Field 10: Communication method used for the session
       $server_termination,		# Field 11: Server termination indicator (0 = abnormal; 1 = normal)
       $archive_objs_inserted,		# Field 12: Number of archive database objects inserted during session
       $archive_kb_inserted,		# Field 13: Amount of archive files, in kilobytes, sent by the client to server
       $archive_objs_retrieved,		# Field 14: Number of archive database objects retrieved during session
       $archive_kb_retrieved,		# Field 15: Amount of archive files, in kilobytes, retrieved by the client
       $backup_objs_inserted,		# Field 16: Number of backup database objects inserted during session
       $backup_kb_inserted,		# Field 17: Amount of backup files, in kilobytes, sent by the client to server
       $backup_objs_retrieved,		# Field 18: Number of backup database objects retrieved during session
       $backup_kb_retrieved,		# Field 19: Amount of backup files, in kilobytes, retrieved by the client
       $session_kb,			# Field 20: Amount of data, in kilobytes, communicated between client and server.
					#           Includes both data volume and session management overhead.
       $session_secs,			# Field 21: Duration of the session, in seconds
       $idlewait_secs,			# Field 22: Amount of idle wait time during the session, in seconds
       $commwait_secs,			# Field 23: Amount of communications wait time during session, in seconds
       $mediawait_secs,			# Field 24: Amount of media wait time during session, in seconds
       $client_session_type,		# Field 25: Client session type. A value of 1 or 4 indicates a general client
					#           session; a value of 5 indicates a client session that is running a schedule.
       $hsm_objs_stored,		# Field 26: Number of space-managed database objects inserted during the session
       $hsm_kb_stored,			# Field 27: Amount of space-managed data, in kilobytes, sent by the client to the server
       $hsm_objs_recalled,		# Field 28: Number of space-managed database objects retrieved during the session
       $hsm_kb_recalled			# Field 29: Amount of space-managed data, in kilobytes, retrieved by space-managed
					#	    objects.
       ) = split(/,/,$line);
      if ($debug)	# Turn on to sample data values.
	 {
	 printf("\nLine %u:\n '%s'\n", $line_number, $line);
	 printf("Product level = '%s'; Product sublevel = '%s', Product name = '%s', Date of accounting = '%s',\n"
	       ." Time of accounting = '%s', Node name of ADSM client = '%s', Client owner name = '%s'\n"
	       ." Client platform = '%s', Authentication method used = '%s', Communication method used = '%s'\n"
	       ." Server termina = '%s', Archived objs = '%s', Archived kb = '%s', Retrieved objs = '%s', Retrieved kb = '%s'\n"
	       ." Backup objs = '%s', Backup kb = '%s', Restore objs = '%s', Restore kb = '%s'\n"
	       ." HSM store objs = '%s', HSM store kb = '%s', HSM recall objs = '%s', HSM recall = '%s'\n"
	       ." Session kb = '%s', Session secs = '%s', Idlewait secs = '%s', Commwait secs = '%s', Mediawait secs = '%s'\n",
		$product_level, $product_sublevel, $product_name, $acctg_date,
		$acctg_time, $client_nodename, $client_owner,
		$client_platform, $auth_method, $comm_method, $server_termination,
		$archive_objs_inserted, $archive_kb_inserted, $archive_objs_retrieved, $archive_kb_retrieved,
		$backup_objs_inserted, $backup_kb_inserted, $backup_objs_retrieved, $backup_kb_retrieved,
		$hsm_objs_stored, $hsm_kb_stored, $hsm_objs_recalled, $hsm_kb_recalled,
		$session_kb, $session_secs, $idlewait_secs, $commwait_secs, $mediawait_secs);
	 }

      #_______________________________________Do some field validation______________________________________________
      # The Product level field should be numeric:
      if ($product_level =~ /\D/)
	 {
	 printf("Record %u is bogus: 'Product level' value in line below is '%s', non-numeric. Skipping it.\n  '%s'\n",
		$line_number, $product_level, $line);
	 next;			# Skip to next record.
	 }

      #________________________________________Determine date range___________________________________________
      # Compare datestamp against oldest-latest values in determining overall date-time range of all the data.
      # (Remember, the data may be from several files, and there is no surity of time sequence.)
      ($mm, $dd, $yyyy) = split(m|/|,$acctg_date);   ($hr, $min, $sec) = split(m|:|,$acctg_time);
      $timestamp = $yyyy.$mm.$dd.$hr.$min.$sec;
      if ($timestamp < $earliest_datestamp)
	 {
	 $earliest_datestamp = $timestamp;
	 if ($debug)  { printf("New earliest_datestamp = %s, from '%s'.\n",
			      $earliest_datestamp, $acctg_date); }
	 }
      elsif ($timestamp > $latest_datestamp)
	 {
	 $latest_datestamp = $timestamp;
	 if ($debug)  { printf("New latest_datestamp = %s, from '%s'.\n", $latest_datestamp, $acctg_date); }
	 }

      #_____________________________See if the data meets the selection criteria________________________________
      if (($from_datestamp ne "Any_Time"  && $timestamp < $from_datestamp)
	  ||  ($to_datestamp ne "Any_Time"  &&  $timestamp > $to_datestamp))
	 {
	 if ($debug)  { printf("Skipping record datestamped %s (%s %s) - out of time range: %s.\n",
			      $timestamp, $acctg_date, $acctg_time,
			      $timestamp < $from_datestamp ? "Time too low ($timestamp < $from_datestamp)"
			      : $timestamp > $to_datestamp ? "Time too high ($timestamp > $to_datestamp)" : "??"); }
	 next;			# Skip to next record.
	 }
      # The record meets selection criteria.
      if ($debug)  { printf("Accepting record timestamped %s (%s %s) - within time range\n",
			   $timestamp, $acctg_date, $acctg_time); }

      #__________________________________Capture data from the record_______________________________________
      $total_sessions++;				# Total number of sessions of all types.
							# (Note that not all sessions involve data in ADSM
							# storage pools.)
      if ($session_obj = $backup_objs_inserted + $backup_objs_retrieved
	  + $archive_objs_inserted + $archive_objs_retrieved + $hsm_objs_stored + $hsm_objs_recalled)
	 { $total_sessions_transferring_data++; }	# Total number of sessions which transferred data;
							# that is, involved storage pools.
      if ($archive_objs_inserted  &&  ($backup_objs_inserted == 0)  &&  ($backup_objs_retrieved == 0)
	  &&  ($archive_objs_retrieved == 0)  &&  ($hsm_objs_stored == 0)  &&  ($hsm_objs_recalled == 0))
	 {
	 #___________________________________It was a pure Archive session_________________________________________
	 $archive_sessions_count++;
	 if ($mediawait_secs)
	    {
	    $total_archives_directly_to_tape++;		# Total number of Archive sessions whose data transfer went
							# directly to tape, skipping the archive disk storage pool.
	    if ($debug)  { print("Session is an Archive which went directly to tape.\n"); }
	    }
	 else
	    {
	    $total_archives_to_disk++;			# Total number of Archive sessions whose data transfer went
							# to the archive disk storage pool.
	    if ($debug)  { print("Session is an Archive which went to disk.\n"); }
	    }
	 }
      if ($archive_objs_retrieved  &&  ($backup_objs_inserted == 0)  &&  ($backup_objs_retrieved == 0)
	  &&  ($archive_objs_inserted == 0)  &&  ($hsm_objs_stored == 0)  &&  ($hsm_objs_recalled == 0))
	 {	
	 #___________________________________It was a pure Retrieve session_________________________________________
	 $retrieve_sessions_count++;
	 if ($mediawait_secs)
	    {
	    $total_retrieves_directly_from_tape++;	# Total number of Retrieve sessions whose data transfer came
							# directly from tape, skipping the archive disk storage pool.
	    if ($debug)  { print("Session is a Retrieve which came directly from tape.\n"); }
	    }
	 else
	    {
	    $total_retrieves_from_disk++;		# Total number of Retrieve sessions whose data transfer came
							# from the archive disk storage pool.
	    if ($debug)  { print("Session is a Retrieve which came from disk.\n"); }
	    }
	 }

      $data_kb = $backup_kb_inserted + $backup_kb_retrieved
	 + $archive_kb_inserted + $archive_kb_retrieved + $hsm_kb_stored + $hsm_kb_recalled;
      $sessions_by_opsys{$client_platform}++;		# Total number of sessions by opsys.
      $sesskb_by_opsys{$client_platform} += $session_kb;	# Total number of KB by client opsys.  Note that
								# this includes overhead communication as well as
								# storage pool data.
      $datakb_by_opsys{$client_platform} += $data_kb;		# Data KB by client opsys.
      $sessions_by_nodename{$client_nodename}++;		# Total number of sessions by node.
      $session_secs_by_nodename{$client_nodename} += $session_secs;
      $idlewait_secs_by_nodename{$client_nodename} += $idlewait_secs;
      $commwait_secs_by_nodename{$client_nodename} += $commwait_secs;
      $mediawait_secs_by_nodename{$client_nodename} += $mediawait_secs;
      $session_kb_by_nodename{$client_nodename} += $session_kb;	# Total number of KB by client nodename.  Note that
								# this includes overhead communication as well as
								# storage pool data.
      $data_kb_by_nodename{$client_nodename} += $data_kb;	# Data KB by client nodename.
      $sessions_per_day{"$yyyy"."$mm"."$dd"}++;
      $sesskb_per_day{"$yyyy"."$mm"."$dd"} += $session_kb;	# Note that this includes overhead communication
								# as well as storage pool data.
      $datakb_per_day{"$yyyy"."$mm"."$dd"} += $data_kb;		# 
      $obj_per_day{"$yyyy"."$mm"."$dd"} += $session_obj;
      # We need to reexamine the maximum lengths seen for text strings as they come in, unlike
      # numerical values whose sum determines maximum overall length.
      if (($l = length($client_nodename)) > $maxlen_nodename)    { $maxlen_nodename = $l; }
      if (($l = length($client_owner)) > $maxlen_username)    { $maxlen_username = $l; }
      $opsyses_by_nodename{$client_nodename} = $client_platform;
      if (($l = length($client_platform)) > $maxlen_opsyses)  { $maxlen_opsyses = $l; }

      # Capture values by nodename...
      $backup_obj_by_nodename{$client_nodename} += $backup_objs_inserted;
      $backup_kb_by_nodename{$client_nodename} += $backup_kb_inserted;
      $restored_obj_by_nodename{$client_nodename} += $backup_objs_retrieved;
      $restored_kb_by_nodename{$client_nodename} += $backup_kb_retrieved;

      $archived_obj_by_nodename{$client_nodename} += $archive_objs_inserted;
      $archived_kb_by_nodename{$client_nodename} += $archive_kb_inserted;
      $retrieved_obj_by_nodename{$client_nodename} += $archive_objs_retrieved;
      $retrieved_kb_by_nodename{$client_nodename} += $archive_kb_retrieved;

      $hsmstore_obj_by_nodename{$client_nodename} += $hsm_objs_stored;
      $hsmstore_kb_by_nodename{$client_nodename} += $hsm_kb_stored;
      $hsmrecall_obj_by_nodename{$client_nodename} += $hsm_objs_recalled;
      $hsmrecall_kb_by_nodename{$client_nodename} += $hsm_kb_recalled;

      # Capture values by username...
      if ($client_owner)				# Omitting null entries...
	 {
         # Note that HSM data transfer is implicit, so no username associated with it.

	 $sessions_by_username{$client_owner}++;	# Total number of sessions by user.
	 $obj_by_username{$client_owner} += $session_obj;		# Sum of all types of objects.
	 $session_kb_by_username{$client_owner} += $session_kb;		# Total number of KB by username.  Note
									# that this includes overhead communication
									# as well as storage pool data.
	 $data_kb_by_username{$client_owner} += $data_kb;		# Data KB by client username.
	 $session_secs_by_username{$client_owner} += $session_secs;
	 $idlewait_secs_by_username{$client_owner} += $idlewait_secs;
	 $commwait_secs_by_username{$client_owner} += $commwait_secs;
	 $mediawait_secs_by_username{$client_owner} += $mediawait_secs;

	 $backup_obj_by_username{$client_owner} += $backup_objs_inserted;
	 $backup_kb_by_username{$client_owner} += $backup_kb_inserted;
	 $restored_obj_by_username{$client_owner} += $backup_objs_retrieved;
	 $restored_kb_by_username{$client_owner} += $backup_kb_retrieved;

	 $archived_obj_by_username{$client_owner} += $archive_objs_inserted;
	 $archived_kb_by_username{$client_owner} += $archive_kb_inserted;
	 $retrieved_obj_by_username{$client_owner} += $archive_objs_retrieved;
	 $retrieved_kb_by_username{$client_owner} += $archive_kb_retrieved;
	
	 $hsmstore_obj_by_username{$client_owner} += $hsm_objs_stored;
	 $hsmstore_kb_by_username{$client_owner} += $hsm_kb_stored;
	 $hsmrecall_obj_by_username{$client_owner} += $hsm_objs_recalled;
	 $hsmrecall_kb_by_username{$client_owner} += $hsm_kb_recalled;
	 }

      # For column totals:
      if ($archive_objs_inserted)   { $total_archive_operations++; }
      if ($archive_objs_retrieved)  { $total_retrieve_operations++; }
      if ($backup_objs_inserted)    { $total_backup_operations++; }
      if ($backup_objs_retrieved)   { $total_restore_operations++; }
      if ($hsm_objs_stored)	    { $total_hsmstore_operations++; }
      if ($hsm_objs_recalled)	    { $total_hsmrecall_operations++; }

      $total_backup_obj += $backup_objs_inserted;       $total_backup_kb += $backup_kb_inserted;
      $total_restore_obj += $backup_objs_retrieved;     $total_restore_kb += $backup_kb_retrieved;
      $total_archive_obj += $archive_objs_inserted;     $total_archive_kb += $archive_kb_inserted;
      $total_retrieve_obj += $archive_objs_retrieved;   $total_retrieve_kb += $archive_kb_retrieved;
      $total_hsmstore_obj += $hsm_objs_stored;          $total_hsmstore_kb += $hsm_kb_stored;
      $total_hsmrecall_obj += $hsm_objs_recalled;       $total_hsmrecall_kb += $hsm_kb_recalled;
      $total_sess_kb += $session_kb;                    $total_data_kb += $data_kb;

      $obj_by_nodename{$client_nodename} += $session_obj;      # Sum of all types of objects.

      # Examine job completion status...
      if    ($server_termination == 0)  { $sessions_completed_abnormally++; }
      elsif ($server_termination == 1)  { $sessions_completed_normally++; }

      }  # bottom of processing each record
   # Done absorbing all the data from this source.
   close(ACCTFILE);
   return $line_number;
   }
# End of subroutine Absorb_Data_Source


#=================================  Subroutine Summarize_Data  =====================================
sub Summarize_Data
#
# Subroutine to summarized all absorbed data to output file.
#
# INVOCATION:  $? = &Summarize_Data();
#
# RETURNS:  0
#
   {

   #____________________________________Preliminaries_____________________________________

   #_________________Save any pre-existing output report file______________________
   # if (-e $report_filename)
      # {
      # printf("Output file '%s' already exists - will rename to preserve it...\n",
	     # $report_filename);
      # if (-x "/usr/local/bin/bkurfile $report_filename")  { # Our command to rename the file with a .YYYYMMDD suffix.
							    # system("/usr/local/bin/bkurfile $report_filename"); }
      # else  { system("/bin/mv $report_filename ${report_filename}.bak"); }
      # }

   #___________________________________Normalize any overall data___________________________________________
   # We should convert the date back to slash- and colon-separated form, for reporting:
   if ($debug)  { printf("Earliest datestamp = %s; latest datestamp = %s.\n", $earliest_datestamp, $latest_datestamp); }
   ($yyyy, $mm, $dd, $hr, $min, $sec) = $earliest_datestamp =~ m|(\d\d\d\d)(\d\d)(\d\d)(\d\d)(\d\d)(\d\d)|;
   $first_date = "$yyyy/$mm/$dd $hr:$min:$sec";
   ($yyyy, $mm, $dd, $hr, $min, $sec) = $latest_datestamp =~ m|(\d\d\d\d)(\d\d)(\d\d)(\d\d)(\d\d)(\d\d)|;
   $last_date = "$yyyy/$mm/$dd $hr:$min:$sec";
   printf("\nData ranges from  %s  to  %s\n", $first_date, $last_date);

   #_____________________________Figure final numerical column widths based upon totals_______________________________
   # Format the numbers so as to base widths upon those constructs...
   $total_sessions_f      = &Format_Number($total_sessions);
   $total_archive_obj_f   = &Format_Number($total_archive_obj);
   $total_archive_kb_f    = &Format_Number($total_archive_kb);
   $total_retrieve_obj_f  = &Format_Number($total_retrieve_obj);
   $total_retrieve_kb_f   = &Format_Number($total_retrieve_kb);
   $total_backup_obj_f    = &Format_Number($total_backup_obj);
   $total_backup_kb_f     = &Format_Number($total_backup_kb);
   $total_restore_obj_f   = &Format_Number($total_restore_obj);
   $total_restore_kb_f    = &Format_Number($total_restore_kb);
   $total_hsmstore_obj_f  = &Format_Number($total_hsmstore_obj);
   $total_hsmstore_kb_f   = &Format_Number($total_hsmstore_kb);
   $total_hsmrecall_obj_f = &Format_Number($total_hsmrecall_obj);
   $total_hsmrecall_kb_f  = &Format_Number($total_hsmrecall_kb);
   $total_sess_kb_f       = &Format_Number($total_sess_kb);
   $total_data_kb_f       = &Format_Number($total_data_kb);
   # Remember to put numbers into double quotes when getting their length, else you get 0.
   if (($l = length("$total_sessions_f"))      > $maxlen_sessions)        { $maxlen_sessions       = $l; }
   if (($l = length("$total_backup_obj_f"))    > $maxlen_backup_objs)     { $maxlen_backup_objs    = $l; }
   if (($l = length("$total_backup_kb_f"))     > $maxlen_backup_kb)       { $maxlen_backup_kb      = $l; }
   if (($l = length("$total_restore_obj_f"))   > $maxlen_restore_objs)    { $maxlen_restore_objs   = $l; }
   if (($l = length("$total_restore_kb_f"))    > $maxlen_restore_kb)      { $maxlen_restore_kb     = $l; }
   if (($l = length("$total_archive_obj_f"))   > $maxlen_archive_objs)    { $maxlen_archive_objs   = $l; }
   if (($l = length("$total_archive_kb_f"))    > $maxlen_archive_kb)      { $maxlen_archive_kb     = $l; }
   if (($l = length("$total_retrieve_obj_f"))  > $maxlen_retrieve_objs)   { $maxlen_retrieve_objs  = $l; }
   if (($l = length("$total_retrieve_kb_f"))   > $maxlen_retrieve_kb)     { $maxlen_retrieve_kb    = $l; }
   if (($l = length("$total_hsmstore_obj_f"))  > $maxlen_hsmstore_objs)   { $maxlen_hsmstore_objs  = $l; }
   if (($l = length("$total_hsmstore_kb_f"))   > $maxlen_hsmstore_kb)     { $maxlen_hsmstore_kb    = $l; }
   if (($l = length("$total_hsmrecall_obj_f")) > $maxlen_hsmrecall_objs)  { $maxlen_hsmrecall_objs = $l; }
   if (($l = length("$total_hsmrecall_kb_f"))  > $maxlen_hsmrecall_kb)    { $maxlen_hsmrecall_kb   = $l; }
   if (($l = length("$total_sess_kb_f"))       > $maxlen_nodesess_kb)     { $maxlen_nodesess_kb    = $l; }
   if (($l = length("$total_data_kb_f"))       > $maxlen_nodedata_kb)     { $maxlen_nodedata_kb    = $l; }
   # Accommodate the sums of the right-hand columns in determining the max width of those columns:
   $total_obj = $total_backup_obj + $total_restore_obj + $total_archive_obj + $total_retrieve_obj
      + $total_hsmstore_obj + $total_hsmrecall_obj;
   $total_obj_f = &Format_Number($total_obj);
   if (($l = length("$total_obj_f"))  > $maxlen_node_objs)   { $maxlen_node_objs = $l; }
   $total_data_kb = $total_backup_kb + $total_restore_kb + $total_archive_kb + $total_retrieve_kb
      + $total_hsmstore_kb + $total_hsmrecall_kb;
   if (($l = length("$total_sesssecs"))    > $maxlen_sesssecs)    { $maxlen_sesssecs = $l; }
   if (($l = length("$total_idlesecs"))    > $maxlen_idlesecs)    { $maxlen_idlesecs = $l; }
   if (($l = length("$total_commsecs"))    > $maxlen_commsecs)    { $maxlen_commsecs = $l; }
   if (($l = length("$total_mediasecs"))   > $maxlen_mediasecs)   { $maxlen_mediasecs = $l; }

   #______________________________________Report ADSM sessions - part 1____________________________________________
   printf("\nNow creating report file '%s'...\n", $report_filename);
   open(REPORTOUT, ">$report_filename") || die "Unable to open $report_filename.";

   # Define printing characteristics for this report (the report format):
   # Note that Format Variables are set on a per-filehandle basis, so 'select' has to be used to set them...
   $save_filehandle = select(REPORTOUT);
   $= = 9999;				# Number of lines per page.  (I originally had this number '60' for
					# conventional reporting; but whereas we only view these reports online,
					# having the column headers repeatedly appear in a terminal window of
					# arbitrary size was pointless, so boosted the number high to have the
					# column headers appear only once for each report section.
   $- = 0;				# Set number of lines remaining on page 0 to cause initial headers.
   $^ = REPORTOUT_TOP;			# Report format for top-of-page.
   $~ = REPORTOUT;			# Report format for body.
   select($save_filehandle);		# Restore.
   $report_title .= sprintf("ADSM SESSIONS, FROM %s TO %s\n", $from_datestamp_text, $to_datestamp_text);
   $report_subtitle = "in accounting data ranging from $first_date through $last_date";
   if ($debug)  { printf("\$= lines per page = %d; \$- lines remaining on page = %d\n", $=, $-); }

   #__________Assign column headers
   # Assign values to the column header variables in the report formats.
   $report_colhdrs1  = sprintf("%-${maxlen_nodename}s"
			      ."  %${maxlen_backup_objs}s  %${maxlen_backup_kb}s"
			      ."  %${maxlen_restore_objs}s  %${maxlen_restore_kb}s"
			      ."  %${maxlen_archive_objs}s  %${maxlen_archive_kb}s"
			      ."  %${maxlen_retrieve_objs}s  %${maxlen_retrieve_kb}s"
			      ."  %${maxlen_hsmstore_objs}s  %${maxlen_hsmstore_kb}s"
			      ."  %${maxlen_hsmrecall_objs}s  %${maxlen_hsmrecall_kb}s",
			       $nodename_column_title1,
			       $backup_obj_column_title1, $backup_kb_column_title1,
			       $restore_obj_column_title1, $restore_kb_column_title1,
			       $archive_obj_column_title1, $archive_kb_column_title1,
			       $retrieve_obj_column_title1, $retrieve_kb_column_title1,
			       $hsmstore_obj_column_title1, $hsmstore_kb_column_title1,
			       $hsmrecall_obj_column_title1, $hsmrecall_kb_column_title1);
   $report_colhdrs2  = sprintf("%-${maxlen_nodename}s"
			      ."  %${maxlen_backup_objs}s  %${maxlen_backup_kb}s"
			      ."  %${maxlen_restore_objs}s  %${maxlen_restore_kb}s"
			      ."  %${maxlen_archive_objs}s  %${maxlen_archive_kb}s"
			      ."  %${maxlen_retrieve_objs}s  %${maxlen_retrieve_kb}s"
			      ."  %${maxlen_hsmstore_objs}s  %${maxlen_hsmstore_kb}s"
			      ."  %${maxlen_hsmrecall_objs}s  %${maxlen_hsmrecall_kb}s",
			       $nodename_column_title2,
			       $backup_obj_column_title2, $backup_kb_column_title2,
			       $restore_obj_column_title2, $restore_kb_column_title2,
			       $archive_obj_column_title2, $archive_kb_column_title2,
			       $retrieve_obj_column_title2, $retrieve_kb_column_title2,
			       $hsmstore_obj_column_title2, $hsmstore_kb_column_title2,
			       $hsmrecall_obj_column_title2, $hsmrecall_kb_column_title2);
   $report_colhdruls = sprintf("%s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s",
			       '-'x${maxlen_nodename},
			       '-'x${maxlen_backup_objs}, '-'x${maxlen_backup_kb},
			       '-'x${maxlen_restore_objs}, '-'x${maxlen_restore_kb},
			       '-'x${maxlen_archive_objs}, '-'x${maxlen_archive_kb},
			       '-'x${maxlen_retrieve_objs}, '-'x${maxlen_retrieve_kb},
			       '-'x${maxlen_hsmstore_objs}, '-'x${maxlen_hsmstore_kb},
			       '-'x${maxlen_hsmrecall_objs}, '-'x${maxlen_hsmrecall_kb});
   # The column headers are now set, and will print implicitly as we fill pages.

   #__________Report each node's usage
   foreach $nodename (sort keys(%sessions_by_nodename))
      {
      # Fill in each column, separated from each preceding column by two spaces...
      $report_line = sprintf("%-${maxlen_nodename}s"
			    ."  %${maxlen_backup_objs}s  %${maxlen_backup_kb}s"
                            ."  %${maxlen_restore_objs}s  %${maxlen_restore_kb}s"
                            ."  %${maxlen_archive_objs}s  %${maxlen_archive_kb}s"
                            ."  %${maxlen_retrieve_objs}s  %${maxlen_retrieve_kb}s"
			    ."  %${maxlen_hsmstore_objs}s  %${maxlen_hsmstore_kb}s"
			    ."  %${maxlen_hsmrecall_objs}s  %${maxlen_hsmrecall_kb}s",
			     $nodename,
			     &Format_Number($backup_obj_by_nodename{$nodename}),
			     &Format_Number($backup_kb_by_nodename{$nodename}),
			     &Format_Number($restored_obj_by_nodename{$nodename}),
			     &Format_Number($restored_kb_by_nodename{$nodename}),
			     &Format_Number($archived_obj_by_nodename{$nodename}),
			     &Format_Number($archived_kb_by_nodename{$nodename}),
			     &Format_Number($retrieved_obj_by_nodename{$nodename}),
			     &Format_Number($retrieved_kb_by_nodename{$nodename}),
			     &Format_Number($hsmstore_obj_by_nodename{$nodename}),
			     &Format_Number($hsmstore_kb_by_nodename{$nodename}),
			     &Format_Number($hsmrecall_obj_by_nodename{$nodename}),
			     &Format_Number($hsmrecall_kb_by_nodename{$nodename}));

      # Finally, write the line out:
      write(REPORTOUT);
      }
   # Bottom of reporting each node's usage.

   #__________Report column totals:
   # The initial spacer here must equal the number of characters reserved for the username.
   $report_line = $report_colhdruls;  # Underline each column to indicate summation.
   write(REPORTOUT);
   $report_line = sprintf("%-${maxlen_nodename}s"
			 ."  %${maxlen_backup_objs}s  %${maxlen_backup_kb}s"
                         ."  %${maxlen_restore_objs}s  %${maxlen_restore_kb}s"
                         ."  %${maxlen_archive_objs}s  %${maxlen_archive_kb}s"
                         ."  %${maxlen_retrieve_objs}s  %${maxlen_retrieve_kb}s"
			 ."  %${maxlen_hsmstore_objs}s  %${maxlen_hsmstore_kb}s"
			 ."  %${maxlen_hsmrecall_objs}s  %${maxlen_hsmrecall_kb}s",
			  "TOTALS",
			  $total_backup_obj_f, $total_backup_kb_f, $total_restore_obj_f, $total_restore_kb_f,
			  $total_archive_obj_f, $total_archive_kb_f, $total_retrieve_obj_f, $total_retrieve_kb_f,
			  $total_hsmstore_obj_f, $total_hsmstore_kb_f, $total_hsmrecall_obj_f, $total_hsmrecall_kb_f);
   write(REPORTOUT);

   # Reinterpret large values, to make visually clear:
   # (Remember that the file size values are already in KB, so are 1024x.)
   $report_line = sprintf("%-${maxlen_nodename}s"
			 ."  %${maxlen_backup_objs}s  %${maxlen_backup_kb}s"
                         ."  %${maxlen_restore_objs}s  %${maxlen_restore_kb}s"
                         ."  %${maxlen_archive_objs}s  %${maxlen_archive_kb}s"
                         ."  %${maxlen_retrieve_objs}s  %${maxlen_retrieve_kb}s"
			 ."  %${maxlen_hsmstore_objs}s  %${maxlen_hsmstore_kb}s"
			 ."  %${maxlen_hsmrecall_objs}s  %${maxlen_hsmrecall_kb}s",
			  "", "",
			  $total_backup_kb > $MB ? sprintf("%.1f GB", $total_backup_kb / $MB) :
			   $total_backup_kb > $KB ? sprintf("%.1f MB", $total_backup_kb / $KB) : $total_backup_kb." KB",
			  "",
			  $total_restore_kb > $MB ? sprintf("%.1f GB", $total_restore_kb / $MB) :
			   $total_restore_kb > $KB ? sprintf("%.1f MB", $total_restore_kb / $KB) : $total_restore_kb." KB",
			  "",
			  $total_archive_kb > $MB ? sprintf("%.1f GB", $total_archive_kb / $MB) :
			   $total_archive_kb > $KB ? sprintf("%.1f MB", $total_archive_kb / $KB) : $total_archive_kb." KB",
			  "",
			  $total_retrieve_kb > $MB ? sprintf("%.1f GB", $total_retrieve_kb / $MB) :
			   $total_retrieve_kb > $KB ? sprintf("%.1f MB", $total_retrieve_kb / $KB) : $total_retrieve_kb." KB",
			  "",
			  $total_hsmstore_kb > $MB ? sprintf("%.1f GB", $total_hsmstore_kb / $MB) :
			   $total_hsmstore_kb > $KB ? sprintf("%.1f MB", $total_hsmstore_kb / $KB) : $total_hsmstore_kb." KB",
			  "",
			  $total_hsmrecall_kb > $MB ? sprintf("%.1f GB", $total_hsmrecall_kb / $MB) :
			   $total_hsmrecall_kb > $KB ? sprintf("%.1f MB", $total_hsmrecall_kb / $KB) : $total_hsmrecall_kb." KB"
			  );
   write(REPORTOUT);
   $report_line_len = length($report_line);	# Reference width for later summary stats to observe.

   #______________________________________Report ADSM sessions - part 2____________________________________________
   $report_line = " ";   write(REPORTOUT);	# Spacer after previous report.

   #__________Assign column headers
   # Assign values to the column header variables in the report formats.
   $report_colhdrs1  = sprintf("%-${maxlen_nodename}s  %${maxlen_opsyses}s  %${maxlen_sessions}s"
			      ."  %${maxlen_node_objs}s  %${maxlen_nodesess_kb}s  %${maxlen_nodedata_kb}s"
			      ."  %${maxlen_sesssecs}s  %${maxlen_idlesecs}s  %${maxlen_commsecs}s  %${maxlen_mediasecs}s",
			       $nodename_column_title1, $opsys_column_title1, $sessions_column_title1,
			       $nodeobjs_column_title1, $nodesesskb_column_title1, $nodedatakb_column_title1,
			       $sesssecs_column_title1, $idlesecs_column_title1,
			       $commsecs_column_title1, $mediasecs_column_title1);
   $report_line = $report_colhdrs1;   write(REPORTOUT);

   $report_colhdrs2  = sprintf("%-${maxlen_nodename}s  %${maxlen_opsyses}s  %${maxlen_sessions}s"
			      ."  %${maxlen_node_objs}s  %${maxlen_nodesess_kb}s  %${maxlen_nodedata_kb}s"
			      ."  %${maxlen_sesssecs}s  %${maxlen_idlesecs}s  %${maxlen_commsecs}s  %${maxlen_mediasecs}s",
			       $nodename_column_title2, $opsys_column_title2, $sessions_column_title2,
			       $nodeobjs_column_title2, $nodesesskb_column_title2, $nodedatakb_column_title2,
			       $sesssecs_column_title2, $idlesecs_column_title2,
			       $commsecs_column_title2, $mediasecs_column_title2);
   $report_line = $report_colhdrs2;   write(REPORTOUT);

   $report_colhdruls = sprintf("%s  %s  %s  %s  %s  %s  %s  %s  %s  %s",
			       '-'x${maxlen_nodename}, '-'x${maxlen_opsyses}, '-'x${maxlen_sessions},
			       '-'x${maxlen_node_objs}, '-'x${maxlen_nodesess_kb}, '-'x${maxlen_nodedata_kb},
			       '-'x${maxlen_sesssecs}, '-'x${maxlen_idlesecs}, '-'x${maxlen_commsecs}, '-'x${maxlen_mediasecs});
   $report_line = $report_colhdruls;   write(REPORTOUT);

   # The column headers are now set, and will print implicitly as we fill pages.

   #__________Report each node's usage
   foreach $nodename (sort keys(%sessions_by_nodename))
      {
      # Fill in each column, separated from each preceding column by two spaces...
      $report_line = sprintf("%-${maxlen_nodename}s  %-${maxlen_opsyses}s  %${maxlen_sessions}u"
			    ."  %${maxlen_node_objs}s  %${maxlen_nodesess_kb}s  %${maxlen_nodedata_kb}s"
			    ."  %${maxlen_sesssecs}s  %${maxlen_idlesecs}s  %${maxlen_commsecs}s  %${maxlen_mediasecs}s",
			     $nodename, $opsyses_by_nodename{$nodename}, $sessions_by_nodename{$nodename},
			     &Format_Number($obj_by_nodename{$nodename}), &Format_Number($session_kb_by_nodename{$nodename}),
			     &Format_Number($data_kb_by_nodename{$nodename}),
			     $session_secs_by_nodename{$nodename}, $idlewait_secs_by_nodename{$nodename},
			     $commwait_secs_by_nodename{$nodename}, $mediawait_secs_by_nodename{$nodename});

      # Finally, write the line out:
      write(REPORTOUT);
      }
   # Bottom of reporting each node's usage.

   #__________Report column totals:
   # The initial spacer here must equal the number of characters reserved for the username.
   $report_line = $report_colhdruls;  # Underline each column to indicate summation.
   write(REPORTOUT);
   $report_line = sprintf("%-${maxlen_nodename}s  %${maxlen_opsyses}s  %${maxlen_sessions}s"
			 ."  %${maxlen_node_objs}s  %${maxlen_nodesess_kb}s  %${maxlen_nodesess_kb}s",
			  "TOTALS", "", $total_sessions_f, $total_obj_f, $total_sess_kb_f, $total_data_kb_f);
   write(REPORTOUT);

   # Reinterpret large values, to make visually clear:
   # (Remember that the file size values are already in KB, so are 1024x.)
   $report_line = sprintf("%-${maxlen_nodename}s  %${maxlen_opsyses}s  %${maxlen_sessions}s"
			 ."  %${maxlen_node_objs}s  %${maxlen_nodesess_kb}s  %${maxlen_nodedata_kb}s",
			  "", "", "", "",
			  $total_data_kb > $MB ? sprintf("%.1f GB", $total_data_kb / $MB) :
			   $total_data_kb > $KB ? sprintf("%.1f MB", $total_data_kb / $KB) : $total_data_kb." KB",
			  $total_sess_kb > $MB ? sprintf("%.1f GB", $total_sess_kb / $MB) :
			   $total_sess_kb > $KB ? sprintf("%.1f MB", $total_sess_kb / $KB) : $total_sess_kb." KB"
			  );
   write(REPORTOUT);

   #__________Some explanatory notes:
   # Nullify column headers that were used above, to prevent the following notes from inappropriately appearing under
   # column headers in a report page eject.
   #if ($debug)  { printf("\$= lines per page = %d; \$- lines remaining on page = %d\n", $=, $-); }
   $report_colhdrs1  = "";   $report_colhdrs2 = "";   $report_colhdruls = "";

   $report_line = " ";   write(REPORTOUT);   $report_line = " ";   write(REPORTOUT);
   $report_line = "NOTES:";   write(REPORTOUT);
   $report_line = " ";   write(REPORTOUT);
   $report_line = "Idle Wait time is the time that the server is waiting for the client to respond.";
   write(REPORTOUT);
   $report_line = " This is often seen in Backup operations, where the server has send the client a full list of the";
   write(REPORTOUT);
   $report_line = " files that it has for the filespace being backed up, and the client is examining them against its";
   write(REPORTOUT);
   $report_line = " file system content to see what is eligible for backup today.";
   write(REPORTOUT);
   $report_line = "Communications Wait time is the time that the client is waiting for the server to respond.";
   write(REPORTOUT);
   $report_line = "Media Wait time is the time spent awaiting completion of a tape mount, either because all drives";
   write(REPORTOUT);
   $report_line = " are in use or because the desired volume is in use.  (When collocation is by node, multiple sessions";
   write(REPORTOUT);
   $report_line = " from one client node will want to write to the same output volume, and so secondary sessions will";
   write(REPORTOUT);
   $report_line = " wait for the first session's use of it to end.)";
   write(REPORTOUT);


   #__________________________________________________Present summary statistics________________________________________________
   printf(REPORTOUT "\fSUMMARY STATISTICS:\n\n");

   printf(REPORTOUT "Total number of sessions = %u;  Number involving data in ADSM storage pools = %u.\n",
	  $total_sessions, $total_sessions_transferring_data);

   @sorted_nodenames = sort(keys(%sessions_by_nodename));   $nodes_count = scalar(@sorted_nodenames);
   @sorted_usernames = sort(keys(%sessions_by_username));   $usernames_count = scalar(@sorted_usernames);
   @sorted_sessions_by_nodename = sort ascending(values(%sessions_by_nodename));
   @sorted_opsyses = sort(keys(%sessions_by_opsys));   $opsyses_count = scalar(@sorted_opsyses);
   @sorted_sessions_by_opsys = sort ascending(values(%sessions_by_opsys));
   @sorted_session_kb_by_nodename = sort ascending(values(%session_kb_by_nodename));
   @sorted_data_kb_by_nodename = sort ascending(values(%data_kb_by_nodename));
   @sorted_sesskb_by_opsys = sort ascending(values(%sesskb_by_opsys));
   @sorted_datakb_by_opsys = sort ascending(values(%datakb_by_opsys));
   @sorted_sesskb_per_day = sort ascending(values(%sesskb_per_day));
   @sorted_datakb_per_day = sort ascending(values(%datakb_per_day));
   @sorted_obj_per_day = sort ascending(values(%obj_per_day));
   @sorted_sessions_per_day = sort ascending(values(%sessions_per_day));

   # Report node-based statistics:
   if ($nodes_count)
      {
      print(REPORTOUT "\n");
      $t = sprintf(" %u Nodes active during this period:", $nodes_count);   $lt = length("$t");
      print(REPORTOUT $t);			# Indent the list.
      $l = $lt;
      foreach $element (@sorted_nodenames)
         {
         if (($l += ($maxlen_nodename + 1)) > $report_line_len)
	    { printf(REPORTOUT "\n%${lt}s", " ");   $l = $lt + length($element) + 1; }
         printf(REPORTOUT " %-${maxlen_nodename}s", $element);
         }
      print(REPORTOUT "\n");
      }
   $n = scalar(@sorted_sessions_by_nodename);   $rmdr = $n % 2;
   if ($rmdr)  { $median = @sorted_sessions_by_nodename[($n/2)]; }
   else        { $median = @sorted_sessions_by_nodename[(($n/2)-1)]; }
   printf(REPORTOUT " Average sessions/node = %.2f; median = %d\n", $total_sessions / $nodes_count, $median);

   # Report user-based statistics:
   if ($usernames_count)
      {
      print(REPORTOUT "\n");
      $t = " Usernames active during this period:";   $lt = length("$t");
      print(REPORTOUT $t);			# Indent the list.
      $l = $lt;
      foreach $element (@sorted_usernames)
         {
         if (($l += ($maxlen_username + 1)) > $report_line_len)
	    { printf(REPORTOUT "\n%${lt}s", " ");   $l = $lt + length($element) + 1; }
         printf(REPORTOUT " %-${maxlen_username}s", $element);
         }
      print(REPORTOUT "\n");
      }
 
   # Report opsys-based statistics:
   printf(REPORTOUT "\n %u Operating systems active during this period: %s\n", $opsyses_count, "@sorted_opsyses");
   $n = scalar(@sorted_sessions_by_opsys);   $rmdr = $n % 2;
   if ($rmdr)  { $median = @sorted_sessions_by_opsys[($n/2)]; }
   else        { $median = @sorted_sessions_by_opsys[(($n/2)-1)]; }
   printf(REPORTOUT " Average sessions/opsys = %s; median = %s\n",
          &Format_Number(sprintf("%.2f",($total_sessions / $opsyses_count))), &Format_Number($median));

   # Report KB-based statistics, by overall session communication volume:
   print(REPORTOUT "\n");
   $n = scalar(@sorted_session_kb_by_nodename);   $rmdr = $n % 2;
   if ($rmdr)  { $median = @sorted_session_kb_by_nodename[($n/2)]; }
   else        { $median = @sorted_session_kb_by_nodename[(($n/2)-1)]; }
   $avg_session_kb_by_nodename = sprintf("%.2f", $total_sess_kb / $nodes_count);
   $maxlen_kb_f = $maxlen_nodesess_kb + 3;	# Width of largest KB values plus ".nn" decimal.
   printf(REPORTOUT " Average session KB/nodename = %${maxlen_kb_f}s (%9s); median = %${maxlen_nodesess_kb}s (%9s)\n",
          &Format_Number($avg_session_kb_by_nodename),
	  $avg_session_kb_by_nodename > $MB ? sprintf("%.1f GB", $avg_session_kb_by_nodename / $MB) :
	  $avg_session_kb_by_nodename > $KB ? sprintf("%.1f MB", $avg_session_kb_by_nodename / $KB) : $avg_session_kb_by_nodename." KB",
	  &Format_Number($median),
	  $median > $MB ? sprintf("%.1f GB", $median / $MB) :
	  $median > $KB ? sprintf("%.1f MB", $median / $KB) : $median." KB"
	  );

   # Report KB-based statistics, by volume of data transmitted:
   $n = scalar(@sorted_data_kb_by_nodename);   $rmdr = $n % 2;
   if ($rmdr)  { $median = @sorted_data_kb_by_nodename[($n/2)]; }
   else        { $median = @sorted_data_kb_by_nodename[(($n/2)-1)]; }
   $avg_data_kb_by_nodename = sprintf("%.2f", $total_data_kb / $nodes_count);
   printf(REPORTOUT " Average data    KB/nodename = %${maxlen_kb_f}s (%9s); median = %${maxlen_nodesess_kb}s (%9s)\n",
          &Format_Number($avg_data_kb_by_nodename),
	  $avg_data_kb_by_nodename > $MB ? sprintf("%.1f GB", $avg_data_kb_by_nodename / $MB) :
	  $avg_data_kb_by_nodename > $KB ? sprintf("%.1f MB", $avg_data_kb_by_nodename / $KB) : $avg_data_kb_by_nodename." KB",
	  &Format_Number($median),
	  $median > $MB ? sprintf("%.1f GB", $median / $MB) :
	  $median > $KB ? sprintf("%.1f MB", $median / $KB) : $median." KB"
	  );

   $n = scalar(@sorted_sesskb_by_opsys);   $rmdr = $n % 2;
   if ($rmdr)  { $median = @sorted_sesskb_by_opsys[($n/2)]; }
   else        { $median = @sorted_sesskb_by_opsys[(($n/2)-1)]; }
   $avg_sesskb_by_opsys = sprintf("%.2f", $total_sess_kb / $opsyses_count);
   printf(REPORTOUT " Average session KB/opsys    = %${maxlen_kb_f}s (%9s); median = %${maxlen_nodesess_kb}s (%9s)\n",
          &Format_Number($avg_sesskb_by_opsys),
	  $avg_sesskb_by_opsys > $MB ? sprintf("%.1f GB", $avg_sesskb_by_opsys / $MB) :
	  $avg_sesskb_by_opsys > $KB ? sprintf("%.1f MB", $avg_sesskb_by_opsys / $KB) : $avg_sesskb_by_opsys." KB",
	  &Format_Number($median),
	  $median > $MB ? sprintf("%.1f GB", $median / $MB) :
	  $median > $KB ? sprintf("%.1f MB", $median / $KB) : $median." KB"
	  );

   $n = scalar(@sorted_datakb_by_opsys);   $rmdr = $n % 2;
   if ($rmdr)  { $median = @sorted_datakb_by_opsys[($n/2)]; }
   else        { $median = @sorted_datakb_by_opsys[(($n/2)-1)]; }
   $avg_datakb_by_opsys = sprintf("%.2f", $total_data_kb / $opsyses_count);
   printf(REPORTOUT " Average data    KB/opsys    = %${maxlen_kb_f}s (%9s); median = %${maxlen_nodesess_kb}s (%9s)\n",
          &Format_Number($avg_datakb_by_opsys),
	  $avg_datakb_by_opsys > $MB ? sprintf("%.1f GB", $avg_datakb_by_opsys / $MB) :
	  $avg_datakb_by_opsys > $KB ? sprintf("%.1f MB", $avg_datakb_by_opsys / $KB) : $avg_datakb_by_opsys." KB",
	  &Format_Number($median),
	  $median > $MB ? sprintf("%.1f GB", $median / $MB) :
	  $median > $KB ? sprintf("%.1f MB", $median / $KB) : $median." KB"
	  );

   print(REPORTOUT "\n");	# Separate from prior collective.
   printf(REPORTOUT " Number of sessions completed: normally = %s; abnormally = %s\n",
	  &Format_Number($sessions_completed_normally), &Format_Number($sessions_completed_abnormally));

   if ($archive_sessions_count > $retrieve_sessions_count)  { $l = length("$archive_sessions_count"); }
   else							    { $l = length("$retrieve_sessions_count"); }
   printf(REPORTOUT " Number of Archive  sessions which went:  to   disk = %${l}u;  directly to   tape = %${l}u\n",
	  $total_archives_to_disk, $total_archives_directly_to_tape);
   printf(REPORTOUT " Number of Retrieve sessions which came:  from disk = %${l}u;  directly from tape = %${l}u\n",
	  $total_retrieves_from_disk, $total_retrieves_directly_from_tape);

   #______________________________________________By-day reports_________________________________________________________
   # Begin on a separate page.  For column widths we will use the $maxlen_nodesess_kb value, which is the largest
   # of all previously reported, and works best here.
   open(CSVFILE,">${host_directory}accounting.csv") or &been_an_error;
   printf(REPORTOUT "BY-DAY REPORTS\n\n");
   printf(REPORTOUT "%-10s  %${maxlen_sessions}s     %${maxlen_node_objs}s              %${maxlen_nodesess_kb}s"
	  ."                %${maxlen_nodesess_kb}s\n\n",
	  "DAY", "SESSIONS", "OBJECTS", "SESSION KB", "DATA KB");

   $l_sess = $maxlen_sessions + 3;	# Integer plus .2f .
   $l_objs = $maxlen_node_objs + 3;	# Integer plus .2f .
   $l_kb   = $maxlen_nodesess_kb + 3;	# Integer plus .2f .
   # Note that all the *_per_day arrays have the same keys, so our choice to control this loop is arbitrary.
   foreach $day (sort(keys(%sessions_per_day)))
      {
      # Remember that the day key is of form YYYYMMDD.
      printf(REPORTOUT "%-10s  %${maxlen_sessions}s     %${maxlen_node_objs}s      %${maxlen_nodesess_kb}s    (%s)      %${maxlen_nodesess_kb}s    (%s)\n",
	     substr($day,0,4)."/".substr($day,4,2)."/".substr($day,6,2),
	     &Format_Number($sessions_per_day{$day}), &Format_Number($obj_per_day{$day}),
             &Format_Number($sesskb_per_day{$day}),
	      $sesskb_per_day{$day} > $MB ? sprintf("%5.1f GB", $sesskb_per_day{$day} / $MB) :
	       $sesskb_per_day{$day} > $KB ? sprintf("%5.1f MB", $sesskb_per_day{$day} / $KB) : sprintf("%5.1f KB", $sesskb_per_day{$day}),
	     &Format_Number($datakb_per_day{$day}),
	      $datakb_per_day{$day} > $MB ? sprintf("%5.1f GB", $datakb_per_day{$day} / $MB) :
	       $datakb_per_day{$day} > $KB ? sprintf("%5.1f MB", $datakb_per_day{$day} / $KB) : sprintf("%5.1f KB", $datakb_per_day{$day}));
	       
      printf(CSVFILE substr($day,6,2)."/".substr($day,4,2)."/".substr($day,0,4).",".
            sprintf("%5.1f", $datakb_per_day{$day} / $MB)."\n"
	      );
	      
      }
 close (CSVFILE);

   $n = scalar(@sorted_sessions_per_day);   $rmdr = $n % 2;
   if ($rmdr)  { $median_sessions_per_day = @sorted_sessions_per_day[($n/2)]; }
   else        { $median_sessions_per_day = @sorted_sessions_per_day[(($n/2)-1)]; }
   $average_sessions_per_day = sprintf("%.2f", $total_sessions / $n);

   $n = scalar(@sorted_obj_per_day);   $rmdr = $n % 2;
   if ($rmdr)  { $median_obj_per_day = @sorted_obj_per_day[($n/2)]; }
   else        { $median_obj_per_day = @sorted_obj_per_day[(($n/2)-1)]; }
   $average_obj_per_day = sprintf("%.2f", $total_obj / $n);

   $n = scalar(@sorted_sesskb_per_day);   $rmdr = $n % 2;
   if ($rmdr)  { $median_sesskb_per_day = @sorted_sesskb_per_day[($n/2)]; }
   else        { $median_sesskb_per_day = @sorted_sesskb_per_day[(($n/2)-1)]; }
   $average_sesskb_per_day = sprintf("%.2f", $total_sess_kb / $n);

   $n = scalar(@sorted_datakb_per_day);   $rmdr = $n % 2;
   if ($rmdr)  { $median_datakb_per_day = @sorted_datakb_per_day[($n/2)]; }
   else        { $median_datakb_per_day = @sorted_datakb_per_day[(($n/2)-1)]; }
   $average_datakb_per_day = sprintf("%.2f", $total_data_kb / $n);

#  printf(REPORTOUT "\n%-10s  %${maxlen_sessions}s  %${maxlen_node_objs}s      %${maxlen_nodesess_kb}s    (%s)      %${maxlen_nodesess_kb}s    (%s)\n",
#  printf(REPORTOUT "\n%-10s     %${l_sess}s  %${l_objs}s      %${l_kb}s    (%s)      %${l_kb}s    (%s)\n",
   printf(REPORTOUT "\n%-10s  %${maxlen_sessions}s     %${maxlen_node_objs}s      %${maxlen_nodesess_kb}s    (%s)      %${maxlen_nodesess_kb}s    (%s)\n",
	  "Median", &Format_Number($median_sessions_per_day), &Format_Number($median_obj_per_day),
          &Format_Number($median_sesskb_per_day),
	  $median_sesskb_per_day > $MB ? sprintf("%5.1f GB", $median_sesskb_per_day / $MB) :
	   $median_sesskb_per_day > $KB ? sprintf("%5.1f MB", $median_sesskb_per_day / $KB) :
	   sprintf("%5.1f KB", $median_sesskb_per_day),
	  &Format_Number($median_datakb_per_day),
	  $median_datakb_per_day > $MB ? sprintf("%5.1f GB", $median_datakb_per_day / $MB) :
	   $median_datakb_per_day > $KB ? sprintf("%5.1f MB", $median_datakb_per_day / $KB) :
	   sprintf("%5.1f KB", $median_datakb_per_day));

   printf(REPORTOUT "\n%-10s     %${maxlen_sessions}s  %${l_objs}s   %${l_kb}s (%s)      %${l_kb}s (%s)\n",
	  "Average", &Format_Number($average_sessions_per_day), &Format_Number($average_obj_per_day),
          &Format_Number($average_sesskb_per_day),
	  $average_sesskb_per_day > $MB ? sprintf("%5.1f GB", $average_sesskb_per_day / $MB) :
	   $average_sesskb_per_day > $KB ? sprintf("%5.1f MB", $average_sesskb_per_day / $KB) :
	   sprintf("%5.1f KB", $average_sesskb_per_day),
	  &Format_Number($average_datakb_per_day),
	  $average_datakb_per_day > $MB ? sprintf("%5.1f GB", $average_datakb_per_day / $MB) :
	   $average_datakb_per_day > $KB ? sprintf("%5.1f MB", $average_datakb_per_day / $KB) :
	   sprintf("%5.1f KB", $average_datakb_per_day));

   # End of by-day report.

   #__________________________________________By-user reports_____________________________________________________
   # Begin on a separate page.  For column widths we will use the $maxlen_nodesess_kb value, which is the largest
   # of all previously reported, and works best here.
   # Note that HSM data transfer is implicit, so no username associated with it.
   printf(REPORTOUT "BY-USER REPORTS\n\n");

   #__________Assign column headers
   # Assign values to the column header variables in the report formats.
   $report_colhdrs1  = sprintf("%-8s"
			      ."  %${maxlen_backup_objs}s  %${maxlen_backup_kb}s"
			      ."  %${maxlen_restore_objs}s  %${maxlen_restore_kb}s"
			      ."  %${maxlen_archive_objs}s  %${maxlen_archive_kb}s"
			      ."  %${maxlen_retrieve_objs}s  %${maxlen_retrieve_kb}s"
			      ."  %${maxlen_hsmstore_objs}s  %${maxlen_hsmstore_kb}s"
			      ."  %${maxlen_hsmrecall_objs}s  %${maxlen_hsmrecall_kb}s",
			       "",
			       $backup_obj_column_title1, $backup_kb_column_title1,
			       $restore_obj_column_title1, $restore_kb_column_title1,
			       $archive_obj_column_title1, $archive_kb_column_title1,
			       $retrieve_obj_column_title1, $retrieve_kb_column_title1,
			       $hsmstore_obj_column_title1, $hsmstore_kb_column_title1,
			       $hsmrecall_obj_column_title1, $hsmrecall_kb_column_title1);
   $report_line = $report_colhdrs1;   write(REPORTOUT);
   $report_colhdrs2  = sprintf("%-8s"
			      ."  %${maxlen_backup_objs}s  %${maxlen_backup_kb}s"
			      ."  %${maxlen_restore_objs}s  %${maxlen_restore_kb}s"
			      ."  %${maxlen_archive_objs}s  %${maxlen_archive_kb}s"
			      ."  %${maxlen_retrieve_objs}s  %${maxlen_retrieve_kb}s"
			      ."  %${maxlen_hsmstore_objs}s  %${maxlen_hsmstore_kb}s"
			      ."  %${maxlen_hsmrecall_objs}s  %${maxlen_hsmrecall_kb}s",
			       "USERNAME",
			       $backup_obj_column_title2, $backup_kb_column_title2,
			       $restore_obj_column_title2, $restore_kb_column_title2,
			       $archive_obj_column_title2, $archive_kb_column_title2,
			       $retrieve_obj_column_title2, $retrieve_kb_column_title2,
			       $hsmstore_obj_column_title2, $hsmstore_kb_column_title2,
			       $hsmrecall_obj_column_title2, $hsmrecall_kb_column_title2);
   $report_line = $report_colhdrs2;   write(REPORTOUT);
   $report_colhdruls = sprintf("%s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s",
			       '-'x${maxlen_nodename},
			       '-'x${maxlen_backup_objs}, '-'x${maxlen_backup_kb},
			       '-'x${maxlen_restore_objs}, '-'x${maxlen_restore_kb},
			       '-'x${maxlen_archive_objs}, '-'x${maxlen_archive_kb},
			       '-'x${maxlen_retrieve_objs}, '-'x${maxlen_retrieve_kb},
			       '-'x${maxlen_hsmstore_objs}, '-'x${maxlen_hsmstore_kb},
			       '-'x${maxlen_hsmrecall_objs}, '-'x${maxlen_hsmrecall_kb});
   $report_line = $report_colhdruls;   write(REPORTOUT);
  
   # The column headers are now set, and will print implicitly as we fill pages.

   #__________Report each user's usage
   # foreach $username (sort keys(%sessions_by_username))
      # {
      # # Fill in each column, separated from each preceding column by two spaces...
      # $report_line = sprintf("%-8s"
			    # ."  %${maxlen_backup_objs}s  %${maxlen_backup_kb}s"
                            # ."  %${maxlen_restore_objs}s  %${maxlen_restore_kb}s"
                            # ."  %${maxlen_archive_objs}s  %${maxlen_archive_kb}s"
                            # ."  %${maxlen_retrieve_objs}s  %${maxlen_retrieve_kb}s"
			    # ."  %${maxlen_hsmstore_objs}s  %${maxlen_hsmstore_kb}s"
			    # ."  %${maxlen_hsmrecall_objs}s  %${maxlen_hsmrecall_kb}s",
			     # $username,
			     # &Format_Number($backup_obj_by_username{$username}),
			     # &Format_Number($backup_kb_by_username{$username}),
			     # &Format_Number($restored_obj_by_username{$username}),
			     # &Format_Number($restored_kb_by_username{$username}),
			     # &Format_Number($archived_obj_by_username{$username}),
			     # &Format_Number($archived_kb_by_username{$username}),
			     # &Format_Number($retrieved_obj_by_username{$username}),
			     # &Format_Number($retrieved_kb_by_username{$username}),
			     # &Format_Number($hsmstore_obj_by_username{$username}),
			     # &Format_Number($hsmstore_kb_by_username{$username}),
			     # &Format_Number($hsmrecall_obj_by_username{$username}),
			     # &Format_Number($hsmrecall_kb_by_username{$username}) );
      # # Finally, write the line out:
      # print "just about to write\n";
      # system ("pause");
      # write(REPORTOUT);
      # print "Got to report writer\n";
      # }
   # Bottom of reporting each user's usage.

   # #______________________________________Report user sessions - part 2____________________________________________
   # $report_line = " ";   write(REPORTOUT);	# Spacer after previous report.

   # #__________Assign column headers
   # # Assign values to the column header variables in the report formats.
   # $report_colhdrs1  = sprintf("%-8s  %${maxlen_sessions}s"
			      # ."  %${maxlen_node_objs}s  %${maxlen_nodesess_kb}s  %${maxlen_nodedata_kb}s"
			      # ."  %${maxlen_sesssecs}s  %${maxlen_idlesecs}s  %${maxlen_commsecs}s  %${maxlen_mediasecs}s",
			       # "", $sessions_column_title1,
			       # $nodeobjs_column_title1, $nodesesskb_column_title1, $nodedatakb_column_title1,
			       # $sesssecs_column_title1, $idlesecs_column_title1,
			       # $commsecs_column_title1, $mediasecs_column_title1);
   # $report_line = $report_colhdrs1;   write(REPORTOUT);

   # $report_colhdrs2  = sprintf("%-8s  %${maxlen_sessions}s"
			      # ."  %${maxlen_node_objs}s  %${maxlen_nodesess_kb}s  %${maxlen_nodedata_kb}s"
			      # ."  %${maxlen_sesssecs}s  %${maxlen_idlesecs}s  %${maxlen_commsecs}s  %${maxlen_mediasecs}s",
			       # "USERNAME", $sessions_column_title2,
			       # $nodeobjs_column_title2, $nodesesskb_column_title2, $nodedatakb_column_title2,
			       # $sesssecs_column_title2, $idlesecs_column_title2,
			       # $commsecs_column_title2, $mediasecs_column_title2);
   # $report_line = $report_colhdrs2;   write(REPORTOUT);

   # $report_colhdruls = sprintf("%s  %s  %s  %s  %s  %s  %s  %s  %s",
			       # '-' x 8, '-'x${maxlen_sessions},
			       # '-'x${maxlen_node_objs}, '-'x${maxlen_nodesess_kb}, '-'x${maxlen_nodedata_kb},
			       # '-'x${maxlen_sesssecs}, '-'x${maxlen_idlesecs}, '-'x${maxlen_commsecs}, '-'x${maxlen_mediasecs});
   # $report_line = $report_colhdruls;   write(REPORTOUT);

   # # The column headers are now set, and will print implicitly as we fill pages.

   # #__________Report each user's usage
   # foreach $username (sort keys(%sessions_by_username))
      # {
      # # Fill in each column, separated from each preceding column by two spaces...
      # $report_line = sprintf("%-8s  %${maxlen_sessions}u"
			    # ."  %${maxlen_node_objs}s  %${maxlen_nodesess_kb}s  %${maxlen_nodedata_kb}s"
			    # ."  %${maxlen_sesssecs}s  %${maxlen_idlesecs}s  %${maxlen_commsecs}s  %${maxlen_mediasecs}s",
			     # $username, $sessions_by_username{$username},
			     # &Format_Number($obj_by_username{$username}), &Format_Number($session_kb_by_username{$username}),
			     # &Format_Number($data_kb_by_username{$username}),
			     # $session_secs_by_username{$username}, $idlewait_secs_by_username{$username},
			     # $commwait_secs_by_username{$username}, $mediawait_secs_by_username{$username});

      # # Finally, write the line out:
      # print "Writing again...\n";
      # write(REPORTOUT);
      # close (REPORTOUT);
      # print "Finished!...\n";
      system ("pause");
      goto MAIN_MENU;
      # }

   # End of by-user report.


   }
# End of subroutine Summarize_Data


#=======================  Subroutine Sub_Secs_to_DateTime  ===========================
sub Sub_Secs_to_DateTime
# Subroutine to convert seconds since 1970 into a date-time value in the form:
#			YYYY/MM/DD (DAY_OF_WEEK) HH:MM:SS
# INVOCATION:  $? = &Sub_Secs_to_DateTime(SECS_SINCE_1970)
   {
   # Associative array for translating month name to a number.
   %mon_to_num = ( "Jan","01", "Feb","02", "Mar","03", "Apr","04", "May","05", "Jun","06",
                   "Jul","07", "Aug","08", "Sep","09", "Oct","10", "Nov","11", "Dec","12");

   $secs_value = $_[0];
   # To get time in human-readable string like the date command does, use the
   # Perl Library ctime() function (rather than localtime()).
   # Sample of returned value:  Mon Jun  7  9:53:16 EDT 1993
   #require "ctime.pl";
   ($ct_wkday,$ct_mon,$ct_mday,$ct_time,$ct_tz,$ct_yyyy) =
    split(' ',&ctime($secs_value));
   # Compensate for Perl defect in responding with year 2069 if fed value 0:
   if (($secs_value == 0)  &&  ($ct_yyyy == 2069))  { $ct_yyyy = 1969; }
   @ctime_output = &ctime($secs_value);   # print("ctime output: ","@ctime_output","\n");
   # Some systems return a timezone name ("EST") before the year, and some don't,
   # so if year is null, it's in the timezone field.
   if ($ct_year eq "")  { $ct_year = $ct_tz; }
   # The month comes back as an alphabetic value (e.g., "Jul"), so has to be
   # translated to a 2-digit number for our purposes.
   $ct_mm = $mon_to_num{$ct_mon};
   # We want the day-of-month number to be two digits (add leading zero if
   # necessary).
   $ct_dd = sprintf("%02d",$ct_mday);
   # We want the time value's hour to have a leading blank if less than 10,
   # to have report values line up.
   $ct_time = sprintf("%08s",$ct_time);
   return $ct_yyyy."/".$ct_mm."/".$ct_dd." (".$ct_wkday.") ".$ct_time;
   }  # end of Sub_Secs_to_DateTime


#=======================  Subroutine Secs_to_YYYYMMDDhhmmss  ===========================
sub Secs_to_YYYYMMDDhhmmss
# Subroutine to convert seconds since 1970 into a date-time value in the form:
#			YYYYMMDDhhmmss
# which is suitable for sorting and relative comparison.
#
# INVOCATION:  $? = &Secs_to_YYYYMMDDhhmmss(SECS_SINCE_1970)
#
   {
   $secs_value = $_[0];
   ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime($secs_value);
   return ($year+1900).sprintf("%02d",$mon+1).sprintf("%02d",$mday).sprintf("%02d",$hour)
         .sprintf("%02d",$min).sprintf("%02d",$sec);
   }  # end of Secs_to_YYYYMMDDhhmmss


#=======================  Subroutine Validate_Filename  ===========================
sub Validate_Filename
#
# Subroutine to validate a given file name.
#
# INVOCATION:  $? = &Validate_Filename(FILE_NAME)
#
# RETURNS:  1  if the file name exists;
#           0  if not, or no file name supplied.  An error message will have been
#              produced.
#
   {
   local($arg_filename) = scalar($_[0]);	# Grab the given file name.
   if (! -f $arg_filename)
      {
      # The file does not exist as a regular file.  Say what gives.
      printf("File name '%s' ", $arg_filename);   # Beginning of message; finish below.
      # Check for specifics before generalities for more helpful reporting:
      if (-d $arg_filename)
	 { printf("is a directory, not a file.\n"); }
      elsif (-l $arg_filename)
	 { printf("is a symbolic link without a target.\n"); }
      elsif (! -e $arg_filename)
	 { printf("does not exist.\n"); }
      else
	 { printf("is not a regular file.\n"); }
      return(0);		# Return failure indication.
      }
   return(1);			# Return success indication.
   }  # end of Validate_Filename subroutine


#######################################  PRINTING FORMATS  #####################################

# For the top of the report page:
#  - There will be a major title (centered), followed by a sub title (centered), followed by a blank line.
#  - The width of each column space before "@*" must equal space reserved for user name.
#  - The "|||||" sequence below defines the width of the top titles, in which their text will be centered.
#  - The period in column 1 marks the end of the "format".

format REPORTOUT_TOP =
@|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
$report_title
@|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
$report_subtitle

@*
$report_colhdrs1
@*
$report_colhdrs2
@*
$report_colhdruls
.

# Use angle brackets rather than pound signs in the following format to avoid having
# zeroes in unused columns.
format REPORTOUT =
@*
$report_line
.


#===================================  Subroutine Format_Number  ========================================
sub Format_Number
#
# Subroutine to format a number into comma-separated form, for easier visual absorption.
# Examples:  12345		--->		12,345
#	     12345.99876	--->		12,345.99876
#
# ENVIRONMENT:  Any
#
# INVOCATION:  $formatted_number = &Format_Number(number);
#
#	where:  Number	Is an integer or decimal number
#
# RETURNS:  Success:  Formatted number.
#	    Failure:  Empty string.
#
# HISTORY:
#
#     1999/06/13  Created.  Richard Sims
   {
   #_______________________________Define local and other variables____________________________________
   # Remember that local variables are known only within their enclosing block.
   #local(@args) = split(/\s+/,"@_");	# Secure the args from the volatile @_ array variable.
					# Note that the args come in as a space-separates string rather
   local(@args) = @_;			# Secure the args from the volatile @_ array variable.
   local($func_name) = "Format_Number";
   local($args_count) = scalar(@args);	# Number of supplied arguments.
   local($arg_number);   local($decimal);   local($number_left);   local($formatted_number);

   #________________________________Validate arguments____________________________________
   if ($args_count > 1)  { return ""; }
   if ($args[0] !~ m|^\d*\.*\d*$|)  { return ""; }
   $arg_number = $args[0];

   #________________________________Format the number____________________________________
   for ($number_left = $arg_number; ; )
      {
      if ($number_left =~ m|(\d*)(\d{3})(\.*\d*)$|)
	 {
	 if ($formatted_number)  { $formatted_number = "$2,$formatted_number"; }
	 else  { $formatted_number = "$2"; }
	 if ($3)  { $decimal = $3; }	# One-time capture of decimal portion.
	 #printf("x = '%s'; decimal = '%s'\n", $formatted_number, $decimal);  # Debugging.
	 $number_left = $1;
	 }
      elsif ($number_left =~ m|(\d*)(\.*\d*)$|)
	 {
	 if ($formatted_number)
	    {
	    if ($1)  { $formatted_number = "$1,$formatted_number"; }
	    }
	 else  { $formatted_number = "$1"; }
	 if ($2)  { $decimal = $2; }	# One-time capture of decimal portion.
	 #printf("x = '%s'; decimal = '%s'\n", $formatted_number, $decimal);  # Debugging.
	 last;
	 }
      }
   if ($formatted_number eq "")		# If got something like ".99", want "0.99" returned.
      { $formatted_number = "0"; }
   if ($decimal)		# If any decimal portion, reattach it to the result...
      { $formatted_number .= "$decimal"; }
   return $formatted_number;
   }  # bottom of Format_Number


#=============================  Subroutine Is_Leapyear  ==================================
#
# Boolean subroutine to determine if the specified year is a leap year.
#
# A leapyear is, of course, a year which is divisible by 4, and a centenary
# divisible by 400.  (So the year 2000 is a leapyear, but 1900 and 2100 are not.)
#
# INVOCATION:  if (&Is_Leapyear(Year)) {...}
#
# RETURNS:  1  if the given year is a leap year
#	    0  if the given year is not a leap year
#
# HISTORY:
#
#     1997/02/05  Written by Richard Sims
#========================================================================================
sub Is_Leapyear
   {
   local($arg_year) = scalar($_[0]);	# Grab the given year number.

   # A year which is not divisible by 4 cannot be a leap year...
   if ($arg_year % 4)  { return(0); }

   # The year is divisible by 4 so the year given is potentially a leapyear.
   # Now see if it is a centenary; and if so, is evenly divisible by 400.
   if ($arg_year % 100)  { return(1); }	# It is a leap year not at the end of a century.

   # The year is evenly divisible by 100 so is the turn of a century.
   # If also evenly divisible by 400, then it is a centenary leap year.
   if ($arg_year % 400)  { return(0); }
   else  { return(1); }
   }  # end of Is_Leapyear


#=======================  Subroutine Sub_Secs_to_DateTime  ===========================
sub Sub_Secs_to_DateTime
# Subroutine to convert seconds since 1970 into a date-time value in the form:
#			YYYY/MM/DD (DAY_OF_WEEK) HH:MM:SS
# INVOCATION:  $? = &Sub_Secs_to_DateTime(SECS_SINCE_1970)
   {
   # Associative array for translating month name to a number.
   %mon_to_num = ( "Jan","01", "Feb","02", "Mar","03", "Apr","04", "May","05", "Jun","06",
                   "Jul","07", "Aug","08", "Sep","09", "Oct","10", "Nov","11", "Dec","12");

   $secs_value = $_[0];
   # To get time in human-readable string like the date command does, use the
   # Perl Library ctime() function (rather than localtime()).
   # Sample of returned value:  Mon Jun  7  9:53:16 EDT 1993
   require "ctime.pl";
   ($ct_wkday,$ct_mon,$ct_mday,$ct_time,$ct_tz,$ct_yyyy) =
    split(' ',&ctime($secs_value));
   # Compensate for Perl defect in responding with year 2069 if fed value 0:
   if (($secs_value == 0)  &&  ($ct_yyyy == 2069))  { $ct_yyyy = 1969; }
   @ctime_output = &ctime($secs_value);   # print("ctime output: ","@ctime_output","\n");
   # Some systems return a timezone name ("EST") before the year, and some don't,
   # so if year is null, it's in the timezone field.
   if ($ct_year eq "")  { $ct_year = $ct_tz; }
   # The month comes back as an alphabetic value (e.g., "Jul"), so has to be
   # translated to a 2-digit number for our purposes.
   $ct_mm = $mon_to_num{$ct_mon};
   # We want the day-of-month number to be two digits (add leading zero if
   # necessary).
   $ct_dd = sprintf("%02d",$ct_mday);
   # We want the time value's hour to have a leading blank if less than 10,
   # to have report values line up.
   $ct_time = sprintf("%08s",$ct_time);
   return $ct_yyyy."/".$ct_mm."/".$ct_dd." (".$ct_wkday.") ".$ct_time;
   }  # end of Sub_Secs_to_DateTime



#=======================  Subroutine Secs_to_YYYYMMDDhhmmss  ===========================
sub Secs_to_YYYYMMDDhhmmss
# Subroutine to convert seconds since 1970 into a date-time value in the form:
#			YYYYMMDDhhmmss
# which is suitable for sorting and relative comparison.
#
# INVOCATION:  $? = &Secs_to_YYYYMMDDhhmmss(SECS_SINCE_1970)
#
   {
   $secs_value = $_[0];
   ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime($secs_value);
   return ($year+1900).sprintf("%02d",$mon+1).sprintf("%02d",$mday).sprintf("%02d",$hour)
         .sprintf("%02d",$min).sprintf("%02d",$sec);
   }  # end of Secs_to_YYYYMMDDhhmmss


#=======================  Subroutine Show_Usage_From_Prolog  ============================
#
# Subroutine to show program usage from prolog comments.
#
# Read the invocation information from the head of this script, as contained
# within a hanging-indented section lead off by one of the following:
#	"USAGE:", "Usage:", "SYNTAX", "Syntax", "INVOCATION", "Invocation"
# and ending with some following line which has text in the same position where
# that lead-off keyword begins.
#
# Each line from that help section will be output with a blank replacing the leading "#"
# so to avoid misaligning text arranged with tabs in the prolog.
#
# INVOCATION:  &Show_Usage_From_Prolog();
#
# RETURNS:  0
#========================================================================================
sub Show_Usage_From_Prolog
   {
      system ("cls");
print "flags:\n";
print "\n";
print "[fromyear YEAR]\n";
print "[frommonth MONTH_NAME|MONTH_NUMBER]\n";
print "[fromday DAY_OF_MONTH_NUMBER]\n";
print "[fromtime 24_HR_TIME_VALUE]\n";
print "[toyear YEAR]\n";
print "[tomonth MONTH_NAME|MONTH_NUMBER]\n";
print "[today DAY_OF_MONTH_NUMBER]\n";
print "[totime 24_HR_TIME_VALUE]\n";
print "[sortby name|user|size]\n";
print "[FILE_NAME(S)]\n";
print "\n";
print "NOTE: running with no flags at all will process\n";
print "the whole of the accounting file dsmaccnt.log in current directory.\n";
print "To run it like this, copy the accounting file where this script runs from.\n";
print "\n";
print "\n";
system ("pause");
print "\n";
print "where:\n";
print "\n";
print "\n";
print " fromyear year_value\n";
print "\n";
print "limits data to that which starts in the given year, expressed as a\n";
print "4-digit number (1996).\n";
print "\n";
print " frommonth month_name|month_number\n";
print "\n";
print "limits data to that which starts in the given month, expressed\n";
print "either as a month name (case insensitive; Jan, jan, JANUAry being\n";
print "equivalent).\n";
print "\n";
print "\n";
print " fromday day_of_month_number\n";
print "\n";
print "limits data to that which begins on the given day of month.\n";
print "\n";
print " fromtime 24_hr_time_value\n";
print "\n";
print "limits data to that which starts at the given time of day, in\n";
print "\n";
print " 24-hour-clock time.\n";
print "\n";
print "Examples:07to specify just the hour;\n";
print "07:30to specify hour & minutes;\n";
print "13:10:47to specify hour, min, sec.\n";
print "\n";
print " toyear year_value\n";
print "\n";
print "limits data to that which ends in the given year, expressed as a\n";
print "4-digit number (1996).\n";
print "\n";
print " tomonth month_name|month_number\n";
print "\n";
print "limits data to that which ends in the given month, expressed either\n";
print "as a month name (case insensitive; Dec, dec, DECEmber being\n";
print "equivalent).\n";
print "\n";
print " today day_of_month_number\n";
print "\n";
print "limits data to that which ends on the given day of month.\n";
print "\n";
print " totime 24_hr_time_value\n";
print "\n";
print "limits data to that which ends at or before the given time of day,\n";
print "in 24-hour-clock time.\n";
print "Examples:07to specify just the hour;\n";
print "07:30to specify hour & minutes;\n";
print "13:10:47to specify hour, min, sec.\n";
print "Note that if you omit trailing components of the time, maximum\n";
print "values will default.So if you code '07', it will be taken as\n";
print "'07:59:59'.Hence you should code '07:00:00' if you want the\n";
print "to time to end exactly at that hour.\n";
print "\n";
print "FILE_NAME(S) May specify the file or files which contain the ADSM accounting\n";
print "\n";
print "data which is to be reported.If not specified, the program\n";
print "checks for the input coming from Stdin, thus allowing you to pipe\n";
print "the input to it, as perhaps from the zcat of a compressed file.\n";
print " \n";
print "If you code any timestamp level, you must code all the levels above it in order to be\n";
print "specific.So, for example, if you code fromtime, you need to code fromday, frommonth,\n";
print "and fromyear as well.\n";
print " \n";
print "If no from or to time range is specified, all data will be reported.\n";
print "\n";
print "Set the internal $debug variable to show processing progress, if desired.\n";
   return(0);
   }  # end of Show_Usage_From_Prolog subroutine


}	





############################################################# END
############################################################# END
############################################################# END
############################################################# END
############################################################# END
############################################################# END





###########################################################################
## Subroutine:
## Name: accounting_data
## accounting search
###########################################################################

sub accounting_data {

our $no_data_for_node=0;
open (ACCOUNTING, "<${host_directory}/backup_data.txt") or &been_an_error;
@accounting=<ACCOUNTING>;
@acc_filt = grep /$node_name/, @accounting;
if (scalar(@acc_filt)==0) { 
	&draw_heading;
	print "No Data for $node_name!!\n\n";
	print "Please try another node.\n\n\n";
	$no_data_for_node=1;
	system ("pause");	
	}



$count=0;
$maximum_y=0;
$max_second_axis=0;
foreach $line_of_file (@acc_filt) {      
	($nodename, $date_thing, $data_sent, $mb_sec) = (split /,/,$line_of_file)[0,1,2,3];
	${datelist}[$count]=$date_thing;
	${nodelist}[$count]=$nodename;
	${datalist}[$count]=($data_sent);
	${mbytes_sec}[$count]=$mb_sec;
		if ($datalist[$count] > $maximum_y) {
			$maximum_y=$datalist[$count];
		}
		if ($mbytes_sec[$count] > $max_second_axis) {
			$max_second_axis=$mbytes_sec[$count];
		}
	## print $datelist[$count]," ",$datalist[$count]," ", $mbytes_sec[$count],"\n";
	$count=$count+1;
	$x_count=$count;
	}
}

###########################################################################
## Subroutine:
## Name: proc_expiration_data
## get expiration data
###########################################################################

sub proc_expiration_data {

our $no_data_for_node=0;
open (EXPIRATION_DATA, "<${host_directory}/expiration_data.txt") or &been_an_error;
@expiration_proc=<EXPIRATION_DATA>;
if (scalar(@expiration_proc)==0) { 
	&draw_heading;
	print "No Expiration Data!!\n\n";
	system ("pause");	
	}



$count=0;
$maximum_y=0;
$max_second_axis=0;
foreach $line_of_file (@expiration_proc) {      
	($exp_days_ago, $exp_time_sec, $exp_oj) = (split /,/,$line_of_file)[0,1,2];
	${datelist}[$count]=$exp_days_ago;
	${exp_time}[$count]=$exp_time_sec;
	${exp_objects}[$count]=($exp_oj/1000);
		if ($exp_time[$count] > $maximum_y) {
			$maximum_y=$exp_time[$count];
		}
		if ($exp_objects[$count] > $max_second_axis) {
			$max_second_axis=$exp_objects[$count];
		}
	print $datelist[$count]," ",$exp_time[$count]," ", $exp_objects[$count],"\n";
	
	$count=$count+1;
	$x_count=$count;
	}
	print "maximum y - $maximum_y";
	print "maximum second - $max_second_axis";
close (EXPIRATION_DATA);
}



###########################################################################
## Subroutine:
## Name: print_node_list
## print nodes registered to instance - think this is unused now
###########################################################################

sub print_node_list {
	print "\n\nThe registered nodes on $tsm_server are:\n\n";
	system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select node_name from nodes > ${host_directory}/nodes.txt");
	open (NODES, "<${host_directory}/nodes.txt") or &been_an_error;
	@nodes=<NODES>;
	foreach $aa (@nodes) {
		print $aa;
		}
}




###########################################################################
## Subroutine:
## Name: test_the_mail
## unused now
###########################################################################

sub test_the_mail{
	 use Mail::Sender;
	 print "please enter SMTP server for mail: ";
		our $smtp_server = <STDIN>;
		print "please enter mail recipient address: ";
		our $to_address = <STDIN>;
		print "please enter mail from address: ";
		our $from_address = <STDIN>;
		
		
		
		
		chomp $smtp_server;	# get rid of carriage returns
		chomp $to_address;	# get rid of carriage returns
		chomp $to_address;	# get rid of carriage returns
		$email_subject="Test from StorageTools";
		
		print "Server: $smtp_server\nTo:$to_address\nFrom:$to_address\nTo:$to_address\n";
		print "\n\nTesting....\n\n";
		system ("pause");
		
 eval {
 (new Mail::Sender)
        ->OpenMultipart({smtp=> $smtp_server , to => $to_address ,subject => $email_subject, from => $from_address})
        ->Body({ msg => <<'*END*' })
TSM Auto Report (TEST)
================
Generated by Tectrade TSM Tool.

See attached File(s)

*END*
        
        ->Close();
 } or print "Error sending mail: $Mail::Sender::Error\n";
 
}


sub send_the_mail{
	 use Mail::Sender;
 eval {
 (new Mail::Sender)
        ->OpenMultipart({smtp=> $smtp_server , to => $to_address ,subject => $email_subject, from => $from_address})
        ->Body({ msg => <<'*END*' })
TSM Auto Report
================
Generated by Tectrade TSM Tool.

See attached File(s)

*END*
        ->Attach({
                #description => 'Perl module Mail::Sender.pm',
                #ctype => 'application/x-zip-encoded',
                #encoding => 'Base64',
                #disposition => 'attachment; filename="Sender.zip"; type="ZIP archive"',
                file => $attach_list
        })
        ->Close();
 } or print "Error sending mail: $Mail::Sender::Error\n";
 
}


###########################################################################
## Subroutine:
## Name: get_version
## get the TSM version
###########################################################################


sub get_version {
	chdir ${host_directory};
	our $actual_ver=qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}/dsm_custom.opt select version from status");
	our $actual_servername=qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}/dsm_custom.opt select server_name from status");
	chomp $actual_ver;
	chomp $actual_servername;
	if ($actual_ver eq "5") {
		$version=5;
		
	}
	if ($actual_ver eq "6") {
		$version=6;
		
	}
	if ($actual_ver eq "7") {
		$version=6;
		
	}
	if ($actual_ver eq "8") {
		$version=6;
		
	}
	if ($actual_ver eq "9") {
		$version=6;
		
	}
	
	if ($actual_ver ne "5" && $actual_ver ne "6" && $actual_ver ne "7" && $actual_ver ne "8" && $actual_ver ne "9") { 
		print "Return from TSM is: $actual_ver \n";
		system ("pause");
		$version="INVALID";
		}
	
}

###########################################################################
## Subroutine:
## Name: make_options_file
## Make the connect file for TSM (dsm_custom.opt)
###########################################################################

sub make_options_file {
	
	open (OPTIONS_FILE, ">${host_directory}dsm_custom.opt");#or &been_an_error;
	print OPTIONS_FILE "tcpserveraddress $tsm_server\n";
	close (OPTIONS_FILE);
	open (OPTIONS_FILE, ">>${host_directory}dsm_custom.opt") or &been_an_error;
	print OPTIONS_FILE "\ntcpport $tsm_port\n";
	close (OPTIONS_FILE);
}

###########################################################################
## Subroutine:
## Name: make_lm_options_file
## Make the connect file for TSM library manager (dsm_lm_custom.opt)
###########################################################################

sub make_lm_options_file {
	
	open (OPTIONS_FILE, ">${host_directory}dsm_lm_custom.opt");#or &been_an_error;
	print OPTIONS_FILE "tcpserveraddress $lm_server\n";
	close (OPTIONS_FILE);
	open (OPTIONS_FILE, ">>${host_directory}dsm_lm_custom.opt") or &been_an_error;
	print OPTIONS_FILE "\ntcpport $lm_port\n";
	close (OPTIONS_FILE);
}

###########################################################################
## Subroutine:
## Name: make_rep_options_file
## Make the connect file for TSM library manager (dsm_lm_custom.opt)
###########################################################################

sub make_rep_options_file {
	
	open (OPTIONS_FILE, ">${host_directory}dsm_rep_custom.opt");#or &been_an_error;
	print OPTIONS_FILE "tcpserveraddress $rep_server\n";
	close (OPTIONS_FILE);
	open (OPTIONS_FILE, ">>${host_directory}dsm_rep_custom.opt") or &been_an_error;
	print OPTIONS_FILE "\ntcpport $rep_port\n";
	close (OPTIONS_FILE);
}

###########################################################################
## Subroutine:
## Name: been_an_error
## replacement for 'or die'
###########################################################################

sub been_an_error {
	&draw_heading;
print "\nThere has been an error of some kind.\nReturning to main menu.\n";
system("pause");
goto MAIN_MENU;

}


###########################################################################
## Subroutine:
## Name: control_c
## Catch control c
###########################################################################


sub control_c {
	#use Win32::Console::ANSI;
  #use Term::ANSIColor;
  #print color 'reset';
	$SIG{INT} = \&control_c; 
	&draw_heading;
	print "Exiting due to INT Signal....\n\n";
	close (OPTIONS_FILE);
	unlink ("${host_directory}dsm_custom.opt");
	close (OPTIONS_FILE);
	close (LOCK_FILE);
	unlink ("${host_directory}/tsmtools.lck");
	unlink ("${host_directory}dsm_custom.opt");
	exit;
}

###########################################################################
## Subroutine:
## Name: create_batch_file
## Used for making a command line - unused at present
###########################################################################

sub create_batch_file {
	&draw_heading;
		
		print "please enter TSM customer name: ";
		our $customer_name = <STDIN>;
		print "please enter SMTP server for mail: ";
		our $smtp_server = <STDIN>;
		print "please enter mail recipient address: ";
		our $to_address = <STDIN>;
		print "please enter mail from address: ";
		our $from_address = <STDIN>;
		print "please enter DRM Plan file directory (using forward slashes): ";
		our $plan_directory = <STDIN>;
		
		#chomp $tsm_user; 	# get rid of carriage returns
		#chomp $tsm_password; 	# get rid of carriage returns
		#chomp $tsm_server;	# get rid of carriage returns
		#chomp $tsm_port;	# get rid of carriage returns
		chomp $customer_name;
		chomp $smtp_server;	# get rid of carriage returns
		chomp $to_address;	# get rid of carriage returns
		chomp $from_address;	# get rid of carriage returns
		chomp $plan_directory;	# get rid of carriage returns
		open (BATCH_FILE_1, ">${host_directory}/tsm_full_report_mail.bat") or &been_an_error;
		open (BATCH_FILE_2, ">${host_directory}/tsm_drm_plan_file_mail.bat") or &been_an_error;
		open (BATCH_FILE_3, ">${host_directory}/tsm_tape_moves_mail.bat") or &been_an_error;
		open (BATCH_FILE_4, ">${host_directory}/tsm_missed_files.bat") or &been_an_error;
		print BATCH_FILE_1 "${host_directory}/tsmtools.exe -chdmpf $tsm_user $tsm_password $tsm_server $tsm_port \"$customer_name\" $smtp_server $from_address $to_address $plan_directory";
		print BATCH_FILE_2 "${host_directory}/tsmtools.exe -pm $tsm_user $tsm_password $tsm_server $tsm_port \"$customer_name\" $smtp_server $from_address $to_address $plan_directory";
		print BATCH_FILE_3 "${host_directory}/tsmtools.exe -dm $tsm_user $tsm_password $tsm_server $tsm_port \"$customer_name\" $smtp_server $from_address $to_address $plan_directory";
		print BATCH_FILE_4 "${host_directory}/tsmtools.exe -mf $tsm_user $tsm_password $tsm_server $tsm_port \"$customer_name\" $smtp_server $from_address $to_address $plan_directory";
		
		close (BATCH_FILE_1); 
		close (BATCH_FILE_2); 
		close (BATCH_FILE_3); 
		close (BATCH_FILE_4); 
		&draw_heading;		
		chdir ${host_directory};
}

###########################################################################
## Subroutine:
## Name: make_WMI_spreadsheet
## Make the processor query spreadsheet
###########################################################################

sub make_WMI_spreadsheet {
	
print "Making spreadsheet. Please wait....\n";
open (WMI_FILE, "<${host_directory}/wmi_collection.csv") or &been_an_error;
	@read_wmi=<WMI_FILE>;  
	foreach $wmi_element (@read_wmi) {
	     chomp $wmi_element;
	     ($field1, $field2, $field3, $field4, $field5, $field6, $field7, $field8, $field9, $field_10, $field_11, $field_12, $field_13, $field_14, $field_15 ) = (split /;/,$wmi_element)[0,1,2,3,4,5,6,7,8,9,10,11,12,13];
		if ($length_f1<=length($field1)) {$length_f1=length($field1);}
		if ($length_f2<=length($field2)) {$length_f2=length($field2);}
		if ($length_f3<=length($field3)) {$length_f3=length($field3);}
		if ($length_f4<=length($field4)) {$length_f4=length($field4);}
		if ($length_f5<=length($field5)) {$length_f5=length($field5);}
		if ($length_f6<=length($field6)) {$length_f6=length($field6);}
		if ($length_f7<=length($field7)) {$length_f7=length($field7);}
		if ($length_f8<=length($field8)) {$length_f8=length($field8);}
		if ($length_f9<=length($field9)) {$length_f9=length($field9);}
		if ($length_f_10<=length($field_10)) {$length_f_10=length($field_10);}
		if ($length_f_11<=length($field_11)) {$length_f_11=length($field_11);}
		if ($length_f_12<=length($field_12)) {$length_f_12=length($field_12);}
		if ($length_f_13<=length($field_13)) {$length_f_13=length($field_13);}
		if ($length_f_14<=length($field_14)) {$length_f_14=length($field_14);}
		if ($length_f_15<=length($field_15)) {$length_f_15=length($field_15);}
	}
	
	close (WMI_FILE);
	          
my $workbook   = Excel::Writer::XLSX ->new("${host_directory}/wmi_collection.xlsx"); # open workbook
    my $worksheet  = $workbook->add_worksheet('WMI Processor Count'); # open sheet
    my $bold       = $workbook->add_format(bold => 0); # make the font normal
    
    
    
    $worksheet->set_column('A:A', $length_f1       ); # this sets the width
    $worksheet->set_column('B:B', $length_f2       ); # this sets the width
    $worksheet->set_column('C:C', $length_f3       ); # this sets the width
    $worksheet->set_column('D:D', $length_f4       ); # this sets the width
    $worksheet->set_column('E:E', $length_f5       ); # this sets the width
    $worksheet->set_column('F:F', $length_f6       ); # this sets the width
    $worksheet->set_column('G:G', $length_f7       ); # this sets the width
    $worksheet->set_column('H:H', $length_f8       ); # this sets the width
    $worksheet->set_column('I:I', $length_f9       ); # this sets the width
    $worksheet->set_column('J:J', $length_f_10       ); # this sets the width
    $worksheet->set_column('K:K', $length_f_11      ); # this sets the width
    $worksheet->set_column('L:L', $length_f_12      ); # this sets the width
    $worksheet->set_column('M:M', $length_f_13      ); # this sets the width
    $worksheet->set_column('N:N', $length_f_14      ); # this sets the width
    $worksheet->set_column('O:O', $length_f_15      ); # this sets the width
    
    my $heading  = $workbook->add_format(
                                            bold    => 1, # Make it pold
                                            color   => 'black', # colour
                                            size    => 14, # 18 font
                                            merge   => 1, # Merge cells
                                            align  => 'vcenter', # vertical Align
                                            font    =>'Arial'
                                            
                                            );
   my $heading_2  = $workbook->add_format(
                                            bold    => 1, # Make it pold
                                            italic  => 1,
                                            color   => 'black', # colour
                                            size    => 12, # 18 font
                                            merge   => 1, # Merge cells
                                            align  => 'vcenter', # vertical Align
                                            font    =>'Arial Bold'
                                            
                                            );
    ###################################
    # Set more heading properties here
    ###################################
    
    $heading->set_align ('left');
    $heading->set_bg_color('$tec_grey'); 
    $heading_2->set_align ('left');
    $heading_2->set_bg_color('red');
    
    #my @headings = ('WMI Processor Count',$tsm_server,'','','','',''); # this is the heading in array form - not used now
    
    $worksheet->write_row('A1', \@headings, $heading); # write the text in the heading format we've defined
    $worksheet->write('A1', 'Processor Audit', $heading);
    $worksheet->write('B1', 'TSM Server Name:');
    $worksheet->write('C1', 'Customer Name:');
    $worksheet->write('B2', $tsm_server, $heading);
    $worksheet->write('C2', $customer_name, $heading_2);
    #$worksheet->write('D2', '', $heading_2);
    #$worksheet->write('E2', '', $heading_2);
    #$worksheet->write('F2', '', $heading_2);
    #$worksheet->write('G2', '', $heading_2); # write the text in the heading format we've defined
    
    ##
    ## Set up the text formats
    ##
    
    my $text_format  = $workbook->add_format(
                                                bold    => 1,
                                                italic  => 1,
                                                color   => 'white',
                                                size    => 10,
                                                font    =>'Arial',                                                
                                            );
    
        
    my $normal_text  = $workbook->add_format(
                                                bold    => 0,
                                                italic  => 0,
                                                color   => 'black',
                                                size    => 10,
                                                font    =>'Arial',                                                                                                                                          
                                            );
                                            
    my $one_decimal_place  = $workbook->add_format(
                                                bold    => 0,
                                                italic  => 1,
                                                color   => 'black',
                                                size    => 10,
                                                font    =>'Arial',                                                                                                                                          
                                            );
                                            
   my $red_processor  = $workbook->add_format(
                                                bold    => 1,
                                                italic  => 0,
                                                color   => 'black',
                                                size    => 10,
                                                font    =>'Arial',                                                                                                                                          
                                            );
                                            
###### Set up some extra formatting here
                                            
    $one_decimal_place->set_num_format('0.0');                                            
    $text_format->set_align ('left');
    $normal_text->set_align ('left');   
    $text_format->set_bg_color('$tec_green');
    
    
    open (WMI_FILE, "<${host_directory}/wmi_collection.csv") or &been_an_error;
	@read_wmi=<WMI_FILE>;
	my $count=4;
	foreach $wmi_element (@read_wmi) {
	     chomp $wmi_element;
	     
	     if (grep !/MANUFACTURER/, $wmi_element) {
	     ($field1, $field2, $field3, $field4, $field5, $field6, $field7, $field8, $field9, $field_10, $field_11, $field_12, $field_13, $field_14 ) = (split /;/,$wmi_element)[0,1,2,3,4,5,6,7,8,9,10,11,12,13];
	     $worksheet->write("A$count}","$field1",$normal_text);
	     $worksheet->write("B$count}","$field2",$normal_text);
	     $worksheet->write("C$count}","$field3",$normal_text);
	     $worksheet->write("D$count}","$field4",$normal_text);
	     $worksheet->write("E$count}","$field5",$normal_text);
	     $worksheet->write("F$count}","$field6",$normal_text);
	     $worksheet->write("G$count}","$field7",$normal_text);
	     $worksheet->write("H$count}","$field8",$red_processor);
	     $worksheet->write("I$count}","$field9",$red_processor);
	     $worksheet->write("J$count}","$field_10",$red_processor);
	     $worksheet->write("K$count}","$field_11",$normal_text);
	     $worksheet->write("L$count}","$field_12",$normal_text);
	     $worksheet->write("M$count}","$field_13",$one_decimal_place);
	     $worksheet->write("N$count}","$field_14",$normal_text);
	     $worksheet->write("O$count}","$field_15",$normal_text);
	     $count=$count+1;
	     }
	     else {
	     ($field1, $field2, $field3, $field4, $field5, $field6, $field7, $field8, $field9, $field_10, $field_11, $field_12, $field_13, $field_14 ) = (split /;/,$wmi_element)[0,1,2,3,4,5,6,7,8,9,10,11,12,13];
	     $worksheet->write("A$count}","$field1",$text_format);
	     $worksheet->write("B$count}","$field2",$text_format);
	     $worksheet->write("C$count}","$field3",$text_format);
	     $worksheet->write("D$count}","$field4",$text_format);
	     $worksheet->write("E$count}","$field5",$text_format);
	     $worksheet->write("F$count}","$field6",$text_format);
	     $worksheet->write("G$count}","$field7",$text_format);
	     $worksheet->write("H$count}","$field8",$text_format);
	     $worksheet->write("I$count}","$field9",$text_format);
	     $worksheet->write("J$count}","$field_10",$text_format);
	     $worksheet->write("K$count}","$field_11",$text_format);
	     $worksheet->write("L$count}","$field_12",$text_format);
	     $worksheet->write("M$count}","$field_13",$text_format);
	     $worksheet->write("N$count}","$field_14",$text_format);
	     $worksheet->write("O$count}","$field_15",$text_format);
	     $count=$count+1;
	                                             
	     } 
	     }
	     }
	                                             


###########################################################################
## Subroutine:
## Name: get_spreadsheet_params
## Size the spreasheet columns
###########################################################################

sub get_spreadsheet_params {

if ("$health_or_doc" eq "v7000" || "$health_or_doc" eq "v7000u" || "$health_or_doc" eq "xiv" || "$health_or_doc" eq "ds8000") {
	open (SPREADSHEET_FILE, "${host_directory}/${v7000_address}_$health_or_doc.csv") or &been_an_error;
}

if ("$health_or_doc" eq "tsmforve" ) {
	
	open (SPREADSHEET_FILE, "${filename}_FINAL_SUMMARY.csv") or &been_an_error;
}
else {
	open (SPREADSHEET_FILE, "${host_directory}/${tsm_server}_$health_or_doc.csv") or &been_an_error;
}
	@read_healthcheck=<SPREADSHEET_FILE>;  
	foreach $health_element (@read_healthcheck) {
	     chomp $health_element;
	     
	     ($field1, $field2, $field3, $field4, $field5, $field6, $field7, $field8, $field9, $field_10, $field_11, $field_12, $field_13, $field_14, $field_15, $field_16, $field_17, $field_18, $field_19, $field_20, $field_21, $field_22, $field_23, $field_24, $field_25, $field_26, $field_27, $field_28, $field_29, $field_30, $field_31, $field_32, $field_33,$field_34, $field_35, $field_36, $field_37, $field_38, $field_39, $field_40, $field_41,$field_42,$field_43,$field_44,$field_45,$field_46,$field_47,$field_48,$field_49,$field_50,$field_51,$field_52,$field_53,$field_54,$field_55,$field_56,$field_57,$field_58,$field_59,$field_60,$field_61,$field_62,$field_63,$field_64,$field_65,$field_66,$field_67,$field_68,$field_69,$field_70,$field_71,$field_72,$field_73,$field_74,$field_75,$field_76,$field_77,$field_78,$field_79,$field_80,$field_81,$field_82,$field_83,$field_84) = (split /,/,$health_element)[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,79,79,80,81,82,83];
		if ($length_f1<=length($field1)) {$length_f1=length($field1);}
		if ($length_f2<=length($field2)) {$length_f2=length($field2);}
		if ($length_f3<=length($field3)) {$length_f3=length($field3);}
		if ($length_f4<=length($field4)) {$length_f4=length($field4);}
		if ($length_f5<=length($field5)) {$length_f5=length($field5);}
		if ($length_f6<=length($field6)) {$length_f6=length($field6);}
		if ($length_f7<=length($field7)) {$length_f7=length($field7);}
		if ($length_f8<=length($field8)) {$length_f8=length($field8);}
		if ($length_f9<=length($field9)) {$length_f9=length($field9);}
		if ($length_f_10<=length($field_10)) {$length_f_10=length($field_10);}
		if ($length_f_11<=length($field_11)) {$length_f_11=length($field_11);}
		if ($length_f_12<=length($field_12)) {$length_f_12=length($field_12);}
		if ($length_f_13<=length($field_13)) {$length_f_13=length($field_13);}
		if ($length_f_14<=length($field_14)) {$length_f_14=length($field_14);}
		if ($length_f_15<=length($field_15)) {$length_f_15=length($field_15);}
		if ($length_f_16<=length($field_16)) {$length_f_16=length($field_16);}
		if ($length_f_17<=length($field_17)) {$length_f_17=length($field_17);}
		if ($length_f_18<=length($field_18)) {$length_f_18=length($field_18);}
		if ($length_f_19<=length($field_19)) {$length_f_19=length($field_19);}
		if ($length_f_20<=length($field_20)) {$length_f_20=length($field_20);}
		if ($length_f_21<=length($field_21)) {$length_f_21=length($field_21);}
		if ($length_f_22<=length($field_22)) {$length_f_22=length($field_22);}
		if ($length_f_23<=length($field_23)) {$length_f_23=length($field_23);}
		if ($length_f_24<=length($field_24)) {$length_f_24=length($field_24);}
		if ($length_f_25<=length($field_25)) {$length_f_25=length($field_25);}
		if ($length_f_26<=length($field_26)) {$length_f_26=length($field_26);}
		if ($length_f_27<=length($field_27)) {$length_f_27=length($field_27);}
		if ($length_f_28<=length($field_28)) {$length_f_28=length($field_28);}
		if ($length_f_29<=length($field_29)) {$length_f_29=length($field_29);}
		if ($length_f_30<=length($field_30)) {$length_f_30=length($field_30);}
		if ($length_f_31<=length($field_31)) {$length_f_31=length($field_31);}
		if ($length_f_32<=length($field_32)) {$length_f_32=length($field_32);}
		if ($length_f_33<=length($field_33)) {$length_f_33=length($field_33);}
		if ($length_f_34<=length($field_34)) {$length_f_34=length($field_34);}
		if ($length_f_35<=length($field_35)) {$length_f_35=length($field_35);}
		if ($length_f_36<=length($field_36)) {$length_f_36=length($field_36);}
		if ($length_f_37<=length($field_37)) {$length_f_37=length($field_37);}
		if ($length_f_38<=length($field_38)) {$length_f_38=length($field_38);}
		if ($length_f_39<=length($field_39)) {$length_f_39=length($field_39);}
		if ($length_f_40<=length($field_40)) {$length_f_40=length($field_40);}
		if ($length_f_41<=length($field_41)) {$length_f_41=length($field_41);}
		if ($length_f_42<=length($field_42)) {$length_f_42=length($field_42);}
		if ($length_f_43<=length($field_43)) {$length_f_43=length($field_43);}
		if ($length_f_44<=length($field_44)) {$length_f_44=length($field_44);}
		if ($length_f_45<=length($field_45)) {$length_f_45=length($field_45);}
		if ($length_f_46<=length($field_46)) {$length_f_46=length($field_46);}
		if ($length_f_47<=length($field_47)) {$length_f_47=length($field_47);}
		if ($length_f_48<=length($field_48)) {$length_f_48=length($field_48);}
		if ($length_f_49<=length($field_49)) {$length_f_49=length($field_49);}
		if ($length_f_50<=length($field_50)) {$length_f_50=length($field_50);}
		if ($length_f_51<=length($field_51)) {$length_f_51=length($field_51);}
		if ($length_f_52<=length($field_52)) {$length_f_52=length($field_52);}
		if ($length_f_53<=length($field_53)) {$length_f_53=length($field_53);}
		if ($length_f_54<=length($field_54)) {$length_f_54=length($field_54);}
		if ($length_f_55<=length($field_55)) {$length_f_55=length($field_55);}
		if ($length_f_56<=length($field_56)) {$length_f_56=length($field_56);}
		if ($length_f_57<=length($field_57)) {$length_f_57=length($field_57);}
		if ($length_f_58<=length($field_58)) {$length_f_58=length($field_58);}
		if ($length_f_59<=length($field_59)) {$length_f_59=length($field_59);}
		if ($length_f_60<=length($field_60)) {$length_f_60=length($field_60);}
		if ($length_f_61<=length($field_61)) {$length_f_61=length($field_61);}
		if ($length_f_62<=length($field_62)) {$length_f_62=length($field_62);}
		if ($length_f_63<=length($field_63)) {$length_f_63=length($field_63);}
		if ($length_f_64<=length($field_64)) {$length_f_64=length($field_64);}
		if ($length_f_65<=length($field_65)) {$length_f_65=length($field_65);}
		if ($length_f_66<=length($field_66)) {$length_f_66=length($field_66);}
		if ($length_f_67<=length($field_67)) {$length_f_67=length($field_67);}
		if ($length_f_68<=length($field_68)) {$length_f_68=length($field_68);}
		if ($length_f_69<=length($field_69)) {$length_f_69=length($field_69);}
		if ($length_f_70<=length($field_70)) {$length_f_70=length($field_70);}
		if ($length_f_71<=length($field_71)) {$length_f_71=length($field_71);}
		if ($length_f_72<=length($field_72)) {$length_f_72=length($field_72);}
		if ($length_f_73<=length($field_73)) {$length_f_73=length($field_73);}
		if ($length_f_74<=length($field_74)) {$length_f_74=length($field_74);}
		if ($length_f_75<=length($field_75)) {$length_f_75=length($field_75);}
		if ($length_f_76<=length($field_76)) {$length_f_76=length($field_76);}
		if ($length_f_77<=length($field_77)) {$length_f_77=length($field_77);}
		if ($length_f_78<=length($field_78)) {$length_f_78=length($field_78);}
		if ($length_f_79<=length($field_79)) {$length_f_79=length($field_79);}
		if ($length_f_80<=length($field_80)) {$length_f_80=length($field_80);}
		if ($length_f_81<=length($field_81)) {$length_f_81=length($field_81);}
		if ($length_f_82<=length($field_82)) {$length_f_82=length($field_82);}
		if ($length_f_83<=length($field_83)) {$length_f_83=length($field_83);}
		if ($length_f_84<=length($field_84)) {$length_f_84=length($field_84);}
	}          

}

###########################################################################
## Subroutine:
## Name: make_spreadsheet
## Make the doc, health, dedupe etc spread###########################################################################
## Subroutine:
## Name: make_WMI_spreadsheet
## Make the processor query spreadsheet
###########################################################################sheets
###########################################################################

sub make_spreadsheet {
	    use Excel::Writer::XLSX ;
	    
if ("$health_or_doc" eq "v7000" || "$health_or_doc" eq "v7000u" || "$health_or_doc" eq "xiv" || "$health_or_doc" eq "ds8000") {
	our $workbook   = Excel::Writer::XLSX ->new("${host_directory}/${v7000_address}_${health_or_doc}_${datetime2}.xlsx"); # open workbook
	open (SPREADSHEET_FILE, "${host_directory}/${v7000_address}_$health_or_doc.csv") or &been_an_error;
	our $separator=";-";
	
}
elsif ("$health_or_doc" eq "brocade" ) {
	
	our $workbook   = Excel::Writer::XLSX ->new("${brocade_address}_${health_or_doc}_${datetime2}.xlsx"); # open workbook
	open (SPREADSHEET_FILE, "${host_directory}/${brocade_address}_$health_or_doc.csv") or &been_an_error;
	our $separator=";-";
	
}

elsif ("$health_or_doc" eq "tsmforve" ) {
	
	our $workbook   = Excel::Writer::XLSX ->new("${filename}_FINAL_SUMMARY_${datetime2}.xlsx"); # open workbook
	open (SPREADSHEET_FILE, "${filename}_FINAL_SUMMARY.csv") or &been_an_error;
	our $separator=":-";
	
}
else {
	
	our $workbook   = Excel::Writer::XLSX ->new("${host_directory}/${tsm_server}_${tsm_port}_${health_or_doc}_${datetime2}.xlsx"); # open workbook
	open (SPREADSHEET_FILE, "${host_directory}/${tsm_server}_$health_or_doc.csv") or &been_an_error;
	our $separator=":-";
} 
    
    
    my $worksheet  = $workbook->add_worksheet('Storage Documentation'); # open sheet
    my $bold       = $workbook->add_format(bold => 0); # make the font normal
    my $format2 = $workbook->add_format();
    
    my $ve_format = $workbook->add_format();
    $ve_format->set_num_format( '0.00' );
    

    
    
    $workbook->set_custom_color(40, '#C50084');
    $workbook->set_custom_color(41, '#8B8178');
    $workbook->set_custom_color(42, '#E00034');
    $workbook->set_custom_color(43, '#E98300');
    $workbook->set_custom_color(44, '#7AB800');
    $workbook->set_custom_color(45, '#00ADD0');
    $workbook->set_custom_color(46, '#212492');
    my $font = $workbook->add_format(color => 40); 
    my $font = $workbook->add_format(color => 41); 
    my $font = $workbook->add_format(color => 42); 
    my $font = $workbook->add_format(color => 43); 
    my $font = $workbook->add_format(color => 44); 
    my $font = $workbook->add_format(color => 45); 
    my $font = $workbook->add_format(color => 46); 

#$tec_purple 40
#$tec_grey 41
#$tec_red 42
#$tec_orange 43
#$tec_green 44
#$tec_ltblue 45
#$tec_drkblue  46
            
    
    
    
    $worksheet->set_column('A:A', $length_f1       ); # this sets the width
    $worksheet->set_column('B:B', $length_f2       ); # this sets the width
    #$worksheet->set_column('C:C', $length_f3       ); # this sets the width
    $worksheet->set_column('C:C', 30 );
    #$worksheet->set_column('D:D', $length_f4      );
    $worksheet->set_column('D:D', 30 	   );# this sets the width
    $worksheet->set_column('E:E', $length_f5       ); # this sets the width
    $worksheet->set_column('F:F', $length_f6       ); # this sets the width
    $worksheet->set_column('G:G', $length_f7       ); # this sets the width
    $worksheet->set_column('H:H', $length_f8       ); # this sets the width
    $worksheet->set_column('I:I', $length_f9       ); # this sets the width
    $worksheet->set_column('J:J', $length_f_10       ); # this sets the width
    $worksheet->set_column('K:K', $length_f_11       ); # this sets the width
    $worksheet->set_column('L:L', $length_f_12       ); # this sets the width
    $worksheet->set_column('M:M', $length_f_13       ); # this sets the width
    $worksheet->set_column('N:N', $length_f_14       ); # this sets the width
    $worksheet->set_column('O:O', $length_f_15       ); # this sets the width
    $worksheet->set_column('P:P', $length_f_16       ); # this sets the width
    $worksheet->set_column('Q:Q', $length_f_17       ); # this sets the width
    $worksheet->set_column('R:R', $length_f_18       ); # this sets the width
    $worksheet->set_column('S:S', $length_f_19       ); # this sets the width
    $worksheet->set_column('T:T', $length_f_20       ); # this sets the width
    $worksheet->set_column('U:U', $length_f_21       ); # this sets the width
    $worksheet->set_column('V:V', $length_f_22       ); # this sets the width
    $worksheet->set_column('W:W', $length_f_23       ); # this sets the width
    $worksheet->set_column('X:X', $length_f_24       ); # this sets the width
    $worksheet->set_column('Y:Y', $length_f_25       ); # this sets the width
    $worksheet->set_column('Z:Z', $length_f_26       ); # this sets the width
    $worksheet->set_column('AA:AA', $length_f_27       ); # this sets the width
    $worksheet->set_column('AB:AB', $length_f_28       ); # this sets the width
    $worksheet->set_column('AC:AC', $length_f_29       ); # this sets the width
    $worksheet->set_column('AD:AD', $length_f_30       ); # this sets the width
    $worksheet->set_column('AE:AE', $length_f_31       ); # this sets the width
    $worksheet->set_column('AF:AF', $length_f_32       ); # this sets the width
    $worksheet->set_column('AG:AG', $length_f_33       ); # this sets the width
    $worksheet->set_column('AH:AH', $length_f_34       ); # this sets the width
    $worksheet->set_column('AI:AI', $length_f_35       ); # this sets the width
    $worksheet->set_column('AJ:AJ', $length_f_36       ); # this sets the width
    $worksheet->set_column('AK:AK', $length_f_37       ); # this sets the width
    $worksheet->set_column('AL:AL', $length_f_38       ); # this sets the width
    $worksheet->set_column('AM:AM', $length_f_39       ); # this sets the width
    $worksheet->set_column('AN:AN', $length_f_40       ); # this sets the width
    $worksheet->set_column('AO:AO', $length_f_41       ); # this sets the width
    $worksheet->set_column('AP:AP', $length_f_42       ); # this sets the width
    $worksheet->set_column('AQ:AQ', $length_f_43       ); # this sets the width
    $worksheet->set_column('AR:AR', $length_f_44       ); # this sets the width
    $worksheet->set_column('AS:AS', $length_f_45       ); # this sets the width
    $worksheet->set_column('AT:AT', $length_f_46       ); # this sets the width
    $worksheet->set_column('AU:AU', $length_f_47       ); # this sets the width
    $worksheet->set_column('AV:AV', $length_f_48       ); # this sets the width
    $worksheet->set_column('AW:AW', $length_f_49       ); # this sets the width
    $worksheet->set_column('AX:AX', $length_f_50       ); # this sets the width
    $worksheet->set_column('AY:AY', $length_f_51       ); # this sets the width
    $worksheet->set_column('AZ:AZ', $length_f_52       ); # this sets the width
    $worksheet->set_column('BA:BA', $length_f_53       ); # this sets the width
    $worksheet->set_column('BB:BB', $length_f_54       ); # this sets the width
    $worksheet->set_column('BC:BC', $length_f_55       ); # this sets the width
    $worksheet->set_column('BD:BD', $length_f_56       ); # this sets the width
    $worksheet->set_column('BE:BE', $length_f_57       ); # this sets the width
    $worksheet->set_column('BF:BF', $length_f_58       ); # this sets the width
    $worksheet->set_column('BG:BG', $length_f_59       ); # this sets the width
    $worksheet->set_column('BH:BH', $length_f_60       ); # this sets the width
    $worksheet->set_column('BI:BI', $length_f_61       ); # this sets the width
    $worksheet->set_column('BJ:BJ', $length_f_62       ); # this sets the width
    $worksheet->set_column('BK:BK', $length_f_63       ); # this sets the width
    $worksheet->set_column('BL:BL', $length_f_64       ); # this sets the width
    $worksheet->set_column('BM:BM', $length_f_65       ); # this sets the width
    $worksheet->set_column('BN:BN', $length_f_66       ); # this sets the width
    $worksheet->set_column('BO:BO', $length_f_67       ); # this sets the width
    $worksheet->set_column('BP:BP', $length_f_68       ); # this sets the width
    $worksheet->set_column('BQ:BQ', $length_f_69       ); # this sets the width
    $worksheet->set_column('BR:BR', $length_f_70       ); # this sets the width
    $worksheet->set_column('BS:BS', $length_f_71       ); # this sets the width
    $worksheet->set_column('BT:BT', $length_f_72       ); # this sets the width
    $worksheet->set_column('BU:BU', $length_f_73       ); # this sets the width
    $worksheet->set_column('BV:BV', $length_f_74       ); # this sets the width
    $worksheet->set_column('BW:BW', $length_f_75       ); # this sets the width
    $worksheet->set_column('BX:BX', $length_f_76       ); # this sets the width
    $worksheet->set_column('BY:BY', $length_f_77       ); # this sets the width
    $worksheet->set_column('BZ:BZ', $length_f_78       ); # this sets the width
    $worksheet->set_column('CA:CA', $length_f_79       ); # this sets the width
    $worksheet->set_column('CB:CB', $length_f_80       ); # this sets the width
    $worksheet->set_column('CC:CC', $length_f_81       ); # this sets the width
    $worksheet->set_column('CD:CD', $length_f_82       ); # this sets the width
    $worksheet->set_column('CE:CE', $length_f_83       ); # this sets the width
    $worksheet->set_column('CF:CF', $length_f_84       ); # this sets the width
    
    #$tec_purple 40
#$tec_grey 41
#$tec_red 42
#$tec_orange 43
#$tec_green 44
#$tec_ltblue 45
#$tec_drkblue  46
    my $heading  = $workbook->add_format(
                                            bold    => 1, # Make it pold
                                            color   => 'black', # colour
                                            size    => 16, # 18 font
                                            merge   => 1, # Merge cells
                                            align  => 'vcenter', # vertical Align
                                            font    =>'Arial'
                                            
                                            );
    my $heading_3  = $workbook->add_format(                                         
                                                                                      
                                            bold    => 1, # Make it pold
                                            color   => 41, # colour
                                            size    => 14, # 18 font
                                            merge   => 1, # Merge cells
                                            align  => 'vcenter', # vertical Align
                                            font    =>'Arial'
                                            
                                            );
                                            
   my $heading_2  = $workbook->add_format(
                                            bold    => 0, # Make it pold
                                            italic  => 0,
                                            color   => 'black', # colour
                                            size    => 14, # 18 font
                                            merge   => 1, # Merge cells
                                            align  => 'left', # vertical Align
                                            font    =>'Arial Bold'
                                            
                                            );
   my $heading_4  = $workbook->add_format(
                                            bold    => 1, # Make it pold
                                            italic  => 0,
                                            color   => 'white', # colour
                                            size    => 12, # 18 font
                                            merge   => 1, # Merge cells
                                            align  => 'left', # vertical Align
                                            font    =>'Arial Bold'
                                            
                                            );
  my $heading_5  = $workbook->add_format(
                                            bold    => 0, # Make it pold
                                            italic  => 0,
                                            color   => 'black', # colour
                                            size    => 10, # 18 font
                                            merge   => 0, # Merge cells
                                            align  => 'left', # vertical Align
                                            font    =>'Arial'
                                            
                                            );
 $heading_5->set_bg_color(42);
 my $heading_6  = $workbook->add_format(
                                            bold    => 0, # Make it pold
                                            italic  => 0,
                                            color   => 'black', # colour
                                            size    => 10, # 18 font
                                            merge   => 0, # Merge cells
                                            align  => 'left', # vertical Align
                                            font    =>'Arial'
                                            
                                            );
 $heading_6->set_bg_color(17);
 
 my $heading_7  = $workbook->add_format(
                                            bold    => 0, # Make it pold
                                            italic  => 0,
                                            color   => 'black', # colour
                                            size    => 9, # 18 font
                                            merge   => 1, # Merge cells
                                            align  => 'left', # vertical Align
                                            font    =>'Arial'
                                            
                                            );
 $heading_7->set_bg_color(17);
 
    ###################################
    # Set more heading properties here
    ###################################
    
    ###################################
    # Set more heading properties here
    ###################################
 #    8   =>   black
#    9   =>   white
#    10   =>   red
#    11   =>   lime
#    12   =>   blue
#    13   =>   yellow
#    14   =>   magenta
#    15   =>   cyan
#    16   =>   brown
#    17   =>   green
#    18   =>   navy
#    20   =>   purple
#    22   =>   silver
#    23   =>   gray
#    33   =>   pink
#    53   =>   orange  

#$tec_purple 40
#$tec_grey 41
#$tec_red 42
#$tec_orange 43
#$tec_green 44
#$tec_ltblue 45
#$tec_drkblue  46
 
    $heading->set_align ('left');
    $heading->set_bg_color(40); 
    $heading_3->set_align ('left');
    $heading_3->set_bg_color(40); 
    $heading_2->set_align ('left');
    $heading_2->set_bg_color(41);
    $heading_4->set_align ('left');
    $heading_4->set_bg_color(40); 
     $heading_5->set_align ('left');
    
    
    $worksheet->write_row('A1', \@headings, $heading); # write the text in the heading format we've defined
    
    if ("$health_or_doc" eq "v7000") {
    $worksheet->write('A1', 'StorageTools V7000 Checks', $heading);
    $worksheet->write('B1', '(c)Tectrade Computers Ltd', $heading_3);
    #$worksheet->write('C1', '', $heading);
    }
    if ("$health_or_doc" eq "brocade") {
    $worksheet->write('A1', 'StorageTools Brocade Checks', $heading);
    $worksheet->write('B1', '(c)Tectrade Computers Ltd', $heading_3);
    #$worksheet->write('C1', '', $heading);
    }
    
    if ("$health_or_doc" eq "v7000u") {
    $worksheet->write('A1', 'StorageTools V7000 UNIFIED Checks', $heading);
    $worksheet->write('B1', '(c)Tectrade Computers Ltd', $heading_3);
    #$worksheet->write('C1', '', $heading);
    }
    
    if ("$health_or_doc" eq "ds8000") {
    $worksheet->write('A1', 'StorageTools DS8000 Checks', $heading);
    $worksheet->write('B1', '(c)Tectrade Computers Ltd', $heading_3);
    #$worksheet->write('C1', '', $heading);
    }
    
    if ("$health_or_doc" eq "xiv") {
    $worksheet->write('A1', 'StorageTools XIV Checks', $heading);
    $worksheet->write('B1', '(c)Tectrade Computers Ltd', $heading_3);
    #$worksheet->write('C1', '', $heading);
    }
    
    
    if ("$health_or_doc" eq "helix") {
    $worksheet->write('A1', 'StorageTools TSM HELIX Checks', $heading);
    $worksheet->write('B1', '(c)Tectrade Computers Ltd', $heading_3);
    #$worksheet->write('C1', '', $heading);
    $worksheet->write('A2', 'TSM Server Name:', $heading_4);
    $worksheet->write('B2', 'Customer Name:', $heading_4);
    }
    if ("$health_or_doc" eq "healthcheck") {
    $worksheet->write('A1', 'StorageTools TSM Healthcheck', $heading);
    $worksheet->write('B1', '(c)Tectrade Computers Ltd', $heading_3);
    #$worksheet->write('C1', '', $heading);
    $worksheet->write('A2', 'TSM Server Name:', $heading_4);
    $worksheet->write('B2', 'Customer Name:', $heading_4);
    }
    elsif ("$health_or_doc" eq "documentation") {
    $worksheet->write('A1', 'StorageTools TSM Documentation', $heading);
    $worksheet->write('B1', '(c)Tectrade Computers Ltd', $heading_3);
    #$worksheet->write('C1', '', $heading);
    $worksheet->write('A2', 'TSM Server Name:', $heading_4);
    $worksheet->write('B2', 'Customer Name:', $heading_4);
    }
    elsif ("$health_or_doc" eq "frontend") {
    $worksheet->write('A1', 'StorageTools Frontend Licensing', $heading);
    $worksheet->write('B1', '(c)Tectrade Computers Ltd', $heading_3);
    #$worksheet->write('C1', '', $heading);
    $worksheet->write('A2', 'TSM Server Name:', $heading_4);
    $worksheet->write('B2', 'Customer Name:', $heading_4);
    }
    elsif ("$health_or_doc" eq "dedupe") {
    #$worksheet->autofilter('A8:AQ99999');
    $worksheet->autofilter($filter_range);
    $worksheet->write('A1', 'StorageTools TSM Dedupe Report', $heading);
    $worksheet->write('B1', '(c)Tectrade Computers Ltd', $heading_3);
    #$worksheet->write('C1', '', $heading);
    $worksheet->write('A2', 'TSM Server Name:', $heading_4);
    $worksheet->write('B2', 'Customer Name:', $heading_4);
    }
    elsif ("$health_or_doc" eq "tsmve") {
    #$worksheet->autofilter('A8:AQ99999');
    $worksheet->autofilter($filter_range);
    $worksheet->write('A1', 'StorageTools TSM for VE Report', $heading);
    $worksheet->write('B1', '(c)Tectrade Computers Ltd', $heading_3);
    #$worksheet->write('C1', '', $heading);
    $worksheet->write('A2', 'TSM Server Name:', $heading_4);
    $worksheet->write('B2', 'Customer Name:', $heading_4);
    }
    elsif ("$health_or_doc" eq "missed_files") {
    $worksheet->autofilter('B8:C99999');
    $worksheet->write('A1', 'StorageTools TSM Missed Files Report', $heading);
    $worksheet->write('B1', '(c)Tectrade Computers Ltd', $heading_3);
    #$worksheet->write('C1', '', $heading);
    $worksheet->write('A2', 'TSM Server Name:', $heading_4);
    $worksheet->write('B2', 'Customer Name:', $heading_4);
    }
    elsif ("$health_or_doc" eq "catalogue") {
    $worksheet->autofilter('A8:AQ99999');
    $worksheet->write('A1', 'StorageTools TSM Backup Catalogue', $heading);
    $worksheet->write('B1', '(c)Tectrade Computers Ltd', $heading_3);
    #$worksheet->write('C1', '', $heading);
    $worksheet->write('A2', 'TSM Server Name:', $heading_4);
    $worksheet->write('B2', 'Customer Name:', $heading_4);
    }
    elsif ("$health_or_doc" eq "filespace") {
    $worksheet->autofilter('A8:AQ99999');
    $worksheet->write('A1', 'StorageTools TSM Filespace Catalogue', $heading);
    $worksheet->write('B1', '(c)Tectrade Computers Ltd', $heading_3);
    #$worksheet->write('C1', '', $heading);
    $worksheet->write('A2', 'TSM Server Name:', $heading_4);
    $worksheet->write('B2', 'Customer Name:', $heading_4);
    }
    elsif ("$health_or_doc" eq "replication") {
    $worksheet->autofilter('A8:CF99999');
    $worksheet->write('A1', 'StorageTools TSM Node Replication Report', $heading);
    $worksheet->write('B1', '(c)Tectrade Computers Ltd', $heading_3);
    #$worksheet->write('C1', '', $heading);
    $worksheet->write('A2', 'TSM Server Name:', $heading_4);
    $worksheet->write('B2', 'Customer Name:', $heading_4);
    }
    elsif ("$health_or_doc" eq "drm") {
    $worksheet->write('A1', 'StorageTools TSM DRM Report', $heading);
    $worksheet->write('B1', '(c)Tectrade Computers Ltd', $heading_3);
    $worksheet->write('C1', '', $heading);
    $worksheet->write('A2', 'TSM Server Name:', $heading_4);
    $worksheet->write('B2', 'Customer Name:', $heading_4);
    }
    elsif ("$health_or_doc" eq "tsmforve") {
    $worksheet->write('A1', 'StorageTools TSM for VE Modeller', $heading);
    $worksheet->write('B1', '(c)Tectrade Computers Ltd', $heading_3);
    $worksheet->write('C1', '', $heading);
    $worksheet->write('A2', 'TSM Server Name: (N/A)', $heading_4);
    
    }
    
    $worksheet->write('A3', $tsm_server, $heading_2);
    $worksheet->write('B3', $customer_name, $heading_2);
    $worksheet->write('C1', $software_version, $heading_4);
    
    ##
    ## Set up the text formats
    ##
    
    my $text_format  = $workbook->add_format(
                                                bold    => 1,
                                                italic  => 1,
                                                color   => 'white',
                                                size    => 10,
                                                font    =>'Arial',                                                
                                            );
                                            
   my $red_format  = $workbook->add_format(
                                                            
                                            bold    => 1, # Make it bold
                                            color   => 'black', # colour
                                            size    => 12, # 18 font
                                            merge   => 1, # Merge cells
                                            align  => 'left', # vertical Align
                                            font    =>'Arial'
                                            
                                            );
    
        
    my $normal_text  = $workbook->add_format(
                                                bold    => 0,
                                                italic  => 0,
                                                color   => 'black',
                                                size    => 10,
                                                font    =>'Arial',                                                                                                                                          
                                            );
                                            
    my $number_2dp_text  = $workbook->add_format(
                                                bold    => 0,
                                                italic  => 0,
                                                color   => 'black',
                                                size    => 10,
                                                font    =>'Arial',                                                                                                                                          
                                            );
                                                
    #    8   =>   black
#    9   =>   white
#    10   =>   red
#    11   =>   lime
#    12   =>   blue
#    13   =>   yellow
#    14   =>   magenta
#    15   =>   cyan
#    16   =>   brown
#    17   =>   green
#    18   =>   navy
#    20   =>   purple
#    22   =>   silver
#    23   =>   gray
#    33   =>   pink
#    53   =>   orange   
 
#$tec_purple 40
#$tec_grey 41
#$tec_red 42
#$tec_orange 43
#$tec_green 44
#$tec_ltblue 45
#$tec_drkblue  46
                                       
    $text_format->set_align ('left');
    $normal_text->set_align ('left');   
    $red_format->set_align ('left');
    $text_format->set_bg_color(41);
    $red_format->set_bg_color(43);

$heading_flag=off;
  
    #open (SPREADSHEET_FILE, "${host_directory}/${tsm_server}_$health_or_doc.csv") or die "Can't open file \n\n";
	@read_healthcheck=<SPREADSHEET_FILE>;
	my $count=6;
	foreach $health_element (@read_healthcheck) {
	     chomp $health_element;
	     $health_element=~s/(\")(\d+)(,)(\d+)(\")/$2$4/;
	     if (grep /$separator/, $health_element) {
	     #($field1, $field2, $field3, $field4, $field5, $field6, $field7, $field8, $field9, $field_10, $field_11, $field_12, $field_13, $field_14, $field_15, $field_16, $field_17, $field_18, $field_19, $field_20, $field_21, $field_22, $field_23, $field_24, $field_25, $field_26, $field_27, $field_28, $field_29, $field_30, $field_31, $field_32, $field_33, $field_34, $field_35, $field_36, $field_37, $field_38, $field_39, $field_40, $field_41, $field_42, $field_43,) = (split /,/,$health_element)[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42];
	     ($field1, $field2, $field3, $field4, $field5, $field6, $field7, $field8, $field9, $field_10, $field_11, $field_12, $field_13, $field_14, $field_15, $field_16, $field_17, $field_18, $field_19, $field_20, $field_21, $field_22, $field_23, $field_24, $field_25, $field_26, $field_27, $field_28, $field_29, $field_30, $field_31, $field_32, $field_33,$field_34, $field_35, $field_36, $field_37, $field_38, $field_39, $field_40, $field_41,$field_42,$field_43,$field_44,$field_45,$field_46,$field_47,$field_48,$field_49,$field_50,$field_51,$field_52,$field_53,$field_54,$field_55,$field_56,$field_57,$field_58,$field_59,$field_60,$field_61,$field_62,$field_63,$field_64,$field_65,$field_66,$field_67,$field_68,$field_69,$field_70,$field_71,$field_72,$field_73,$field_74,$field_75,$field_76,$field_77,$field_78,$field_79,$field_80,$field_81,$field_82,$field_83,$field_84) = (split /,/,$health_element)[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,79,79,80,81,82,83];
	     $count=$count+1;
	     $worksheet->write("A$count}","$field1",$red_format);
	     $count=$count+1;
	     $heading_flag="on";
	     }
	     elsif ((grep /\Dedupl/, $health_element) && ("$health_or_doc" eq "dedupe")) {
	     ($field1, $field2, $field3, $field4, $field5, $field6, $field7, $field8, $field9, $field_10, $field_11, $field_12, $field_13, $field_14, $field_15, $field_16, $field_17, $field_18, $field_19, $field_20, $field_21, $field_22, $field_23, $field_24, $field_25, $field_26, $field_27, $field_28, $field_29, $field_30, $field_31, $field_32, $field_33, $field_34, $field_35, $field_36, $field_37, $field_38, $field_39, $field_40, $field_41, $field_42, $field_43,) = (split /,/,$health_element)[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42];
	     $worksheet->write("A$count}","$field1",$heading_5);
	     $worksheet->write("B$count}","$field2",$heading_5);
	     $worksheet->write("C$count}","$field3",$heading_5);
	     $worksheet->write("D$count}","$field4",$heading_5);
	     $worksheet->write("E$count}","$field5",$heading_5);
	     $worksheet->write("F$count}","$field6",$heading_5);
	     $worksheet->write("G$count}","$field7",$heading_5);
	     $worksheet->write("H$count}","$field8",$heading_5);
	     $worksheet->write("I$count}","$field9",$heading_5);
	     $worksheet->write("J$count}","$field_10",$heading_5);
	     $worksheet->write("K$count}","$field_11",$heading_5);
	     $worksheet->write("L$count}","$field_12",$heading_5);
	     $worksheet->write("M$count}","$field_13",$heading_5);
	     $worksheet->write("N$count}","$field_14",$heading_5);
	     $worksheet->write("O$count}","$field_15",$heading_5);
	     $worksheet->write("P$count}","$field_16",$heading_5);
	     $worksheet->write("Q$count}","$field_17",$heading_5);
	     $worksheet->write("R$count}","$field_18",$heading_5);
	     $worksheet->write("S$count}","$field_19",$heading_5);
	     $worksheet->write("T$count}","$field_20",$heading_5);
	     $worksheet->write("U$count}","$field_21",$heading_5);
	     $worksheet->write("V$count}","$field_22",$heading_5);
	     $worksheet->write("W$count}","$field_23",$heading_5);
	     $worksheet->write("X$count}","$field_24",$heading_5);
	     $worksheet->write("Y$count}","$field_25",$heading_5);
	     $worksheet->write("Z$count}","$field_26",$heading_5);
	     $worksheet->write("AA$count}","$field_27",$heading_5);
	     $worksheet->write("AB$count}","$field_28",$heading_5);
	     $worksheet->write("AC$count}","$field_29",$heading_5);
	     $worksheet->write("AD$count}","$field_30",$heading_5);
	     $worksheet->write("AE$count}","$field_31",$heading_5);
	     $worksheet->write("AF$count}","$field_32",$heading_5);
	     $worksheet->write("AG$count}","$field_33",$heading_5);
	     $worksheet->write("AH$count}","$field_34",$heading_5);
	     $worksheet->write("AI$count}","$field_35",$heading_5);
	     $worksheet->write("AJ$count}","$field_36",$heading_5);
	     $worksheet->write("AK$count}","$field_37",$heading_5);
	     $worksheet->write("AL$count}","$field_38",$heading_5);
	     $worksheet->write("AM$count}","$field_39",$heading_5);
	     $worksheet->write("AN$count}","$field_40",$heading_5);
	     $worksheet->write("AO$count}","$field_41",$heading_5);
	     $worksheet->write("AP$count}","$field_42",$heading_5);
	     $worksheet->write("AQ$count}","$field_43",$heading_5);
	     $count=$count+1;
	     
	     
	     }
	     
	     elsif ((grep /SUCCESSFUL Full backup of VM/, $health_element) && ("$health_or_doc" eq "tsmve")) {
	     ($field1, $field2, $field3, $field4, $field5, $field6, $field7, $field8, $field9, $field_10, $field_11, $field_12, $field_13, $field_14, $field_15, $field_16, $field_17, $field_18, $field_19, $field_20, $field_21, $field_22, $field_23, $field_24, $field_25, $field_26, $field_27, $field_28, $field_29, $field_30, $field_31, $field_32, $field_33, $field_34, $field_35, $field_36, $field_37, $field_38, $field_39, $field_40, $field_41, $field_42, $field_43,) = (split /,/,$health_element)[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42];
	     $worksheet->write("A$count}","$field1",$heading_6);
	     $worksheet->write("B$count}","$field2",$heading_6);
	     $worksheet->write("C$count}","$field3",$heading_6);
	     $worksheet->write("D$count}","$field4",$heading_6);
	     $worksheet->write("E$count}","$field5",$heading_6);
	     $worksheet->write("F$count}","$field6",$heading_6);
	     $worksheet->write("G$count}","$field7",$heading_6);
	     $worksheet->write("H$count}","$field8",$heading_6);
	     $worksheet->write("I$count}","$field9",$heading_6);
	     $worksheet->write("J$count}","$field_10",$heading_6);
	     $worksheet->write("K$count}","$field_11",$heading_6);
	     $worksheet->write("L$count}","$field_12",$heading_6);
	     $worksheet->write("M$count}","$field_13",$heading_6);
	     $worksheet->write("N$count}","$field_14",$heading_6);
	     $worksheet->write("O$count}","$field_15",$heading_6);
	     $worksheet->write("P$count}","$field_16",$heading_6);
	     $worksheet->write("Q$count}","$field_17",$heading_6);
	     $worksheet->write("R$count}","$field_18",$heading_6);
	     $worksheet->write("S$count}","$field_19",$heading_6);
	     $worksheet->write("T$count}","$field_20",$heading_6);
	     $worksheet->write("U$count}","$field_21",$heading_6);
	     $worksheet->write("V$count}","$field_22",$heading_6);
	     $worksheet->write("W$count}","$field_23",$heading_6);
	     $worksheet->write("X$count}","$field_24",$heading_6);
	     $worksheet->write("Y$count}","$field_25",$heading_6);
	     $worksheet->write("Z$count}","$field_26",$heading_6);
	     $worksheet->write("AA$count}","$field_27",$heading_6);
	     $worksheet->write("AB$count}","$field_28",$heading_6);
	     $worksheet->write("AC$count}","$field_29",$heading_6);
	     $worksheet->write("AD$count}","$field_30",$heading_6);
	     $worksheet->write("AE$count}","$field_31",$heading_6);
	     $worksheet->write("AF$count}","$field_32",$heading_6);
	     $worksheet->write("AG$count}","$field_33",$heading_6);
	     $worksheet->write("AH$count}","$field_34",$heading_6);
	     $worksheet->write("AI$count}","$field_35",$heading_6);
	     $worksheet->write("AJ$count}","$field_36",$heading_6);
	     $worksheet->write("AK$count}","$field_37",$heading_6);
	     $worksheet->write("AL$count}","$field_38",$heading_6);
	     $worksheet->write("AM$count}","$field_39",$heading_6);
	     $worksheet->write("AN$count}","$field_40",$heading_6);
	     $worksheet->write("AO$count}","$field_41",$heading_6);
	     $worksheet->write("AP$count}","$field_42",$heading_6);
	     $worksheet->write("AQ$count}","$field_43",$heading_6);
	     $count=$count+1;
	     
	     
	     }
	     
	     elsif ((grep /==== :-/, $health_element) && ("$health_or_doc" eq "xiv")) {
	     ($field1, $field2, $field3, $field4, $field5, $field6, $field7, $field8, $field9, $field_10, $field_11, $field_12, $field_13, $field_14, $field_15, $field_16, $field_17, $field_18, $field_19, $field_20, $field_21, $field_22, $field_23, $field_24, $field_25, $field_26, $field_27, $field_28, $field_29, $field_30, $field_31, $field_32, $field_33, $field_34, $field_35, $field_36, $field_37, $field_38, $field_39, $field_40, $field_41, $field_42, $field_43,) = (split /,/,$health_element)[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42];
	     $worksheet->write("A$count}","$field1",$heading_7);
	     $worksheet->write("B$count}","$field2",$heading_7);
	     $worksheet->write("C$count}","$field3",$heading_7);
	     $worksheet->write("D$count}","$field4",$heading_7);
	     $worksheet->write("E$count}","$field5",$heading_7);
	     $worksheet->write("F$count}","$field6",$heading_7);
	     $worksheet->write("G$count}","$field7",$heading_7);
	     $worksheet->write("H$count}","$field8",$heading_7);
	     $worksheet->write("I$count}","$field9",$heading_7);
	     $worksheet->write("J$count}","$field_10",$heading_7);
	     $worksheet->write("K$count}","$field_11",$heading_7);
	     $worksheet->write("L$count}","$field_12",$heading_7);
	     $worksheet->write("M$count}","$field_13",$heading_7);
	     $worksheet->write("N$count}","$field_14",$heading_7);
	     $worksheet->write("O$count}","$field_15",$heading_7);
	     $worksheet->write("P$count}","$field_16",$heading_7);
	     $worksheet->write("Q$count}","$field_17",$heading_7);
	     $worksheet->write("R$count}","$field_18",$heading_7);
	     $worksheet->write("S$count}","$field_19",$heading_7);
	     $worksheet->write("T$count}","$field_20",$heading_7);
	     $worksheet->write("U$count}","$field_21",$heading_7);
	     $worksheet->write("V$count}","$field_22",$heading_7);
	     $worksheet->write("W$count}","$field_23",$heading_7);
	     $worksheet->write("X$count}","$field_24",$heading_7);
	     $worksheet->write("Y$count}","$field_25",$heading_7);
	     $worksheet->write("Z$count}","$field_26",$heading_7);
	     $worksheet->write("AA$count}","$field_27",$heading_7);
	     $worksheet->write("AB$count}","$field_28",$heading_7);
	     $worksheet->write("AC$count}","$field_29",$heading_7);
	     $worksheet->write("AD$count}","$field_30",$heading_7);
	     $worksheet->write("AE$count}","$field_31",$heading_7);
	     $worksheet->write("AF$count}","$field_32",$heading_7);
	     $worksheet->write("AG$count}","$field_33",$heading_7);
	     $worksheet->write("AH$count}","$field_34",$heading_7);
	     $worksheet->write("AI$count}","$field_35",$heading_7);
	     $worksheet->write("AJ$count}","$field_36",$heading_7);
	     $worksheet->write("AK$count}","$field_37",$heading_7);
	     $worksheet->write("AL$count}","$field_38",$heading_7);
	     $worksheet->write("AM$count}","$field_39",$heading_7);
	     $worksheet->write("AN$count}","$field_40",$heading_7);
	     $worksheet->write("AO$count}","$field_41",$heading_7);
	     $worksheet->write("AP$count}","$field_42",$heading_7);
	     $worksheet->write("AQ$count}","$field_43",$heading_7);
	     $count=$count+1;
	     
	     
	     }
	     elsif ((grep /failed/, $health_element) && ("$health_or_doc" eq "tsmve")) {
	     ($field1, $field2, $field3, $field4, $field5, $field6, $field7, $field8, $field9, $field_10, $field_11, $field_12, $field_13, $field_14, $field_15, $field_16, $field_17, $field_18, $field_19, $field_20, $field_21, $field_22, $field_23, $field_24, $field_25, $field_26, $field_27, $field_28, $field_29, $field_30, $field_31, $field_32, $field_33, $field_34, $field_35, $field_36, $field_37, $field_38, $field_39, $field_40, $field_41, $field_42, $field_43,) = (split /,/,$health_element)[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42];
	     $worksheet->write("A$count}","$field1",$heading_5);
	     $worksheet->write("B$count}","$field2",$heading_5);
	     $worksheet->write("C$count}","$field3",$heading_5);
	     $worksheet->write("D$count}","$field4",$heading_5);
	     $worksheet->write("E$count}","$field5",$heading_5);
	     $worksheet->write("F$count}","$field6",$heading_5);
	     $worksheet->write("G$count}","$field7",$heading_5);
	     $worksheet->write("H$count}","$field8",$heading_5);
	     $worksheet->write("I$count}","$field9",$heading_5);
	     $worksheet->write("J$count}","$field_10",$heading_5);
	     $worksheet->write("K$count}","$field_11",$heading_5);
	     $worksheet->write("L$count}","$field_12",$heading_5);
	     $worksheet->write("M$count}","$field_13",$heading_5);
	     $worksheet->write("N$count}","$field_14",$heading_5);
	     $worksheet->write("O$count}","$field_15",$heading_5);
	     $worksheet->write("P$count}","$field_16",$heading_5);
	     $worksheet->write("Q$count}","$field_17",$heading_5);
	     $worksheet->write("R$count}","$field_18",$heading_5);
	     $worksheet->write("S$count}","$field_19",$heading_5);
	     $worksheet->write("T$count}","$field_20",$heading_5);
	     $worksheet->write("U$count}","$field_21",$heading_5);
	     $worksheet->write("V$count}","$field_22",$heading_5);
	     $worksheet->write("W$count}","$field_23",$heading_5);
	     $worksheet->write("X$count}","$field_24",$heading_5);
	     $worksheet->write("Y$count}","$field_25",$heading_5);
	     $worksheet->write("Z$count}","$field_26",$heading_5);
	     $worksheet->write("AA$count}","$field_27",$heading_5);
	     $worksheet->write("AB$count}","$field_28",$heading_5);
	     $worksheet->write("AC$count}","$field_29",$heading_5);
	     $worksheet->write("AD$count}","$field_30",$heading_5);
	     $worksheet->write("AE$count}","$field_31",$heading_5);
	     $worksheet->write("AF$count}","$field_32",$heading_5);
	     $worksheet->write("AG$count}","$field_33",$heading_5);
	     $worksheet->write("AH$count}","$field_34",$heading_5);
	     $worksheet->write("AI$count}","$field_35",$heading_5);
	     $worksheet->write("AJ$count}","$field_36",$heading_5);
	     $worksheet->write("AK$count}","$field_37",$heading_5);
	     $worksheet->write("AL$count}","$field_38",$heading_5);
	     $worksheet->write("AM$count}","$field_39",$heading_5);
	     $worksheet->write("AN$count}","$field_40",$heading_5);
	     $worksheet->write("AO$count}","$field_41",$heading_5);
	     $worksheet->write("AP$count}","$field_42",$heading_5);
	     $worksheet->write("AQ$count}","$field_43",$heading_5);
	     $count=$count+1;
	     
	     
	     }
	    # elsif ("$health_or_doc" eq "tsmforve"){
	    	# ($field1, $field2) = (split /,/,$health_element)[0,1];
	    	# $worksheet->write("A$count}","$field1",$normal_text);
	        # $worksheet->write("B$count}","$field2",$ve_format);
	    # }
	    	
	     elsif ((grep /Objects compressed by/, $health_element) && ("$health_or_doc" eq "dedupe")) {
	     ($field1, $field2, $field3, $field4, $field5, $field6, $field7, $field8, $field9, $field_10, $field_11, $field_12, $field_13, $field_14, $field_15, $field_16, $field_17, $field_18, $field_19, $field_20, $field_21, $field_22, $field_23, $field_24, $field_25, $field_26, $field_27, $field_28, $field_29, $field_30, $field_31, $field_32, $field_33, $field_34, $field_35, $field_36, $field_37, $field_38, $field_39, $field_40, $field_41, $field_42, $field_43,) = (split /,/,$health_element)[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42];
	     $worksheet->write("A$count}","$field1",$heading_5);
	     $worksheet->write("B$count}","$field2",$heading_5);
	     $worksheet->write("C$count}","$field3",$heading_5);
	     $worksheet->write("D$count}","$field4",$heading_5);
	     $worksheet->write("E$count}","$field5",$heading_5);
	     $worksheet->write("F$count}","$field6",$heading_5);
	     $worksheet->write("G$count}","$field7",$heading_5);
	     $worksheet->write("H$count}","$field8",$heading_5);
	     $worksheet->write("I$count}","$field9",$heading_5);
	     $worksheet->write("J$count}","$field_10",$heading_5);
	     $worksheet->write("K$count}","$field_11",$heading_5);
	     $worksheet->write("L$count}","$field_12",$heading_5);
	     $worksheet->write("M$count}","$field_13",$heading_5);
	     $worksheet->write("N$count}","$field_14",$heading_5);
	     $worksheet->write("O$count}","$field_15",$heading_5);
	     $worksheet->write("P$count}","$field_16",$heading_5);
	     $worksheet->write("Q$count}","$field_17",$heading_5);
	     $worksheet->write("R$count}","$field_18",$heading_5);
	     $worksheet->write("S$count}","$field_19",$heading_5);
	     $worksheet->write("T$count}","$field_20",$heading_5);
	     $worksheet->write("U$count}","$field_21",$heading_5);
	     $worksheet->write("V$count}","$field_22",$heading_5);
	     $worksheet->write("W$count}","$field_23",$heading_5);
	     $worksheet->write("X$count}","$field_24",$heading_5);
	     $worksheet->write("Y$count}","$field_25",$heading_5);
	     $worksheet->write("Z$count}","$field_26",$heading_5);
	     $worksheet->write("AA$count}","$field_27",$heading_5);
	     $worksheet->write("AB$count}","$field_28",$heading_5);
	     $worksheet->write("AC$count}","$field_29",$heading_5);
	     $worksheet->write("AD$count}","$field_30",$heading_5);
	     $worksheet->write("AE$count}","$field_31",$heading_5);
	     $worksheet->write("AF$count}","$field_32",$heading_5);
	     $worksheet->write("AG$count}","$field_33",$heading_5);
	     $worksheet->write("AH$count}","$field_34",$heading_5);
	     $worksheet->write("AI$count}","$field_35",$heading_5);
	     $worksheet->write("AJ$count}","$field_36",$heading_5);
	     $worksheet->write("AK$count}","$field_37",$heading_5);
	     $worksheet->write("AL$count}","$field_38",$heading_5);
	     $worksheet->write("AM$count}","$field_39",$heading_5);
	     $worksheet->write("AN$count}","$field_40",$heading_5);
	     $worksheet->write("AO$count}","$field_41",$heading_5);
	     $worksheet->write("AP$count}","$field_42",$heading_5);
	     $worksheet->write("AQ$count}","$field_43",$heading_5);
	     $count=$count+1;
	     
	     
	     }
	     elsif ((grep /Total number of bytes transferred/, $health_element) && ("$health_or_doc" eq "dedupe")) {
	     ($field1, $field2, $field3, $field4, $field5, $field6, $field7, $field8, $field9, $field_10, $field_11, $field_12, $field_13, $field_14, $field_15, $field_16, $field_17, $field_18, $field_19, $field_20, $field_21, $field_22, $field_23, $field_24, $field_25, $field_26, $field_27, $field_28, $field_29, $field_30, $field_31, $field_32, $field_33, $field_34, $field_35, $field_36, $field_37, $field_38, $field_39, $field_40, $field_41, $field_42, $field_43,) = (split /,/,$health_element)[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42];
	     $worksheet->write("A$count}","$field1",$heading_6);
	     $worksheet->write("B$count}","$field2",$heading_6);
	     $worksheet->write("C$count}","$field3",$heading_6);
	     $worksheet->write("D$count}","$field4",$heading_6);
	     $worksheet->write("E$count}","$field5",$heading_6);
	     $worksheet->write("F$count}","$field6",$heading_6);
	     $worksheet->write("G$count}","$field7",$heading_6);
	     $worksheet->write("H$count}","$field8",$heading_6);
	     $worksheet->write("I$count}","$field9",$heading_6);
	     $worksheet->write("J$count}","$field_10",$heading_6);
	     $worksheet->write("K$count}","$field_11",$heading_6);
	     $worksheet->write("L$count}","$field_12",$heading_6);
	     $worksheet->write("M$count}","$field_13",$heading_6);
	     $worksheet->write("N$count}","$field_14",$heading_6);
	     $worksheet->write("O$count}","$field_15",$heading_6);
	     $worksheet->write("P$count}","$field_16",$heading_6);
	     $worksheet->write("Q$count}","$field_17",$heading_6);
	     $worksheet->write("R$count}","$field_18",$heading_6);
	     $worksheet->write("S$count}","$field_19",$heading_6);
	     $worksheet->write("T$count}","$field_20",$heading_6);
	     $worksheet->write("U$count}","$field_21",$heading_6);
	     $worksheet->write("V$count}","$field_22",$heading_6);
	     $worksheet->write("W$count}","$field_23",$heading_6);
	     $worksheet->write("X$count}","$field_24",$heading_6);
	     $worksheet->write("Y$count}","$field_25",$heading_6);
	     $worksheet->write("Z$count}","$field_26",$heading_6);
	     $worksheet->write("AA$count}","$field_27",$heading_6);
	     $worksheet->write("AB$count}","$field_28",$heading_6);
	     $worksheet->write("AC$count}","$field_29",$heading_6);
	     $worksheet->write("AD$count}","$field_30",$heading_6);
	     $worksheet->write("AE$count}","$field_31",$heading_6);
	     $worksheet->write("AF$count}","$field_32",$heading_6);
	     $worksheet->write("AG$count}","$field_33",$heading_6);
	     $worksheet->write("AH$count}","$field_34",$heading_6);
	     $worksheet->write("AI$count}","$field_35",$heading_6);
	     $worksheet->write("AJ$count}","$field_36",$heading_6);
	     $worksheet->write("AK$count}","$field_37",$heading_6);
	     $worksheet->write("AL$count}","$field_38",$heading_6);
	     $worksheet->write("AM$count}","$field_39",$heading_6);
	     $worksheet->write("AN$count}","$field_40",$heading_6);
	     $worksheet->write("AO$count}","$field_41",$heading_6);
	     $worksheet->write("AP$count}","$field_42",$heading_6);
	     $worksheet->write("AQ$count}","$field_43",$heading_6);
	     $count=$count+1;
	     
	     
	     }
	     
	     elsif ((grep /Objects compressed by/, $health_element) && ("$health_or_doc" eq "dedupe")) {
	     ($field1, $field2, $field3, $field4, $field5, $field6, $field7, $field8, $field9, $field_10, $field_11, $field_12, $field_13, $field_14, $field_15, $field_16, $field_17, $field_18, $field_19, $field_20, $field_21, $field_22, $field_23, $field_24, $field_25, $field_26, $field_27, $field_28, $field_29, $field_30, $field_31, $field_32, $field_33, $field_34, $field_35, $field_36, $field_37, $field_38, $field_39, $field_40, $field_41, $field_42, $field_43,) = (split /,/,$health_element)[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42];
	     $worksheet->write("A$count}","$field1",$heading_5);
	     $worksheet->write("B$count}","$field2",$heading_5);
	     $worksheet->write("C$count}","$field3",$heading_5);
	     $worksheet->write("D$count}","$field4",$heading_5);
	     $worksheet->write("E$count}","$field5",$heading_5);
	     $worksheet->write("F$count}","$field6",$heading_5);
	     $worksheet->write("G$count}","$field7",$heading_5);
	     $worksheet->write("H$count}","$field8",$heading_5);
	     $worksheet->write("I$count}","$field9",$heading_5);
	     $worksheet->write("J$count}","$field_10",$heading_5);
	     $worksheet->write("K$count}","$field_11",$heading_5);
	     $worksheet->write("L$count}","$field_12",$heading_5);
	     $worksheet->write("M$count}","$field_13",$heading_5);
	     $worksheet->write("N$count}","$field_14",$heading_5);
	     $worksheet->write("O$count}","$field_15",$heading_5);
	     $worksheet->write("P$count}","$field_16",$heading_5);
	     $worksheet->write("Q$count}","$field_17",$heading_5);
	     $worksheet->write("R$count}","$field_18",$heading_5);
	     $worksheet->write("S$count}","$field_19",$heading_5);
	     $worksheet->write("T$count}","$field_20",$heading_5);
	     $worksheet->write("U$count}","$field_21",$heading_5);
	     $worksheet->write("V$count}","$field_22",$heading_5);
	     $worksheet->write("W$count}","$field_23",$heading_5);
	     $worksheet->write("X$count}","$field_24",$heading_5);
	     $worksheet->write("Y$count}","$field_25",$heading_5);
	     $worksheet->write("Z$count}","$field_26",$heading_5);
	     $worksheet->write("AA$count}","$field_27",$heading_5);
	     $worksheet->write("AB$count}","$field_28",$heading_5);
	     $worksheet->write("AC$count}","$field_29",$heading_5);
	     $worksheet->write("AD$count}","$field_30",$heading_5);
	     $worksheet->write("AE$count}","$field_31",$heading_5);
	     $worksheet->write("AF$count}","$field_32",$heading_5);
	     $worksheet->write("AG$count}","$field_33",$heading_5);
	     $worksheet->write("AH$count}","$field_34",$heading_5);
	     $worksheet->write("AI$count}","$field_35",$heading_5);
	     $worksheet->write("AJ$count}","$field_36",$heading_5);
	     $worksheet->write("AK$count}","$field_37",$heading_5);
	     $worksheet->write("AL$count}","$field_38",$heading_5);
	     $worksheet->write("AM$count}","$field_39",$heading_5);
	     $worksheet->write("AN$count}","$field_40",$heading_5);
	     $worksheet->write("AO$count}","$field_41",$heading_5);
	     $worksheet->write("AP$count}","$field_42",$heading_5);
	     $worksheet->write("AQ$count}","$field_43",$heading_5);
	     $count=$count+1;
	     
	     
	     }
	     elsif ((grep /Total number of bytes inspected/, $health_element) && ("$health_or_doc" eq "dedupe")) {
	     ($field1, $field2, $field3, $field4, $field5, $field6, $field7, $field8, $field9, $field_10, $field_11, $field_12, $field_13, $field_14, $field_15, $field_16, $field_17, $field_18, $field_19, $field_20, $field_21, $field_22, $field_23, $field_24, $field_25, $field_26, $field_27, $field_28, $field_29, $field_30, $field_31, $field_32, $field_33, $field_34, $field_35, $field_36, $field_37, $field_38, $field_39, $field_40, $field_41, $field_42, $field_43,) = (split /,/,$health_element)[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42];
	     $worksheet->write("A$count}","$field1",$heading_6);
	     $worksheet->write("B$count}","$field2",$heading_6);
	     $worksheet->write("C$count}","$field3",$heading_6);
	     $worksheet->write("D$count}","$field4",$heading_6);
	     $worksheet->write("E$count}","$field5",$heading_6);
	     $worksheet->write("F$count}","$field6",$heading_6);
	     $worksheet->write("G$count}","$field7",$heading_6);
	     $worksheet->write("H$count}","$field8",$heading_6);
	     $worksheet->write("I$count}","$field9",$heading_6);
	     $worksheet->write("J$count}","$field_10",$heading_6);
	     $worksheet->write("K$count}","$field_11",$heading_6);
	     $worksheet->write("L$count}","$field_12",$heading_6);
	     $worksheet->write("M$count}","$field_13",$heading_6);
	     $worksheet->write("N$count}","$field_14",$heading_6);
	     $worksheet->write("O$count}","$field_15",$heading_6);
	     $worksheet->write("P$count}","$field_16",$heading_6);
	     $worksheet->write("Q$count}","$field_17",$heading_6);
	     $worksheet->write("R$count}","$field_18",$heading_6);
	     $worksheet->write("S$count}","$field_19",$heading_6);
	     $worksheet->write("T$count}","$field_20",$heading_6);
	     $worksheet->write("U$count}","$field_21",$heading_6);
	     $worksheet->write("V$count}","$field_22",$heading_6);
	     $worksheet->write("W$count}","$field_23",$heading_6);
	     $worksheet->write("X$count}","$field_24",$heading_6);
	     $worksheet->write("Y$count}","$field_25",$heading_6);
	     $worksheet->write("Z$count}","$field_26",$heading_6);
	     $worksheet->write("AA$count}","$field_27",$heading_6);
	     $worksheet->write("AB$count}","$field_28",$heading_6);
	     $worksheet->write("AC$count}","$field_29",$heading_6);
	     $worksheet->write("AD$count}","$field_30",$heading_6);
	     $worksheet->write("AE$count}","$field_31",$heading_6);
	     $worksheet->write("AF$count}","$field_32",$heading_6);
	     $worksheet->write("AG$count}","$field_33",$heading_6);
	     $worksheet->write("AH$count}","$field_34",$heading_6);
	     $worksheet->write("AI$count}","$field_35",$heading_6);
	     $worksheet->write("AJ$count}","$field_36",$heading_6);
	     $worksheet->write("AK$count}","$field_37",$heading_6);
	     $worksheet->write("AL$count}","$field_38",$heading_6);
	     $worksheet->write("AM$count}","$field_39",$heading_6);
	     $worksheet->write("AN$count}","$field_40",$heading_6);
	     $worksheet->write("AO$count}","$field_41",$heading_6);
	     $worksheet->write("AP$count}","$field_42",$heading_6);
	     $worksheet->write("AQ$count}","$field_43",$heading_6);
	     $count=$count+1;
	     
	     
	     }
	     elsif ((grep /Total number of bytes processed/, $health_element) && ("$health_or_doc" eq "dedupe")) {
	     ($field1, $field2, $field3, $field4, $field5, $field6, $field7, $field8, $field9, $field_10, $field_11, $field_12, $field_13, $field_14, $field_15, $field_16, $field_17, $field_18, $field_19, $field_20, $field_21, $field_22, $field_23, $field_24, $field_25, $field_26, $field_27, $field_28, $field_29, $field_30, $field_31, $field_32, $field_33, $field_34, $field_35, $field_36, $field_37, $field_38, $field_39, $field_40, $field_41, $field_42, $field_43,) = (split /,/,$health_element)[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42];
	     $worksheet->write("A$count}","$field1",$heading_5);
	     $worksheet->write("B$count}","$field2",$heading_5);
	     $worksheet->write("C$count}","$field3",$heading_5);
	     $worksheet->write("D$count}","$field4",$heading_5);
	     $worksheet->write("E$count}","$field5",$heading_5);
	     $worksheet->write("F$count}","$field6",$heading_5);
	     $worksheet->write("G$count}","$field7",$heading_5);
	     $worksheet->write("H$count}","$field8",$heading_5);
	     $worksheet->write("I$count}","$field9",$heading_5);
	     $worksheet->write("J$count}","$field_10",$heading_5);
	     $worksheet->write("K$count}","$field_11",$heading_5);
	     $worksheet->write("L$count}","$field_12",$heading_5);
	     $worksheet->write("M$count}","$field_13",$heading_5);
	     $worksheet->write("N$count}","$field_14",$heading_5);
	     $worksheet->write("O$count}","$field_15",$heading_5);
	     $worksheet->write("P$count}","$field_16",$heading_5);
	     $worksheet->write("Q$count}","$field_17",$heading_5);
	     $worksheet->write("R$count}","$field_18",$heading_5);
	     $worksheet->write("S$count}","$field_19",$heading_5);
	     $worksheet->write("T$count}","$field_20",$heading_5);
	     $worksheet->write("U$count}","$field_21",$heading_5);
	     $worksheet->write("V$count}","$field_22",$heading_5);
	     $worksheet->write("W$count}","$field_23",$heading_5);
	     $worksheet->write("X$count}","$field_24",$heading_5);
	     $worksheet->write("Y$count}","$field_25",$heading_5);
	     $worksheet->write("Z$count}","$field_26",$heading_5);
	     $worksheet->write("AA$count}","$field_27",$heading_5);
	     $worksheet->write("AB$count}","$field_28",$heading_5);
	     $worksheet->write("AC$count}","$field_29",$heading_5);
	     $worksheet->write("AD$count}","$field_30",$heading_5);
	     $worksheet->write("AE$count}","$field_31",$heading_5);
	     $worksheet->write("AF$count}","$field_32",$heading_5);
	     $worksheet->write("AG$count}","$field_33",$heading_5);
	     $worksheet->write("AH$count}","$field_34",$heading_5);
	     $worksheet->write("AI$count}","$field_35",$heading_5);
	     $worksheet->write("AJ$count}","$field_36",$heading_5);
	     $worksheet->write("AK$count}","$field_37",$heading_5);
	     $worksheet->write("AL$count}","$field_38",$heading_5);
	     $worksheet->write("AM$count}","$field_39",$heading_5);
	     $worksheet->write("AN$count}","$field_40",$heading_5);
	     $worksheet->write("AO$count}","$field_41",$heading_5);
	     $worksheet->write("AP$count}","$field_42",$heading_5);
	     $worksheet->write("AQ$count}","$field_43",$heading_5);
	     $count=$count+1;
	     
	     
	     }
	     
	     elsif ((grep /Total data reduction ratio/, $health_element) && ("$health_or_doc" eq "dedupe")) {
	     ($field1, $field2, $field3, $field4, $field5, $field6, $field7, $field8, $field9, $field_10, $field_11, $field_12, $field_13, $field_14, $field_15, $field_16, $field_17, $field_18, $field_19, $field_20, $field_21, $field_22, $field_23, $field_24, $field_25, $field_26, $field_27, $field_28, $field_29, $field_30, $field_31, $field_32, $field_33, $field_34, $field_35, $field_36, $field_37, $field_38, $field_39, $field_40, $field_41, $field_42, $field_43,) = (split /,/,$health_element)[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42];
	     $worksheet->write("A$count}","$field1",$heading_5);
	     $worksheet->write("B$count}","$field2",$heading_5);
	     $worksheet->write("C$count}","$field3",$heading_5);
	     $worksheet->write("D$count}","$field4",$heading_5);
	     $worksheet->write("E$count}","$field5",$heading_5);
	     $worksheet->write("F$count}","$field6",$heading_5);
	     $worksheet->write("G$count}","$field7",$heading_5);
	     $worksheet->write("H$count}","$field8",$heading_5);
	     $worksheet->write("I$count}","$field9",$heading_5);
	     $worksheet->write("J$count}","$field_10",$heading_5);
	     $worksheet->write("K$count}","$field_11",$heading_5);
	     $worksheet->write("L$count}","$field_12",$heading_5);
	     $worksheet->write("M$count}","$field_13",$heading_5);
	     $worksheet->write("N$count}","$field_14",$heading_5);
	     $worksheet->write("O$count}","$field_15",$heading_5);
	     $worksheet->write("P$count}","$field_16",$heading_5);
	     $worksheet->write("Q$count}","$field_17",$heading_5);
	     $worksheet->write("R$count}","$field_18",$heading_5);
	     $worksheet->write("S$count}","$field_19",$heading_5);
	     $worksheet->write("T$count}","$field_20",$heading_5);
	     $worksheet->write("U$count}","$field_21",$heading_5);
	     $worksheet->write("V$count}","$field_22",$heading_5);
	     $worksheet->write("W$count}","$field_23",$heading_5);
	     $worksheet->write("X$count}","$field_24",$heading_5);
	     $worksheet->write("Y$count}","$field_25",$heading_5);
	     $worksheet->write("Z$count}","$field_26",$heading_5);
	     $worksheet->write("AA$count}","$field_27",$heading_5);
	     $worksheet->write("AB$count}","$field_28",$heading_5);
	     $worksheet->write("AC$count}","$field_29",$heading_5);
	     $worksheet->write("AD$count}","$field_30",$heading_5);
	     $worksheet->write("AE$count}","$field_31",$heading_5);
	     $worksheet->write("AF$count}","$field_32",$heading_5);
	     $worksheet->write("AG$count}","$field_33",$heading_5);
	     $worksheet->write("AH$count}","$field_34",$heading_5);
	     $worksheet->write("AI$count}","$field_35",$heading_5);
	     $worksheet->write("AJ$count}","$field_36",$heading_5);
	     $worksheet->write("AK$count}","$field_37",$heading_5);
	     $worksheet->write("AL$count}","$field_38",$heading_5);
	     $worksheet->write("AM$count}","$field_39",$heading_5);
	     $worksheet->write("AN$count}","$field_40",$heading_5);
	     $worksheet->write("AO$count}","$field_41",$heading_5);
	     $worksheet->write("AP$count}","$field_42",$heading_5);
	     $worksheet->write("AQ$count}","$field_43",$heading_5);
	     $count=$count+1;
	     
	     
	     }
	     else {
	     	#($field1, $field2, $field3, $field4, $field5, $field6, $field7, $field8, $field9, $field_10, $field_11, $field_12, $field_13, $field_14, $field_15, $field_16, $field_17, $field_18, $field_19, $field_20, $field_21, $field_22, $field_23, $field_24, $field_25, $field_26, $field_27, $field_28, $field_29, $field_30, $field_31, $field_32, $field_33, $field_34, $field_35, $field_36, $field_37, $field_38, $field_39, $field_40, $field_41, $field_42,$field_43) = (split /,/,$health_element)[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42];
	     	($field1, $field2, $field3, $field4, $field5, $field6, $field7, $field8, $field9, $field_10, $field_11, $field_12, $field_13, $field_14, $field_15, $field_16, $field_17, $field_18, $field_19, $field_20, $field_21, $field_22, $field_23, $field_24, $field_25, $field_26, $field_27, $field_28, $field_29, $field_30, $field_31, $field_32, $field_33,$field_34, $field_35, $field_36, $field_37, $field_38, $field_39, $field_40, $field_41,$field_42,$field_43,$field_44,$field_45,$field_46,$field_47,$field_48,$field_49,$field_50,$field_51,$field_52,$field_53,$field_54,$field_55,$field_56,$field_57,$field_58,$field_59,$field_60,$field_61,$field_62,$field_63,$field_64,$field_65,$field_66,$field_67,$field_68,$field_69,$field_70,$field_71,$field_72,$field_73,$field_74,$field_75,$field_76,$field_77,$field_78,$field_79,$field_80,$field_81,$field_82,$field_83,$field_84) = (split /,/,$health_element)[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,79,79,80,81,82,83];
	     	if ("$heading_flag" eq "on") {	     
	     $worksheet->write("A$count}","$field1",$text_format);
	     $worksheet->write("B$count}","$field2",$text_format);
	     $worksheet->write("C$count}","$field3",$text_format);
	     $worksheet->write("D$count}","$field4",$text_format);
	     $worksheet->write("E$count}","$field5",$text_format);
	     $worksheet->write("F$count}","$field6",$text_format);
	     $worksheet->write("G$count}","$field7",$text_format);
	     $worksheet->write("H$count}","$field8",$text_format);
	     $worksheet->write("I$count}","$field9",$text_format);
	     $worksheet->write("J$count}","$field_10",$text_format);
	     $worksheet->write("K$count}","$field_11",$text_format);
	     $worksheet->write("L$count}","$field_12",$text_format);
	     $worksheet->write("M$count}","$field_13",$text_format);
	     $worksheet->write("N$count}","$field_14",$text_format);
	     $worksheet->write("O$count}","$field_15",$text_format);
	     $worksheet->write("P$count}","$field_16",$text_format);
	     $worksheet->write("Q$count}","$field_17",$text_format);
	     $worksheet->write("R$count}","$field_18",$text_format);
	     $worksheet->write("S$count}","$field_19",$text_format);
	     $worksheet->write("T$count}","$field_20",$text_format);
	     $worksheet->write("U$count}","$field_21",$text_format);
	     $worksheet->write("V$count}","$field_22",$text_format);
	     $worksheet->write("W$count}","$field_23",$text_format);
	     $worksheet->write("X$count}","$field_24",$text_format);
	     $worksheet->write("Y$count}","$field_25",$text_format);
	     $worksheet->write("Z$count}","$field_26",$text_format);
	     $worksheet->write("AA$count}","$field_27",$text_format);
	     $worksheet->write("AB$count}","$field_28",$text_format);
	     $worksheet->write("AC$count}","$field_29",$text_format);
	     $worksheet->write("AD$count}","$field_30",$text_format);
	     $worksheet->write("AE$count}","$field_31",$text_format);
	     $worksheet->write("AF$count}","$field_32",$text_format);
	     $worksheet->write("AG$count}","$field_33",$text_format);
	     $worksheet->write("AH$count}","$field_34",$text_format);
	     $worksheet->write("AI$count}","$field_35",$text_format);
	     $worksheet->write("AJ$count}","$field_36",$text_format);
	     $worksheet->write("AK$count}","$field_37",$text_format);
	     $worksheet->write("AL$count}","$field_38",$text_format);
	     $worksheet->write("AM$count}","$field_39",$text_format);
	     $worksheet->write("AN$count}","$field_40",$text_format);
	     $worksheet->write("AO$count}","$field_41",$text_format);
	     $worksheet->write("AP$count}","$field_42",$text_format);
	     $worksheet->write("AQ$count}","$field_43",$text_format);
	     $worksheet->write("AR$count}","$field_44",$text_format);
	     $worksheet->write("AS$count}","$field_45",$text_format);
	     $worksheet->write("AT$count}","$field_46",$text_format);
	     $worksheet->write("AU$count}","$field_47",$text_format);
	     $worksheet->write("AV$count}","$field_48",$text_format);
	     $worksheet->write("AW$count}","$field_49",$text_format);
	     $worksheet->write("AX$count}","$field_50",$text_format);
	     $worksheet->write("AY$count}","$field_51",$text_format);
	     $worksheet->write("AZ$count}","$field_52",$text_format);
	     $worksheet->write("BA$count}","$field_53",$text_format);
	     $worksheet->write("BB$count}","$field_54",$text_format);
	     $worksheet->write("BC$count}","$field_55",$text_format);
	     $worksheet->write("BD$count}","$field_56",$text_format);
	     $worksheet->write("BE$count}","$field_57",$text_format);
	     $worksheet->write("BF$count}","$field_58",$text_format);
	     $worksheet->write("BG$count}","$field_59",$text_format);
	     $worksheet->write("BH$count}","$field_60",$text_format);
	     $worksheet->write("BI$count}","$field_61",$text_format);
	     $worksheet->write("BJ$count}","$field_62",$text_format);
	     $worksheet->write("BK$count}","$field_63",$text_format);
	     $worksheet->write("BL$count}","$field_64",$text_format);
	     $worksheet->write("BM$count}","$field_65",$text_format);
	     $worksheet->write("BN$count}","$field_66",$text_format);
	     $worksheet->write("BO$count}","$field_67",$text_format);
	     $worksheet->write("BP$count}","$field_68",$text_format);
	     $worksheet->write("BQ$count}","$field_69",$text_format);
	     $worksheet->write("BR$count}","$field_70",$text_format);
	     $worksheet->write("BS$count}","$field_71",$text_format);
	     $worksheet->write("BT$count}","$field_72",$text_format);
	     $worksheet->write("BU$count}","$field_73",$text_format);
	     $worksheet->write("BV$count}","$field_74",$text_format);
	     $worksheet->write("BW$count}","$field_75",$text_format);
	     $worksheet->write("BX$count}","$field_76",$text_format);
	     $worksheet->write("BY$count}","$field_77",$text_format);
	     $worksheet->write("BZ$count}","$field_78",$text_format);
	     $worksheet->write("CA$count}","$field_79",$text_format);
	     $worksheet->write("CB$count}","$field_80",$text_format);
	     $worksheet->write("CC$count}","$field_81",$text_format);
	     $worksheet->write("CD$count}","$field_82",$text_format);
	     $worksheet->write("CE$count}","$field_83",$text_format);
	     $worksheet->write("CF$count}","$field_84",$text_format);
	     $count=$count+1;
	     $heading_flag="off";                                        
	     } 
		else {
	     $worksheet->write("A$count}","$field1",$normal_text);
	     $worksheet->write("B$count}","$field2",$normal_text);
	     $worksheet->write("C$count}","$field3",$normal_text);
	     $worksheet->write("D$count}","$field4",$normal_text);
	     $worksheet->write("E$count}","$field5",$normal_text);
	     $worksheet->write("F$count}","$field6",$normal_text);
	     $worksheet->write("G$count}","$field7",$normal_text);
	     $worksheet->write("H$count}","$field8",$normal_text);
	     $worksheet->write("I$count}","$field9",$normal_text);
	     $worksheet->write("J$count}","$field_10",$normal_text);
	     $worksheet->write("K$count}","$field_11",$normal_text);
	     $worksheet->write("L$count}","$field_12",$normal_text);
	     $worksheet->write("M$count}","$field_13",$normal_text);
	     $worksheet->write("N$count}","$field_14",$normal_text);
	     $worksheet->write("O$count}","$field_15",$normal_text);
	     $worksheet->write("P$count}","$field_16",$normal_text);
	     $worksheet->write("Q$count}","$field_17",$normal_text);
	     $worksheet->write("R$count}","$field_18",$normal_text);
	     $worksheet->write("S$count}","$field_19",$normal_text);
	     $worksheet->write("T$count}","$field_20",$normal_text);
	     $worksheet->write("U$count}","$field_21",$normal_text);
	     $worksheet->write("V$count}","$field_22",$normal_text);
	     $worksheet->write("W$count}","$field_23",$normal_text);
	     $worksheet->write("X$count}","$field_24",$normal_text);
	     $worksheet->write("Y$count}","$field_25",$normal_text);
	     $worksheet->write("Z$count}","$field_26",$normal_text);
	     $worksheet->write("AA$count}","$field_27",$normal_text);
	     $worksheet->write("AB$count}","$field_28",$normal_text);
	     $worksheet->write("AC$count}","$field_29",$normal_text);
	     $worksheet->write("AD$count}","$field_30",$normal_text);
	     $worksheet->write("AE$count}","$field_31",$normal_text);
	     $worksheet->write("AF$count}","$field_32",$normal_text);
	     $worksheet->write("AG$count}","$field_33",$normal_text);
	     $worksheet->write("AH$count}","$field_34",$normal_text);
	     $worksheet->write("AI$count}","$field_35",$normal_text);
	     $worksheet->write("AJ$count}","$field_36",$normal_text);
	     $worksheet->write("AK$count}","$field_37",$normal_format);
	     $worksheet->write("AL$count}","$field_38",$normal_format);
	     $worksheet->write("AM$count}","$field_39",$normal_format);
	     $worksheet->write("AN$count}","$field_40",$normal_format);
	     $worksheet->write("AO$count}","$field_41",$normal_format);
	     $worksheet->write("AP$count}","$field_42",$normal_format);
	     $worksheet->write("AQ$count}","$field_43",$normal_format);
	     $worksheet->write("AR$count}","$field_44",$normal_format);
	     $worksheet->write("AS$count}","$field_45",$normal_format);
	     $worksheet->write("AT$count}","$field_46",$normal_format);
	     $worksheet->write("AU$count}","$field_47",$normal_format);
	     $worksheet->write("AV$count}","$field_48",$normal_format);
	     $worksheet->write("AW$count}","$field_49",$normal_format);
	     $worksheet->write("AX$count}","$field_50",$normal_format);
	     $worksheet->write("AY$count}","$field_51",$normal_format);
	     $worksheet->write("AZ$count}","$field_52",$normal_format);
	     $worksheet->write("BA$count}","$field_53",$normal_format);
	     $worksheet->write("BB$count}","$field_54",$normal_format);
	     $worksheet->write("BC$count}","$field_55",$normal_format);
	     $worksheet->write("BD$count}","$field_56",$normal_format);
	     $worksheet->write("BE$count}","$field_57",$normal_format);
	     $worksheet->write("BF$count}","$field_58",$normal_format);
	     $worksheet->write("BG$count}","$field_59",$normal_format);
	     $worksheet->write("BH$count}","$field_60",$normal_format);
	     $worksheet->write("BI$count}","$field_61",$normal_format);
	     $worksheet->write("BJ$count}","$field_62",$normal_format);
	     $worksheet->write("BK$count}","$field_63",$normal_format);
	     $worksheet->write("BL$count}","$field_64",$normal_format);
	     $worksheet->write("BM$count}","$field_65",$normal_format);
	     $worksheet->write("BN$count}","$field_66",$normal_format);
	     $worksheet->write("BO$count}","$field_67",$normal_format);
	     $worksheet->write("BP$count}","$field_68",$normal_format);
	     $worksheet->write("BQ$count}","$field_69",$normal_format);
	     $worksheet->write("BR$count}","$field_70",$normal_format);
	     $worksheet->write("BS$count}","$field_71",$normal_format);
	     $worksheet->write("BT$count}","$field_72",$normal_format);
	     $worksheet->write("BU$count}","$field_73",$normal_format);
	     $worksheet->write("BV$count}","$field_74",$normal_format);
	     $worksheet->write("BW$count}","$field_75",$normal_format);
	     $worksheet->write("BX$count}","$field_76",$normal_format);
	     $worksheet->write("BY$count}","$field_77",$normal_format);
	     $worksheet->write("BZ$count}","$field_78",$normal_format);
	     $worksheet->write("CA$count}","$field_79",$normal_format);
	     $worksheet->write("CB$count}","$field_80",$normal_format);
	     $worksheet->write("CC$count}","$field_81",$normal_format);
	     $worksheet->write("CD$count}","$field_82",$normal_format);
	     $worksheet->write("CE$count}","$field_83",$normal_format);
	     $worksheet->write("CF$count}","$field_84",$normal_format);
	     $count=$count+1;
	     }
	    }
	   }
	     #$logo_file="$ENV{PAR_TEMP}\\inc\\inc\\tectrade_logo.jpg";
	     #$worksheet->insert_image('C1', $logo_file, 0, 0, 1, 0.81);
	     
	     close (SPREADSHEET_FILE);
	     $workbook->close();
	     unlink ("${host_directory}/${tsm_server}_$health_or_doc.csv");
	     }
	     
	                                       
###########################################################################
## Subroutine:
## Name: version_5_healthcheck
## Version 5 healthcheck
###########################################################################

sub version_5_healthcheck {
	chdir ${host_directory};
	unlink ("${host_directory}/${tsm_server}_healthcheck.csv");
	@commands = (
	["DATABASE STATS:-","Total Available Space GB,Total Assigned Space GB, PCT UTIL, MAX_PCT_UTIL, Utilised Space GB, Last Backup Date, Cache Hit PCT","\"select avail_space_mb/1024, capacity_mb/1024,pct_utilized, max_pct_utilized, int(((avail_space_mb/1024)*pct_utilized)/100), last_backup_date, cache_hit_pct from db\""],	
	["DB LAST BACKUP:-","Last Backup Date, Backup Running?","\"select LAST_BACKUP_DATE,BACKUP_RUNNING FROM DB \""],
	["DB BACKUPS:-","Date_Time,Type,DB:Volume Name, Backup Series","\"select DATE_TIME,TYPE,VOLUME_NAME,BACKUP_SERIES FROM VOLHISTORY WHERE TYPE = 'BACKUPFULL' ORDER BY 1 DESC\""],               
	["DB CACHE HIT PCT:-","Cache Hit Pct","\"SELECT CACHE_HIT_PCT FROM DB\""],
	["DB VOLUMES:-","Primary,Sync,Secondary,Sync,Tertiary,Sync","\"SELECT DBV.COPY1_NAME, DBV.COPY1_STATUS, DBV.COPY2_NAME, DBV.COPY2_STATUS, DBV.COPY3_NAME, DBV.COPY3_STATUS FROM DBVOLUMES DBV\""],
	["LOG SPACE:-","Available Space GB,PCT UTIL, MAX_PCT_UTIL","\"select avail_space_mb/1024, pct_utilized, max_pct_utilized from log\""],
	["LOG VOLUMES:-","Primary,Sync,Secondary,Sync,Tertiary,Sync","\"SELECT COPY1_NAME, COPY1_STATUS, COPY2_NAME, COPY2_STATUS, COPY3_NAME, COPY3_STATUS FROM LOGVOLUMES\""],
	["ACTLOG RETENTION:-","Retention in Days","\"SELECT ACTLOGRETENTION FROM  STATUS\""],
	["TUNE:-","Commtimeout","\"SELECT * FROM OPTIONS WHERE OPTION_NAME = 'CommTimeOut'\""],
	["TUNE:-","Audit Storage","\"SELECT * FROM OPTIONS WHERE OPTION_NAME = 'AuditStorage'\""],
	["TUNE:-","DisableScheds","\"SELECT * FROM OPTIONS WHERE OPTION_NAME = 'DisableScheds'\""],
	["TUNE:-","Expire Interval","\"SELECT * FROM OPTIONS WHERE OPTION_NAME = 'ExpInterval'\""],
	["TUNE:-","Idle Timeout","\"SELECT * FROM OPTIONS WHERE OPTION_NAME = 'IdleTimeOut'\""],	
	["TUNE:-","TCP Window Size","\"SELECT * FROM OPTIONS WHERE OPTION_NAME = 'TCPWindowsize'\""],
	["TUNE:-","TXN Group Max","\"SELECT option_name, option_value from OPTIONS where option_name='TxnGroupMax'\""],
	["TUNE:-","TXN Move Batch","\"SELECT option_name, option_value from OPTIONS where option_name='MoveBatchSize'\""],
	["STATUS:-","Password Expire Days","\"SELECT PASSEXP FROM STATUS\""],
	["STATUS:-","Min Password Length","\"SELECT MINPWLENGTH FROM STATUS\""],
	["STATUS:-","Client Accounting","\"SELECT ACCOUNTING FROM STATUS\""],
	["STATUS:-","Scheduler Enabled?","\"SELECT SCHEDULER FROM STATUS\""],
	["STATUS:-","Server Version, Release, Level, Sublevel","\"SELECT VERSION, RELEASE, LEVEL, SUBLEVEL FROM STATUS\""],
	["STATUS:-","Availability","\"SELECT AVAILABILITY FROM STATUS \""],
	["LICENSE:-","License Compliance","\"SELECT LICENSECOMPLIANCE FROM STATUS\""],		
	["DISK RANDOM ACCESS VOLUMES:-","Volume Name, Status, Stgpool Name","\"SELECT VOLUME_NAME, STATUS, STGPOOL_NAME FROM VOLUMES WHERE DEVCLASS_NAME = 'DISK' ORDER BY 2\""],
	["VOLUMES (READONLY in LIBRARIES):-","Volume Name,Access,Stgpool Name,Library Name","\"SELECT V.VOLUME_NAME, V.ACCESS, V.STGPOOL_NAME,L.LIBRARY_NAME FROM VOLUMES V, LIBVOLUMES L where L.VOLUME_NAME in (SELECT VOLUME_NAME FROM LIBVOLUMES) AND ACCESS = 'READONLY' AND V.VOLUME_NAME=L.VOLUME_NAME ORDER BY V.VOLUME_NAME\""],
	["VOLUMES (UNAVAILABLE in LIBRARIES):-","Volume Name,Access,Stgpool Name,Library Name","\"SELECT V.VOLUME_NAME, V.ACCESS, V.STGPOOL_NAME,L.LIBRARY_NAME FROM VOLUMES V, LIBVOLUMES L where L.VOLUME_NAME in (SELECT VOLUME_NAME FROM LIBVOLUMES) AND ACCESS = 'UNAVAILABLE' AND V.VOLUME_NAME=L.VOLUME_NAME ORDER BY V.VOLUME_NAME\""],
	["VOLUMES (READONLY / TAPE OR DISK):-","Volume Name,Access,Stgpool Name","\"SELECT VOLUME_NAME, ACCESS, STGPOOL_NAME FROM VOLUMES where ACCESS = 'READONLY' ORDER BY 1\""],
	["VOLUMES (UNAVAILABLE / TAPE OR DISK):-","Volume Name,Access,Stgpool Name","\"SELECT VOLUME_NAME, ACCESS, STGPOOL_NAME FROM VOLUMES WHERE ACCESS = 'UNAVAILABLE' ORDER BY 1\""],
	["VOLUMES (BY STATUS):-","Number of Volumes,Storage Pool,Device Class,Status, Access","\"select count(*), stgpool_name, devclass_name, status, access from volumes group by stgpool_name, devclass_name, status, access order by devclass_name\""],
	["VOLUMES (BY POOL and TYPE):-","Number of Volumes,Storage Pool,Pool Type","\"select count(*), vols.stgpool_name, pool.pooltype FROM volumes vols, stgpools pool where vols.stgpool_name=pool.stgpool_name group by vols.stgpool_name, pool.pooltype order by pool.pooltype desc\""],
	["PRIMARY STGPOOLS:-","Primary Storage Pool, Device Class","\"SELECT STGPOOL_NAME, DEVCLASS from STGPOOLS where POOLTYPE='PRIMARY'\""],
	["COPY STGPOOLS:-","Copy Storage Pool, Device Class","\"SELECT STGPOOL_NAME, DEVCLASS from STGPOOLS where POOLTYPE='COPY'\""],
	["ARE ALL STGPOOLS BEING BACKED UP?:-","Backup STG Process, Number of Backups in 48 hours","\"select entity, count(entity) FROM summary where activity='STGPOOL BACKUP' and START_TIME >= CURRENT_TIMESTAMP-48 HOURS group by entity order by entity asc\""],
	["NON-DISK STGPOOLS:-","Non DISK Poolname,Collocate,Pooltype,Device Class","\"SELECT STGPOOL_NAME, COLLOCATE, POOLTYPE, DEVCLASS FROM STGPOOLS WHERE DEVCLASS != 'DISK' ORDER BY POOLTYPE DESC\""],
	["ALL STGPOOLS:-","Poolname,Max Scratch,Num Scratch Used,Pooltype,Device Class","\"SELECT STGPOOL_NAME, MAXSCRATCH, NUMSCRATCHUSED, POOLTYPE, DEVCLASS FROM STGPOOLS WHERE DEVCLASS != 'DISK'\""],	
	["CLIENT SCHEDULES STATUS 7 DAYS:-","Status,Number in 7 Days","\"select status, count(status) from events where scheduled_start>'2000-01-01 00:00' and (scheduled_start >= current_timestamp-168 hours) and node_name is not null and status!='Pending' group by status\""],
	["CLIENT SCHEDULES FAILED NODES:-","Node Name,Number Failed in 7 Days","\"select NODE_NAME, count(status) from events where scheduled_start>'2000-01-01 00:00' and (scheduled_start >= current_timestamp-168 hours) and node_name is not null and status!='Pending' and status='Failed' group by NODE_NAME, STATUS order by 2 desc\""],
	["CLIENT SCHEDULES MISSED NODES:-","Node Name,Number Missed in 7 Days","\"select NODE_NAME, count(status) from events where scheduled_start>'2000-01-01 00:00' and (scheduled_start >= current_timestamp-168 hours) and node_name is not null and status!='Pending' and status='Missed' group by NODE_NAME, STATUS order by 2 desc\""],
	["CLIENT SCHEDULES NO ASSOCIATIONS:-","Node Name without Association, Contact, Platform, Domain, Nodetype","\"Select node_name, contact, platform_name, domain_name, nodetype from nodes where node_name not in (select node_name from  associations)\""],	
	["VOLHIST:-","Number lines in Volhistory","\"select count(*) from volhistory\""],
	["TAPES - NUMBER OF LIBRARY VOLUMES:-","Library Name, Number of Libray Volumes, Status","\"SELECT library_name, count(*), STATUS FROM LIBVOLUMES GROUP BY library_name, STATUS ORDER BY 1,3 asc\""],
	["TAPES - PRIVATE LIBRARY VOLUME OWNERS:-","Library Name, Volume Owner, Number of owned Library Volumes (not Scratch)","\"SELECT library_name, owner ,count(*) FROM libvolumes WHERE status<>'Scratch' GROUP BY owner, library_name\""],	
	["TAPES - READ AND WRITE ERRORS:-","Volume Name,Stgpool Name,Write Errors,Read Errors,In Error State?","\"SELECT VOLUME_NAME, STGPOOL_NAME, WRITE_ERRORS, READ_ERRORS, ERROR_STATE FROM VOLUMES WHERE DEVCLASS_NAME <> 'DISK' AND (WRITE_ERRORS >= 1 OR READ_ERRORS >=1)\""],
	["RECLAIMED VOLUMES IN 168 HOURS (1 WEEK):-","Start Time,Elapsed Time (D HHMMSS),Activity,Process Number,Storage Pool,Media Wait,Successful","\"SELECT substr(char(start_time),1,19) AS START_TIME,substr(char(end_time - start_time),1,10),activity, number, entity, mediaw, successful FROM summary WHERE activity='RECLAMATION' AND end_time>current_timestamp-168 hours\""],
	["RECLAIM ANALYSIS (PRIMARY/FULL):-","(Primary) Volume Name,Stgpool Name,Status,PCT Reclaim","\"SELECT volume_name, stgpool_name, status, pct_reclaim from volumes where devclass_name !='DISK' and stgpool_name in (select stgpool_name from stgpools where pooltype='PRIMARY') and status='FULL' order by pct_reclaim desc\""],
	["RECLAIM ANALYSIS (PRIMARY/FILLING):-","(Primary) Volume Name,Stgpool Name,Status,PCT Reclaim","\"SELECT volume_name, stgpool_name, status, pct_reclaim from volumes where devclass_name !='DISK' and stgpool_name in (select stgpool_name from stgpools where pooltype='PRIMARY') and status='FILLING' order by pct_reclaim desc\""],
	["RECLAIM ANALYSIS (COPY/FULL and FILLING):-","(Copy) Volume Name,Stgpool Name,Status,PCT Reclaim","\"SELECT volume_name, stgpool_name, status, pct_reclaim from volumes where devclass_name !='DISK' and stgpool_name in (select stgpool_name from stgpools where pooltype='COPY') order by pct_reclaim desc\""],
	["DB EXPIRE DAYS:-","DB Expiry Days","\"select DBBEXPIREDAYS from DRMSTATUS\""],
	["REUSE DELAYS:-","Stgpool Name,Reusedelay,Pooltype,Device Class","\"SELECT STG.STGPOOL_NAME, STG.REUSEDELAY, STG.POOLTYPE, STG.DEVCLASS FROM STGPOOLS STG WHERE STG.DEVCLASS != 'DISK'\""],	
	["LIBRARY SETTINGS:-","Library Name,Autolabel?, Reset Drives?","\"SELECT LIBRARY_NAME, AUTOLABEL, RESETDRIVES FROM LIBRARIES\""],
	["LIBRARY CHECK LABEL:-","DRM Check Label on Eject?","\"SELECT CHECKLABEL FROM DRMSTATUS\""],
	["LIBRARY PATHS ONLINE:-","Source Name,Destination Name,Path Online?,Drive Online?,Device Address","\"SELECT PAT.SOURCE_NAME, PAT.DESTINATION_NAME, PAT.ONLINE, DRI.ONLINE, PAT.DEVICE FROM PATHS PAT, DRIVES DRI WHERE PAT.DESTINATION_NAME=DRI.DRIVE_NAME ORDER BY 1\""],
	["LIBRARY:-","Library Name,Library Type,Shared?,Library Serial Number","\"select library_name, library_type,  shared, library_serial from libraries\""],
	["LIBRARY:-","Drive Name,Drive Serial,Formats Supported","\"select drive_name,drive_serial,read_formats from drives\""],
	["ADMINS:-","Admin Name, System Priv","\"select admin_name, system_priv from admins\""],
	["POLICY:(Invalid Backup Destination):-","Domain Name,Class Name,Ver Exists,Ver Deleted,Retain Extra, Retain Only,Destination Pool","\"select domain_name,class_name,verexists,verdeleted,retextra,retonly,destination from bu_copygroups where destination  not in (select stgpool_name from stgpools) and set_name='ACTIVE'\""],
	["POLICY:(All Backup Copygroups):-","Domain Name,Set Name,Class Name,Ver Exists,Ver Deleted,Retain Extra, Retain Only,Destination Pool","\"select domain_name,set_name,class_name,verexists,verdeleted,retextra,retonly,destination from bu_copygroups where set_name='ACTIVE'\""],
	["POLICY:(Invalid Archive Destination):-","Domain Name,Class Name,Retain Days,Destination Pool","\"select domain_name,class_name,retver,destination from ar_copygroups where destination  not in (select stgpool_name from stgpools) and set_name='ACTIVE'\""],
	["POLICY:(All Archive Copygroups):-","Domain Name,Set Name,Class Name,Retain Days,Destination Pool","\"select domain_name,set_name,class_name,retver,destination from ar_copygroups where set_name='ACTIVE'\""],
	["POLICY:(Still At DEFAULTS?):-","Domain Name,Class Name","\"select domain_name,class_name from bu_copygroups where verexists='2' and verdeleted='1' and retextra='30' and retonly='60' and set_name='ACTIVE'\""],
	["POLICY:(NOLIMIT?):-","Domain Name,Class Name","\"select domain_name,class_name from bu_copygroups where verexists='NOLIMIT' and verdeleted='NOLIMIT' and retextra='NOLIMIT' and retonly='NOLIMIT' and set_name='ACTIVE'\""],	
	["SOFTWARE:(Client):-","Node Name, Version,Release,Level,Sublevel","\"select node_name, client_version, client_release, client_level, client_sublevel from nodes order by 2,3,4,5\""],	
	["MAX SESSIONS:-","Max Sessions","\"SELECT MAXSESSIONS FROM STATUS\""],
	["MAX SCHEDULED SESSIONS:-","Max Scheduled Sessions","\"SELECT MAXSCHEDSESSIONS FROM STATUS\""],
	["NODES DEFINED:-","Total Defined Nodes","\"select count(*) from nodes\""],
	["NODES UNIQUE:-","Total Unique Nodes (by IP address)","\"select count(distinct(TCP_ADDRESS)) from nodes\""],
	["NODES PER DOMAIN:-","Domain Name, Number of Nodes in Domain","\"SELECT domain_name,num_nodes FROM domains\""],
	["NODES PER PLATFORM:-","Platform Name,Number of Nodes","\"SELECT platform_name,COUNT(*) FROM nodes GROUP BY platform_name\""],
	["NODES LOCKED:-","Node Name,Locked?","\"SELECT node_name,locked FROM nodes WHERE locked='YES'\""],
	["POLICY ASSOCIATIONS:-","Domain Name,Schedule,Number of Associations","\"SELECT domain_name, schedule_name, count(*) FROM associations GROUP BY domain_name, schedule_name\""],
	["POLICY BACKUP DESTINATIONS:-","Domain Name,Class Name,Backup Destination Pool","\"SELECT domain_name, class_name, destination FROM bu_copygroups WHERE set_name='ACTIVE'\""],
	["POLICY ARCHIVE DESTINATIONS:-","Domain Name,Class Name,Archive Destination Pool","\"SELECT domain_name, class_name, destination FROM ar_copygroups WHERE set_name='ACTIVE'\""],
	["BACKUP MIN/MAX PER NODE SESSION FROM SUMMARY TABLE:-","Node,MIN GB,MAX GB","\"select entity,int(min(bytes/1024/1024/1024)), int(max(bytes/1024/1024/1024)) from summary where activity='BACKUP' group by entity\""],
	["BACKUP GB IN 7 DAYS:-","TOTAL GB BACKED UP in 7 days","\"SELECT cast(float(sum(bytes))/1024/1024/1024 as dec(8,2)) from summary where activity='BACKUP' and end_time>current_timestamp-168 hours\""],
	["BACKUP GB IN 30 DAYS (PER DAY):-","Date,GB Backed Up","\"select cast(end_time as date), cast(sum(bytes)/1024/1024/1024 as varchar(16)) from summary where start_time>=current_timestamp - 30 day and activity='BACKUP' group by end_time\""],	
	["ARCHIVE MIN/MAX PER NODE SESSION FROM SUMMARY TABLE:-","Node,MIN GB,MAX GB","\"select entity,int(min(bytes/1024/1024/1024)), int(max(bytes/1024/1024/1024)) from summary where activity='ARCHIVE' group by entity\""],
	["ARCHIVE GB IN 7 DAYS:-","TOTAL GB ARCHIVED in 7 days","\"SELECT cast(float(sum(bytes))/1024/1024/1024 as dec(8,2)) from summary where activity='ARCHIVE' and end_time>current_timestamp-168 hours\""],
	["ARCHIVE GB IN 30 DAYS (PER DAY):-","Date,GB Archived","\"select cast(end_time as date), cast(sum(bytes)/1024/1024/1024 as varchar(16)) from summary where start_time>=current_timestamp - 30 day and activity='ARCHIVE' group by end_time\""],	
	["HOUSEKEEPING GB IN 7 DAYS:-","Activity,GB Moved in 7 days","\"SELECT activity, cast(float(sum(bytes))/1024/1024/1024 as dec(8,2)) FROM summary WHERE activity<>'TAPE MOUNT' AND activity<>'EXPIRATION'  AND end_time>current_timestamp-168 hours GROUP BY activity\""],
	["HOUSEKEEPING:-","Start Time,Time Taken in 7 Days,Activity,Entry Number,Volume Name,Media Wait,Success?","\"SELECT substr(char(start_time),1,19),substr(char(end_time - start_time),1,10), activity, number, entity, mediaw, successful FROM summary WHERE activity='RECLAMATION' AND end_time>current_timestamp-168 hours 	\""],
	["BACKUP STGPOOL (VAULTING) (in 72 Hours):-","Backup Stg Action, Number of Files Affected,GB Moved","\"select entity, sum(affected), (sum(bytes)/1024/1024/1024) from summary where activity='STGPOOL BACKUP' and end_time>timestamp(current_date)-(3)days group by entity\""],
	["VOLUMES PER DEVICE CLASS:-","Number of Volumes,Device Class","\"SELECT devclass_name, COUNT(*) FROM volumes GROUP BY devclass_name\""],
	["NODES PER VOLUME:-","Volume Name,Storage Pool Name,Number of Nodes on Volume","\"SELECT volume_name, stgpool_name, COUNT(DISTINCT node_name) FROM volumeusage GROUP BY volume_name, stgpool_name\""],
	["DRM VOLUMES IN LIBRARY:-","DRM Volume Name in LIBRARY, State, Type","\"SELECT volume_name, state, voltype FROM drmedia WHERE volume_name IN ( SELECT volume_name FROM libvolumes ) ORDER BY voltype\""],
	["MIGRATION PROCESSES:-","Start Time, Activity, Storage Pool, Successful","\"SELECT START_TIME, ACTIVITY, ENTITY, SUCCESSFUL  FROM SUMMARY WHERE ACTIVITY = 'MIGRATION' AND SCHEDULE_NAME is NULL ORDER BY 1 DESC\""],
	["MIGRATION AMOUNT PER POOL IN 24 HOURS:-","Activity,Storage Pool, GB Moved","\"SELECT activity, entity, cast(float(sum(bytes))/1024/1024/1024 as dec(8,2)) FROM summary WHERE activity='MIGRATION' AND (START_TIME >= CURRENT_TIMESTAMP-48 HOURS) GROUP BY activity, entity\""],
	["BACKUP BEFORE HOUSEKEEPING:-","Start Time, End Time, Activity","\"SELECT substr(cast(START_TIME as char(29)),12,8),  substr(cast(END_TIME as char(29)),12,8), ACTIVITY, ENTITY FROM SUMMARY WHERE  (ACTIVITY = 'BACKUP' or ACTIVITY = 'STGPOOL BACKUP' or ACTIVITY='MIGRATION' or  ACTIVITY='RECLAMATION') and start_time >= current_timestamp-72 hours\""],
	["ALL HOUSEKEEPING IN 48 HOURS:-","Start Time, End Time, Successful, Activity","\"SELECT SUBSTR(CAST(START_TIME AS CHAR(29)),12,8),  SUBSTR(CAST(END_TIME AS CHAR(29)),12,8), ACTIVITY, ENTITY,  SUCCESSFUL FROM SUMMARY WHERE ACTIVITY in ('EXPIRATION','FULL_DBBACKUP','MIGRATION','OFFSITE  RECLAMATION','RECLAMATION','STGPOOL BACKUP') AND (START_TIME >= CURRENT_TIMESTAMP-48 HOURS)\""],
	["HARDWARE SENSE ERRORS IN 14 DAYS:-","Date, Severity, MSG Number, Message","\"SELECT DATE_TIME, SEVERITY, MSGNO,  MESSAGE FROM ACTLOG WHERE lcase(MESSAGE) like '%sense%' and severity != 'I' and (date_time >=  current_timestamp-336 hours)\""],
	["SEVERE ERRORS:-","Date, Severity, MSG Number, Message","\"SELECT DATE_TIME, SEVERITY, MSGNO,  MESSAGE FROM ACTLOG WHERE SEVERITY='S' and (date_time >= current_timestamp-168 hours)\""],
	["DATA BACKED UP IN 24 HOURS:-","Nodename,GB Transferred, Start Date, Start Time, End Date, End Time","\"SELECT entity ,CAST(sum(bytes/1024/1024/1024) AS decimal(8,2)),SUBSTR (CAST(min (start_time) AS  char(29)),1,10) ,SUBSTR (CAST(min (start_time) AS char(29)),12,8) ,SUBSTR (CAST(max  (end_time) AS char(29)),1,10) ,SUBSTR (CAST(max (end_time) AS char(29)),12,8)  FROM summary  WHERE activity='BACKUP' AND start_time>=current_timestamp - 24 hours GROUP BY entity\""],
	["SUMMARY TABLE 30 DAYS HISTORY:-","ACTIVITY, SUCCESSFUL, COUNT IN 30 DAYS","\"select activity, successful, count(successful) from summary where  start_time>'2000-01-01 00:00' and (start_time >= current_timestamp-720 hours) group by activity, successful order by activity,successful\""],
	["SUMMARY TABLE HOUSEKEEPING FAILURES:-","ACTIVITY, PROCESS, SUCCESSFUL, COUNT IN 30 DAYS","\"select activity, successful, entity, count(successful) from summary where  start_time>'2000-01-01 00:00' and activity != 'BACKUP' and activity != 'RESTORE' and activity != 'ARCHIVE' and activity !='RETRIEVE' and activity !='HSM-MIGRATE' and activity !='RECALL' and successful='NO' and (start_time >= current_timestamp-720 hours) group by activity,entity, successful order by activity,entity, successful\""],
	["NODES STILL IN USE - BY NODE (GB SAVINGS??):-","TSM Nodename, Domain, Days Since Last Access, Days Since First Registered, GB Total Prim+Copy Occupancy","\"select n.node_name,dom.domain_name, (timestampdiff (16,char(current_timestamp-dom.lastacc_time))), (timestampdiff (16,char(current_timestamp-dom.reg_time))), int(sum(n.logical_mb)/1024) from occupancy n, nodes dom where n.node_name=dom.node_name group by  n.node_name,dom.domain_name,(timestampdiff (16,char(current_timestamp-dom.lastacc_time))), (timestampdiff (16,char(current_timestamp-dom.reg_time))) order by 2 desc\""],["NODES LOCKED:-","Node Name,Locked?","\"SELECT node_name,locked FROM nodes WHERE locked='YES'\""],
	["NODES STILL IN USE - BY FILESPACE? (GB SAVINGS??):-","Days Since Last Access, Actual Space Occupied on Disk GB, Space Occupied if UnComp/UnDedup, Filespace Name, Nodename, Stgpool Name, Pooltype","\"select (TIMESTAMPDIFF(16,CHAR(current_timestamp-f.backup_end))),int(o.logical_mb/1024),int(o.reporting_mb/1024),o.filespace_name, o.node_name, o.stgpool_name,p.pooltype from occupancy o, filespaceview f,stgpools p where o.node_name=f.node_name and f.filespace_name=o.filespace_name and o.stgpool_name=p.stgpool_name order by 1 desc\""],
	["NODE FILESPACES TOTAL:-","TOTAL AVAILABLE FILESPACE CAPACITY (GB), TOTAL UTILISED FILESPACE CAPACITY (GB), PCT USED of TOTAL ASSIGNED","\"select sum(int(capacity/1024)),sum(int(capacity/1024/100*pct_util)),((sum((capacity/1024/100*pct_util)))/(sum((capacity/1024)))*100) from filespaces where filespace_type !='VSS' and filespace_type not like'API:%'\""],	
	["NODE FILESPACES INDIVIDUAL:-","NODENAME, DNS NAME, IP ADDRESS, DOMAIN, TOTAL AVAILABLE FILESPACE CAPACITY (GB), TOTAL UTILISED FILESPACE CAPACITY (GB)","\"select n.node_name, n.tcp_name, n.tcp_address, n.domain_name, sum(int(fil.capacity/1024)),sum(int(fil.capacity/1024/100*fil.pct_util)) from filespaces fil, nodes n where fil.filespace_type !='VSS' and fil.filespace_type not like'API:%' and n.node_name=fil.node_name group by n.node_name,n.tcp_name,n.tcp_address, n.domain_name order by n.node_name\""],
	["OCCUPANCY by NODE TOTALS (Primary + Copy):-","Nodename, Domain, Num Files, Physical $TB_TITLE","\"select n.node_name, dom.domain_name, sum(n.num_files), sum(n.logical_mb)/1024/$TB_DIV from occupancy n, nodes dom where n.node_name=dom.node_name group by  n.node_name,dom.domain_name order by 3 desc\""],
	["OCCUPANCY by NODE by POOL:-","Nodename, Domain, Stgpool Name, Num Files, Physical $TB_TITLE","\"select n.node_name, dom.domain_name, n.stgpool_name, sum(n.num_files), sum(n.logical_mb)/1024/$TB_DIV from occupancy n, nodes dom where n.node_name=dom.node_name group by  n.node_name,dom.domain_name,n.stgpool_name order by 1\""],
	["OCCUPANCY by DOMAIN:-","Domain, Num Files, Physical $TB_TITLE","\"select dom.domain_name, sum(n.num_files), sum(n.logical_mb)/1024/$TB_DIV from occupancy n, nodes dom where n.node_name=dom.node_name group by dom.domain_name order by 3 desc\""],	
	["OCCUPANCY by STGPOOL:-","Stgpool, Pool Type, Num Files, Physical $TB_TITLE","\"select n.stgpool_name, stg.pooltype, sum(n.num_files), sum(n.logical_mb)/1024/$TB_DIV from occupancy n, nodes dom, stgpools stg where n.node_name=dom.node_name and n.stgpool_name=stg.stgpool_name group by n.stgpool_name, stg.pooltype order by 3 desc\""],	
	["TOTAL PRIMARY OCCUPANCY:-","Total Primary PHYSICAL $TB_TITLE, Total Primary LOGICAL $TB_TITLE","\"SELECT INT(SUM(PHYSICAL_MB/1024/$TB_DIV)), INT(SUM(LOGICAL_MB/1024/$TB_DIV)) FROM OCCUPANCY WHERE STGPOOL_NAME IN (SELECT STGPOOL_NAME FROM STGPOOLS WHERE POOLTYPE='PRIMARY')\""],
	["TOTAL COPY OCCUPANCY:-","Total Copy PHYSICAL $TB_TITLE, Total Copy LOGICAL $TB_TITLE","\"SELECT INT(SUM(PHYSICAL_MB/1024/$TB_DIV)), INT(SUM(LOGICAL_MB/1024/$TB_DIV)) FROM OCCUPANCY WHERE STGPOOL_NAME IN (SELECT STGPOOL_NAME FROM STGPOOLS WHERE POOLTYPE='COPY')\""],
	["AUDITOCC TOTAL:-","Total Primary Backup $TB_TITLE, Total Copy Backup $TB_TITLE, Total Primary Archive $TB_TITLE, Total Copy Archive $TB_TITLE","\"select sum(backup_mb)/1024/$TB_DIV, sum(backup_copy_mb)/1024/$TB_DIV, sum(archive_mb)/1024/$TB_DIV,  sum(archive_copy_mb)/1024/$TB_DIV from auditocc\""],
	["AUDITOCC by NODE:-","Nodename,Primary Backup $TB_TITLE, Copy Backup $TB_TITLE, Primary Archive $TB_TITLE, Copy Archive $TB_TITLE","\"select node_name, backup_mb/1024/$TB_DIV, backup_copy_mb/1024/$TB_DIV, archive_mb/1024/$TB_DIV,  archive_copy_mb/1024/$TB_DIV from auditocc\""],	
	["ENTITLED OCCUPANCY:-","Primary Pool Occ (TB),(For Cap based Lic)","\" select  trim(leading '0' from char((sum(occupancy.logical_mb)/1048576))) from occupancy where occupancy.node_name is not null and occupancy.filespace_name is not null and occupancy.stgpool_name in ( select stgpools.stgpool_name from stgpools where occupancy.stgpool_name=stgpools.stgpool_name and stgpools.pooltype='PRIMARY') and occupancy.filespace_name not in ('DocAve', 'ADSM.SERVER', '') and occupancy.filespace_id in (select filespaces.filespace_id from filespaces where filespaces.node_name=occupancy.node_name and filespaces.filespace_id=occupancy.filespace_id and (filespaces.filespace_type not in ('API:TSM HSM Client for Windows', 'API:FastBack')))\""],
	["ENTITLED OCCUPANCY:-","Excluded - Copy or ACTIVE (TB),(For Cap based Lic)","\" select trim(trailing ' ' from trim(leading '0' from char((sum(occupancy.logical_mb)/1048576))))||' TB' from occupancy where occupancy.node_name is not null and occupancy.stgpool_name in ( select stgpools.stgpool_name from stgpools where occupancy.stgpool_name=stgpools.stgpool_name and stgpools.pooltype in('COPY', 'ACTIVEDATA'))\""],
	["ENTITLED OCCUPANCY:-","Excluded - Server to Server Virtual Volumes (TB),(For Cap based Lic)","\" select trim(trailing ' ' from trim(leading '0' from char((sum(occupancy.logical_mb)/1048576))))||' TB' from occupancy where occupancy.node_name is not null and occupancy.stgpool_name in ( select stgpools.stgpool_name from stgpools where occupancy.stgpool_name=stgpools.stgpool_name and stgpools.pooltype='PRIMARY') and occupancy.filespace_name in ('ADSM.SERVER')\""],
	["ENTITLED OCCUPANCY:-","Excluded - TSM for Sharepoint (TB),(For Cap based Lic)","\" select trim(trailing ' ' from trim(leading '0' from char((sum(occupancy.logical_mb)/1048576))))||' TB' from occupancy where occupancy.node_name is not null and occupancy.stgpool_name in ( select stgpools.stgpool_name from stgpools where occupancy.stgpool_name=stgpools.stgpool_name and stgpools.pooltype='PRIMARY') and occupancy.filespace_name in ('DocAve')\""],
	["ENTITLED OCCUPANCY:-","Excluded - Fastback Data Replication to TSM (TB),(For Cap based Lic)","\" select trim(trailing ' ' from trim(leading '0' from char((sum(occupancy.logical_mb)/1048576))))||' TB' from occupancy where occupancy.node_name is not null and occupancy.stgpool_name in ( select stgpools.stgpool_name from stgpools where occupancy.stgpool_name=stgpools.stgpool_name and stgpools.pooltype='PRIMARY') and occupancy.filespace_name in (select filespaces.filespace_name from filespaces where filespaces.node_name=occupancy.node_name and filespaces.filespace_id=occupancy.filespace_id and (filespaces.filespace_type in ('API:FastBack')))\""],
	["ENTITLED OCCUPANCY:-","Excluded - TSM for HSM (TB),(For Cap based Lic)","\" select trim(trailing ' ' from trim(leading '0' from char((sum(occupancy.logical_mb)/1048576))))||' TB' from occupancy where occupancy.node_name is not null and occupancy.stgpool_name in ( select stgpools.stgpool_name from stgpools where occupancy.stgpool_name=stgpools.stgpool_name and stgpools.pooltype='PRIMARY') and occupancy.filespace_name in (select filespaces.filespace_name from filespaces where filespaces.node_name=occupancy.node_name and filespaces.filespace_id=occupancy.filespace_id and (filespaces.filespace_type in ('API:TSM HSM Client for Windows')))\""],
	["ENTITLED OCCUPANCY:-","Excluded - Other Deduplicated Data (TB),(For Cap based Lic)","\" select trim(trailing ' ' from trim( leading '0' from char((sum(occupancy.logical_mb)/1048576))))||' TB' from occupancy where occupancy.stgpool_name in ( select stgpools.stgpool_name from stgpools where occupancy.stgpool_name=stgpools.stgpool_name and stgpools.pooltype='PRIMARY') and ( occupancy.node_name is null or occupancy.filespace_name is null )\""],        
        ["FILESPACES NOT BACKED UP:-","Last Backed Up (days ago), Nodename, Filespace Name, Type, FSID","\"SELECT cast((CURRENT_TIMESTAMP-FIL.BACKUP_END)days as decimal(8,0)) AS Days_Since_Backup, FIL.NODE_NAME as Node_Name, N.CONTACT, FIL.FILESPACE_NAME, FIL.FILESPACE_TYPE, FIL.FILESPACE_ID FROM FILESPACES FIL, NODES N WHERE (FIL.BACKUP_END <= CURRENT_TIMESTAMP-24 HOURS) and fil.node_name=n.node_name ORDER BY 1 desc\""],
	["USED SLOTS - NUMBER OF LIBRARY VOLUMES INC SCRATCH:-","Library Name, Number of Library Volumes","\"SELECT library_name, count(*) FROM LIBVOLUMES GROUP BY library_name ORDER BY 1 asc\""],
	);
	$count=0;
	
	while ($commands[$count]){
		open (V5_HEALTHCHECK, ">>${host_directory}/${tsm_server}_healthcheck.csv") or &been_an_error;
		print V5_HEALTHCHECK $commands[$count][0];
		print V5_HEALTHCHECK "\n";
		print V5_HEALTHCHECK $commands[$count][1];
		print V5_HEALTHCHECK "\n";
		close (V5_HEALTHCHECK);
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt $commands[$count][2]  >> ${host_directory}/${tsm_server}_healthcheck.csv");
		print "\r\r\r\r\r\r\r\r\r\r";
		$arraysize=@commands;
		$factor=100/$arraysize;
		$percentage=int($count*$factor);
		print "$percentage";
		print "% complete";
		$count=$count+1;
		}
		print "\r\r\r\r\r\r\r\r\r\r";
		print "100% complete\n";
	open (LIBRARY_NAMES,"<${host_directory}/library_names.txt") or &been_an_error;
	@libraries=<LIBRARY_NAMES>;
	foreach $library_line (@libraries) {
		chomp $library_line;
		open (V5_HEALTHCHECK, ">>${host_directory}/${tsm_server}_healthcheck.csv") or &been_an_error;
		print V5_HEALTHCHECK "Slot Count for library $library_line:-";
		print V5_HEALTHCHECK "\n";
		close (V5_HEALTHCHECK);
		
		#system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt show slots $library_line  >> ${host_directory}/${tsm_server}_healthcheck.csv");
	}
	close (LIBRARY_NAMES);
	} 

###########################################################################
## Subroutine:
## Name: version_6_healthcheck
## Version 6 and above healthcheck
###########################################################################

sub version_6_healthcheck {
	
	chdir ${host_directory};
	unlink ("${host_directory}/${tsm_server}_$health_or_doc.csv");
	@commands = (
	["DB SPACE:-","Location,Total FS Size GB,Total FS Used GB,Total Free Space (usable) GB","\"select location,int(TOTAL_FS_SIZE_MB/1024),INT(USED_FS_SIZE_MB/1024),INT(FREE_SPACE_MB/1024) from dbspace\""],	
	["DB LAST BACKUP:-","Last Backup Date, Backup Running?","\"select LAST_BACKUP_DATE FROM DB \""],
	["DB BACKUPS:-","Date_Time,Type,Volume Name, Backup Series","\"select DATE_TIME,TYPE,VOLUME_NAME,BACKUP_SERIES FROM VOLHISTORY WHERE TYPE = 'BACKUPFULL' ORDER BY 1 DESC\""],               
	["DB BUFFER HIT RATIO:-","Buffer Hit Ratio","\"SELECT BUFF_HIT_RATIO FROM DB\""],
	["LOG SPACE:-","PCT used,Total Space MB, Used Space MB, Active Log Dir, Arch Log Dir","\"select cast((USED_SPACE_MB / decimal(TOTAL_SPACE_MB)*100) as decimal(5,2)),  TOTAL_SPACE_MB, USED_SPACE_MB, ACTIVE_LOG_DIR, ARCH_LOG_DIR from log\""],
	["ACTLOG RETENTION:-","Retention in Days","\"SELECT ACTLOGRETENTION FROM  STATUS\""],
	["TUNE:-","Commtimeout","\"SELECT * FROM OPTIONS WHERE OPTION_NAME = 'CommTimeOut'\""],
	["TUNE:-","Audit Storage","\"SELECT * FROM OPTIONS WHERE OPTION_NAME = 'AuditStorage'\""],
	["TUNE:-","DisableScheds","\"SELECT * FROM OPTIONS WHERE OPTION_NAME = 'DisableScheds'\""],
	["TUNE:-","Expire Interval","\"SELECT * FROM OPTIONS WHERE OPTION_NAME = 'ExpInterval'\""],
	["TUNE:-","Idle Timeout","\"SELECT * FROM OPTIONS WHERE OPTION_NAME = 'IdleTimeOut'\""],	
	["TUNE:-","TCP Window Size","\"SELECT * FROM OPTIONS WHERE OPTION_NAME = 'TCPWindowsize'\""],
	["TUNE:-","TXN Group Max","\"SELECT option_name, option_value from OPTIONS where option_name='TxnGroupMax'\""],
	["TUNE:-","TXN Move Batch","\"SELECT option_name, option_value from OPTIONS where option_name='MoveBatchSize'\""],
	["STATUS:-","Password Expire Days","\"SELECT PASSEXP FROM STATUS\""],
	["STATUS:-","Min Password Length","\"SELECT MINPWLENGTH FROM STATUS\""],
	["STATUS:-","Client Accounting","\"SELECT ACCOUNTING FROM STATUS\""],
	["STATUS:-","Scheduler Enabled?","\"SELECT SCHEDULER FROM STATUS\""],
	["STATUS:-","Server Version, Release, Level, Sublevel","\"SELECT VERSION, RELEASE, LEVEL, SUBLEVEL FROM STATUS\""],
	["STATUS:-","Availability","\"SELECT AVAILABILITY FROM STATUS \""],
	["LICENSE:-","License Compliance","\"SELECT LICENSECOMPLIANCE FROM STATUS\""],		
	["DISK RANDOM ACCESS VOLUMES:-","Volume Name, Status, Stgpool Name","\"SELECT VOLUME_NAME, STATUS, STGPOOL_NAME FROM VOLUMES WHERE DEVCLASS_NAME = 'DISK' ORDER BY 2\""],
	["VOLUMES (READONLY in LIBRARIES):-","Volume Name,Access,Stgpool Name,Library Name","\"SELECT V.VOLUME_NAME, V.ACCESS, V.STGPOOL_NAME,L.LIBRARY_NAME FROM VOLUMES V, LIBVOLUMES L where L.VOLUME_NAME in (SELECT VOLUME_NAME FROM LIBVOLUMES) AND ACCESS = 'READONLY' AND V.VOLUME_NAME=L.VOLUME_NAME ORDER BY V.VOLUME_NAME\""],
	["VOLUMES (UNAVAILABLE in LIBRARIES):-","Volume Name,Access,Stgpool Name,Library Name","\"SELECT V.VOLUME_NAME, V.ACCESS, V.STGPOOL_NAME,L.LIBRARY_NAME FROM VOLUMES V, LIBVOLUMES L where L.VOLUME_NAME in (SELECT VOLUME_NAME FROM LIBVOLUMES) AND ACCESS = 'UNAVAILABLE' AND V.VOLUME_NAME=L.VOLUME_NAME ORDER BY V.VOLUME_NAME\""],
	["VOLUMES (READONLY / TAPE OR DISK):-","Volume Name,Access,Stgpool Name","\"SELECT VOLUME_NAME, ACCESS, STGPOOL_NAME FROM VOLUMES where ACCESS = 'READONLY' ORDER BY 1\""],
	["VOLUMES (UNAVAILABLE / TAPE OR DISK):-","Volume Name,Access,Stgpool Name","\"SELECT VOLUME_NAME, ACCESS, STGPOOL_NAME FROM VOLUMES WHERE ACCESS = 'UNAVAILABLE' ORDER BY 1\""],
	["VOLUMES (BY STATUS):-","Number of Volumes,Storage Pool,Device Class,Status, Access","\"select count(*), stgpool_name, devclass_name, status, access from volumes group by stgpool_name, devclass_name, status, access order by devclass_name\""],
	["VOLUMES (BY POOL and TYPE):-","Number of Volumes,Storage Pool,Pool Type","\"select count(*), vols.stgpool_name, pool.pooltype FROM volumes vols, stgpools pool where vols.stgpool_name=pool.stgpool_name group by vols.stgpool_name, pool.pooltype order by pool.pooltype desc\""],
	["VOLUMES (AVERAGE TAPE UTILISATION):-","Number of Volumes,Storage Pool,Devclass,Average Util (GB)","\"select count, stgpool_name, devclass_name, int(avg (est_capacity_mb)/1024) from volumes where devclass_name in (select devclass_name from devclasses where devtype like '%LTO%' or devtype like '%359%') group by stgpool_name, devclass_name\""],	
	["PRIMARY STGPOOLS:-","Primary Storage Pool, Device Class","\"SELECT STGPOOL_NAME, DEVCLASS from STGPOOLS where POOLTYPE='PRIMARY'\""],
	["COPY STGPOOLS:-","Copy Storage Pool, Device Class","\"SELECT STGPOOL_NAME, DEVCLASS from STGPOOLS where POOLTYPE='COPY'\""],
	["ARE ALL STGPOOLS BEING BACKED UP?:-","Backup STG Process, Number of Backups in 48 hours","\"select entity, count(entity) FROM summary where activity='STGPOOL BACKUP' and START_TIME >= CURRENT_TIMESTAMP-48 HOURS group by entity order by entity asc\""],
	["NON-DISK STGPOOLS:-","Non DISK Poolname,Collocate,Pooltype,Device Class","\"SELECT STGPOOL_NAME, COLLOCATE, POOLTYPE, DEVCLASS FROM STGPOOLS WHERE DEVCLASS != 'DISK' ORDER BY POOLTYPE DESC\""],
	["ALL STGPOOLS:-","Poolname,Max Scratch,Num Scratch Used,Pooltype,Device Class","\"SELECT STGPOOL_NAME, MAXSCRATCH, NUMSCRATCHUSED, POOLTYPE, DEVCLASS FROM STGPOOLS WHERE DEVCLASS != 'DISK'\""],
	["CLIENT SCHEDULES STATUS 7 DAYS:-","Status,Number in 7 Days","\"select status, count(status) from events where scheduled_start>'2000-01-01 00:00' and (scheduled_start >= current_timestamp-168 hours) and node_name is not null and status!='Pending' group by status\""],
	["CLIENT SCHEDULES FAILED NODES:-","Node Name,Number Failed in 7 Days","\"select NODE_NAME, count(status) from events where scheduled_start>'2000-01-01 00:00' and (scheduled_start >= current_timestamp-168 hours) and node_name is not null and status!='Pending' and status='Failed' group by NODE_NAME, STATUS order by 2 desc\""],
	["CLIENT SCHEDULES MISSED NODES:-","Node Name,Number Missed in 7 Days","\"select NODE_NAME, count(status) from events where scheduled_start>'2000-01-01 00:00' and (scheduled_start >= current_timestamp-168 hours) and node_name is not null and status!='Pending' and status='Missed' group by NODE_NAME, STATUS order by 2 desc\""],
	["CLIENT SCHEDULES NO ASSOCIATIONS:-","Node Name without Association, Contact, Platform, Domain, Nodetype","\"Select node_name, contact, platform_name, domain_name, nodetype from nodes where node_name not in (select node_name from  associations)\""],	
	["CLIENTS NOT BACKED UP IN 24 HOURS (BUT HAVE CONTACTED):-","NODENAME, LAST BACKUP DATE","\"SELECT node_name, date(backup_end) from filespaces where int(days(current_timestamp)-days(backup_end))>1 group by node_name, date(backup_end)\""],
	["CLIENTS NOT CONTACTED SERVER (AT ALL):-","NODENAME","\"select node_name from nodes where platform_name is NULL \""],
	["CLIENTS NOT STARTED REPLICATION (BUT HAVE CONTACTED):-","NODENAME","\"select unique(node_name) from filespaces where LAST_REPL_START is NULL \""],
	["CLIENTS NOT COMPLETED REPLICATION (BUT HAVE CONTACTED):-","NODENAME","\"select unique(node_name) from filespaces where LAST_REPL_COMP is NULL \""],	
	["PROTECT STGPOOL TRANSFER STATS (30 DAYS):-","DATE, GB TRANSFERRED, ENTITY","\"select date(end_time) , cast(sum(bytes/(1024*1024*1024)) as decimal(5,4)) , entity from summary where activity='STGPOOL PROTECTION' and days(current_timestamp) - days(end_time)<30 group by date(end_time),entity order by date(end_time) desc\""],	
	["PROTECT STGPOOL (COMPLETED) TRANSFERS:-","Date, Completed Runs, From->To","\"select date(end_time),count(*),entity from summary where activity='STGPOOL PROTECTION' and successful='YES' and days(current_timestamp) - days(end_time) < 30 group by date(end_time), entity order by date(end_time) desc\""],
	["PROTECT STGPOOL (INCOMPLETE) TRANSFERS:-","Date, Incomplete Runs, From->To","\"select date(end_time),count(*),entity from summary where activity='STGPOOL PROTECTION' and successful='NO' and days(current_timestamp) - days(end_time) < 30 group by date(end_time), entity order by date(end_time) desc\""],
	["CONTAINERS: AUTOMATIC CONTAINER DEFRAG IN 31 DAYS:-","Date,Checked,Defrag","\"select date(end_time),sum(examined),sum(affected) from summary where activity='CONTAINER DEFRAGMENTATION' and date(end_time)>=date(current_timestamp - 31 days) group by date(end_time)\""],
	["CONTAINERS: DEDUPE CONTAINERS AVAILABLE (SUMMARY):-","Storage Pool,Dedupe Containers Available,Total GB,Free Space GB","\"select stgpool_name,count(*),cast(sum(total_space_mb)/1024 as decimal(8,2)),cast(sum(FREE_SPACE_MB)/1024 as decimal(8,2)) from containers where state='AVAILABLE' and type='DEDUP' group by stgpool_name\""],
	["CONTAINERS: READONLY or UNAVAILABLE CONTAINERS (summary) :-","Storage Pool,READONLY or UNAVAILABLE containers","\"select stgpool_name,count(*) from containers where state='READONLY' or state='UNAVAILABLE' group by stgpool_name\""],
	["CONTAINERS: READONLY or UNAVAILABLE CONTAINERS (detail):-","STGPOOL,CONTAINER NAME,STATE,TYPE","\"Select stgpool_name, container_name, state, type from containers where state='READONLY' or state='UNAVAILABLE' order by stgpool_name\""],
	["CONTAINERS: PENDING CONTAINERS:-","Storage Pool,Pending Containers,Free Space GB","\"Select stgpool_name,count(*),cast(sum(free_space_mb)/1024 as decimal(8,2)) from containers where state='PENDING' group by stgpool_name\""],
	["LINES IN VOLHISTORY:-","Number lines in Volhistory","\"select count(*) from volhistory\""],
	["TAPES - NUMBER OF LIBRARY VOLUMES:-","Library Name, Number of Libray Volumes, Status","\"SELECT library_name, count(*), STATUS FROM LIBVOLUMES GROUP BY library_name, STATUS ORDER BY 1,3 asc\""],
	["TAPES - PRIVATE LIBRARY VOLUME OWNERS:-","Library Name, Volume Owner, Number of owned Library Volumes (not Scratch)","\"SELECT library_name, owner ,count(*) FROM libvolumes WHERE status<>'Scratch' GROUP BY owner, library_name\""],	
	["TAPES - READ AND WRITE ERRORS:-","Volume Name,Stgpool Name,Write Errors,Read Errors,In Error State?","\"SELECT VOLUME_NAME, STGPOOL_NAME, WRITE_ERRORS, READ_ERRORS, ERROR_STATE FROM VOLUMES WHERE DEVCLASS_NAME <> 'DISK' AND (WRITE_ERRORS >= 1 OR READ_ERRORS >=1)\""],
	["RECLAIMED VOLUMES IN 168 HOURS (1 WEEK):-","Start Time,Elapsed Time (D HHMMSS),Activity,Process Number,Storage Pool,Media Wait,Successful","\"SELECT TO_CHAR(CHAR(start_time),'YYYY-MM-DD HH24:MI:SS'),TRANSLATE('a bc:de:fg', DIGITS(end_time-start_time), '_______abcdefgh_____',' '), activity, number, entity, mediaw, successful FROM summary WHERE activity='RECLAMATION' AND end_time>current_timestamp-168 hours\""],
	["RECLAIM ANALYSIS (PRIMARY/FULL):-","(Primary) Volume Name,Stgpool Name,Status,PCT Reclaim","\"SELECT volume_name, stgpool_name, status, pct_reclaim from volumes where devclass_name !='DISK' and stgpool_name in (select stgpool_name from stgpools where pooltype='PRIMARY') and status='FULL' order by pct_reclaim desc\""],
	["RECLAIM ANALYSIS (PRIMARY/FILLING):-","(Primary) Volume Name,Stgpool Name,Status,PCT Reclaim","\"SELECT volume_name, stgpool_name, status, pct_reclaim from volumes where devclass_name !='DISK' and stgpool_name in (select stgpool_name from stgpools where pooltype='PRIMARY') and status='FILLING' order by pct_reclaim desc\""],
	["RECLAIM ANALYSIS (COPY/FULL and FILLING):-","(Copy) Volume Name,Stgpool Name,Status,PCT Reclaim","\"SELECT volume_name, stgpool_name, status, pct_reclaim from volumes where devclass_name !='DISK' and stgpool_name in (select stgpool_name from stgpools where pooltype='COPY') order by pct_reclaim desc\""],
	["DB EXPIRE DAYS:-","DB Expiry Days","\"select DBBEXPIREDAYS from DRMSTATUS\""],
	["REUSE DELAYS:-","Stgpool Name,Reusedelay,Pooltype,Device Class","\"SELECT STG.STGPOOL_NAME, STG.REUSEDELAY, STG.POOLTYPE, STG.DEVCLASS FROM STGPOOLS STG WHERE STG.DEVCLASS != 'DISK'\""],	
	["LIBRARY SETTINGS:-","Library Name,Autolabel?, Reset Drives?","\"SELECT LIBRARY_NAME, AUTOLABEL, RESETDRIVES FROM LIBRARIES\""],
	["LIBRARY CHECK LABEL:-","DRM Check Label on Eject?","\"SELECT CHECKLABEL FROM DRMSTATUS\""],
	["LIBRARY PATHS ONLINE:-","Source Name,Destination Name,Path Online?,Drive Online?,Device Address","\"SELECT PAT.SOURCE_NAME, PAT.DESTINATION_NAME, PAT.ONLINE, DRI.ONLINE, PAT.DEVICE FROM PATHS PAT, DRIVES DRI WHERE PAT.DESTINATION_NAME=DRI.DRIVE_NAME ORDER BY 1\""],
	["LIBRARY:-","Library Name,Library Type,Shared?,Library Serial Number","\"select library_name, library_type,  shared, library_serial from libraries\""],
	["LIBRARY:-","Drive Name,Drive Serial,Formats Supported","\"select drive_name,drive_serial,read_formats from drives\""],
	["ADMINS:-","Admin Name, System Priv","\"select admin_name, system_priv from admins\""],
	["POLICY:(Invalid Backup Destination):-","Domain Name,Class Name,Ver Exists,Ver Deleted,Retain Extra, Retain Only,Destination Pool","\"select domain_name,class_name,verexists,verdeleted,retextra,retonly,destination from bu_copygroups where destination  not in (select stgpool_name from stgpools) and set_name='ACTIVE'\""],
	["POLICY:(All Backup Copygroups):-","Domain Name,Set Name,Class Name,Ver Exists,Ver Deleted,Retain Extra, Retain Only,Destination Pool","\"select domain_name,set_name,class_name,verexists,verdeleted,retextra,retonly,destination from bu_copygroups where set_name='ACTIVE'\""],
	["POLICY:(Invalid Archive Destination):-","Domain Name,Class Name,Retain Days,Destination Pool","\"select domain_name,class_name,retver,destination from ar_copygroups where destination  not in (select stgpool_name from stgpools) and set_name='ACTIVE'\""],
	["POLICY:(All Archive Copygroups):-","Domain Name,Set Name,Class Name,Retain Days,Destination Pool","\"select domain_name,set_name,class_name,retver,destination from ar_copygroups where set_name='ACTIVE'\""],
	["POLICY:(Still At DEFAULTS?):-","Domain Name,Class Name","\"select domain_name,class_name from bu_copygroups where verexists='2' and verdeleted='1' and retextra='30' and retonly='60' and set_name='ACTIVE'\""],
	["POLICY:(NOLIMIT?):-","Domain Name,Class Name","\"select domain_name,class_name from bu_copygroups where verexists='NOLIMIT' and verdeleted='NOLIMIT' and retextra='NOLIMIT' and retonly='NOLIMIT' and set_name='ACTIVE'\""],	
	["SOFTWARE:(Client):-","Node Name, Version,Release,Level,Sublevel","\"select node_name, client_version, client_release, client_level, client_sublevel from nodes order by 2,3,4,5\""],	
	["MAX SESSIONS:-","Max Sessions","\"SELECT MAXSESSIONS FROM STATUS\""],
	["MAX SCHEDULED SESSIONS:-","Max Scheduled Sessions","\"SELECT MAXSCHEDSESSIONS FROM STATUS\""],
	["TSM FOR VE BACKUPS (Last 7 Days):-","VM Name,Date of Backup","\"select substr(char(filespace_name),9),date(backup_date) from backups where filespace_name like '%VMFULL%' and ll_name not like '%.CTL%' group by filespace_name, date(backup_date) and START_TIME>current_timestamp - 168 hours order by filespace_name\""],
	["TSM for VE Backups (SUCCESSFUL) in 7 DAYS:-","DataCenter/Proxy,VM Name,Activity,Times SUCCESSFUL in 7 Days,Total GB Moved in 7 Days","\"select ENTITY,SUB_ENTITY,ACTIVITY_TYPE,count(SUCCESSFUL),sum(BYTES/1024/1024/1024) from SUMMARY_EXTENDED where SUCCESSFUL='YES' and START_TIME>current_timestamp - 168 hours AND SUB_ENTITY IS NOT NULL group by ENTITY,SUB_ENTITY,ACTIVITY_TYPE\""],
	["TSM for VE Backups (FAILED) in 7 DAYS:-","DataCenter/Proxy,VM Name,Activity,Times FAILED in 7 Days,Total GB Moved in 7 Days","\"select ENTITY,SUB_ENTITY,ACTIVITY_TYPE,count(SUCCESSFUL),sum(BYTES/1024/1024/1024) from SUMMARY_EXTENDED where SUCCESSFUL='NO' and START_TIME>current_timestamp - 168 hours AND SUB_ENTITY IS NOT NULL group by ENTITY,SUB_ENTITY,ACTIVITY_TYPE\""],
	["TSM for VE Backups (NEW QUERY - Last 7 Days) :-","DATE,TIME,ACTIVITY,SUCCESSFUL,SCHEDULE,ACTIVITY TYPE,DATA MOVER,DATA CENTER,VM NAME","\"SELECT date(start_time),time(start_time),activity,successful,schedule_name,activity_type,ENTITY,as_entity,SUB_ENTITY FROM SUMMARY_EXTENDED WHERE ENTITY LIKE '%DM%' and activity_type like '%Incremental%' and START_TIME>current_timestamp - 168 hours order by 2,1\""],	
	["NODES DEFINED:-","Total Defined Nodes","\"select count(*) from nodes\""],
	["NODES UNIQUE:-","Total Unique Nodes (by IP address)","\"select count(unique(TCP_ADDRESS)) from nodes\""],
	["NODES PVU:-","PRODUCT,LICENSE_NAME,NODE_NAME,LAST_USED,TRYBUY,PROC_VENDOR,PROC_BRAND,PROC_TYPE,PROC_MODEL,PROC_COUNT,ROLE,ROLE_OVERRIDE,ROLE_EFFECTIVE,VALUE_UNITS,VALUE_FROM_TABLE,PVU,SCAN_ERROR,API_CLIENT,PVU_AGNOSTIC,HYPERVISOR,GUID,VERSION,RELEASE,LEVEL,VENDOR_D,BRAND_D,TYPE_D,MODEL_D,PRODUCT_D","\"select PRODUCT,LICENSE_NAME,NODE_NAME,LAST_USED,TRYBUY,PROC_VENDOR,PROC_BRAND,PROC_TYPE,PROC_MODEL,PROC_COUNT,ROLE,ROLE_OVERRIDE,ROLE_EFFECTIVE,VALUE_UNITS,VALUE_FROM_TABLE,PVU,SCAN_ERROR,API_CLIENT,PVU_AGNOSTIC,HYPERVISOR,GUID,VERSION,RELEASE,LEVEL,VENDOR_D,BRAND_D,TYPE_D,MODEL_D,PRODUCT_D from PVUESTIMATE_DETAILS\""],
	["NODES PER DOMAIN:-","Domain Name, Number of Nodes in Domain","\"SELECT domain_name,num_nodes FROM domains\""],
	["NODES PER PLATFORM:-","Platform Name,Number of Nodes","\"SELECT platform_name,COUNT(*) FROM nodes GROUP BY platform_name\""],
	["NODES LOCKED:-","Node Name,Locked?","\"SELECT node_name,locked FROM nodes WHERE locked='YES'\""],
	["POLICY ASSOCIATIONS:-","Domain Name,Schedule,Number of Associations","\"SELECT domain_name, schedule_name, count(*) FROM associations GROUP BY domain_name, schedule_name\""],
	["POLICY BACKUP DESTINATIONS:-","Domain Name,Class Name,Backup Destination Pool","\"SELECT domain_name, class_name, destination FROM bu_copygroups WHERE set_name='ACTIVE'\""],
	["POLICY ARCHIVE DESTINATIONS:-","Domain Name,Class Name,Archive Destination Pool","\"SELECT domain_name, class_name, destination FROM ar_copygroups WHERE set_name='ACTIVE'\""],
	["NOT BACKED UP IN 24 HOURS (BUT HAVE CONTACTED):-","NODENAME, LAST BACKUP DATE","\"SELECT node_name, date(backup_end) from filespaces where int(days(current_timestamp)-days(backup_end))>1 group by node_name, date(backup_end)\""],
	["NOT CONTACTED SERVER (AT ALL):-","NODENAME","\"select node_name from nodes where platform_name is NULL \""],
	["NOT STARTED REPLICATION (BUT HAVE CONTACTED):-","NODENAME","\"select unique(node_name) from filespaces where LAST_REPL_START is NULL \""],
	["NOT COMPLETED REPLICATION (BUT HAVE CONTACTED):-","NODENAME","\"select unique(node_name) from filespaces where LAST_REPL_COMP is NULL \""],	
	["BACKUP MIN/MAX PER NODE SESSION FROM SUMMARY TABLE (Last 7 Days):-","Node,MIN GB,MAX GB","\"select entity,int(min(bytes/1024/1024/1024)), int(max(bytes/1024/1024/1024)) from summary where activity='BACKUP' and START_TIME>current_timestamp - 168 hours  group by entity\""],
	["BACKUP GB IN 7 DAYS:-","TOTAL GB BACKED UP in 7 days","\"SELECT cast(float(sum(bytes))/1024/1024/1024 as dec(8,2)) from summary where activity='BACKUP' and end_time>current_timestamp-168 hours\""],
	["BACKUP GB IN 30 DAYS (PER DAY):-","Date,GB Backed Up","\"select date(end_time), cast(sum(bytes)/1024/1024/1024 as varchar(16)) from summary where start_time>=current_timestamp - 30 day and activity='BACKUP' group by date(end_time)\""],
	["ARCHIVE MIN/MAX PER NODE SESSION FROM SUMMARY TABLE:-","Node,MIN GB,MAX GB","\"select entity,int(min(bytes/1024/1024/1024)), int(max(bytes/1024/1024/1024)) from summary where activity='ARCHIVE' group by entity\""],
	["ARCHIVE GB IN 7 DAYS:-","TOTAL GB ARCHIVED in 7 days","\"SELECT cast(float(sum(bytes))/1024/1024/1024 as dec(8,2)) from summary where activity='ARCHIVE' and end_time>current_timestamp-168 hours\""],	
	["ARCHIVE GB IN 30 DAYS (PER DAY):-","Date,GB Archived","\"select date(end_time), cast(sum(bytes)/1024/1024/1024 as varchar(16)) from summary where start_time>=current_timestamp - 30 day and activity='ARCHIVE' group by date(end_time)\""],
	["HOUSEKEEPING GB IN 7 DAYS:-","Activity,GB Moved in 7 days","\"SELECT activity, cast(float(sum(bytes))/1024/1024/1024 as dec(8,2)) FROM summary WHERE activity<>'TAPE MOUNT' AND activity<>'EXPIRATION'  AND end_time>current_timestamp-168 hours GROUP BY activity\""],
	["HOUSEKEEPING:-","Start Time,Tme Taken in 7 Days,Activity,Entry Number,Volume Name,Media Wait,Success?","\"SELECT substr(char(start_time),1,19),substr(char(end_time - start_time),1,10), activity, number, entity, mediaw, successful FROM summary WHERE activity='RECLAMATION' AND end_time>current_timestamp-168 hours 	\""],
	["BACKUP STGPOOL (VAULTING) (in 72 Hours):-","Backup Stg Action, Number of Files Affected,GB Moved","\"select entity, sum(affected), (sum(bytes)/1024/1024/1024) from summary where activity='STGPOOL BACKUP' and end_time>timestamp(current_date)-(3)days group by entity\""],
	["VOLUMES PER DEVICE CLASS:-","Number of Volumes,Device Class","\"SELECT devclass_name, COUNT(*) FROM volumes GROUP BY devclass_name\""],
	["NODES PER VOLUME:-","Volume Name,Storage Pool Name,Number of Nodes on Volume","\"SELECT volume_name, stgpool_name, COUNT(DISTINCT node_name) FROM volumeusage GROUP BY volume_name, stgpool_name\""],
	["DRM VOLUMES IN LIBRARY:-","DRM Volume Name in LIBRARY, State, Type","\"SELECT volume_name, state, voltype FROM drmedia WHERE volume_name IN ( SELECT volume_name FROM libvolumes ) ORDER BY voltype\""],
	["MIGRATION PROCESSES (7 days):-","Start Time, Activity, Storage Pool, Successful","\"SELECT START_TIME, ACTIVITY, ENTITY, SUCCESSFUL  FROM SUMMARY WHERE ACTIVITY = 'MIGRATION' AND SCHEDULE_NAME is NULL and START_TIME>current_timestamp - 168 hours ORDER BY 1 DESC\""],
	["MIGRATION AMOUNT PER POOL IN 24 HOURS:-","Activity,Storage Pool, GB Moved","\"SELECT activity, entity, cast(float(sum(bytes))/1024/1024/1024 as dec(8,2)) FROM summary WHERE activity='MIGRATION' AND start_time>current_timestamp-24 hours GROUP BY activity, entity\""],
	["BACKUP BEFORE HOUSEKEEPING:-","Start Time, End Time, Activity","\"SELECT substr(cast(START_TIME as char(29)),12,8),  substr(cast(END_TIME as char(29)),12,8), ACTIVITY, ENTITY FROM SUMMARY WHERE  (ACTIVITY = 'BACKUP' or ACTIVITY = 'STGPOOL BACKUP' or ACTIVITY='MIGRATION' or  ACTIVITY='RECLAMATION') and start_time >= current_timestamp-72 hours\""],
	["ALL HOUSEKEEPING IN 48 HOURS:-","Start Time, End Time, Successful, Activity","\"SELECT SUBSTR(CAST(START_TIME AS CHAR(29)),12,8),  SUBSTR(CAST(END_TIME AS CHAR(29)),12,8), ACTIVITY, ENTITY,  SUCCESSFUL FROM SUMMARY WHERE ACTIVITY in ('EXPIRATION','FULL_DBBACKUP','MIGRATION','OFFSITE  RECLAMATION','RECLAMATION','STGPOOL BACKUP') AND (START_TIME >= CURRENT_TIMESTAMP-48 HOURS)\""],
	["HARDWARE SENSE ERRORS IN 14 DAYS:-","Date, Severity, MSG Number, Message","\"SELECT DATE_TIME, SEVERITY, MSGNO,  MESSAGE FROM ACTLOG WHERE lcase(MESSAGE) like '%sense%' and severity != 'I' and (date_time >=  current_timestamp-336 hours)\""],
	["SEVERE ERRORS:-","Date, Severity, MSG Number, Message","\"SELECT DATE_TIME, SEVERITY, MSGNO,  MESSAGE FROM ACTLOG WHERE SEVERITY='S' and (date_time >= current_timestamp-168 hours)\""],
	["DATA BACKED UP IN 24 HOURS:-","Nodename,GB Transferred, Start Date, Start Time, End Date, End Time","\"SELECT entity ,CAST(sum(bytes/1024/1024/1024) AS decimal(8,2)),SUBSTR (CAST(min (start_time) AS  char(29)),1,10) ,SUBSTR (CAST(min (start_time) AS char(29)),12,8) ,SUBSTR (CAST(max  (end_time) AS char(29)),1,10) ,SUBSTR (CAST(max (end_time) AS char(29)),12,8)  FROM summary  WHERE activity='BACKUP' AND start_time>=current_timestamp - 24 hours GROUP BY entity\""],
	["NODES STILL IN USE - BY NODE (GB SAVINGS??):-","TSM Nodename, Domain, Days Since Last Access, Days Since First Registered, GB Total Prim+Copy Occupancy","\"select n.node_name,dom.domain_name, (timestampdiff (16,char(current_timestamp-dom.lastacc_time))), (timestampdiff (16,char(current_timestamp-dom.reg_time))), int(sum(n.logical_mb)/1024) from occupancy n, nodes dom where n.node_name=dom.node_name group by  n.node_name,dom.domain_name,(timestampdiff (16,char(current_timestamp-dom.lastacc_time))), (timestampdiff (16,char(current_timestamp-dom.reg_time))) order by 2 desc\""],
	["NODES STILL IN USE - BY FILESPACE? (GB SAVINGS??):-","Days Since Last Access, Actual Space Occupied on Disk GB, Space Occupied if UnComp/UnDedup, Filespace Name, Nodename, Stgpool Name, Pooltype","\"select (TIMESTAMPDIFF(16,CHAR(current_timestamp-f.backup_end))),int(o.logical_mb/1024),int(o.reporting_mb/1024),o.filespace_name, o.node_name, o.stgpool_name,p.pooltype from occupancy o, filespaceview f,stgpools p where o.node_name=f.node_name and f.filespace_name=o.filespace_name and o.stgpool_name=p.stgpool_name order by 1 desc\""],
	["SUMMARY TABLE 30 DAYS HISTORY:-","ACTIVITY, SUCCESSFUL, COUNT IN 30 DAYS","\"select activity, successful, count(successful) from summary where  start_time>'2000-01-01 00:00' and (start_time >= current_timestamp-720 hours) group by activity, successful order by activity,successful\""],
	["SUMMARY TABLE HOUSEKEEPING FAILURES:-","ACTIVITY, PROCESS, SUCCESSFUL, COUNT IN 30 DAYS","\"select activity, successful, entity, count(successful) from summary where  start_time>'2000-01-01 00:00' and activity != 'BACKUP' and activity != 'RESTORE' and activity != 'ARCHIVE' and activity !='RETRIEVE' and activity !='HSM-MIGRATE' and activity !='RECALL' and successful='NO' and (start_time >= current_timestamp-720 hours) group by activity,entity, successful order by activity,entity, successful\""],
	["NODE FILESPACES TOTAL:-","TOTAL AVAILABLE FILESPACE CAPACITY (GB), TOTAL UTILISED FILESPACE CAPACITY (GB), PCT USED of TOTAL ASSIGNED","\"select sum(int(capacity/1024)),sum(int(capacity/1024/100*pct_util)),((sum((capacity/1024/100*pct_util)))/(sum((capacity/1024)))*100) from filespaces where filespace_type !='VSS' and filespace_type not like'API:%'\""],	
	["NODE FILESPACES INDIVIDUAL:-","NODENAME, DNS NAME, IP ADDRESS, DOMAIN, TOTAL AVAILABLE FILESPACE CAPACITY (GB), TOTAL UTILISED FILESPACE CAPACITY (GB), DECOMM_STATE","\"select n.node_name, n.tcp_name, n.tcp_address, n.domain_name, sum(int(fil.capacity/1024)),sum(int(fil.capacity/1024/100*fil.pct_util)),fil.DECOMM_STATE from filespaces fil, nodes n where fil.filespace_type !='VSS' and fil.filespace_type not like'API:%' and n.node_name=fil.node_name group by n.node_name,n.tcp_name,n.tcp_address, n.domain_name order by n.node_name\""],
	["DECOMMISSIONED FILESPACES:-","NODENAME, DNS NAME, IP ADDRESS, DOMAIN, TOTAL AVAILABLE FILESPACE CAPACITY (GB), TOTAL UTILISED FILESPACE CAPACITY (GB), DECOMM_STATE","\"select n.node_name, n.tcp_name, n.tcp_address, n.domain_name, sum(int(fil.capacity/1024)),sum(int(fil.capacity/1024/100*fil.pct_util)),fil.DECOMM_STATE from filespaces fil, nodes n where fil.filespace_type !='VSS' and fil.filespace_type not like'API:%' and fil.DECOMM_STATE='YES' and n.node_name=fil.node_name group by n.node_name,n.tcp_name,n.tcp_address, n.domain_name order by n.node_name\""],
	["OCCUPANCY by NODE TOTALS (Primary + Copy):-","Nodename, Domain, Num Files, Physical $TB_TITLE","\"select n.node_name, dom.domain_name, sum(n.num_files), sum(n.logical_mb)/1024/$TB_DIV from occupancy n, nodes dom where n.node_name=dom.node_name group by  n.node_name,dom.domain_name order by 3 desc\""],
	["OCCUPANCY by NODE by POOL:-","Nodename, Domain, Stgpool Name, Num Files, Physical $TB_TITLE","\"select n.node_name, dom.domain_name, n.stgpool_name, sum(n.num_files), sum(n.logical_mb)/1024/$TB_DIV from occupancy n, nodes dom where n.node_name=dom.node_name group by  n.node_name,dom.domain_name,n.stgpool_name order by 1\""],
	["OCCUPANCY by DOMAIN:-","Domain, Num Files, Physical $TB_TITLE","\"select dom.domain_name, sum(n.num_files), sum(n.logical_mb)/1024/$TB_DIV from occupancy n, nodes dom where n.node_name=dom.node_name group by dom.domain_name order by 3 desc\""],	
	["OCCUPANCY by STGPOOL:-","Stgpool, Pool Type,Num Files, Physical $TB_TITLE","\"select n.stgpool_name, stg.pooltype, sum(n.num_files), sum(n.logical_mb)/1024/$TB_DIV from occupancy n, nodes dom, stgpools stg where n.node_name=dom.node_name and n.stgpool_name=stg.stgpool_name group by n.stgpool_name, stg.pooltype order by 3 desc\""],	
	["TOTAL PRIMARY OCCUPANCY:-","Total Primary PHYSICAL $TB_TITLE, Total Primary LOGICAL $TB_TITLE, Total Primary REPORTING $TB_TITLE","\"SELECT INT(SUM(PHYSICAL_MB/1024/$TB_DIV)), INT(SUM(LOGICAL_MB/1024/$TB_DIV)), INT(SUM(REPORTING_MB/1024/$TB_DIV)) FROM OCCUPANCY WHERE STGPOOL_NAME IN (SELECT STGPOOL_NAME FROM STGPOOLS WHERE POOLTYPE='PRIMARY') and NODE_NAME is not NULL\""],
	["TOTAL COPY OCCUPANCY:-","Total Copy PHYSICAL $TB_TITLE, Total Copy LOGICAL $TB_TITLE, Total Copy REPORTING $TB_TITLE","\"SELECT INT(SUM(PHYSICAL_MB/1024/$TB_DIV)), INT(SUM(LOGICAL_MB/1024/$TB_DIV)), INT(SUM(REPORTING_MB/1024/$TB_DIV)) FROM OCCUPANCY WHERE STGPOOL_NAME IN (SELECT STGPOOL_NAME FROM STGPOOLS WHERE POOLTYPE='COPY')\""],
	["AUDITOCC TOTAL:-","Total Primary Backup $TB_TITLE, Total Copy Backup $TB_TITLE, Total Primary Archive $TB_TITLE, Total Copy Archive $TB_TITLE","\"select sum(backup_mb)/1024/$TB_DIV, sum(backup_copy_mb)/1024/$TB_DIV, sum(archive_mb)/1024/$TB_DIV,  sum(archive_copy_mb)/1024/$TB_DIV from auditocc\""],
	["AUDITOCC by NODE:-","Nodename,Primary Backup $TB_TITLE, Copy Backup $TB_TITLE, Primary Archive $TB_TITLE, Copy Archive $TB_TITLE","\"select node_name, backup_mb/1024/$TB_DIV, backup_copy_mb/1024/$TB_DIV, archive_mb/1024/$TB_DIV,  archive_copy_mb/1024/$TB_DIV from auditocc\""],
	["ENTITLED OCCUPANCY:-","Primary Pool Occ (TB),(For Cap based Lic)","\"select strip(char((sum(o.logical_mb)/1048576)), leading, '0') from occupancy o where o.node_name is not null and o.filespace_name is not null and o.stgpool_name in ( select s.stgpool_name from stgpools s where o.stgpool_name=s.stgpool_name and s.pooltype='PRIMARY') and o.filespace_name not in ('DocAve', 'ADSM.SERVER', '') and o.filespace_id in (select f.filespace_id from filespaces f where f.filespace_id=o.filespace_id and (f.filespace_type not in ('API:TSM HSM Client for Windows', 'API:FastBack')))\""],
	["ENTITLED OCCUPANCY:-","Deduplication Saving (TB),(For Cap based Lic)","\" select strip(char(((sum(o.reporting_mb)-sum(o.logical_mb))/1048576)), leading, '0') from occupancy o where o.node_name is not null and o.filespace_name is not null and o.stgpool_name in ( select s.stgpool_name from stgpools s where o.stgpool_name=s.stgpool_name and s.pooltype='PRIMARY') and o.filespace_name not in ('DocAve', 'ADSM.SERVER', '') and o.filespace_name in (select f.filespace_name from filespaces f where f.node_name=o.node_name and f.filespace_id=o.filespace_id and (f.filespace_type not in ('API:TSM HSM Client for Windows', 'API:FastBack')))\""],
	["ENTITLED OCCUPANCY:-","Excluded - Copy or ACTIVE (TB),(For Cap based Lic)","\" select trim( trailing ' ' from strip(char(sum(o.logical_mb)/1048576),leading,'0'))||' TB' from occupancy o where o.node_name is not null and o.filespace_name is not null and o.stgpool_name in ( select s.stgpool_name from stgpools s where o.stgpool_name=s.stgpool_name and s.pooltype in('COPY', 'ACTIVEDATA'))\""],
	["ENTITLED OCCUPANCY:-","Excluded - Server to Server Virtual Volumes (TB),(For Cap based Lic)","\" select trim( trailing ' ' from strip(char((sum(o.logical_mb)/1048576)),leading,'0'))||' TB' from occupancy o where o.node_name is not null and o.filespace_name is not null and o.stgpool_name in ( select s.stgpool_name from stgpools s where o.stgpool_name=s.stgpool_name and s.pooltype='PRIMARY') and o.filespace_name in ('ADSM.SERVER')\""],
	["ENTITLED OCCUPANCY:-","Excluded - TSM for Sharepoint (TB),(For Cap based Lic)","\" select trim(trailing ' ' from strip(char((sum(o.logical_mb)/1048576)),leading,'0'))||' TB' from occupancy o where o.node_name is not null and o.filespace_name is not null and o.stgpool_name in ( select s.stgpool_name from stgpools s where o.stgpool_name=s.stgpool_name and s.pooltype='PRIMARY') and o.filespace_name in ('DocAve')\""],
	["ENTITLED OCCUPANCY:-","Excluded - Fastback Data Replicated to TSM (TB),(For Cap based Lic)","\" select trim( trailing ' ' from strip(char((sum(o.logical_mb)/1048576)),leading,'0'))||' TB' from occupancy o where o.node_name is not null and o.filespace_name is not null and o.stgpool_name in ( select s.stgpool_name from stgpools s where o.stgpool_name=s.stgpool_name and s.pooltype='PRIMARY') and o.filespace_id in (select f.filespace_id from filespaces f where f.node_name=o.node_name and f.filespace_id=o.filespace_id and (f.filespace_type in ('API:FastBack')))\""],
	["ENTITLED OCCUPANCY:-","Excluded - TSM for HSM (TB),(For Cap based Lic)","\" select trim( trailing ' ' from strip(char((sum(o.logical_mb)/1048576)),leading,'0'))||' TB' from occupancy o where o.node_name is not null and o.filespace_name is not null and o.stgpool_name in ( select s.stgpool_name from stgpools s where o.stgpool_name=s.stgpool_name and s.pooltype='PRIMARY') and o.filespace_id in (select f.filespace_id from filespaces f where f.node_name=o.node_name and f.filespace_id=o.filespace_id and (f.filespace_type in ('API:TSM HSM Client for Windows')))\""],
	["ENTITLED OCCUPANCY:-","Excluded - Other DUPLICATED Data (TB),(For Cap based Lic)","\" select trim( trailing ' ' from strip(char((sum(o.logical_mb)/1048576)),leading,'0'))||' TB' from occupancy o where o.stgpool_name in ( select s.stgpool_name from stgpools s where o.stgpool_name=s.stgpool_name and s.pooltype='PRIMARY') and ( o.filespace_name is NULL or o.node_name is NULL )\""],
        ["FILESPACES NOT BACKED UP:-","Last Backed Up (days ago), Nodename, Filespace Name, Type, FSID, DECOMM_STATE","\"select (TIMESTAMPDIFF  (16,CHAR(current_timestamp-backup_end))),node_name, filespace_name, filespace_type, FILESPACE_ID, DECOMM_STATE FROM FILESPACEVIEW where TIMESTAMPDIFF  (16,CHAR(current_timestamp-backup_end)) >=1 order by 1 desc\""],
	["USED SLOTS - NUMBER OF LIBRARY VOLUMES INC SCRATCH:-","Library Name, Number of Library Volumes","\"SELECT library_name, count(*) FROM LIBVOLUMES GROUP BY library_name ORDER BY 1 asc\""],
	
	
	
	
	        
	);
	$count=0;
	
	while ($commands[$count]){
		open (V6_HEALTHCHECK, ">>${host_directory}/${tsm_server}_healthcheck.csv") or &been_an_error;
		print V6_HEALTHCHECK $commands[$count][0];
		print V6_HEALTHCHECK "\n";
		print V6_HEALTHCHECK $commands[$count][1];
		print V6_HEALTHCHECK "\n";
		close (V6_HEALTHCHECK);
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt $commands[$count][2]  >> ${host_directory}/${tsm_server}_healthcheck.csv");
		print "\r\r\r\r\r\r\r\r\r\r";
		$arraysize=@commands;
		$factor=100/$arraysize;
		$percentage=int($count*$factor);
		print "$percentage";
		print "% complete";
		$count=$count+1;
		}
		print "\r\r\r\r\r\r\r\r\r\r";
		print "100% complete\n";
		open (LIBRARY_NAMES,"<${host_directory}/library_names.txt") or &been_an_error;
		@libraries=<LIBRARY_NAMES>;
		foreach $library_line (@libraries) {
		chomp $library_line;
		open (V6_HEALTHCHECK, ">>${host_directory}/${tsm_server}_healthcheck.csv") or &been_an_error;
		print V6_HEALTHCHECK "Slot Count for library $library_line:-";
		print V6_HEALTHCHECK "\n";
		close (V6_HEALTHCHECK);
		
		#system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt show slots $library_line  >> ${host_directory}/${tsm_server}_healthcheck.csv");
	}
	close (LIBRARY_NAMES);
	} 

###########################################################################
## Subroutine:
## Name: frontend_licensing
## IBM Licensing based on current ACTIVE data
###########################################################################


sub frontend_licensing {
	chdir ${host_directory};
	unlink ("${host_directory}/${tsm_server}_$health_or_doc.csv");
	
	@commands = (
	
	["Frontend (USAGE DATA) BU MB and Objects:-","MB,Number of Objects","\"select (sum( bk.bfsize )/1048576) as front_end_size_mega_byte, count( bk.bfsize ) as number_of_objects from backups b, backup_objects bk where b.state='ACTIVE_VERSION' and b.object_id=bk.objid and b.filespace_id in ( select f.filespace_id from filespaces f where b.node_name=f.node_name and f.filespace_id=b.filespace_id and f.filespace_type not like 'API:%' and f.filespace_type not like 'TDP%' ) and b.node_name in (select node_name from nodes where repl_mode not in ('RECEIVE','SYNCRECEIVE'))\""],
	["Frontend (ALL USAGE DATA) BU MB and Objects:-","MB,Number of Objects","\"select (sum( bk.bfsize )/1048576) as front_end_size_mega_byte, count( bk.bfsize ) as number_of_objects from backups b, backup_objects bk where b.state='ACTIVE_VERSION' and b.object_id=bk.objid and b.filespace_id in ( select f.filespace_id from filespaces f where b.node_name=f.node_name and f.filespace_id=b.filespace_id and f.filespace_type not like 'API:%' and f.filespace_type not like 'TDP%' ) and b.node_name in (select node_name from nodes where repl_mode not in ('RECEIVE','SYNCRECEIVE'))\""],
	["Frontend (ALL USAGE BY NODE) BU MB and Objects:-","MB,Number of Objects","\"select (sum( bk.bfsize )/1048576) as front_end_size_mega_byte, count( bk.bfsize ) as number_of_objects from backups b, backup_objects bk where b.state='ACTIVE_VERSION' and b.object_id=bk.objid and b.filespace_id in ( select f.filespace_id from filespaces f where b.node_name=f.node_name and f.filespace_id=b.filespace_id and f.filespace_type not like 'API:%' and f.filespace_type not like 'TDP%' ) and b.node_name in (select node_name from nodes where repl_mode not in ('RECEIVE','SYNCRECEIVE'))\""],
	
	
	
			
	
	
	        
	);
	$count=0;
	
	while ($commands[$count]){
		open (V5_DOCUMENTATION, ">>${host_directory}/${tsm_server}_$health_or_doc.csv") or &been_an_error;
		print V5_DOCUMENTATION $commands[$count][0];
		print V5_DOCUMENTATION "\n";
		print V5_DOCUMENTATION $commands[$count][1];
		print V5_DOCUMENTATION "\n";
		close (V5_DOCUMENTATION);
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt $commands[$count][2]  >> ${host_directory}/${tsm_server}_$health_or_doc.csv");
		print "\r\r\r\r\r\r\r\r\r\r";
		$arraysize=@commands;
		$factor=100/$arraysize;
		$percentage=int($count*$factor);
		print "$percentage";
		print "% complete";
		$count=$count+1;
		}
		print "\r\r\r\r\r\r\r\r\r\r";
		print "100% complete\n";
	} 

###########################################################################
## Subroutine:
## Name: perf_stats
## live performance stats
###########################################################################


sub perf_stats {
	unlink ("${host_directory}/${tsm_server}_$health_or_doc.csv");
	@commands = (
	
	["Historical Processes (2 WEEKS):-","Start Date, Start Time, End Date, End Time, Activity, Entity, Processes, Media Wait Seconds, Elapsed Seconds, MB Moved, MB Per Sec (MediaW removed), MB Per Sec per Process (MediaW removed - CAUTION with MIGRATIONS!),COMMWAIT,IDLE","\"SELECT date(start_time), time(start_time), date(end_time), time(end_time), activity,entity, processes,mediaw,(TIMESTAMPDIFF  (2,CHAR(end_time-start_time))), CAST(bytes/1024/1024 AS DEC(18,2)),cast((CAST(bytes/1024/1024 AS DEC(18,2))/((TIMESTAMPDIFF(2,CHAR(end_time-start_time)))-(mediaw/processes))) AS dec (18,5)), cast((CAST(bytes/1024/1024 AS DEC(18,2))/((TIMESTAMPDIFF(2,CHAR(end_time-start_time)))-(mediaw/processes))/processes) AS dec (18,5)), COMM_WAIT,idle FROM summary WHERE  bytes!=0 and end_time!=start_time and (start_time >= current_timestamp-1440 hours)order by start_time\""],
	#["Current Processes:-","Process Number,Process,Start Time,Elapsed Time Sec, MB Moved, MB per Sec","\"SELECT process_num, process,substr(char(start_time),1,19),(TIMESTAMPDIFF  (2,CHAR(current_timestamp-start_time))),cast(float(bytes_processed) /1024/1024 AS DEC(18,2)),cast((cast(bytes_processed / 1024 / 1024 as dec(18,5))/(TIMESTAMPDIFF  (2,CHAR(current_timestamp-start_time)))) AS DEC (18,5)) FROM processes\""],			        
	#["Current Sessions:-","Client Name, Session ID, Wait Sec, Elapsed Time Sec, Commmethod, State, MB Sent, MB Recieved, Sent MB per Sec, Recv MB per Sec","\"SELECT client_name,session_id, wait_seconds,(TIMESTAMPDIFF  (2,CHAR(current_timestamp-start_time))), commmethod, state, CAST(bytes_sent/1024/1024 AS DEC(18,2)), CAST(bytes_received/1024/1024 AS DEC(18,2)), cast((CAST(bytes_sent/1024/1024 AS DEC(18,2))/(TIMESTAMPDIFF  (2,CHAR(current_timestamp-start_time)))) AS dec (18,5)),cast ((CAST(bytes_received/1024/1024 AS DEC(18,2))/(TIMESTAMPDIFF  (2,CHAR(current_timestamp-start_time)))) AS dec (18,5)) FROM sessions WHERE session_type='Node'\""],			        
	
	);
	$count=0;
	
	while ($commands[$count]){
		open (V6_DOCUMENTATION, ">>${host_directory}/${tsm_server}_$health_or_doc.csv") or &been_an_error;
		print V6_DOCUMENTATION $commands[$count][0];
		print V6_DOCUMENTATION "\n";
		print V6_DOCUMENTATION $commands[$count][1];
		print V6_DOCUMENTATION "\n";
		close (V6_DOCUMENTATION);
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt $commands[$count][2]  >> ${host_directory}/${tsm_server}_$health_or_doc.csv");
		print "\r\r\r\r\r\r\r\r\r\r";
		$arraysize=@commands;
		$factor=100/$arraysize;
		$percentage=int($count*$factor);
		print "$percentage";
		print "% complete";
		$count=$count+1;
		}
		print "\r\r\r\r\r\r\r\r\r\r";
		print "100% complete\n";
	} 
	
###########################################################################
## Subroutine:
## Name: perf_stats
## live performance stats
###########################################################################


sub perf_stats_2 {

unlink ("${host_directory}/${tsm_server}_perfstats_two.csv");
unlink ("${host_directory}/${tsm_server}_perfstats_output.csv");
@commands = (
	
	["\"select (current_timestamp)hours,(current_timestamp)minutes,(current_timestamp)seconds,(start_time)hours, (start_time)minutes, (start_time)seconds,activity,entity, processes,(TIMESTAMPDIFF  (2,CHAR(end_time-start_time))), CAST(bytes/1024/1024 AS DEC(18,2)),cast((CAST(bytes/1024/1024 AS DEC(18,2))/(TIMESTAMPDIFF(2,CHAR(end_time-start_time)))) AS dec (18,5)), cast((CAST(bytes/1024/1024 AS DEC(18,2))/(TIMESTAMPDIFF(2,CHAR(end_time-start_time)))/processes) AS dec (18,5)) FROM summary WHERE (activity='BACKUP' or activity='ARCHIVE' or activity='IDENTIFY' or activity='FULL_DBBACKUP' or activity='REPLICATION' or activity='MIGRATION' or activity='OFFSITE RECLAMATION' or activity='RECLAMATION' or activity='STGPOOL BACKUP') and bytes!=0 and end_time!=start_time and start_time>current_timestamp-86400 seconds order by start_time\""],			        
	);
	$count=0;
	
	while ($commands[$count]){
		
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt $commands[$count][0]  >> ${host_directory}/${tsm_server}_perfstats_two.csv");
	$count=$count+1;	
	} 


open (OUTPUT, ">>${host_directory}/${tsm_server}_perfstats_output.csv") or &been_an_error;
open (DATA, "${host_directory}/${tsm_server}_perfstats_two.csv") or &been_an_error;
	@csvfile=<DATA>;  
	
	foreach $element (@csvfile) {
	      chomp $element;
	     ($perf_cthours, $perf_ctminutes, $perf_ctseconds, $perf_sthours, $perf_stminutes, $perf_stseconds, $perf_activity, $perf_entity, $perf_noprocesses,$perf_elapsedsec, $perf_mbmoved, $perf_mbpersec, $perf_mbsecperproc) = (split /,/,$element)[0,1,2,3,4,5,6,7,8,9,10,11,12];

chomp $perf_cthours;
chomp $perf_ctminutes;
chomp $perf_ctseconds;
chomp $perf_sthours;
chomp $perf_stminutes;
chomp $perf_stseconds;

chomp $perf_activity;
chomp $perf_entity;
chomp $perf_noprocesses;
chomp $perf_mediaw;
chomp $perf_elapsedsec;
chomp $perf_mbmoved;
chomp $perf_mbpersec;
chomp $perf_mbsecperproc;

$perf_cthours=$perf_cthours*60*60;
$perf_ctminutes=$perf_ctminutes*60;
$perf_cttotal=$perf_cthours+$perf_ctminutes+$perf_ctseconds;

$perf_sthours=$perf_sthours*60*60;
$perf_stminutes=$perf_stminutes*60;
$perf_sttotal=$perf_sthours+$perf_stminutes+$perf_stseconds;

if ($perf_sttotal <= $perf_cttotal) {
	$perf_relativet=(86400-$perf_cttotal)+$perf_sttotal;
}
else {
	$perf_relativet=$perf_sttotal-$perf_cttotal;

}

$perf_relendt=$perf_relativet+$perf_elapsedsec;
print OUTPUT "$perf_activity,$perf_entity,$perf_noprocesses,$perf_elapsedsec,$perf_mbmoved,$perf_mbpersec,$perf_mbsecperproc,$perf_relativet,$perf_relendt\n";

}
close (OUTPUT);
close (DATA);

#########
$perf_count=0;
$perf_varbackup=0;
$perf_vararchive=0;
$perf_varidentify=0;
$perf_varreplicate=0;
$perf_vardbbackup=0;
$perf_varmigration=0;
$perf_varoffsiterec=0;
$perf_varrec=0;
$perf_varstg=0;
$perf_varrest=0;
$perf_var_total=0;

unlink "${host_directory}/${tsm_server}_perfstats_final_$datetime2.csv";
open (OUTPUT, ">>${host_directory}/${tsm_server}_perfstats_final_$datetime2.csv") or &been_an_error;
print OUTPUT "HH:MM:SS,SECONDS,BACKUP MBS,ARCHIVE_MBS,RESTORE MBS,REPLICATION_MBS, IDENTIFY_MBS, FULL_DBBACKUP MBS,MIGRATION MBS,OFFSITE RECLAMATION MBS,RECLAMATION MBS,STGPOOL BACKUP MBS,TOTAL MBS\n";

#### loop on timer
while ($perf_count <= 86400 ){
	open (INPUT, "<${host_directory}/${tsm_server}_perfstats_output.csv") or &been_an_error;
	@csvfile=<INPUT>;  

##### loop on spreadsheet	
	foreach $element (@csvfile) {
	      chomp $element;
	      ($perf_activity,$perf_entity,$perf_noprocesses,$perf_elapsedsec,$perf_mbmoved,$perf_mbpersec,$perf_mbsecperproc,$perf_relativet,$perf_relendt) = (split /,/,$element)[0,1,2,3,4,5,6,7,8];
		
		chomp $perf_activity;
		chomp $perf_entity;
		chomp $perf_noprocesses;
		chomp $perf_elapsedsec;
		chomp $perf_mbmoved;
		chomp $perf_mbpersec;
		chomp $perf_mbsecperproc;
		chomp $perf_relativet;
		chomp $perf_relendt;
		#$perf_cthours;
		#$perf_ctminutes;
		#$perf_ctseconds;
		#activity='BACKUP'
		#activity='FULL_DBBACKUP'
		#activity='MIGRATION'
		#activity='OFFSITE RECLAMATION'
		#activity='RECLAMATION'
		#activity='STGPOOL BACKUP'
		
# $perf_vararchive=0;
# $perf_varidentify=0;
# $perf_varreplicate=0;

		if (($perf_count >= $perf_relativet) && ($perf_count < $perf_relendt)) {
			if ($perf_activity eq 'BACKUP') {
				
				$perf_varbackup=$perf_varbackup+$perf_mbpersec;
				}
			if ($perf_activity eq 'ARCHIVE') {
				
				$perf_vararchive=$perf_vararchive+$perf_mbpersec;
				}
			if ($perf_activity eq 'IDENTIFY') {
				
				$perf_varidentify=$perf_varidentify+$perf_mbpersec;
				}
			if ($perf_activity eq 'REPLICATION') {
				
				$perf_varreplicate=$perf_varreplicate+$perf_mbpersec;
				}
			
			if ($perf_activity eq 'FULL_DBBACKUP') {
				
				$perf_vardbbackup=$perf_vardbbackup+$perf_mbpersec;
				}
			if ($perf_activity eq 'MIGRATION') {
				
				$perf_varmigration=$perf_varmigration+$perf_mbpersec;
				}
			if ($perf_activity eq 'OFFSITE RECLAMATION') {
				
				$perf_varoffsiterec=$perf_varoffsiterec+$perf_mbpersec;
				}
			if ($perf_activity eq 'RECLAMATION') {
				
				$perf_varrec=$perf_varrec+$perf_mbpersec;
				}
			if ($perf_activity eq 'STGPOOL BACKUP') {
				
				$perf_varstg=$perf_varstg+$perf_mbpersec;
				}
			if ($perf_activity eq 'RESTORE') {
				
				$perf_varrest=$perf_varrest+$perf_mbpersec;
				}
			if (($perf_activity eq 'BACKUP') || ($perf_activity eq 'ARCHIVE') || ($perf_activity eq 'IDENTIFY') || ($perf_activity eq 'REPLICATION') || ($perf_activity eq 'FULL_DBBACKUP') || ($perf_activity eq 'MIGRATION') || ($perf_activity eq 'OFFSITE RECLAMATION') || ($perf_activity eq 'RECLAMATION') || ($perf_activity eq 'STGPOOL BACKUP') || ($perf_activity eq 'RESTORE')) {
			$perf_var_total=$perf_var_total+$perf_mbpersec;
			}
		}
	       
	      }
	      ## loop on spreadsheet
		#$perf_cthours;
		#$perf_ctminutes;
		#$perf_ctseconds;
		#$perf_vararchive=0;
# $perf_varidentify=0;
# $perf_varreplicate=0;
		$perf_ctaddhours=$perf_cthours;
		$perf_ctaddmins=$perf_ctminutes;
		$perf_ctaddsecs=$perf_ctseconds;
		$perf_cttotalseconds=$perf_ctaddhours+$perf_ctaddmins+$perf_ctaddsecs;
		$perf_hrconvert=(($perf_cttotalseconds+$perf_count)/(60*60))%24;
		$perf_minconvert=(($perf_cttotalseconds+$perf_count)/60)%60;
		$perf_secconvert=($perf_cttotalseconds+$perf_count)%60;
	      print OUTPUT "$perf_hrconvert:$perf_minconvert:$perf_secconvert,$perf_count,$perf_varbackup,$perf_vararchive,$perf_varrest,$perf_varreplicate,$perf_varidentify,$perf_vardbbackup,$perf_varmigration,$perf_varoffsiterec,$perf_varrec,$perf_varstg,$perf_var_total\n";
	      $perf_count=$perf_count+10;
	      close (INPUT);
		$perf_varbackup=0;
		$perf_vararchive=0;
		$perf_varidentify=0;
		$perf_varreplicate=0;
		$perf_vardbbackup=0;
		$perf_varmigration=0;
		$perf_varoffsiterec=0;
		$perf_varrec=0;
		$perf_varstg=0;
		$perf_varrest=0;
		$perf_var_total=0;
}
## loop while < 86400
close (OUTPUT);
print "Done...Output is in ${tsm_server}_perfstats_final_$datetime2.csv\"\n";

unlink ("${host_directory}/${tsm_server}_perfstats_output.csv");
unlink ("${host_directory}/${tsm_server}_perfstats_two.csv");
}
###########################################################################
## Subroutine:
## Name: helix_checks
## Post installation healthcheck
###########################################################################


sub helix_checks {
	chdir ${host_directory};
	unlink ("${host_directory}/${tsm_server}_$health_or_doc.csv");
	
	@commands = (
	["DB SPACE:-","Location,Total FS Size GB,Total FS Used GB,Total Free Space (usable) GB","\"select location,int(TOTAL_FS_SIZE_MB/1024),INT(USED_FS_SIZE_MB/1024),INT(FREE_SPACE_MB/1024) from dbspace\""],	
	["DB LAST BACKUP:-","Last Backup Date, Backup Running?","\"select LAST_BACKUP_DATE FROM DB \""],
	["DB BACKUPS:-","Date_Time,Type,Volume Name, Backup Series","\"select DATE_TIME,TYPE,VOLUME_NAME,BACKUP_SERIES FROM VOLHISTORY WHERE TYPE = 'BACKUPFULL' ORDER BY 1 DESC\""],               
	["DB BUFFER HIT RATIO:-","Buffer Hit Ratio","\"SELECT BUFF_HIT_RATIO FROM DB\""],
	["DBEXPIREDAYS from DRMSTAUS:-","DBEXPIREDAYS Setting","\"select dbbexpiredays from drmstatus\""],	
	["Is Database Backup in a Script?:-","Script Name, Command","\"select name, command from scripts where command like '%ba% db%'\""],
	["Is Database Backup in an admin Schedule?:-","Schedule Name, Command, Active?","\"select schedule_name,command,active from admin_schedules where SUBSTR(CHAR(command),5,100) in (select lower(name) from scripts where command like '%ba% db%')\""],
	["Actual Reuse Delays:-","Storage Pool Name, Device Class, Reuse Delay","\"select stgpool_name, devclass, reusedelay from stgpools\""],
	["Pools with Reuse Delays less than DBEXPIREDAYS?:-","Storage Pool Name, Device Class, Reuse Delay","\"select stgpool_name, devclass,reusedelay from stgpools where reusedelay<(select dbbexpiredays from drmstatus)\""],
	["LOG SPACE:-","PCT used,Total Space MB, Used Space MB, Active Log Dir, Arch Log Dir","\"select cast((USED_SPACE_MB / decimal(TOTAL_SPACE_MB)*100) as decimal(5,2)),  TOTAL_SPACE_MB, USED_SPACE_MB, ACTIVE_LOG_DIR, ARCH_LOG_DIR from log\""],
	["ACTLOG RETENTION:-","Retention in Days","\"SELECT ACTLOGRETENTION FROM  STATUS\""],
	["STATUS:-","Password Expire Days","\"SELECT PASSEXP FROM STATUS\""],
	["STATUS:-","Min Password Length","\"SELECT MINPWLENGTH FROM STATUS\""],
	["STATUS:-","Client Accounting","\"SELECT ACCOUNTING FROM STATUS\""],
	["STATUS:-","Scheduler Enabled?","\"SELECT SCHEDULER FROM STATUS\""],
	["STATUS:-","Server Version, Release, Level, Sublevel","\"SELECT VERSION, RELEASE, LEVEL, SUBLEVEL FROM STATUS\""],
	["STATUS:-","Availability","\"SELECT AVAILABILITY FROM STATUS \""],
	["LICENSE:-","License Compliance","\"SELECT LICENSECOMPLIANCE FROM STATUS\""],
	["MAXSESSIONS:-","MAXSESSIONS","\"select maxsessions from status\""],
	["MAXSCHEDSESSIONS:-","MAXSCHEDSESSIONS","\"select maxschedsessions from status\""],
	["MoveBatchSize (1000 good for Migration):-","MoveBatchSize","\"SELECT OPTION_NAME,OPTION_VALUE FROM OPTIONS WHERE OPTION_NAME='MoveBatchSize'\""],
	["MoveSizeThresh (32768 good for Migration):-","MoveSizeThresh","\"SELECT OPTION_NAME,OPTION_VALUE FROM OPTIONS WHERE OPTION_NAME='MoveSizeThresh'\""],
	["TxnGroupMax (65000 may speed up backups):-","TxnGroupMax","\"SELECT OPTION_NAME,OPTION_VALUE FROM OPTIONS WHERE OPTION_NAME='TxnGroupMax'\""],
	["NODES DEFINED:-","Total Defined Nodes","\"select count(*) from nodes\""],
	["NODES UNIQUE:-","Total Unique Nodes (by IP address)","\"select count(unique(TCP_ADDRESS)) from nodes\""],	
	["Nodes with No Filespaces:-","Nodename","\"select node_name from nodes where node_name not in (select node_name from filespaces)\""],
	["Domains with no Nodes:-","Domain","\"select Domain_name from domains where num_nodes=0\""],
	["Schedules with no Associations:-","Domain Name, Schedule","\"select domain_name,schedule_name from client_schedules where schedule_name not in (select schedule_name from associations)\""],
	["Deduplication set to ServerOnly?:-","Nodename","\"select node_name from nodes where deduplication='ServerOnly'\""],
	["Nodes not Replicated:-","Nodename","\"select Node_Name from nodes where REPL_STATE='NONE' or REPL_STATE='DISABLED'\""],
	["Nodes with no Option Set:-","Domain Name,Node Name","\"select domain_name,node_name from nodes where option_set is NULL\""],
	["Is Collocation on?:-","Storage Pool, Collocation","\"select stgpool_name, collocate from stgpools\""],
	["Are there collocation groups?:-","Collocation Group","\"select * from collocgroup\""],
	["Nodes not in Collocation Group:-","Node Name","\"select node_name from nodes where node_name not in (select node_name from collocgroup)\""],
	["FILE Pools with Scratch Volumes (should be private):-","Storage Pool Name, Device Class, Reuse Delay","\"select a.stgpool_name,a.numscratchused from stgpools a,devclasses b where a.numscratchused>0 and a.devclass=b.devclass_name and b.devtype='FILE'\""],
	["Are FILE Volumes 50-100GB?:-","Storage Pool Name, Volume Capacity (GB)","\"select a.stgpool_name,(b.capacity/1024) from stgpools a,devclasses b where a.devclass=b.devclass_name and b.devtype='FILE'\""],
	["Scratch used vs Maxscratch Limit:-","Storage Pool Name, MAXSCRATCH, Number scratch used","\"select stgpool_name, maxscratch, numscratchused from stgpools\""],	
	["Private and Scratch Volumes in FILE class pools:-","Storage Pool Name, Is Scratch? (NO=private), Number of Vols","\"select stgpool_name,scratch,count(volume_name) from volumes where devclass_NAME in (SELECT DEVCLASS_NAME FROM DEVCLASSES WHERE DEVTYPE='FILE') group by stgpool_name,scratch\""],
	["Next Storage Pool:-","Stgpool,Next Pool","\"select stgpool_name,nextstgpool from stgpools where devclass='DISK'\""],
	["Is Encryption ON? (ALLOW=LIBRARY ONLY ON=TSM Managed):-","Device Class, Device Type, Drive Encryption","\"select devclass_name,devtype,drive_encryption from devclasses where devclass_name!='DISK' and devtype!='FILE'\""],
	["Encrypted Volumes:-","Number of Volumes, Storage Pool Name, Encryption Key Manager","\"select count (volume_name),stgpool_name,vol_encr_keymgr from volumes group by vol_encr_keymgr,stgpool_name\""],	
	["Admin Schedules that are ACTIVE (in use):-","Schedule Name, Command, Active?","\"select schedule_name, command, active from admin_schedules where active='YES'\""],
	["Is Storage Pool Protect scripted?:-","Script Name, Command","\"select name, command from scripts where lcase(command) like '%prot% stg%'\""],
	["Is Storage Pool Protect in an admin Schedule?:-","Schedule Name, Command, Active?","\"select schedule_name,command,active from admin_schedules where SUBSTR(CHAR(command),5,100) in (select lower(name) from scripts where lcase(command) like '%prot% stg%')\""],	
	["Sequential DEVCLASS Mountlimit:-","Device Class, Device Type, Mount Limit","\"select devclass_name,devtype, mountlimit from devclasses where devclass_name!='DISK'\""],
	["What Primary Pools are There?:-","Stgpool Name, Pooltype, Device Class","\"select stgpool_name,pooltype,devclass from stgpools where pooltype='PRIMARY'\""],
	["Is Backup Stg scripted?:-","Script Name, Command","\"select name, command from scripts where lcase(command) like '%ba% stg%'\""],
	["Is Backup Stg in an admin Schedule?:-","Schedule Name, Command, Active?","\"select schedule_name,command,active from admin_schedules where SUBSTR(CHAR(command),5,100) in (select lower(name) from scripts where lcase(command) like '%ba% stg%')\""],
	["Difference Prim minus Copy($TB_TITLE):-","Difference($TB_TITLE)","\"select (sum(backup_MB)-sum(Backup_COPY_MB))/1024/$TB_DIV from auditocc\""],
	["Stgpools with Reuse not Equal to DBEXPIREDAYS:-","Stgpool,Reusedelay","\"select stgpool_name,reusedelay from stgpools where devclass!='DISK' and reusedelay!=(select DBBEXPIREDAYS from drmstatus)\""],
	["DedupRequiresBackup:-","Option,Setting","\"select * from options where option_name='DedupRequiresBackup'\""],
	["DedupTXN:-","Option,Setting","\"select * from options where option_name like '%DedupTxnLimit%'\""],
	["Domain with No ACTIVE bu_copygroup:-","Domain Name","\"select domain_name from domains where domain_name not in (select domain_name from bu_copygroups where set_name='ACTIVE')\""],
	["Policy Settings:-","domain_name,set_name,class_name,verexists,verdeleted,retextra,retonly,destination","\"select domain_name,set_name,class_name,verexists,verdeleted,retextra,retonly,destination from bu_copygroups where set_name='ACTIVE'\""],
	["INVALID Stgpool Destinations:-","domain_name,class_name,destination","\"select domain_name,class_name,destination as INVALID_DESTINATION from bu_copygroups where set_name='ACTIVE' and destination not in (select stgpool_name from stgpools)\""],
	["ACTIVE bu_copygroups:-","domain_name,set_name,class_name,verexists,verdeleted,retextra,retonly,destination","\"select domain_name,set_name,class_name,verexists,verdeleted,retextra,retonly,destination from bu_copygroups where set_name='ACTIVE'\""],
	["Is Replication Likely to be on?:-","Target Replication Server","\"select TARGET_REPL_SERVER_NAME from status\""],
	["Cutover Checks: CLIENTS NOT BACKED UP IN 24 HOURS (BUT HAVE CONTACTED):-","NODENAME, LAST BACKUP DATE","\"SELECT node_name, date(backup_end) from filespaces where int(days(current_timestamp)-days(backup_end))>1 group by node_name, date(backup_end)\""],
	["Cutover Checks: CLIENTS NOT CONTACTED SERVER (AT ALL):-","NODENAME","\"select node_name from nodes where platform_name is NULL \""],
	["Cutover Checks: CLIENTS NOT STARTED REPLICATION (BUT HAVE CONTACTED):-","NODENAME","\"select unique(node_name) from filespaces where LAST_REPL_START is NULL \""],
	["Cutover Checks: CLIENTS NOT COMPLETED REPLICATION (BUT HAVE CONTACTED):-","NODENAME","\"select unique(node_name) from filespaces where LAST_REPL_COMP is NULL \""],
	["Cutover Checks: last_repl_comp is NULL:-","Nodename, Filespace","\"select node_name,filespace_name from filespaces where last_repl_comp is NULL\""],

	
			
	
	
	        
	);
	$count=0;
	
	while ($commands[$count]){
		open (V5_DOCUMENTATION, ">>${host_directory}/${tsm_server}_$health_or_doc.csv") or &been_an_error;
		print V5_DOCUMENTATION $commands[$count][0];
		print V5_DOCUMENTATION "\n";
		print V5_DOCUMENTATION $commands[$count][1];
		print V5_DOCUMENTATION "\n";
		close (V5_DOCUMENTATION);
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt $commands[$count][2]  >> ${host_directory}/${tsm_server}_$health_or_doc.csv");
		print "\r\r\r\r\r\r\r\r\r\r";
		$arraysize=@commands;
		$factor=100/$arraysize;
		$percentage=int($count*$factor);
		print "$percentage";
		print "% complete";
		$count=$count+1;
		}
		print "\r\r\r\r\r\r\r\r\r\r";
		print "100% complete\n";
	} 




###########################################################################
## Subroutine:
## Name: version_5_documentation
## Version 5 documentation
###########################################################################


sub version_5_documentation {
	chdir ${host_directory};
	unlink ("${host_directory}/${tsm_server}_$health_or_doc.csv");
	
	@commands = (
	
	["DATABASE STATS:-","Total Available Space GB,Total Assigned Space GB, PCT UTIL, MAX_PCT_UTIL, Utilised Space GB, Last Backup Date, Cache Hit PCT","\"select avail_space_mb/1024, capacity_mb/1024,pct_utilized, max_pct_utilized, int(((avail_space_mb/1024)*pct_utilized)/100), last_backup_date, cache_hit_pct from db\""],		
	["DATABASE VOLUMES:-","PRIMARY,SYNC,SECONDARY,SYNC,TERTIARY,SYNC","\"SELECT DBV.COPY1_NAME, DBV.COPY1_STATUS, DBV.COPY2_NAME, DBV.COPY2_STATUS, DBV.COPY3_NAME, DBV.COPY3_STATUS FROM DBVOLUMES DBV\""],
	["LOG:-","Available Space GB,PCT UTIL, MAX_PCT_UTIL","\"select avail_space_mb/1024, pct_utilized, max_pct_utilized from log\""],
	["LOG:-","PRIMARY,SYNC,SECONDARY,SYNC,TERTIARY,SYNC","\"SELECT COPY1_NAME, COPY1_STATUS, COPY2_NAME, COPY2_STATUS, COPY3_NAME, COPY3_STATUS FROM LOGVOLUMES\""],	
	["LIBRARY:-","LIBRARY NAME, LIBRARY TYPE, ACS ID, PRIVATE CATAGORY, SCRATCH CATAGORY, EXTERNAL MANAGER, SHARED, PRIMARY LIBRARY MANAGER, AUTOLABEL, LIBRARY SERIAL NUMBER, RESET DRIVES","\"select LIBRARY_NAME, LIBRARY_TYPE, ACS_ID, PRIVATE_CATEGORY, SCRATCH_CATEGORY, EXTERNAL_MGR, SHARED, PRIMARY_LIB_MGR, AUTOLABEL, LIBRARY_SERIAL, RESETDRIVES FROM LIBRARIES\""],
	["DRIVES:-","LIBRARY NAME, DRIVE NAME, DEVICE TYPE, ONLINE, ELEMENT ID, CLEAN FREQUENCY, DRIVE SERIAL NUMBER","\"select LIBRARY_NAME, DRIVE_NAME, DEVICE_TYPE, ONLINE, ELEMENT, CLEAN_FREQ, DRIVE_SERIAL from DRIVES\""],
	["SERVERS:-","SERVER NAME, HL ADDRESS, LL ADDRESS, NODE NAME","\"select server_name, hl_address, ll_address, node_name from servers\""],
	["PATHS:-","SOURCE NAME, SOURCE TYPE, DESTINATION NAME, DESTINATION TYPE, LIBRARY NAME, NODE NAME, DEVICE, ONLINE","\"select SOURCE_NAME, SOURCE_TYPE, DESTINATION_NAME, DESTINATION_TYPE, LIBRARY_NAME, NODE_NAME, DEVICE, ONLINE from PATHS\""],
	["DEVICE CLASSES:-","DEVCLASS NAME, ACCESS, STGPOOL COUNT, DEVICE TYPE, FORMAT, CAPACITY, MOUNTLIMIT, MOUNT RETENTION, LIBRARY NAME, DIRECTORY, SERVERNAME, HIGH LEVEL ADDRESS, WORM, DRIVE ENCRYPTION","\"select DEVCLASS_NAME, ACCESS_STRATEGY, STGPOOL_COUNT, DEVTYPE, FORMAT, CAPACITY, MOUNTLIMIT, MOUNTRETENTION, LIBRARY_NAME, DIRECTORY, SERVERNAME, HLADDRESS, WORM, DRIVE_ENCRYPTION from devclasses\""],
	["STORAGE POOLS:-","POOL NAME, POOL TYPE, DEVCLASS, CAPACITY (EST), PCT UTIL, PCT MIGR, HI MIG, LOW MIG, MIG PR, NEXT STGPOOL, MAXSIZE, CACHE, COLLOCATE, RECLAIM THRESHOLD, MAXSCRATCH, NUM SCRATCH USED, REUSE DELAY, MIG DELAY, DATA FORMAT, COPY STGPOOL, ACTIVE STGPOOL","\"select STGPOOL_NAME, POOLTYPE, DEVCLASS, EST_CAPACITY_MB, PCT_UTILIZED, PCT_MIGR, HIGHMIG, LOWMIG, MIGPROCESS, NEXTSTGPOOL, MAXSIZE, CACHE, COLLOCATE, RECLAIM, MAXSCRATCH, NUMSCRATCHUSED, REUSEDELAY, MIGDELAY, DATAFORMAT, COPYSTGPOOLS, ACTIVEDATASTGPOOLS from STGPOOLS\""],
	["DOMAINS:-","DOMAIN NAME, DEFAULT MC, NUMBER OF NODES, BACKUP RET, ARCHIVE RET, ACTIVE STGPOOLS","\"select DOMAIN_NAME, DEFMGMTCLASS, NUM_NODES, BACKRETENTION, ARCHRETENTION, ACTIVESTGPOOLS FROM DOMAINS\""],
	["POLICY SETS:-","DOMAIN NAME, SET NAME, DEFAULT MC","\"select DOMAIN_NAME, SET_NAME, DEFMGMTCLASS FROM POLICYSETS\""],
	["MANAGEMENT CLASSES:-","DOMAIN NAME, SET NAME, CLASS NAME, DEFAULT MC, MIGRATE REQUIRES BACKUP","\"select DOMAIN_NAME, SET_NAME, CLASS_NAME, DEFAULTMC, MIGREQUIRESBKUP from MGMTCLASSES\""],
	["BACKUP COPYGROUPS:-","DOMAIN NAME, SET NAME, CLASS NAME, VER EXISTS, VER DELETED, RET EXTRA, RET ONLY, MODE, SERIALIZATION, FREQ, DESTINATION, TOC DESTINATION","\"select DOMAIN_NAME, SET_NAME, CLASS_NAME, VEREXISTS, VERDELETED, RETEXTRA, RETONLY, MODE, SERIALIZATION, FREQUENCY, DESTINATION, TOC_DESTINATION FROM BU_COPYGROUPS\""],
	["ARCHIVE COPYGROUPS:-","DOMAIN NAME, SET NAME, CLASS NAME, RET VERSION, SERIALIZATION, DESTINATION","\"select DOMAIN_NAME, SET_NAME, CLASS_NAME, RETVER, SERIALIZATION, DESTINATION FROM AR_COPYGROUPS\""],
	["NODES:-","NODE NAME, PLATFORM, CLIENT_OS_LEVEL,DOMAIN NAME, ARCH DELETE, BACKUP DELETE, VERSION, RELEASE, LEVEL, SUBLEVEL, OPTION SET, TCP ADDRESS","\"select NODE_NAME, PLATFORM_NAME, CLIENT_OS_LEVEL, DOMAIN_NAME, ARCHDELETE, BACKDELETE, CLIENT_VERSION, CLIENT_RELEASE, CLIENT_LEVEL, CLIENT_SUBLEVEL, OPTION_SET, CLIENT_HLA FROM NODES\""],
	["NODE FILESPACES:-","NODE NAME, FILESPACE TYPE, CAPACITY (GB), PCT UTILISED (%), SPACE UTILISED (GB), FILESPACE NAME","\"select node_name, filespace_type, int(capacity/1024), pct_util, int(capacity/1024/100*pct_util), filespace_name from filespaces where filespace_type !='VSS' and filespace_type not like'API:%'\""],
        ["NODE FILESPACES TOTAL:-","TOTAL AVAILABLE FILESPACE CAPACITY (GB), TOTAL UTILISED FILESPACE CAPACITY (GB), PCT USED of TOTAL ASSIGNED","\"select sum(int(capacity/1024)),sum(int(capacity/1024/100*pct_util)),((sum((capacity/1024/100*pct_util)))/(sum((capacity/1024)))*100) from filespaces where filespace_type !='VSS' and filespace_type not like'API:%'\""],	
	["NODE SCHEDULES:-","DOMAIN NAME, SCHEDULE NAME, ACTION, OPTIONS, OBJECTS, START TIME, DURATION, DUR UNITS, PERIOD, PERIOD UNITS, DAY OF WEEK, SCHED STYLE","\"select DOMAIN_NAME, SCHEDULE_NAME, ACTION, OPTIONS, OBJECTS, STARTTIME, DURATION, DURUNITS, PERIOD, PERUNITS, DAYOFWEEK, SCHED_STYLE FROM CLIENT_SCHEDULES\""],
	["ADMIN SCHEDULES:-","SCHEDULE NAME, COMMAND, START TIME, DURATION, DUR UNITS, PERIOD, PERIOD UNITS, DAY OF WEEK, ACTIVE","\"select SCHEDULE_NAME, COMMAND, STARTTIME, DURATION, DURUNITS, PERIOD, PERUNITS, DAYOFWEEK, ACTIVE, SCHED_STYLE FROM ADMIN_SCHEDULES\""],
	["SUMMARY TABLE 30 DAYS HISTORY:-","ACTIVITY, SUCCESSFUL, COUNT IN 30 DAYS","\"select activity, successful, count(successful) from summary where  start_time>'2000-01-01 00:00' and (start_time >= current_timestamp-720 hours) group by activity, successful order by activity,successful\""],
	["SUMMARY TABLE HOUSEKEEPING FAILURES:-","ACTIVITY, PROCESS, SUCCESSFUL, COUNT IN 30 DAYS","\"select activity, successful, entity, count(successful) from summary where  start_time>'2000-01-01 00:00' and activity != 'BACKUP' and activity != 'RESTORE' and activity != 'ARCHIVE' and activity !='RETRIEVE' and activity !='HSM-MIGRATE' and activity !='RECALL' and successful='NO' and (start_time >= current_timestamp-720 hours) group by activity,entity, successful order by activity,entity, successful\""],
	["SCRIPTS:-","NAME, LINE, COMMAND","\"select NAME, LINE, COMMAND FROM SCRIPTS order by name, line\""],
	["DRM SETTINGS:-","PLAN PREFIX, INTRUCTION PREFIX, NOT MOUNT NAME, COURIER NAME, VAULT NAME, DB EXPIRE DAYS, CHECK LABEL","\"select PLANPREFIX, INSTRPREFIX, NONMOUNTNAME, COURIERNAME, VAULTNAME, DBBEXPIREDAYS, CHECKLABEL FROM DRMSTATUS\""],
	["DRM TAPES:-","VOLUME NAME, STATE, LOCATION, STGPOOL NAME, LIBRARY NAME, VOLUME TYPE","\"select VOLUME_NAME, STATE, LOCATION, STGPOOL_NAME, LIB_NAME, VOLTYPE FROM DRMEDIA\""],
	["OPTIONS:-","AUDIT STORAGE","\"select option_value from options where option_name='AuditStorage'\""],
	["OPTIONS:-","DATE FORMAT","\"select option_value from options where option_name='DateFormat'\""],
	["OPTIONS:-","EXPIRE INTERVAL","\"select option_value from options where option_name='ExpInterval'\""],
	["OPTIONS:-","IDLE TIMEOUT","\"select option_value from options where option_name='IdleTimeOut'\""],
	["OPTIONS:-","MAX SESSIONS","\"select option_value from options where option_name='MaxSessions'\""],
	["OPTIONS:-","MOVE BATCH SIZE","\"select option_value from options where option_name='MoveBatchSize'\""],
	["OPTIONS:-","MOVE SIZE THRESHOLD","\"select option_value from options where option_name='MoveSizeThresh'\""],
	["OPTIONS:-","SAN DISCOVERY","\"select option_value from options where option_name='SANdiscovery'\""],
	["OPTIONS:-","TCP NODELAY","\"select option_value from options where option_name='TCPNoDelay'\""],	
	["OPTIONS:-","TCP WINDOWSIZE","\"select option_value from options where option_name='TCPWindowsize'\""],
	["OPTIONS:-","TCP ADMIN PORT","\"select option_value from options where option_name='TcpAdminport'\""],
	["OPTIONS:-","TCP PORT","\"select option_value from options where option_name='TcpPort'\""],  	["OPTIONS:-","ALL","\"q opt\""],           	
	["STATUS:-","SERVER NAME, SERVER HLA, SERVER LLA, INSTALLATION DATE, LOG MODE, PASSWORD EXPIRE DAYS, ACTLOG RET, LICENSE COMPLIENCE, MAXSESSIONS, MAXSCHEDSESSIONS, RANDOMIZE, QUERY SCHED PERIOD, PLATFORM, VERSION, RELEASE, LEVEL, SUBLEVEL","\"SELECT SERVER_NAME, SERVER_HLA, SERVER_LLA, INSTALL_DATE, LOGMODE, PASSEXP, ACTLOGRETENTION, LICENSECOMPLIANCE, MAXSESSIONS, MAXSCHEDSESSIONS, RANDOMIZE, QUERYSCHEDPERIOD, PLATFORM, VERSION, RELEASE, LEVEL, SUBLEVEL FROM STATUS\""],
	
	
	
	        
	);
	$count=0;
	
	while ($commands[$count]){
		open (V5_DOCUMENTATION, ">>${host_directory}/${tsm_server}_$health_or_doc.csv") or &been_an_error;
		print V5_DOCUMENTATION $commands[$count][0];
		print V5_DOCUMENTATION "\n";
		print V5_DOCUMENTATION $commands[$count][1];
		print V5_DOCUMENTATION "\n";
		close (V5_DOCUMENTATION);
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt $commands[$count][2]  >> ${host_directory}/${tsm_server}_$health_or_doc.csv");
		print "\r\r\r\r\r\r\r\r\r\r";
		$arraysize=@commands;
		$factor=100/$arraysize;
		$percentage=int($count*$factor);
		print "$percentage";
		print "% complete";
		$count=$count+1;
		}
		print "\r\r\r\r\r\r\r\r\r\r";
		print "100% complete\n";
	} 


###########################################################################
## Subroutine:
## Name: version_6_documentation
## Version 6 documentation
###########################################################################

sub version_6_documentation {
	chdir ${host_directory};
	unlink ("${host_directory}/${tsm_server}_$health_or_doc.csv");
	
	@commands = (
	["DATABASE STATS:-","DATABASE NAME, TOTAL FS GB, USED DB SPACE GB, FREE SPACE GB, BUFF HIT RATIO, PKG HIT RATIO, LAST REORG, FULL DEVCLASS, LAST BACKUP DATE, NUM PHYSICAL VOLUMES","\"select DATABASE_NAME, INT(TOT_FILE_SYSTEM_MB/1024), INT(USED_DB_SPACE_MB/1024), INT(FREE_SPACE_MB/1024), BUFF_HIT_RATIO, PKG_HIT_RATIO, LAST_REORG, FULL_DEV_CLASS, LAST_BACKUP_DATE, PHYSICAL_VOLUMES from DB \""],
	["DATABASE VOLUMES:-","Location,Total FS Size,Total FS Used,Total Free Space (usable)","\"select * from dbspace\""],	
	["LOG STATS:-","TOTAL SPACE GB, USED SPACE GB, FREE SPACE GB, ACTIVE LOG DIR, MIRROR LOG DIR, ACTIVE FAILOVER LOGDIR, ARCH LOG DIR","\"select  INT(TOTAL_SPACE_MB/1024), INT(USED_SPACE_MB/1024), INT(FREE_SPACE_MB/1024), ACTIVE_LOG_DIR, MIRROR_LOG_DIR, AFAILOVER_LOG_DIR, ARCH_LOG_DIR from log \""],
	["LOG STATS (full stats without column titles):-","FULL LOG STATS","\"Q LOG F=D\""],
	["LIBRARY:-","LIBRARY NAME, LIBRARY TYPE, ACS ID, PRIVATE CATAGORY, SCRATCH CATAGORY, EXTERNAL MANAGER, SHARED, PRIMARY LIBRARY MANAGER, AUTOLABEL, LIBRARY SERIAL NUMBER, RESET DRIVES","\"select LIBRARY_NAME, LIBRARY_TYPE, ACS_ID, PRIVATE_CATEGORY, SCRATCH_CATEGORY, EXTERNAL_MGR, SHARED, PRIMARY_LIB_MGR, AUTOLABEL, LIBRARY_SERIAL, RESETDRIVES FROM LIBRARIES\""],
	["DRIVES:-","LIBRARY NAME, DRIVE NAME, DEVICE TYPE, ONLINE, ELEMENT ID, CLEAN FREQUENCY, DRIVE SERIAL NUMBER","\"select LIBRARY_NAME, DRIVE_NAME, DEVICE_TYPE, ONLINE, ELEMENT, CLEAN_FREQ, DRIVE_SERIAL from DRIVES\""],
	["SERVERS:-","SERVER NAME, HL ADDRESS, LL ADDRESS, NODE NAME","\"select server_name, hl_address, ll_address, node_name from servers\""],
	["PATHS:-","SOURCE NAME, SOURCE TYPE, DESTINATION NAME, DESTINATION TYPE, LIBRARY NAME, NODE NAME, DEVICE, ONLINE","\"select SOURCE_NAME, SOURCE_TYPE, DESTINATION_NAME, DESTINATION_TYPE, LIBRARY_NAME, NODE_NAME, DEVICE, ONLINE from PATHS\""],
	["DEVICE CLASSES:-","DEVCLASS NAME, ACCESS, STGPOOL COUNT, DEVICE TYPE, FORMAT, CAPACITY, MOUNTLIMIT, MOUNT RETENTION, LIBRARY NAME, DIRECTORY, SERVERNAME, HIGH LEVEL ADDRESS, WORM, DRIVE ENCRYPTION","\"select DEVCLASS_NAME, ACCESS_STRATEGY, STGPOOL_COUNT, DEVTYPE, FORMAT, CAPACITY, MOUNTLIMIT, MOUNTRETENTION, LIBRARY_NAME, DIRECTORY, SERVERNAME, HLADDRESS, WORM, DRIVE_ENCRYPTION from devclasses\""],
	["STORAGE POOLS:-","POOL NAME, POOL TYPE, DEVCLASS, CAPACITY (EST), PCT UTIL, PCT MIGR, HI MIG, LOW MIG, MIG PR, NEXT STGPOOL, MAXSIZE, CACHE, COLLOCATE, RECLAIM THRESHOLD, MAXSCRATCH, NUM SCRATCH USED, REUSE DELAY, MIG DELAY, DATA FORMAT, COPY STGPOOL, ACTIVE STGPOOL, DEDUPLICATE","\"select STGPOOL_NAME, POOLTYPE, DEVCLASS, EST_CAPACITY_MB, PCT_UTILIZED, PCT_MIGR, HIGHMIG, LOWMIG, MIGPROCESS, NEXTSTGPOOL, MAXSIZE, CACHE, COLLOCATE, RECLAIM, MAXSCRATCH, NUMSCRATCHUSED, REUSEDELAY, MIGDELAY, DATAFORMAT, COPYSTGPOOLS, ACTIVEDATASTGPOOLS, DEDUPLICATE from STGPOOLS\""],
	["STORAGE POOLS (v8 extended (may fail):-","POOL NAME, POOL TYPE, DEVCLASS, CAPACITY (EST), PCT UTIL, PCT MIGR, HI MIG, LOW MIG, MIG PR, NEXT STGPOOL, MAXSIZE, CACHE, COLLOCATE, RECLAIM THRESHOLD, MAXSCRATCH, NUM SCRATCH USED, REUSE DELAY, MIG DELAY, DATA FORMAT, COPY STGPOOL, ACTIVE STGPOOL, DEDUPLICATE,TOTAL_CLOUD_SPACE_MB,USED_CLOUD_SPACE_MB, LOCAL_EST_CAPACITY_MB,LOCAL_PCT_UTILIZED ","\"select STGPOOL_NAME, POOLTYPE, DEVCLASS, EST_CAPACITY_MB, PCT_UTILIZED, PCT_MIGR, HIGHMIG, LOWMIG, MIGPROCESS, NEXTSTGPOOL, MAXSIZE, CACHE, COLLOCATE, RECLAIM, MAXSCRATCH, NUMSCRATCHUSED, REUSEDELAY, MIGDELAY, DATAFORMAT, COPYSTGPOOLS, ACTIVEDATASTGPOOLS, DEDUPLICATE,TOTAL_CLOUD_SPACE_MB,USED_CLOUD_SPACE_MB, LOCAL_EST_CAPACITY_MB,LOCAL_PCT_UTILIZED from STGPOOLS\""],
	["DISK CLASS VOLUMES:-","VOLUME NAME, POOL NAME, SIZE (MB)","\"select volume_name, stgpool_name, est_capacity_mb from volumes where devclass_name='DISK' order by 2\""],
	["DOMAINS:-","DOMAIN NAME, DEFAULT MC, NUMBER OF NODES, BACKUP RET, ARCHIVE RET, ACTIVE STGPOOLS","\"select DOMAIN_NAME, DEFMGMTCLASS, NUM_NODES, BACKRETENTION, ARCHRETENTION, ACTIVESTGPOOLS FROM DOMAINS\""],
	["POLICY SETS:-","DOMAIN NAME, SET NAME, DEFAULT MC","\"select DOMAIN_NAME, SET_NAME, DEFMGMTCLASS FROM POLICYSETS\""],
	["MANAGEMENT CLASSES:-","DOMAIN NAME, SET NAME, CLASS NAME, DEFAULT MC, MIGRATE REQUIRES BACKUP","\"select DOMAIN_NAME, SET_NAME, CLASS_NAME, DEFAULTMC, MIGREQUIRESBKUP from MGMTCLASSES\""],
	["BACKUP COPYGROUPS:-","DOMAIN NAME, SET NAME, CLASS NAME, VER EXISTS, VER DELETED, RET EXTRA, RET ONLY, MODE, SERIALIZATION, FREQ, DESTINATION, TOC DESTINATION","\"select DOMAIN_NAME, SET_NAME, CLASS_NAME, VEREXISTS, VERDELETED, RETEXTRA, RETONLY, MODE, SERIALIZATION, FREQUENCY, DESTINATION, TOC_DESTINATION FROM BU_COPYGROUPS\""],
	["ARCHIVE COPYGROUPS:-","DOMAIN NAME, SET NAME, CLASS NAME, RET VERSION, SERIALIZATION, DESTINATION","\"select DOMAIN_NAME, SET_NAME, CLASS_NAME, RETVER, SERIALIZATION, DESTINATION FROM AR_COPYGROUPS\""],
	["NODES:-","NODE NAME, PLATFORM, CLIENT_OS_LEVEL, DOMAIN NAME, ARCH DELETE, BACKUP DELETE, VERSION, RELEASE, LEVEL, SUBLEVEL, OPTION SET, TCP ADDRESS, DEDUPLICATION","\"select NODE_NAME, PLATFORM_NAME, CLIENT_OS_LEVEL, DOMAIN_NAME, ARCHDELETE, BACKDELETE, CLIENT_VERSION, CLIENT_RELEASE, CLIENT_LEVEL, CLIENT_SUBLEVEL, OPTION_SET, CLIENT_HLA, DEDUPLICATION FROM NODES\""],
	["NODE FILESPACES:-","NODE NAME, FILESPACE TYPE, CAPACITY (GB), PCT UTILISED (%), SPACE UTILISED (GB), FILESPACE NAME, DECOMM_STATE","\"select node_name, filespace_type, int(capacity/1024), pct_util, int(capacity/1024/100*pct_util), filespace_name, DECOMM_STATE from filespaces where filespace_type !='VSS' and filespace_type not like'API:%'\""],
        ["NODE FILESPACES TOTAL:-","TOTAL AVAILABLE FILESPACE CAPACITY (GB), TOTAL UTILISED FILESPACE CAPACITY (GB), PCT USED of TOTAL ASSIGNED","\"select sum(int(capacity/1024)),sum(int(capacity/1024/100*pct_util)),((sum((capacity/1024/100*pct_util)))/(sum((capacity/1024)))*100) from filespaces where filespace_type !='VSS' and filespace_type not like'API:%'\""],	
	["NODE SCHEDULES:-","DOMAIN NAME, SCHEDULE NAME, ACTION, OPTIONS, OBJECTS, START TIME, DURATION, DUR UNITS, PERIOD, PERIOD UNITS, DAY OF WEEK, SCHED STYLE","\"select DOMAIN_NAME, SCHEDULE_NAME, ACTION, OPTIONS, OBJECTS, STARTTIME, DURATION, DURUNITS, PERIOD, PERUNITS, DAYOFWEEK, SCHED_STYLE FROM CLIENT_SCHEDULES\""],
	["ADMIN SCHEDULES:-","SCHEDULE NAME, COMMAND, START TIME, DURATION, DUR UNITS, PERIOD, PERIOD UNITS, DAY OF WEEK, ACTIVE","\"select SCHEDULE_NAME, COMMAND, STARTTIME, DURATION, DURUNITS, PERIOD, PERUNITS, DAYOFWEEK, ACTIVE, SCHED_STYLE FROM ADMIN_SCHEDULES\""],
	["SUMMARY TABLE 30 DAYS HISTORY:-","ACTIVITY, SUCCESSFUL, COUNT IN 30 DAYS","\"select activity, successful, count(successful) from summary where  start_time>'2000-01-01 00:00' and (start_time >= current_timestamp-720 hours) group by activity, successful order by activity,successful\""],
	["SUMMARY TABLE HOUSEKEEPING FAILURES:-","ACTIVITY, PROCESS, SUCCESSFUL, COUNT IN 30 DAYS","\"select activity, successful, entity, count(successful) from summary where  start_time>'2000-01-01 00:00' and activity != 'BACKUP' and activity != 'RESTORE' and activity != 'ARCHIVE' and activity !='RETRIEVE' and activity !='HSM-MIGRATE' and activity !='RECALL' and successful='NO' and (start_time >= current_timestamp-720 hours) group by activity,entity, successful order by activity,entity, successful\""],
	["SCRIPTS:-","NAME, LINE, COMMAND","\"select NAME, LINE, COMMAND FROM SCRIPTS order by name, line\""],
	["DRM SETTINGS:-","PLAN PREFIX, INTRUCTION PREFIX, NOT MOUNT NAME, COURIER NAME, VAULT NAME, DB EXPIRE DAYS, CHECK LABEL","\"select PLANPREFIX, INSTRPREFIX, NONMOUNTNAME, COURIERNAME, VAULTNAME, DBBEXPIREDAYS, CHECKLABEL FROM DRMSTATUS\""],
	["DRM TAPES:-","VOLUME NAME, STATE, LOCATION, STGPOOL NAME, LIBRARY NAME, VOLUME TYPE","\"select VOLUME_NAME, STATE, LOCATION, STGPOOL_NAME, LIB_NAME, VOLTYPE FROM DRMEDIA\""],
	["OPTIONS:-","AUDIT STORAGE","\"select option_value from options where option_name='AuditStorage'\""],
	["OPTIONS:-","DATE FORMAT","\"select option_value from options where option_name='DateFormat'\""],
	["OPTIONS:-","EXPIRE INTERVAL","\"select option_value from options where option_name='ExpInterval'\""],
	["OPTIONS:-","IDLE TIMEOUT","\"select option_value from options where option_name='IdleTimeOut'\""],
	["OPTIONS:-","MAX SESSIONS","\"select option_value from options where option_name='MaxSessions'\""],
	["OPTIONS:-","MOVE BATCH SIZE","\"select option_value from options where option_name='MoveBatchSize'\""],
	["OPTIONS:-","MOVE SIZE THRESHOLD","\"select option_value from options where option_name='MoveSizeThresh'\""],
	["OPTIONS:-","SAN DISCOVERY","\"select option_value from options where option_name='SANdiscovery'\""],
	["OPTIONS:-","TCP NODELAY","\"select option_value from options where option_name='TCPNoDelay'\""],
	["OPTIONS:-","TCP WINDOWSIZE","\"select option_value from options where option_name='TCPWindowsize'\""],
	["OPTIONS:-","TCP ADMIN PORT","\"select option_value from options where option_name='TcpAdminport'\""],
	["OPTIONS:-","TCP PORT","\"select option_value from options where option_name='TcpPort'\""],
	["OPTIONS:-","TCP ALL","\"q opt\""],
	["STATUS:-","SERVER NAME, SERVER HLA, SERVER LLA, INSTALLATION DATE, PASSWORD EXPIRE DAYS, ACTLOG RET, LICENSE COMPLIENCE, MAXSESSIONS, MAXSCHEDSESSIONS, RANDOMIZE, QUERY SCHED PERIOD, PLATFORM, VERSION, RELEASE, LEVEL, SUBLEVEL","\"SELECT SERVER_NAME, SERVER_HLA, SERVER_LLA, INSTALL_DATE, PASSEXP, ACTLOGRETENTION, LICENSECOMPLIANCE, MAXSESSIONS, MAXSCHEDSESSIONS, RANDOMIZE, QUERYSCHEDPERIOD, PLATFORM, VERSION, RELEASE, LEVEL, SUBLEVEL FROM STATUS\""], 	        
	);
	$count=0;
	
	while ($commands[$count]){
		open (V6_DOCUMENTATION, ">>${host_directory}/${tsm_server}_$health_or_doc.csv") or &been_an_error;
		print V6_DOCUMENTATION $commands[$count][0];
		print V6_DOCUMENTATION "\n";
		print V6_DOCUMENTATION $commands[$count][1];
		print V6_DOCUMENTATION "\n";
		close (V6_DOCUMENTATION);
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt $commands[$count][2]  >> ${host_directory}/${tsm_server}_$health_or_doc.csv");
		print "\r\r\r\r\r\r\r\r\r\r";
		$arraysize=@commands;
		$factor=100/$arraysize;
		$percentage=int($count*$factor);
		print "$percentage";
		print "% complete";
		$count=$count+1;
		}
		print "\r\r\r\r\r\r\r\r\r\r";
		print "100% complete\n";
	} 


###########################################################################
## Subroutine:
## Name: drm_documentation
## DRM documentation
###########################################################################

sub drm_documentation {
	
	unlink ("${host_directory}/${tsm_server}_$health_or_doc.csv");
	chdir ${host_directory};
	
	@commands = (
	
	["MOUNTABLE:-","Volume Name, State, Volume Type","\"select volume_name, state, voltype from drmedia where state='MOUNTABLE'\""],		
	["COURIER:-","Volume Name, State, Volume Type","\"select volume_name, state, voltype from drmedia where state='COURIER'\""],
	["VAULT:-","Volume Name, State, Volume Type","\"select volume_name, state, voltype from drmedia where state='VAULT'\""],
	["VAULTRETRIEVE:-","Volume Name, State, Volume Type","\"select volume_name, state, voltype from drmedia where state='VAULTRETRIEVE'\""],	
	["COURIERRETRIEVE:-","Volume Name, State, Volume Type","\"select volume_name, state, voltype from drmedia where state='COURIERRETRIEVE'\""],	        
	);
	$count=0;
	while ($commands[$count]){
		open (V5_DRM, ">>${host_directory}/${tsm_server}_$health_or_doc.csv") or &been_an_error;
		print V5_DRM $commands[$count][0];
		print V5_DRM "\n";
		print V5_DRM $commands[$count][1];
		print V5_DRM "\n";
		close (V5_DRM);
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt $commands[$count][2]  >> ${host_directory}/${tsm_server}_$health_or_doc.csv");
		$count=$count+1;
		}
	}
	
###########################################################################
## Subroutine:
## Name: missed_files
## Missed files report
###########################################################################

sub missed_files {
	$health_or_doc="missed_files";
	chdir ${host_directory};
	unlink ("${host_directory}/${tsm_server}_$health_or_doc.csv");
	unlink ("${host_directory}/incl_excl.lst");
	unlink ("${host_directory}/EXCLUDE_LIST_UNSORTED.txt");
	unlink ("${host_directory}/EXCLUDE_LIST_SORTED_BY_EXTENSION.txt");
	
	
	@commands = (
	
	["MISSED FILES:-","Date Time,Nodename,Session,Message","\"SELECT date_time,nodename, session, message FROM ACTLOG WHERE  date_time>=current_timestamp - 72 hours AND (ORIGINATOR='CLIENT') AND (MSGNO not between 4991 and 4999) and (severity!='I') ORDER BY nodename\""],		
	
	);
	$count=0;
	
	while ($commands[$count]){
		open (MISSED_FILES, ">>${host_directory}/${tsm_server}_$health_or_doc.csv") or &been_an_error;
		print MISSED_FILES $commands[$count][0];
		print MISSED_FILES "\n";
		print MISSED_FILES $commands[$count][1];
		print MISSED_FILES "\n";
		close (MISSED_FILES);
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt $commands[$count][2]  >> ${host_directory}/${tsm_server}_$health_or_doc.csv");
		$count=$count+1;
		}
		
		open (MISSED_FILES, "<${host_directory}/${tsm_server}_$health_or_doc.csv") or &been_an_error;
		open (INCL_EXCL,">>${host_directory}/incl_excl.lst");
		@read_backup=<MISSED_FILES>;  
	
	foreach $backup_element (@read_backup) {
	     chomp $backup_element;
	     ($backup_time, $backup_nodename, $backup_session, $backup_message ) = (split /,/,$backup_element)[0,1,2,3];
	chomp $backup_time;
	chomp $backup_nodename;
	chomp $backup_session;
	chomp $backup_message;
	
	$backup_message=~s/\'//g;
	$backup_message=~s/ANE4251W System Writer file //g;
	$backup_message=~s/ANE4037E Object //g;
	$backup_message=~s/ANE4987E Error processing //g;
	$backup_message=~s/: not found.  //g;
	$backup_message=~s/(SESSION: $backup_session)//g;
	$backup_message=~s/\\\\\L$backup_nodename\\//g;
	$backup_message=~s/\$\\/:\\/g;
	$backup_message=~s/: the object is in use by another process \(\)//g;
	$backup_message=~s/ANE4005E Error processing //g;
	$backup_message=~s/: file not found \(\)//g;
	$backup_message=~s/: the object is in use by another process \(\)//g;
	$backup_message=~s/\\\\\w*\\//g;
	$backup_message=~s/\\\\\w*-\w\*\\//g;
	$backup_message=~s/ANE4007E Error processing /: access to the object is denied \(\)/g;
	$backup_message=~s/: access to the object is denied \(\)//g;
	$backup_message=~s/\"ANE4007E Error processing //g;
	$backup_message=~s/\(\)//g;
	$backup_message=~s/^\"//g;
	$backup_message=~s/ANE4973E An error occurred accessing NTFS security information for file //g;
	$backup_message=~s/ changed during processing.  Object skipped.//g;
	$backup_message=~s/: file input\/output error//g;
	$backup_message=~s/ANE4023E Error processing //g;
	# $backup_message=~s///g;
	# $backup_message=~s///g;
	# $backup_message=~s///g;
	# $backup_message=~s///g;
	# $backup_message=~s///g;
	
	print INCL_EXCL "$backup_message\n";
	
	
          }
          close (INCL_EXCL);
          
          
          #######################
          
unlink ("${host_directory}/incl_excl_sorted.lst");
unlink ("${host_directory}/incl_excl_sorted_final.lst");

          open my $handle, '<', "${host_directory}/incl_excl.lst";
	  chomp(my @lines = <$handle>);
	  close $handle;
	  ## File in @lines
	  
	  
	  open (INCL_EXCL2,">>${host_directory}/incl_excl_sorted.lst") or &been_an_error;
	  
	 foreach (@lines) { 
	           #print "sorting";
	           $reversed=reverse $_;
   print INCL_EXCL2 "$reversed\n";   
    
  
}
close (INCL_EXCL2);

open my $handle, '<', "${host_directory}/incl_excl_sorted.lst" or &been_an_error;
	  chomp(my @reversing = <$handle>);
	  close $handle;
	  print "\nThinking....\n";
	  @sorted=sort @reversing;
	  
open (INCL_EXCL3,">>${host_directory}/incl_excl_sorted_final.lst") or &been_an_error;


foreach (@sorted) { 
	           #print "sorting";
	           $reversed=reverse $_;
   print INCL_EXCL3 "Define clientopt WINDOWS inclexcl \" EXCLUDE \'$reversed\'\"\n";
}
close (INCL_EXCL3);

open (EXCL_UNSORTED,">>${host_directory}/EXCLUDE_LIST_UNSORTED.txt") or &been_an_error;

foreach (@lines) { 
	           
   print EXCL_UNSORTED "KEY_FOR_TEXT_ST3RT==${_}==KEY_FOR_TEXT_3ND_\n";   
   }
   
   close(EXCL_UNSORTED);

system ("move ${host_directory}/incl_excl_sorted_final.lst ${host_directory}/EXCLUDE_LIST_SORTED_BY_EXTENSION.txt");
unlink ("${host_directory}/incl_excl_sorted.lst");
unlink ("${host_directory}/incl_excl.lst");

print "\nMacros can be found in output directory for EXCLUDE lists!\n";
system ("pause");

################################

} 
	

###########################################################################
## Subroutine:
## Name: node_replication
## Node replication report
###########################################################################

sub node_replication {
	$health_or_doc="replication";
	chdir ${host_directory};
	unlink ("${host_directory}/${tsm_server}_$health_or_doc.csv");
	
	@commands = (
	["DAILY TOTAL AMOUNT SUMMARY vs. BACKUP/ARCHIVE:-","Date	GB Fully Inflated Required Transferred	GB Fully Inflated Actually Transferred	GB Deduped Actually Transferred	GB Backup+Archive","\"select date(r.start_time),(sum(r.TOTBYTES_TO_REPLICATE)/1024/1024/1024),(sum(r.TOTBYTES_REPLICATED)/1024/1024/1024),(sum(r.TOTBYTES_TRANSFERRED)/1024/1024/1024), (select (sum(s.bytes)/1024/1024/1024) from summary s where (activity='BACKUP' or activity='ARCHIVE') and date(s.start_time)=date(r.start_time)) from REPLICATIONVIEW r group by date(r.start_time)\""],
	["REPLICATION NUMBER OF FILES SOURCE->TARGET:-","NODENAME	TYPE	FILESPACE NAME	FSID	NUMBER FILES LOCALLY	REPLICATION TARGET SERVER NAME	NUMBER FILES ON TARGET SERVER","\"q replnode *\""],
	["NODE DAILY TOTAL AMOUNT SUMMARY vs. BACKUP/ARCHIVE:-","Date	Nodename	GB Fully Inflated Required Transferred	GB Fully Inflated Actually Transferred	GB Deduped Actually Transferred	GB Backup+Archive","\"select date(r.start_time),r.node_name,(sum(r.TOTBYTES_TO_REPLICATE)/1024/1024/1024),(sum(r.TOTBYTES_REPLICATED)/1024/1024/1024),(sum(r.TOTBYTES_TRANSFERRED)/1024/1024/1024), (select (sum(s.bytes)/1024/1024/1024) from summary s where (activity='BACKUP' or activity='ARCHIVE') and date(s.start_time)=date(r.start_time) and r.node_name=s.entity) from REPLICATIONVIEW r group by date(r.start_time), r.node_name\""],
	["FILESPACE DAILY TOTAL AMOUNT SUMMARY without BACKUP/ARCHIVE:-","Date,GB Fully Inflated Required Transferred	GB Fully Inflated Actually Transferred	GB Deduped Actually Transferred","\"select date(r.start_time),(sum(r.TOTBYTES_TO_REPLICATE)/1024/1024/1024),(sum(r.TOTBYTES_REPLICATED)/1024/1024/1024),(sum(r.TOTBYTES_TRANSFERRED)/1024/1024/1024) from REPLICATIONVIEW r group by date(r.start_time)\""],
	["FILESPACE DATA AMOUNT SUMMARY:-","Node Name	Start Date	Start Time	End Date	End Time	Filespace Name	GB Fully Inflated Required Transferred	GB Fully Inflated Actually Transferred	GB Deduped Actually Transferred","\"select node_name, date(start_time), time(start_time), date(end_time),time(end_time), FSNAME,((TOTBYTES_TO_REPLICATE)/1024/1024/1024),((TOTBYTES_REPLICATED)/1024/1024/1024),((TOTBYTES_TRANSFERRED)/1024/1024/1024) from REPLICATIONVIEW\""],
	["NODE DATA AMOUNT SUMMARY:-","Node Name	Total GB to Replicate	Total GB Replicated	Total MB Transferred","\"select node_name, sum(TOTBYTES_TO_REPLICATE/1024/1024/1024), sum(TOTBYTES_REPLICATED/1024/1024/1024),sum(TOTBYTES_TRANSFERRED/1024/1024) from replicationview group by node_name\""],	
	["REPLICATION SUMMARY BY DAY:-","Date	GB	Idle Time	Media Wait(s)	Processes	Examined	Affected	Failed","\"select date(start_time),sum(bytes/1024/1024/1024), sum(idle), sum(mediaw), sum(processes), sum(examined),sum(affected),sum(failed) from summary where activity='REPLICATION' group by date(start_time)\""],	
	["FILESPACE REPLICATION SUMMARY:-","Node Name	Filespace Name	FSID	Start Time	End Time	Status	Phase","\"q replication \*\""],
	["NODE REPLICATION STATUS:-","Node Name	Replication Mode	Replication State	Backup Rule	Archive Rule	SpaceMG Rule","\"select node_name,repl_mode,REPL_STATE,REPL_BKRULE,REPL_ARRULE,REPL_SPRULE FROM NODES\""],	
	["FILESPACE REPLICATION DETAILED SUMMARY:-","START_TIME	NODE_NAME	FSNAME	UNICODE_FILESPACE	FSID	PROC_ID	END_TIME	CMD	STATE	PHASE	COMP_STATE	COMP_REASON	BKLAST_UPDATE	BKSERVER	BKFILES_TO_REPL	BKFILES_REPLICATED	BKFILES_REPL_ERROR_TGT	BKFILES_REPL_ERROR_SRC	BKFILES_TO_DELETE	BKFILES_DELETED	BKFILES_DELETE_ERR	BKFILES_TO_UPDATE	BKFILES_UPDATED	BKFILES_UPDATE_ERR	BKBYTES_TO_REPLICATE	BKBYTES_REPLICATED	BKBYTES_TRANSFERRED	BKBYTES_REPL_ERROR_TGT	BKBYTES_REPL_ERROR_SRC	BKFILES_CURRENT	ARLAST_UPDATE	ARSERVER	ARFILES_TO_REPL	ARFILES_REPLICATED	ARFILES_REPL_ERROR_TGT	ARFILES_REPL_ERROR_SRC	ARFILES_TO_DELETE	ARFILES_DELETED	ARFILES_DELETE_ERR	ARFILES_TO_UPDATE	ARFILES_UPDATED	ARFILES_UPDATE_ERR	ARBYTES_TO_REPLICATE	ARBYTES_REPLICATED	ARBYTES_TRANSFERRED	ARBYTES_REPL_ERROR_TGT	ARBYTES_REPL_ERROR_SRC	ARFILES_CURRENT	SMLAST_UPDATE	SMSERVER	SMFILES_TO_REPL	SMFILES_REPLICATED	SMFILES_REPL_ERROR_TGT	SMFILES_REPL_ERROR_SRC	SMFILES_TO_DELETE	SMFILES_DELETED	SMFILES_DELETE_ERR	SMFILES_TO_UPDATE	SMFILES_UPDATED	SMFILES_UPDATE_ERR	SMBYTES_TO_REPLICATE	SMBYTES_REPLICATED	SMBYTES_TRANSFERRED	SMBYTES_REPL_ERROR_TGT	SMBYTES_REPL_ERROR_SRC	SMFILES_CURRENT	TOTFILES_TO_REPLICATE	TOTFILES_REPLICATED	TOTFILES_REPL_ERROR_TGT	TOTFILES_REPL_ERROR_SRC	TOTFILES_TO_DELETE	TOTFILES_DELETED	TOTFILES_DELETE_ERR	TOTFILES_TO_UPDATE	TOTFILES_UPDATED	TOTFILES_UPDATE_ERR	TOTBYTES_TO_REPLICATE	TOTBYTES_REPLICATED	TOTBYTES_TRANSFERRED	TOTBYTES_REPL_ERROR_TGT	TOTBYTES_REPL_ERROR_SRC	TOTFILES_CURRENT","\"select \* from replicationview\""],
	
	);
	$count=0;
	
	while ($commands[$count]){
		open (REPLICATION, ">>${host_directory}/${tsm_server}_$health_or_doc.csv") or &been_an_error;
		print REPLICATION $commands[$count][0];
		print REPLICATION "\n";
		print REPLICATION $commands[$count][1];
		print REPLICATION "\n";
		close (REPLICATION);
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -tabdelimited -optfile=${host_directory}dsm_custom.opt $commands[$count][2]  >> ${host_directory}/${tsm_server}_$health_or_doc.csv");		
		$count=$count+1;
		}
	open(XML_INPUT, "${host_directory}/${tsm_server}_$health_or_doc.csv") or &been_an_error;
my @lines = <XML_INPUT>;
close(XML_INPUT);
my @newlines;
foreach(@lines) {
		$_ =~ s/\"//g;
		$_ =~ s/,//g;
		$_ =~ s/\t/,/g; 
  		push(@newlines,$_);
}

open(XML_OUTPUT, ">${host_directory}/${tsm_server}_$health_or_doc.csv") or &been_an_error;
print XML_OUTPUT @newlines;
close(XML_OUTPUT);
	
		
	} 
	
	
	
###########################################################################
## Subroutine:
## Name: tsm_command_line
## TSM command line
###########################################################################

sub tsm_command_line {
	 $tsmmode="";
	 #use Win32::Console::ANSI;
         #use Term::ANSIColor;

# 0 = Black
# 1 = Blue
# 2 = Green
# 3 = Aqua
# 4 = Red
# 5 = Purple
# 6 = Yellow
# 7 = White
# 8 = Gray
# 9 = Light Blue
# A = Light Green
# B = Light Aqua
# C = Light Red
# D = Light Purple
# E = Light Yellow
# F = Bright White
#
#
# bg:fg
# yellow: e0
# red: c0
# blue: 90
# green: a0
# aqua: b0
# purple: d0
# inverse: f0
# normal 07

COMMANDMENU:	
	while ($tsmmode ne "exittomenu"){
		&draw_heading;
		
########################
######################## Start Menu
########################
	use Term::Menu;
	my $prompt = new Term::Menu (
	beforetext => "MENU Options\n",
	aftertext => "\nChoose Option then press <enter> => ",
	);
	our $tsmmode = $prompt->menu(
        test  =>      			["quick connection test", 't'],
        grep =>				["search using GREP",'g'],
        loop  =>      			["loop mode", 'l'],
        console  =>      		["console mode", 'c'],
        comma  =>      			["commadelimited", 'd'],
        datarate =>			["data rates", 'r'],
        macro  =>      			["macro creator", 'm'],
        san  =>      			["SAN Query", 's'],
        table  =>      			["TSM table query", 'q'],
        credent =>                      ["change tsm credentials",'e'],
        exittomenu  =>      		["exit to main menu", 'x'],
        );
 
####
#### Data Rates
####  
 
 
if ($tsmmode eq "san") {
MACRO:
&draw_heading;
print "SAN Query:\n\n";
&SAN_devices;
}

if ($tsmmode eq "table") {
MACRO:
&draw_heading;
print "Table Query:\n\n";
&table_query;
}

 
if ($tsmmode eq "macro") {
MACRO:
&draw_heading;
print "Macro Creator:\n\n";
&text_editor;
print "\n'q' to quit >";
		$answer=<STDIN>;
		chomp $answer;
		if ($answer ne "q") {
		goto MACRO;
		}
}

if ($tsmmode eq "datarate") {
&draw_heading;
print "Sessions:\n\n";
print "SessionID,NodeName,REC(MB/s),SENT(MB/s)\n";
system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select session_id, client_name, (bytes_received/1024/1024)/(timestampdiff (2,char(current_timestamp-start_time))) from sessions where session_type='Node' order by session_id");	
print "Processes:\n\n";
print "ProcessNum,Process,Files Processed,Rate(MB/s)\n";
system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select process_num, process, files_processed,(BYTES_processed/1024/1024)/(timestampdiff (2,char(current_timestamp-start_time))) from processes order by process_num");	
print "\n";
system ("pause");
}

if ($tsmmode eq "credent") {   
###############
############### Comma delimited
###############
change_credentials;
make_options_file;
get_version;

}
	if ($tsmmode eq "test") { 
		system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -optfile=${host_directory}dsm_custom.opt select server_name,server_hla, version, release,level, sublevel from status");
		system ("pause");
		}	

	if ($tsmmode eq "comma") { 
		system ("start \"$actual_servername\" ${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=no -optfile=${host_directory}dsm_custom.opt -commadelimited");
		}
		

###############
############### GREP
###############

if ($tsmmode eq "grep") { 
COMMANDGREPIN:
&draw_heading;
print "\nSyntax: <command> | grep <string1> | grep <string2> | grep <string3> etc....\n";
print "============================================================================\n\n";
print "<ENTER> to return to menu)\n\n";
print "Enter Command ($tsm_server)>";
$answer = <STDIN>;
chomp $answer;

($grep_command,$grep_1,$grep_2,$grep_3,$grep_4,$grep_5,$grep_6) = (split /\|/,$answer)[0,1,2,3,4,5,6];


chomp $grep_command;
if ($grep_command eq "") { goto COMMANDMENU}
chomp $grep_1;
$grep_1=~s/grep //g;
$grep_1=~s/ //g;
chomp $grep_2;
$grep_2=~s/grep //g;
$grep_2=~s/ //g;
chomp $grep_3;
$grep_3=~s/grep //g;
$grep_3=~s/ //g;
chomp $grep_4;
$grep_4=~s/grep //g;
$grep_4=~s/ //g;
chomp $grep_5;
$grep_5=~s/grep //g;
$grep_5=~s/ //g;
chomp $grep_6;
$grep_6=~s/grep //g;
$grep_6=~s/ //g;
unlink ("${host_directory}/temp_command.txt");
open (OUTPUT,">${host_directory}/temp_command.txt") or &been_an_error;
system ("cls");
print "Running Query...\n";
@commands = (
	
				["\"$grep_command\""],		
	
				);
	
	$query_details=qx(${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=no -commadelimited -optfile=${host_directory}dsm_custom.opt $grep_command);


if ($grep_1 ne "" && $grep_2 ne "" && $grep_3 ne "" && $grep_4 ne "" && $grep_5 ne "" && $grep_6 ne "") {

		foreach (grep((m/$grep_1/i && m/$grep_2/i && m/$grep_3/i && m/$grep_4/i && m/$grep_5/i && m/$grep_6/i), split(/\n/, $query_details)))
		{
		print OUTPUT $_."\n";
		
		}

		}
		
		
if ($grep_1 ne "" && $grep_2 ne "" && $grep_3 ne "" && $grep_4 ne "" && $grep_5 ne "" && $grep_6 eq "") {

		foreach (grep((m/$grep_1/i && m/$grep_2/i && m/$grep_3/i && m/$grep_4/i && m/$grep_5/i), split(/\n/, $query_details))) 
		{
		print OUTPUT $_."\n";
		
		}

		}


if ($grep_1 ne "" && $grep_2 ne "" && $grep_3 ne "" && $grep_4 ne "" && $grep_5 eq "" && $grep_6 eq "") {

		foreach (grep((m/$grep_1/i && m/$grep_2/i && m/$grep_3/i && m/$grep_4/i), split(/\n/, $query_details))) 
		{
		print OUTPUT $_."\n";
		
		}

		}
		
		
if ($grep_1 ne "" && $grep_2 ne "" && $grep_3 ne "" && $grep_4 eq "" && $grep_5 eq "" && $grep_6 eq "") {

		foreach (grep((m/$grep_1/i && m/$grep_2/i && m/$grep_3/i), split(/\n/, $query_details))) 
		{
		print OUTPUT $_."\n";
		
		}

		}



if ($grep_1 ne "" && $grep_2 ne "" && $grep_3 eq "" && $grep_4 eq "" && $grep_5 eq "" && $grep_6 eq "") {

		foreach (grep((m/$grep_1/i && m/$grep_2/i), split(/\n/, $query_details))) 
		{
		print OUTPUT $_."\n";
		
		}

		}
		
		
if ($grep_1 ne "" && $grep_2 eq "" && $grep_3 eq "" && $grep_4 eq "" && $grep_5 eq "" && $grep_6 eq "") {

		foreach (grep(/($grep_1)/i, split(/\n/, $query_details))) 
		{
		print OUTPUT $_."\n";
		
		}

		}


if ($grep_1 eq "" && $grep_2 eq "" && $grep_3 eq "" && $grep_4 eq "" && $grep_5 eq "" && $grep_6 eq "") {

		foreach ($query_details) 
		{
		print OUTPUT $_."\n";
		
		}
		}


close (OUTPUT);
system ("start ${host_directory}/temp_command.txt");
goto COMMANDGREPIN;		

}
###############
############### Console
###############
	
	if ($tsmmode eq "console") { 	
	my $prompt = new Term::Menu (
	beforetext => "CONSOLE COLOR MENU OPTIONS:\n",
	aftertext => "\nChoose color then press <enter> => ",
	);
	our $answer = $prompt->menu(
        normal  =>      		["normal", 'n'],
        yellow  =>      		["yellow", 'y'],
        red  =>      			["red", 'r'],
        blue  =>      			["blue", 'b'],
        green  =>      			["green", 'g'],
        aqua =>				["aqua", 'a'],
        purple  =>      		["purple", 'p'],
        inverse  =>      		["inverse", 'i'],
        
            
  );

# 0 = Black
# 1 = Blue
# 2 = Green
# 3 = Aqua
# 4 = Red
# 5 = Purple
# 6 = Yellow
# 7 = White
# 8 = Gray

# yellow: e0
# red: c0
# blue: 90
# green: a0
# aqua: b0
# purple: d0
# inverse: f0
# normal 0

		if($answer eq "normal"){ $loop_color="07" }
		if($answer eq "yellow"){ $loop_color="60" }
		if($answer eq "red"){ $loop_color="40" }
		if($answer eq "blue"){ $loop_color="10" }
		if($answer eq "green"){ $loop_color="20" }
		if($answer eq "aqua"){ $loop_color=30 }
		if($answer eq "purple"){ $loop_color=50 }
		if($answer eq "inverse"){ $loop_color=70 }
		if($answer eq ""){ $loop_color="07" }


		system ("start \"${actual_servername}\" cmd.exe /T:$loop_color /k ${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=no -optfile=${host_directory}dsm_custom.opt -console");
			
			}
###############
############### Loop
###############
		if ($tsmmode eq "loop") {
	
	my $prompt = new Term::Menu (
	beforetext => "LOOP COLOR MENU OPTIONS:\n",
	aftertext => "\nChoose color then press <enter> => ",
	);
	our $answer = $prompt->menu(
        normal  =>      		["normal", 'n'],
        yellow  =>      		["yellow", 'y'],
        red  =>      			["red", 'r'],
        blue  =>      			["blue", 'b'],
        green  =>      			["green", 'g'],
        aqua =>				["aqua", 'a'],
        purple  =>      		["purple", 'p'],
        inverse  =>      		["inverse", 'i'],
        
            
  );

# yellow: e0
# red: c0
# blue: 90
# green: a0
# aqua: b0
# purple: d0
# inverse: f0
# normal 07

if($answer eq "normal"){ $loop_color="07" }
if($answer eq "yellow"){ $loop_color="e0" }
if($answer eq "red"){ $loop_color="c0" }
if($answer eq "blue"){ $loop_color="90" }
if($answer eq "green"){ $loop_color="a0" }
if($answer eq "aqua"){ $loop_color=b0 }
if($answer eq "purple"){ $loop_color=d0 }
if($answer eq "inverse"){ $loop_color=f0 }
if($answer eq ""){ $loop_color="07" }

			#system ("start ${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=no -optfile=${host_directory}dsm_custom.opt");
			system ("start \"${actual_servername}\" cmd.exe /T:$loop_color /k ${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=no -optfile=${host_directory}dsm_custom.opt");
		}
		
		
	}
}
	
###########################################################################
## Subroutine:
## Name: cleanup
## clean up a few things
###########################################################################

sub cleanup {
	
	close (OPTIONS_FILE);
	close (LOCK_FILE);
	unlink ("${host_directory}/tsmtools.lck");
	unlink ("${host_directory}dsm_custom.opt");
	exit;
}


###########################################################################
## Subroutine:
## Name: service_desk_monitor
## Experiment - will be used in the future again
###########################################################################

sub service_desk_monitor {
use Mail::Sender;
#$sender = new Mail::Sender
#{smtp => 'mail.yourdomain.com', from => 'your@address.com'};
#$sender->MailFile({to => 'some@address.com',
#subject => 'Here is the file',
#msg => "I'm sending you the list you wanted.",
#file => 'filename.txt'});
#$tsm_user="$ARGV[0]";
#$tsm_password="$ARGV[1]";
#$tsm_server="$ARGV[2]";
#$tsm_port="$ARGV[3]";
#$customer_name="$ARGV[4]";
#$smtp_server="$ARGV[5]";
#$from_address="$ARGV[6]";
#$to_address="$ARGV[7]";
#$email_subject="$tsm_server | ";

@commands = (
["\"select nd.node_name,nd.tcp_name,nd.tcp_address,ev.schedule_name,ev.scheduled_start,ev.actual_start,ev.status from nodes nd, events ev where ev.schedule_name not in (select schedule_name from client_schedules where action='COMMAND') and nd.node_name=ev.node_name and ev.status='Failed' and ev.scheduled_start>= current_timestamp-16 minutes\""],
);
system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt $commands[0][0]  > ${host_directory}/servicedesk_failed_backup_$tsm_server.txt");

@commands = (
["\"select nd.node_name,nd.tcp_name,nd.tcp_address,ev.schedule_name,ev.scheduled_start,ev.actual_start,ev.status from nodes nd, events ev where ev.schedule_name not in (select schedule_name from client_schedules where action='COMMAND') and nd.node_name=ev.node_name and ev.status='Missed' and ev.scheduled_start>= current_timestamp-16 minutes\""],
);
system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt $commands[0][0]  > ${host_directory}/servicedesk_missed_backup_$tsm_server.txt");

@commands = (
["\"select nd.node_name,nd.tcp_name,nd.tcp_address,ev.schedule_name,ev.scheduled_start,ev.actual_start,ev.status from nodes nd, events ev where ev.schedule_name in (select schedule_name from client_schedules where action='COMMAND') and nd.node_name=ev.node_name and ev.status='Failed' and ev.scheduled_start>= current_timestamp-16 minutes\""],
);
system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt $commands[0][0]  > ${host_directory}/servicedesk_failed_tdp_$tsm_server.txt");

@commands = (
["\"select nd.node_name,nd.tcp_name,nd.tcp_address,ev.schedule_name,ev.scheduled_start,ev.actual_start,ev.status from nodes nd, events ev where ev.schedule_name in (select schedule_name from client_schedules where action='COMMAND') and nd.node_name=ev.node_name and ev.status='Missed' and ev.scheduled_start>= current_timestamp-16 minutes\""],
);
system ("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt $commands[0][0]  > ${host_directory}/servicedesk_missed_tdp_$tsm_server.txt");
		
#exit;
###############
# Backup Fails
###############
$email_subject="$customer_name | Failed Backup Job Alert";
open (FAILED_LIST, "<${host_directory}/servicedesk_failed_backup_$tsm_server.txt") or &been_an_error;
	@failed_events=<FAILED_LIST>;
	foreach $line_of_file (@failed_events) {	    
	($cl_nodename, $cl_dnsname, $cl_ipaddress, $cl_sched_name, $cl_sched_start, $cl_sched_actual_start, $cl_sched_status) = (split /,/,$line_of_file)[0,1,2,3,4,5,6];
chomp $cl_nodename;
chomp $cl_dnsname;
chomp $cl_ipaddress;
chomp $cl_sched_name;
chomp $cl_sched_start;
chomp $cl_sched_actual_start;
chomp $cl_sched_status;

if ((grep !/ANR2034E/, $line_of_file)&&(grep !/ANS8001I/, $line_of_file)){
my $client_messages=qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt q act begint=-00:20 search=$cl_nodename");
eval {
	(new Mail::Sender)
		->OpenMultipart({smtp=> $smtp_server , to => $to_address ,subject => $email_subject, from => $from_address})
		->Body({ msg => "Email Body: | Unique Client: $cl_dnsname | Error Code: Failed Backup Job | Description: Backup Client $cl_nodename which is installed on Unique Client $cl_dnsname($cl_ipaddress) has failed scheduled backup $cl_sched_name on Backup Server $tsm_server. Check that the Backup Scheduler is running and check Backup Client scheduler logs for further detail|MESSAGES:\n$client_messages||" })
		->Close();
	} or print "Error sending mail: $Mail::Sender::Error\n";
	eval {
	(new Mail::Sender)
		->OpenMultipart({smtp=> $smtp_server , to => $cc_address ,subject => $email_subject, from => $from_address})
		->Body({ msg => "Email Body: | Unique Client: $cl_dnsname | Error Code: Failed Backup Job | Description: Backup Client $cl_nodename which is installed on Unique Client $cl_dnsname($cl_ipaddress) has failed scheduled backup $cl_sched_name on Backup Server $tsm_server. Check that the Backup Scheduler is running and check Backup Client scheduler logs for further detail|MESSAGES:\n$client_messages||" })
		->Close();
	} or print "Error sending mail: $Mail::Sender::Error\n";

close (FAILED_LIST);
}
}
###############
# Backup Misses
###############
$email_subject="$customer_name | Missed Backup Job Alert";
open (FAILED_LIST, "<${host_directory}/servicedesk_missed_backup_$tsm_server.txt") or &been_an_error;
	@failed_events=<FAILED_LIST>;
	foreach $line_of_file (@failed_events) {	    
	($cl_nodename, $cl_dnsname, $cl_ipaddress, $cl_sched_name, $cl_sched_start, $cl_sched_actual_start, $cl_sched_status) = (split /,/,$line_of_file)[0,1,2,3,4,5,6];
chomp $cl_nodename;
chomp $cl_dnsname;
chomp $cl_ipaddress;
chomp $cl_sched_name;
chomp $cl_sched_start;
chomp $cl_sched_actual_start;
chomp $cl_sched_status;
if ((grep !/ANR2034E/, $line_of_file)&&(grep !/ANS8001I/, $line_of_file)){
	my $client_messages=qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt q act begint=-00:20 search=$cl_nodename");
eval {
	(new Mail::Sender)
		->OpenMultipart({smtp=> $smtp_server , to => $to_address ,subject => $email_subject, from => $from_address})
		->Body({ msg => "Email Body: | Unique Client: $cl_dnsname | Error Code: Failed Backup Job | Description: Backup Client $cl_nodename which is installed on Unique Client $cl_dnsname($cl_ipaddress) has failed scheduled backup $cl_sched_name on Backup Server $tsm_server. Check that the Backup Scheduler is running and check Backup Client scheduler logs for further detail|MESSAGES:\n$client_messages||" })
		->Close();
	} or print "Error sending mail: $Mail::Sender::Error\n";
	eval {
	(new Mail::Sender)
		->OpenMultipart({smtp=> $smtp_server , to => $cc_address ,subject => $email_subject, from => $from_address})
		->Body({ msg => "Email Body: | Unique Client: $cl_dnsname | Error Code: Failed Backup Job | Description: Backup Client $cl_nodename which is installed on Unique Client $cl_dnsname($cl_ipaddress) has failed scheduled backup $cl_sched_name on Backup Server $tsm_server. Check that the Backup Scheduler is running and check Backup Client scheduler logs for further detail|MESSAGES:\n$client_messages||" })
		->Close();
	} or print "Error sending mail: $Mail::Sender::Error\n";

close (FAILED_LIST);
}
}

###############
#  TDP Fails
###############
$email_subject="$customer_name | Failed TDP Job Alert";
open (FAILED_LIST, "<${host_directory}/servicedesk_failed_tdp_$tsm_server.txt") or &been_an_error;
	@failed_events=<FAILED_LIST>;
	foreach $line_of_file (@failed_events) {	    
	($cl_nodename, $cl_dnsname, $cl_ipaddress, $cl_sched_name, $cl_sched_start, $cl_sched_actual_start, $cl_sched_status) = (split /,/,$line_of_file)[0,1,2,3,4,5,6];
chomp $cl_nodename;
chomp $cl_dnsname;
chomp $cl_ipaddress;
chomp $cl_sched_name;
chomp $cl_sched_start;
chomp $cl_sched_actual_start;
chomp $cl_sched_status;
if ((grep !/ANR2034E/, $line_of_file)&&(grep !/ANS8001I/, $line_of_file)){
	my $client_messages=qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt q act begint=-00:20 search=$cl_nodename");
eval {
	(new Mail::Sender)
		->OpenMultipart({smtp=> $smtp_server , to => $to_address ,subject => $email_subject, from => $from_address})
		->Body({ msg => "Email Body: | Unique Client: $cl_dnsname | Error Code: Failed TDP Job | Description: Backup Client $cl_nodename which is installed on Unique Client $cl_dnsname($cl_ipaddress) has failed scheduled backup $cl_sched_name on Backup Server $tsm_server. Check that the Backup Scheduler is running and check Backup Client scheduler logs for further detail|MESSAGES:\n$client_messages||" })
		->Close();
	} or print "Error sending mail: $Mail::Sender::Error\n";
eval {
	(new Mail::Sender)
		->OpenMultipart({smtp=> $smtp_server , to => $cc_address ,subject => $email_subject, from => $from_address})
		->Body({ msg => "Email Body: | Unique Client: $cl_dnsname | Error Code: Failed TDP Job | Description: Backup Client $cl_nodename which is installed on Unique Client $cl_dnsname($cl_ipaddress) has failed scheduled backup $cl_sched_name on Backup Server $tsm_server. Check that the Backup Scheduler is running and check Backup Client scheduler logs for further detail|MESSAGES:\n$client_messages||" })
		->Close();
	} or print "Error sending mail: $Mail::Sender::Error\n";
close (FAILED_LIST);
}
}

###############
# TDP Misses
###############
$email_subject="$customer_name | Missed TDP Job Alert";
open (FAILED_LIST, "<${host_directory}/sservicedesk_missed_tdp_$tsm_server.txt") or &been_an_error;
	@failed_events=<FAILED_LIST>;
	foreach $line_of_file (@failed_events) {	    
	($cl_nodename, $cl_dnsname, $cl_ipaddress, $cl_sched_name, $cl_sched_start, $cl_sched_actual_start, $cl_sched_status) = (split /,/,$line_of_file)[0,1,2,3,4,5,6];
chomp $cl_nodename;
chomp $cl_dnsname;
chomp $cl_ipaddress;
chomp $cl_sched_name;
chomp $cl_sched_start;
chomp $cl_sched_actual_start;
chomp $cl_sched_status;
if ((grep !/ANR2034E/, $line_of_file)&&(grep !/ANS8001I/, $line_of_file)){
	my $client_messages=qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt q act begint=-00:20 search=$cl_nodename");
eval {
	(new Mail::Sender)
		->OpenMultipart({smtp=> $smtp_server , to => $to_address ,subject => $email_subject, from => $from_address})
		->Body({ msg => "Email Body: | Unique Client: $cl_dnsname | Error Code: Failed TDP Job | Description: Backup Client $cl_nodename which is installed on Unique Client $cl_dnsname($cl_ipaddress) has failed scheduled backup $cl_sched_name on Backup Server $tsm_server. Check that the Backup Scheduler is running and check Backup Client scheduler logs for further detail|MESSAGES:\n$client_messages||" })
		->Close();
	} or print "Error sending mail: $Mail::Sender::Error\n";
eval {
	(new Mail::Sender)
		->OpenMultipart({smtp=> $smtp_server , to => $cc_address ,subject => $email_subject, from => $from_address})
		->Body({ msg => "Email Body: | Unique Client: $cl_dnsname | Error Code: Failed TDP Job | Description: Backup Client $cl_nodename which is installed on Unique Client $cl_dnsname($cl_ipaddress) has failed scheduled backup $cl_sched_name on Backup Server $tsm_server. Check that the Backup Scheduler is running and check Backup Client scheduler logs for further detail|MESSAGES:\n$client_messages||" })
		->Close();
	} or print "Error sending mail: $Mail::Sender::Error\n";
	
close (FAILED_LIST);
}
}
}	
	









##########################################################################
##########################################################################
##### Main Routine
##########################################################################
##########################################################################

use Term::ReadKey;
##########################################################################
##### Command Line Automation First
##########################################################################

use Getopt::Std;
%options=();
getopts("cdmhpuvtfbs",\%options);
$num_flags=%options;


if (%options) {
$tsm_server="$ARGV[2]";
##${host_directory}="$ARGV[5]";
our ${host_directory}="$ENV{PAR_TEMP}\\inc\\inc\\";
unlink glob("${host_directory}/${tsm_server}_*.xlsx");
}

##########################################################################
##### Run from desktop 
##########################################################################

if (defined $options{t}) {

	$tsm_user="$ARGV[0]";
	$tsm_password="$ARGV[1]";
	$tsm_server="$ARGV[2]";	
	$tsm_port="$ARGV[3]";
	
	make_options_file;
	get_version;
goto MAIN_MENU;		
}

if (defined $options{c}) {

	$tsm_user="$ARGV[0]";
	$tsm_password="$ARGV[1]";
	$tsm_server="$ARGV[2]";	
	$tsm_port="$ARGV[3]";
	$windows_domain="$ARGV[4]";
	$windows_admin="$ARGV[5]";
	$domain_password="$ARGV[6]";
	#system ("powershell \"$secure = ConvertTo-SecureString $domain_password -force -asPlainText\"");
	#system ("powershell \"read-host -assecurestring | convertfrom-securestring | out-file C:\\cred.txt\"");
	system ("powershell \"ConvertTo-SecureString $domain_password -force -asPlainText | convertfrom-securestring | out-file C:\\cred.txt\"");
	make_options_file;
	get_version;
goto MAIN_MENU;		
}


##########################################################################
##### Automatic DRM
##########################################################################

if (defined $options{d}) {	
	use Net::Ping; 
	 use Socket;   
	 $p = Net::Ping->new();
	$tsm_user="$ARGV[0]";
	$tsm_password="$ARGV[1]";
	$tsm_server="$ARGV[2]";
	$tsm_port="$ARGV[3]";
	$customer_name="$ARGV[4]";
	#${host_directory}="$ARGV[5]";
	$health_or_doc="drm";
	chdir ${host_directory};

	make_options_file;
	drm_documentation;	
	get_spreadsheet_params;
	make_spreadsheet;
	$attach_list="$attach_list${host_directory}/${tsm_server}_${tsm_port}_${health_or_doc}_${datetime2}.xlsx,";
	
}



##########################
## Service Desk
##########################
		
if (defined $options{s}) {

	$tsm_user="$ARGV[0]";
	$tsm_password="$ARGV[1]";
	$tsm_server="$ARGV[2]";
	$tsm_port="$ARGV[3]";
	$customer_name="$ARGV[4]";
	$smtp_server="$ARGV[5]";
	$from_address="$ARGV[6]";
	$to_address="$ARGV[7]";
	$cc_address="$ARGV[8]";
	
	
chdir ${host_directory};
make_options_file;
get_version;
service_desk_monitor;
}
##########################
## Run a Healthcheck
##########################
		
if (defined $options{h}) {
		
	use Net::Ping; 
	 use Socket;   
	 $p = Net::Ping->new();
	$tsm_user="$ARGV[0]";
	$tsm_password="$ARGV[1]";
	$tsm_server="$ARGV[2]";
	$tsm_port="$ARGV[3]";
	$customer_name="$ARGV[4]";
	#${host_directory}="$ARGV[5]";
	$health_or_doc="healthcheck";
	chdir ${host_directory};
	make_options_file;
	get_version;
	if ($version == 5) {
			version_5_healthcheck;
			
		}
		elsif ($version == 6) {
			
			version_6_healthcheck;
			
		}	
	get_spreadsheet_params;
	make_spreadsheet;
	$attach_list="$attach_list${host_directory}/${tsm_server}_${tsm_port}_${health_or_doc}_${datetime2}.xlsx,";
					
}


##########################################################################
##### Automatic Plan File
##########################################################################

if (defined $options{p}) {
	
	$plan_directory="$ARGV[8]";
	my $directory = $plan_directory;
	opendir(DIR2, $directory) or &been_an_error;
	@files = grep {! -d "$directory/$_" } readdir(DIR2);
	closedir(DIR2);
	@sorted = sort {-M "$directory$a" <=> -M "$directory$b"} @files; #sort them by modification date most recent to least recent
	$number_elements=scalar @sorted;
	$plan_file=$sorted[$number_elements-1];
	$attach_list="$attach_list$plan_directory/$plan_file,";
	
}

##########################################################################
##### Automatic Usage
##########################################################################

if (defined $options{u}) {
	system ("cls");
	print "StorageTools usage menu\n";
	print "===================\n";
	print "usage:\n\n";
	print "-v latest version from Tectrade\n";
	print "-vt latest version plus live update from Tectrade\n";
	print "-u usage\n";
	print "-c documentation (requires server parameters)\n";
	print "-h healthcheck (requires server parameters)\n";
	print "-d drm tapes (requires server parameters)\n";
	print "-f missed files (requires server parameters)\n";
	print "-m mail (requires server and smtp parameters)\n";
	print "-p planfile (requires server, smtp and drm plan file directory)\n";
	print "-b deduplication report (requires server parameters)\n";
	print "\n";
	print "Order of Parameters\n";
	print "==================\n";
	print "StorageTools.exe <flags> user pass server_addr port customer_name smtp_addr from_email to_email drm_dir\n";
	print "Note: use 8.3 DOS format and forward slashes for directory specs not backslash\n";
}	

##########################################################################
##### Automatic Missed Files
##########################################################################

if (defined $options{f}) {	
	use Net::Ping; 
	 use Socket;   
	 $p = Net::Ping->new();
	$tsm_user="$ARGV[0]";
	$tsm_password="$ARGV[1]";
	$tsm_server="$ARGV[2]";
	$tsm_port="$ARGV[3]";
	$customer_name="$ARGV[4]";
	#${host_directory}="$ARGV[5]";
	$health_or_doc="missed_files";
	chdir ${host_directory};
	make_options_file;
	missed_files;
	get_spreadsheet_params;
	make_spreadsheet;
	$attach_list="$attach_list${host_directory}/${tsm_server}_${tsm_port}_${health_or_doc}_${datetime2}.xlsx,";
			
		
		
}	

##########################################################################
##### Automatic Backup Catalogue
##########################################################################

if (defined $options{b}) {	
	
	$tsm_user="$ARGV[0]";
	$tsm_password="$ARGV[1]";
	$tsm_server="$ARGV[2]";
	$tsm_port="$ARGV[3]";
	$customer_name="$ARGV[4]";
	#${host_directory}="$ARGV[5]";
	$health_or_doc="dedupe";
	chdir ${host_directory};
	make_options_file;
	get_version;
	deduplication_summary;
	get_spreadsheet_params;
	make_spreadsheet;
	$attach_list="$attach_list${host_directory}/${tsm_server}_${tsm_port}_${health_or_doc}_${datetime2}.xlsx,";
			
		
		
}	

##########################################################################
##### Automatic Send The Mail
##########################################################################

if (defined $options{m}) {
	$customer_name="$ARGV[4]";
	$smtp_server="$ARGV[5]";
	$from_address="$ARGV[6]";
	$to_address="$ARGV[7]";
	$email_subject="TSM Daily Report for $customer_name: ($tsm_server)";
	send_the_mail;
	exit;
}	

##########################################################################
##### Automatic Update and Version
##########################################################################

if (defined $options{v}) {
	print "Installed Version $software_version $released\n";
	print "Checking Tectrade for latest version...\n";
	#use LWP::Simple; 
	use File::Download;
	$url="http://software.tectrade.co.uk/TSM/tsmtools/version.txt";
	$content = get($url);
	print "$content";
	die "Can't GET $url from Tectrade" if (! defined $content); 
	#####
	# Update -t flag
	#####
		if (defined $options{t}) {
			print "\nGetting new version from Tectrade";
			my $dwn = File::Download->new({
			overwrite => 1,
			});
		print "\nDownloading from http://software.tectrade.co.uk....\n";
		print $dwn->download('http://software.tectrade.co.uk/TSM/tsmtools/tsmtools.zip');
		print " =>Return Code ";
		print $dwn->status();
		print "\nNew version (zipped) saved in working directory\n";
			
		}
			
	

	exit;
}	

if ($num_flags!=0){
	exit;
	
##########################################################################
##### Otherwise Carry On......
##########################################################################
}

###########################################################################
## Main:
## Name: Main routine
## This is where the main program starts
###########################################################################

##########################################################################
##### Trap Control C
##########################################################################	
$SIG{INT} = \&control_c;        # traps keyboard interrupt

##########################################################################
##### Authenticate, Setup menu and get login details
##########################################################################

###########################################################################
## Subroutine:
## Name: whats_the_day_mate
# the date mate
## Use: What day is it!
###########################################################################

sub whats_the_day_mate {
use Date::Simple (date,today);
## yyyy-mm-dd
$todays_date='2025-02-13';
$diff=today()-date($todays_date);



if ($diff >= 90) { 
	&draw_heading;
	print "\nIMPORTANT:\nThis program cannot run on this server and will exit.\nPlease contact Tectrade Computers Ltd for further information.\n";
	system ("pause");
	exit
	
}
}

&whats_the_day_mate
&draw_heading;
&draw_disclaimer;
&draw_heading;
&authentication;
&draw_heading;
&print_notes;
&draw_heading;

##########################################################################
##### Main Menu
##########################################################################

MAIN_MENU:while (1) {
	draw_main_heading;
	
	use Term::Menu;
	
	my $mainprompt = new Term::Menu (
	beforetext => "MENU Options\n",
	aftertext => "\nChoose Option then press <enter> => ",
	);
	my $mainanswer = $mainprompt->menu(
        
        OPENBADIR  =>      	["*** Access the Output Files Directory ***", 'o'],
        Customer  =>      	["Enter Customer Name (for Spreadsheets)", 'n'],    
        Credentials =>		["Change TSM Credentials or TSM Server", 'e'],    
        TSM => 			["TSM Tools (Docs, Healthchecks, Macros etc.)",'t'],   
        DEDUPE_STATS => 	["TSM IBM Deduplication Statistics (BETA)",'i'],
        DEDUPE_NODE => 	        ["TSM Deduplication Statistics (containers only) Detail per Node (BETA)",'g'],
        DASHBOARD =>		["TSM Micro Healthcheck",'d'],  
        VE => 			["TSM for VE Sizing Tool",'v'],
        ACCOUNTING =>		["TSM Accounting Log Processor",'a'],
        LOGS => 		["TSM Client Log File Access",'l'],
        RERUNFAILED =>		["TSM Re-Run Failed Backups",'r'],
        RERUNMISSED =>		["TSM Re-Run Missed Backups",'m'],
        PERF =>			["TSM Performance Analysis",'p'],
        FRONTEND =>		["TSM Front-End Accounting",'f'],
        STORAGE =>		["IBM Storage Tools and AIX Performance Scripts",'s'],
        BROCADE =>		["Brocade Tools",'b'],
        UNIX =>			["UNIX command line",'x'],
        Quit  =>      		["QUIT Storagetools (exit program)", 'q'], 
      
            
  );


if ($mainanswer eq "UNIX")   {
	&draw_heading;
	if ("$unix_user" eq "" ) {
	&unix_credentials;	
}
	system ("${inc_directory}plink.exe -l ${unix_user} -pw \"${unix_pw}\" ${unix_address}");
}

if ($mainanswer eq "DEDUPE_NODE")   {
	&draw_heading;
	if ("$tsm_user" eq "" ) {
	&set_client;
	&change_credentials;
	&make_options_file;
	&get_version;
	}
	&draw_heading;
	&deduplication_per_node;
	}
	
if ($mainanswer eq "DEDUPE_STATS")   {
	&draw_heading;
	if ("$tsm_user" eq "" ) {
	&set_client;
	&change_credentials;
	&make_options_file;
	&get_version;
	}
	&draw_heading;
	&deduplication_statistics;
	}
	
if ($mainanswer eq "RERUNFAILED")   {
	&draw_heading;
	if ("$tsm_user" eq "" ) {
	&set_client;
	&change_credentials;
	&make_options_file;
	&get_version;
	}
	&rerun_failed_backups;

	}

if ($mainanswer eq "RERUNMISSED")   {
	&draw_heading;
	if ("$tsm_user" eq "" ) {
	&set_client;
	&change_credentials;
	&make_options_file;
	&get_version;
	}
	&rerun_missed_backups;
	
	}

if ($mainanswer eq "Credentials")   {
		change_credentials;
		make_options_file;
		get_version;
	}
if ($mainanswer eq "WMI") {
		&draw_heading;
		#get_live_data;
		make_ip_address_array;
		print "Done....\n";
		system ("pause");
		&draw_heading;
		get_live_data;
		make_WMI_spreadsheet;
		print "Done....\n";
		system ("pause");
	}
	
if ($mainanswer eq "PERF") {
	&draw_heading;
	if ("$tsm_user" eq "" ) {
	&set_client;
	&change_credentials;
	&make_options_file;
	&get_version;
	}	

		
		&draw_heading;
		print "\nPress 's' and then <enter> to skip historical stats >";
		$answer=<STDIN>;
		chomp $answer;
		if ($answer ne "s") {
                &draw_heading;
		print "Performing Process Check.\nPlease Wait - this may take some time...\n";
		get_live_data;
		$health_or_doc="process";
		&perf_stats;
		print "Done....\n";
		get_spreadsheet_params;
		print "Making Spreadsheet....\n";
		make_spreadsheet;
		print "Done....\n";
		}
		print "Running Cumulative Performance Statistics...\n";
		&perf_stats_2;
		system ("pause");
	
	}
	
if ($mainanswer eq "LOGS") {
	&draw_windows_heading;
	if ("$tsm_user" eq "" ) {
	&set_client;
	&change_credentials;
	&make_options_file;
	&get_version;
	}
	&draw_windows_heading;
	if ("$windows_admin" eq "" ) {
	&change_windows_creds;
	}

	&make_log_powershell;
	}
if($mainanswer eq "DASHBOARD"){ 
        
		if ($tsm_user eq ''){
		&draw_heading;
		set_client;
		&draw_heading;
		change_credentials;
		make_options_file;
		get_version;
	}
		# if ($version eq '5') {
			# &draw_heading;
			# print "\n##### You cannot run the Micro Healthcheck on a version 5 server! #####\n";
			# system ("pause");
			# goto MAIN_MENU;
		# }
		# else {
		&draw_heading;
		print "\nPlease Enter Customer Name for Micro Healthcheck: -> ";
		our $customer_name=<STDIN>;
		chomp $customer_name;
		draw_ve_heading;
		graph_dashboard;		
		gd_data;
		make_drive_graphs;
		make_lm_graphs;
		make_process_graphs;
		print "\nDone....\n";
		system ("pause");
		goto MAIN_MENU;
	# }
}

if($mainanswer eq "VE"){ 
        
	
TSMFORVE:while (1) {
	draw_ve_heading;
	
	use Term::Menu;
	
	my $veprompt = new Term::Menu (
	beforetext => "MENU Options\n",
	aftertext => "\nChoose Option then press <enter> => ",
	);
	my $veanswer = $veprompt->menu(
	OPENBADIR  =>      	["*** Access the Output Files Directory ***", 'o'],
        Customer  =>      	["Enter Customer Name (for Spreadsheets)", 'n'],  
        RVTOOLS  =>      	["Process RVTOOLS spreadsheet (Step 1)", 'r'],
        SETTINGS   => 		["Change the Model Parameters (Step 2)", 'p'],
        MODEL   => 		["Run the Model (Step 3 - run after each model change)", 'm'],
        SPREADSHEET   => 	["Make Spreadsheet (Final Step)", 's'],
        Quit  =>      		["RETURN TO PREVIOUS MENU", 'x'], 
        
            
  );
	
	


if ($veanswer eq "SPREADSHEET") { 
	$title="TSM for VE Documentation";
		print "Making TSM for VE Spreadsheet.\nPlease Wait - this may take some time!\n";		
		$health_or_doc="tsmforve";
		
		get_spreadsheet_params;
		print "Making Spreadsheet....\n";
		make_spreadsheet;
		print "Done....\n";
		system ("pause");	
		
		}
		
if ($veanswer eq "Quit") { 
		system ("cls");
		goto MAIN_MENU;
		}



if ($veanswer eq "MODEL"){
print "here!!\n";
draw_ve_heading;
print "Adding Model to .csv file!....";
make_model;
print "done!\n";
system ("pause");		
}

if($veanswer eq "RVTOOLS"){ 
        	


print "\n\nPress Enter to open $cust_directory directory:\n";
system ("pause");
system ("start $cust_directory");
draw_ve_heading;
print "\nEnter name of customer (CAPS are Best. Spaces are Allowed) > ";
our $custname = <STDIN>;
chomp $custname;
draw_ve_heading;
print "Files in Output Directory:\n";
print color 'bold green';

opendir my($dh), $cust_directory or &been_an_error;
while (my $file = readdir($dh)) {

        
        # Use a regular expression to find files ending in .txt
        next unless ($file =~ m/\.xlsx$/);
        print "$file\n";
    }

    closedir $dh;
    
    
print join("\n",values @files); 

print color 'reset';
print "\nIMPORTANT!\n1.The spreadsheet needs to be copied to the output directory\n2.The spreadsheet HAS to be in .xlsx format\n\n"; 
print "\n\nEnter name of customer spreadsheet (.xlsx) > ";
our $xlsname = <STDIN>;
chomp $xlsname;
reset_variables;
xls_convert;
print_heading_in_csv;
rvtools_num_vms;
rvtools_sheet_0;
rvtools_sheet_1;
rvtools_sheet_2;
rvtools_sheet_3;
rvtools_sheet_4;
rvtools_sheet_5;

##
## We don't want these run again on each model so do them here
# This is commented out because vPartion table doesn't include raw
#${total_inuse_MB}=${total_inuse_MB}-${disk_total_capacity_raw_mappings};
$datastore_in_use=int($datastore_in_use-${snapshot_total_storage_MB});
$has_process_been_run="yes";
$biggest_size_of_biggest_vm=$biggest_size_of_biggest_vm/1024;
##
##


}

########################


if($veanswer eq "SETTINGS"){ 
draw_ve_heading;
rv_get_variables;
}


if($veanswer eq "OPENBADIR"){ 
        
	&draw_heading;
	system ("start ${host_directory}");
	
}


if($veanswer eq "Customer"){ 
        
	&draw_heading;
		print "Please Enter Customer Name: -> ";
		our $customer_name=<STDIN>;
		chomp $customer_name;
		;
	
}
}
}

if($mainanswer eq "ACCOUNTING"){ 
##########################################################################
##### Storage Menu
##########################################################################
&draw_heading;
print "Place the dsmaccnt.log file in the output directory\nPress <ENTER> to open the output directory:\n\n";
system ("pause");
system ("start ${host_directory}");
print "\nPress <ENTER> when the file has been copied:\n";
system ("pause");

accounting_log_process;
goto MAIN_MENU;
}

if($mainanswer eq "FRONTEND"){ 
##########################################################################
##### Storage Menu
##########################################################################

$health_or_doc="frontend";
if ($tsm_user eq ''){
		&draw_heading;
		set_client;
		&draw_heading;
		change_credentials;
		make_options_file;
		get_version;
	}
&draw_heading;
print "Running query (this may take some time. Please be patient........)\n";
frontend_licensing;
print "Done....\n";
get_stg_spreadsheet_params;
print "Making Spreadsheet....\n";
make_spreadsheet;
print "Done....\n";
system ("pause");
goto MAIN_MENU;
}


if($mainanswer eq "STORAGE"){ 
##########################################################################
##### Storage Menu
##########################################################################
&draw_heading;
if ($v7000_user eq ''){
storage_credentials;
&draw_heading;
}
STORAGE_MENU:while (1) {
	
	draw_stg_heading;
	
	
	
	use Term::Menu;
	
	my $stgprompt = new Term::Menu (
	beforetext => "MENU Options\n",
	aftertext => "\nChoose Option then press <enter> => ",
	);
	my $stganswer = $stgprompt->menu(
        OPENBADIR  =>      	["*** Access the Output Files Directory ***", 'o'],
        Credentials =>		["Change Storage Credentials", 'e'],
        Customer  =>      	["Enter Customer Name (for Spreadsheets)", 'n'],   
        v7000  =>      		["V3700/V5000/V7000/V9000/SVC Documentation", 'd'],
        v7000U  =>      	["V7000U Documentation", 'u'],
        V7COMMAND  =>      	["V3700/V5000/V7000/V9000/SVC Command Line", 'c'],
        XIV  =>      		["XIV/Spectrum Acc Documentation (requires XCLI installed and IN PATH)", 'x'],
        DS8000  =>      	["DS8000 Documentation (requires DSCLI installed and IN PATH)", 'b'],
        AIX  =>      		["AIX Performance Gathering Scripts (Text Only)", 'a'],
        Quit  =>      		["RETURN TO PREVIOUS MENU", 'x'], 
        
            
  );

##########################################################################
##### Menu Choices
##########################################################################





if($stganswer eq "OPENBADIR"){ 
        
	&draw_heading;
	system ("start ${host_directory}");
	
}

if($stganswer eq "Credentials"){ 
        
	&draw_heading;
	storage_credentials;
	
}

if($stganswer eq "Customer"){ 
        
	&draw_heading;
		print "Please Enter Customer Name: -> ";
		our $customer_name=<STDIN>;
		chomp $customer_name;
		;
	
}

if($stganswer eq "AIX"){ 
	&draw_heading;
	$title="AIX Scripts";
	system("start ${host_directory}THE_BEST_OF.txt");
}
if($stganswer eq "v7000"){ 
        
	
	&draw_heading;
	$title="V7000/SVC Documentation";
		print "Making V3/V5/V7/SVC Documentation.\nPlease Wait - this may take some time!\n";		
		$health_or_doc="v7000";
		v7000_documentation;
		print "Done....\n";
		get_stg_spreadsheet_params;
		print "Making Spreadsheet....\n";
		make_spreadsheet;
		print "Done....\n";
		system ("pause");
	
}


if($stganswer eq "V7COMMAND"){ 

print "Starting command line....\n";   
system ("start ${inc_directory}plink.exe -l ${v7000_user} -pw \"${v7000_pw}\" ${v7000_address} ${v7000_keylocation}");	

	
}

if($stganswer eq "DS8000"){ 
        
	
	&draw_heading;
	$title="DS8000 Documentation";
		print "Making DS8000 Documentation.\nPlease Wait - this may take some time!\n";		
		$health_or_doc="ds8000";
		ds8000;
		print "Done....\n";
		get_stg_spreadsheet_params;
		print "Making Spreadsheet....\n";
		make_spreadsheet;
		print "Done....\n";
		system ("pause");
	
}



if($stganswer eq "v7000U"){ 
        
	
	&draw_heading;
	$title="V7000U Documentation";
		print "Making V7000U Documentation.\nPlease Wait - this may take some time!\n";		
		$health_or_doc="v7000u";
		v7000_u_documentation;
		print "Done....\n";
		get_stg_spreadsheet_params;
		print "Making Spreadsheet....\n";
		make_spreadsheet;
		print "Done....\n";
		system ("pause");
	
}






if($stganswer eq "XIV"){ 
        	
	&draw_heading;
	$title="XIV Documentation";
		print "Making XIV Documentation.\nPlease Wait - this may take some time!\n";		
		$health_or_doc="xiv";
		xiv_documentation;
		print "Done....\n";
		get_stg_spreadsheet_params;
		print "Making Spreadsheet....\n";
		make_spreadsheet;
		print "Done....\n";
		system ("pause");
	
}

if($stganswer eq "Quit"){ 
        
	&draw_heading;	
	goto MAIN_MENU;
	
}
}
}


if($mainanswer eq "BROCADE"){ 
##########################################################################
##### Storage Menu
##########################################################################
&draw_heading;
if ($brocade_user eq ''){
brocade_credentials;
&draw_heading;
}
STORAGE_MENU:while (1) {
	
	draw_stg_heading;
	
	
	
	use Term::Menu;
	
	my $stgprompt = new Term::Menu (
	beforetext => "MENU Options\n",
	aftertext => "\nChoose Option then press <enter> => ",
	);
	my $stganswer = $stgprompt->menu(
        OPENBADIR  =>      	["*** Access the Output Files Directory ***", 'o'],
        Credentials =>		["Change Storage Credentials", 'e'],
        Customer  =>      	["Enter Customer Name (for Spreadsheets)", 'n'],   
        DOCUMENTATION  =>      	["Brocade Documentation", 'd'],
        ANALYSIS  =>      	["Brocade Analysis", 'a'],
        BRCOMMAND  =>      	["Switch Command Line", 'c'],
        NAMESERVER  =>      	["Switch Name Server Contents", 's'],
        Quit  =>      		["RETURN TO PREVIOUS MENU", 'x'], 
        
            
  );

##########################################################################
##### Menu Choices
##########################################################################





if($stganswer eq "OPENBADIR"){ 
        
	&draw_heading;
	system ("start ${host_directory}");
	
}

if($stganswer eq "Credentials"){ 
        
	&draw_heading;
	brocade_credentials;
	
}

if($stganswer eq "Customer"){ 
        
	&draw_heading;
		print "Please Enter Customer Name: -> ";
		our $customer_name=<STDIN>;
		chomp $customer_name;
		;
	
}

if($stganswer eq "DOCUMENTATION"){ 
        
	
	&draw_heading;
	$title="Brocade Documentation";
		print "Making Brocade Documentation.\nPlease Wait - this may take some time!\n";		
		$health_or_doc="brocade";
		brocade_documentation;
		print "Done....\n";
		get_stg_spreadsheet_params;
		print "Making Spreadsheet....\n";
		make_spreadsheet;
		print "Done....\n";
		system ("pause");
	
}


if($stganswer eq "ANALYSIS"){ 
        
	
	&draw_heading;
	$title="Brocade Analysis";
		print "Running Analysis!\n";				
		brocade_monitoring;
		print "Done....\n";
		system ("pause");
	
}

if($stganswer eq "BRCOMMAND"){ 

print "Starting Brocade switch command line....\n";   
system ("start ${inc_directory}plink.exe -l ${brocade_user} -pw \"${brocade_pw}\" ${brocade_address}");	

	
}

if($stganswer eq "NAMESERVER"){ 

&draw_heading;
&brocade_nameserver;	

	
}




if($stganswer eq "Quit"){ 
        
	&draw_heading;	
	goto MAIN_MENU;
	
}
}
}




if($mainanswer eq "TSM"){ 

&draw_heading;


if ($tsm_user eq ''){
set_client;
&draw_heading;
change_credentials;
make_options_file;
get_version;
}
##########################################################################
##### TSM Menu
##########################################################################
TSM_MENU:while (1) {
	&draw_heading;
	
	use Term::Menu;
	
	my $tsmprompt = new Term::Menu (
	beforetext => "MENU Options\n",
	aftertext => "\nChoose Option then press <enter> => ",
	);
	my $tsmanswer = $tsmprompt->menu(
        OPENBADIR  =>      	["*** Access the Output Files Directory ***", 'o'],
        Credentials =>		["Change TSM Credentials or TSM Server", 'e'],
        Customer  =>      	["Enter Customer Name (for Spreadsheets)", 'n'],
        Healthcheck  =>      	["TSM Healthcheck", 'h'],
        DOCS  =>      		["TSM Documentation", 'd'],
        CATALOGUE =>		["TSM Backup Catalogue", 'u'],
        DEDUPE =>      		["TSM Dedupe Catalogue (IBM SELECTS)", 'l'],
        TSMVE =>      		["TSM Node Activity report (including VE)", 'v'],
        MISSED =>      		["TSM Missed Files Spreadsheet (Last 72H) (+EXCLUDE MACROS)", 'f'],
        REPLICATE =>		["TSM Replication Report", 'r'],
        HELIX  =>      		["TSM HELIX Checks", 'c'],
        FILESPACE  =>      	["TSM Filespace Catalogue (Backup History)", 'a'],
        Paths  =>      		["TSM Macros (Policy, Replication, Paths etc.)", 'p'],
        DefNodes  =>      	["TSM Define Nodes from File", 'b'],
        Drive_Graphs =>		["TSM Drive and Process Graphs", 'g'],
        Command  =>      	["TSM Command Lines, Macro Builder, Table Query, Test Connection etc.", 't'],
        
        #WMI  =>      		["WMI Processor Query (requires Powershell installed)", 'w'],               
        #BATCH  =>      	["Run Batch Collection (Doc and Health)", 'b'],     
        #MAILTEST  =>      	["Test The Mail", 'm'],
        Quit  =>      		["RETURN TO PREVIOUS MENU", 'x'], 
        
            
  );

##########################################################################
##### Menu Choices
##########################################################################


if($tsmanswer eq "REPLICATE"){ 
        
	print "Getting Replication Data.\nPlease Wait - this may take some time...\n";
		
		$health_or_doc="replication";
		if ($version == 5) {
			print "Makes no sense to run this. v5!!\n";
			print "Done....\n";
			system ("pause");
			
		}
		elsif ($version == 6) {
		node_replication;
		print "Done....\n";
		get_spreadsheet_params;
		print "Making Spreadsheet....\n";
		make_spreadsheet;
		print "Done....\n";
		system ("pause");
	}
	
	
}

if($tsmanswer eq "Drive_Graphs"){ 
        
		if ($tsm_user eq ''){
		&draw_heading;
		set_client;
		&draw_heading;
		change_credentials;
		make_options_file;
		get_version;
	}
		if ($version eq '5') {
			&draw_heading;
			print "\n##### You cannot run the drive graphs on a version 5 server! #####\n";
			system ("pause");
			goto MAIN_MENU;
		}
		else {
		&draw_heading;
		print "\nPlease Enter Customer Name for Graphs: -> ";
		our $customer_name=<STDIN>;
		chomp $customer_name;
		draw_ve_heading;
		make_drive_graphs;
		make_lm_graphs;
		make_process_graphs;
		print "\nDone....\n";
		system ("pause");
		goto MAIN_MENU;
	}
}

if($tsmanswer eq "OPENBADIR"){ 
        
	&draw_heading;
	system ("start ${host_directory}");
	
}

if($tsmanswer eq "MAILTEST"){ 
        
	&draw_heading;
	test_the_mail;
	
}


	
if($tsmanswer eq "DEDUPE"){ 
get_version;
	if ($version eq '5') {
			print "\nVersion 5!: Make no sense to run this!!\n";
			system ("pause");
		}
		
		
	if ($version eq '6') {
			print "\Creating Dedupe Catalogue!\n";
			&draw_heading;
			$health_or_doc="dedupe";
			deduplication_summary;
			get_spreadsheet_params;
			make_spreadsheet;
			print "\nDone!\n";
			system ("pause");
			
		}	
}

if($tsmanswer eq "TSMVE"){ 
get_version;
	
			print "\Creating TSM for VE Report!\n";
			&draw_heading;
			$health_or_doc="tsmve";
			tsm_ve;
			get_spreadsheet_params;
			make_spreadsheet;
			print "\nDone!\n";
			system ("pause");
			
			
}


if($tsmanswer eq "Graph"){ 
        
	&draw_heading;
	print_node_list;
	while ($node_name eq "") {
		print "\n\nplease enter nodename (q to quit - can't be NULL): ";
		$node_name = <STDIN>;
		chomp $node_name;
		$node_name =~ tr/a-z/A-Z/;
		if (($node_name eq "Q") || ($node_name eq "q")) {
			&draw_heading;
			print "\n\nExiting......\n\n\n";
			cleanup;
			}
		}
		&draw_heading;
		get_live_data;
		accounting_data;
		if ($no_data_for_node eq "0") {
			make_backup_graphs;
			}
		$node_name="";
		}
	elsif ($tsmanswer eq "Healthcheck") {
		&draw_heading;
		TB_adjuster;
		&draw_heading;
		print "Performing Healthcheck.\nPlease Wait - this may take some time...\n";
		get_live_data;
		$health_or_doc="healthcheck";
		if ($version == 5) {
			version_5_healthcheck;
			
		}
		elsif ($version == 6) {
			version_6_healthcheck;
			
		}
		print "Done....\n";
		get_spreadsheet_params;
		print "Making Spreadsheet....\n";
		make_spreadsheet;
		print "Done....\n";
		system ("pause");
	}
	
	elsif ($tsmanswer eq "HELIX") {
		&draw_heading;
		TB_adjuster;
		&draw_heading;
		print "Performing Helix Checks.\nPlease Wait - this may take some time...\n";
		get_live_data;
		$health_or_doc="helix";
		helix_checks;
		print "Done....\n";
		get_spreadsheet_params;
		print "Making Spreadsheet....\n";
		make_spreadsheet;
		print "Done....\n";
		system ("pause");
	}
	
	elsif ($tsmanswer eq "Credentials")   {
		change_credentials;
		make_options_file;
		get_version;
		   
	}
	elsif ($tsmanswer eq "Command") { 
		tsm_command_line;
		
	}
	elsif ($tsmanswer eq "MISSED") {
		print "Working..."; 
		missed_files;
		print "Making Spreadsheet";
		make_spreadsheet;
		;
	}
	
	elsif ($tsmanswer eq "DefNodes") {
		print "Working..."; 
		defnodes;
		
		;
	}
	
	elsif ($tsmanswer eq "CATALOGUE") {
		print "Working..."; 
		$health_or_doc="catalogue";
		get_version;
		backup_catalogue;
		print "Making Spreadsheet";
		get_spreadsheet_params;
		make_spreadsheet;
		print "\nDone!\n";
		system ("pause");
		;
	}
	
	elsif ($tsmanswer eq "FILESPACE") {
		print "Working..."; 
		get_version;
		filespace_catalogue;		
		print "\nDone! CSV files are in output directory!\n";
		system ("pause");
		;
	}
	
	elsif ($tsmanswer eq "Customer") { 
		&draw_heading;
		print "Please Enter Customer Name: -> ";
		our $customer_name=<STDIN>;
		chomp $customer_name;
		;
	}
	elsif ($tsmanswer eq "Quit") { 
		&draw_heading;
		goto MAIN_MENU;
	}
	elsif ($tsmanswer eq "Spreadsheet") {
		&draw_heading;
		get_spreadsheet_params;
		print "Done....\n";
		system ("pause");
	}
	elsif ($tsmanswer eq "Expiration") {
		&draw_heading;
		get_live_data;
		proc_expiration_data;
		draw_expiration_graphs;
		print "Done....\n";
		system ("pause");
	}
	elsif ($tsmanswer eq "Paths") {
		&draw_heading;
		print "Getting some data...\n";
		get_live_data;
		print "Done....\n";
		print "Making Path Macros...\n";
		make_path_macro;
		print "Done....\n";
		print "Making Node Replication Macros...\n";
		setup_node_replication;
		print "Done....\n";
		print "Making Policy Macros...\n";
		make_policy_macro;
		print "Done....\n";
		print "Making Performance CSV's...\n";
		make_performance_data;
		print "Done....\n";
		system ("pause");
	}
	elsif ($tsmanswer eq "WMI") {
		&draw_heading;
		get_live_data;
		make_ip_address_array;
		print "Done....\n";
		system ("pause");
		&draw_heading;
		get_live_data;
		make_WMI_spreadsheet;
		print "Done....\n";
		system ("pause");
	}
	elsif ($tsmanswer eq "PROC") {
		&draw_heading;
		get_live_data;
		make_WMI_spreadsheet;
		print "Done....\n";
		system ("pause");
	
	}
	elsif ($tsmanswer eq "BATCH") {
		&draw_heading;
		batch_collection;
		print "Done....\n";
		system ("pause");

	}
	elsif ($tsmanswer eq "DOCS") {
		&draw_heading;
		TB_adjuster;
		&draw_heading;
		print "Making Documentation.\nPlease Wait - this may take some time.....\n";
		get_live_data;
		$health_or_doc="documentation";
		if ($version == 5) {
			version_5_documentation;
			
		}
		elsif ($version == 6) {
			version_6_documentation;
			
		}
		
		
		print "Done....\n";
		get_spreadsheet_params;
		print "Making Spreadsheet....\n";
		make_spreadsheet;
		print "Done....\n";
		system ("pause");
	
	}
}
}

if($mainanswer eq "Quit"){ 
&draw_heading;	
	exit;
	
}

if($mainanswer eq "OPENBADIR"){ 
        
	&draw_heading;
	system ("start ${host_directory}");
	
}


if($mainanswer eq "Customer"){ 
        
	&draw_heading;
		print "Please Enter Customer Name: -> ";
		our $customer_name=<STDIN>;
		chomp $customer_name;
		;
	
}

}