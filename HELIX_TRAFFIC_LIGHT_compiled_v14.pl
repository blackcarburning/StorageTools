#!/usr/bin/perl

##########################
## Release info SERVICE_TOOLS
##########################

#debug;
# use diagnostics -verbose;
# enable  diagnostics;

our $software_version="v12";
our $released="12th July 2019";

## [‎13/‎06/‎2019 16:45]  Brian Biddlecombe:  
#tools/Pa55word (Windows and TSM)
#Administrator/Pa55word
#10.5.70.193 
 




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

## Make some directories

our ${baclient_directory}="$ENV{PAR_TEMP}\\inc\\inc\\";
system ("mkdir ${baclient_directory}HELIX_BASE_TOOL");
system ("mkdir ${baclient_directory}HELIX_BASE_TOOL\\MACROS");
system ("mkdir ${baclient_directory}HELIX_BASE_TOOL\\OPTION_FILES");
system ("mkdir ${baclient_directory}HELIX_BASE_TOOL\\DOCS");
system ("mkdir ${baclient_directory}HELIX_BASE_TOOL\\TEST_RESULTS");
## Set directory variables
our $base_dir="${baclient_directory}HELIX_BASE_TOOL";
our $macro_dir="${baclient_directory}HELIX_BASE_TOOL\\MACROS";
our $option_dir="${baclient_directory}HELIX_BASE_TOOL\\OPTION_FILES";
our $docs_dir="${baclient_directory}HELIX_BASE_TOOL\\DOCS";
our $test_dir="${baclient_directory}HELIX_BASE_TOOL\\TEST_RESULTS";

our $tsm_server="10.5.70.74";
our $tsm_port="1500";
our $tsm_user="tt_hockingsm";
our $tsm_password="mais1em0";
our $version="Unknown";

# our $host_ps_directory="$ENV{PAR_TEMP}\\inc\\inc";
# our ${host_directory}="$ENV{PAR_TEMP}\\inc\\inc\\";
# our ${baclient_directory}="$ENV{PAR_TEMP}\\inc\\inc\\";
# our $inc_directory="$ENV{PAR_TEMP}\\inc\\inc\\";
# our $cust_directory="$ENV{PAR_TEMP}\\inc\\inc\\";
# our $autodeploy_dir="$ENV{PAR_TEMP}\\inc\\inc\\";
our ${host_ps_directory}=${baclient_directory};
our ${host_directory}=${baclient_directory};
#our ${baclient_directory}="C:\\progra~1\\tivoli\\tsm\\baclient\\";
our ${ba_client_type}="Default Installed";


## Set Some Dates for file naming

our ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime;
$year += 1900;
$mon += 1;
our $datetime = sprintf "%04d%02d%02d%02d%02d%02d", $year, $mon, $mday, $hour, $min, $sec;
print "$datetime\n";
use POSIX;
our $datetime2 = strftime( '%d_%m_%Y', localtime );
chomp $datetime2;


our $policy_win_dly = 0; 
our $policy_win_mon = 0;
our $policy_win_yr = 0;
our $policy_win_img = 0;
our $policy_unx_dly = 0; 
our $policy_unx_mon = 0;
our $policy_unx_yr = 0;
our $policy_unx_img = 0;
#our $policy_exc_vss = 0;
our $policy_exc_dly = 0;
our $policy_exc_wk = 0;
our $policy_exc_mon = 0;
our $policy_exc_yr = 0;
#our $policy_sql_vss = 0;
our $policy_sql_dly = 0;
our $policy_sql_wk = 0;
our $policy_sql_mon = 0;
our $policy_sql_yr = 0;
our $policy_ve_dly = 0;
our $policy_ve_wk = 0;
our $policy_ve_mon = 0;
our $policy_ve_yr = 0;
our $policy_doc_dly = 0;
our $policy_ora_dly = 0;
our $policy_erp_dly = 0;
our $policy_db2_dly = 0;
our $policy_dom_dly = 0;
our $policy_dom_wk = 0;
our $policy_dom_mon = 0;
our $policy_dom_yr = 0;
our $policy_mac_dly = 0;
our $policy_mac_wk = 0;
our $policy_mac_mon = 0;
our $policy_mac_yr = 0;
our $policy_ndmp_dly = 0;
our $policy_ndmp_wk = 0;
our $policy_ndmp_mon = 0;
our $policy_ndmp_yr = 0;
our $policy_snapdiff_dly = 0;
our $policy_snapdiff_wk = 0;
our $policy_snapdiff_mon = 0;
our $policy_snapdiff_yr = 0;



## Subroutines

## Change Credentials
sub change_credentials {
	CREDENTIALS:
		use Win32::Console::ANSI;
		use Term::ANSIColor;
		use Term::ReadKey;
		use Net::Ping;
		#print color 'bold magenta';
		&draw_heading;
		print color 'bold green';
		print "\nplease enter TSM administrator: ";
		print color 'reset';
		our $tsm_user = <STDIN>;
		print color 'bold green';
		print "please enter TSM password: ";
		print color 'reset';
		ReadMode('noecho'); # don't echo
		our $tsm_password = <STDIN>;
		ReadMode(0);        # back to normal
	TSM_ADDRESS:
		print color 'bold green';
		print "\nplease enter TSM server address: ";
		print color 'reset';
		our $tsm_server = <STDIN>;
		print color 'bold green';
		print "please enter TSM server port: ";
		print color 'reset';
		our $tsm_port = <STDIN>;
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
		if ($pinganswer eq "r") {goto CREDENTIALS}
		if ($pinganswer eq "c") {print "Continuing with dubious address....\n"}
		}
		
	if ("$tsm_server" eq "" ) { goto CREDENTIALS;}
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

###
### get_base_drive
###

sub get_base_drive {
	
	use Win32::Console::ANSI;
		use Term::ANSIColor;
		#print color 'bold magenta';
		GET_DRIVE_AGAIN:
		&draw_heading;
		print color 'bold green';
		print "\nplease enter TSM base drive (eg: \"d:\") >";
		print color 'reset';
		our $instance_base_drive = <STDIN>;
		chomp $instance_base_drive;
		if (-d $instance_base_drive) { 
							print "Drive \"$instance_base_drive\" exists! Proceeding to menu...\n";
							system ("pause");
							}
						else {
							print "Drive \"$instance_base_drive\" doesn't exist...try again...\n";
							system ("pause");
							goto GET_DRIVE_AGAIN;
							}
			
}

###########################################################################
## Subroutine:
## Name: been_an_error
## replacement for 'or die'
###########################################################################

sub been_an_error {
                       &draw_heading;
                       print "There has been an error of some kind.\nExiting....";
                       system("pause");
                       exit;
}


sub make_options_file {
	
	open (OPTIONS_FILE, ">${host_directory}dsm_custom.opt");
	print OPTIONS_FILE "tcpserveraddress $tsm_server\n";
	close (OPTIONS_FILE);
	open (OPTIONS_FILE, ">>${host_directory}dsm_custom.opt") or &been_an_error;
	print OPTIONS_FILE "\ntcpport $tsm_port\n";
	close (OPTIONS_FILE);
}
sub get_version {
	
	chdir ${host_directory};
	our $actual_ver=qx("${baclient_directory}dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}/dsm_custom.opt select version from status");
	our $actual_servername=qx("${baclient_directory}dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}/dsm_custom.opt select server_name from status");
	chomp $actual_ver;
	chomp $actual_servername;
	print "$actual_ver";
	print "$actual_servername";
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
	
	if ($actual_ver ne "5" && $actual_ver ne "6" && $actual_ver ne "7" && $actual_ver ne "8" && $actual_ver ne "9") { $version="INVALID"}
	
}
sub set_client {
	&draw_heading;
use Term::Menu;
our $prompt = new Term::Menu (
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
		our $host_ps_directory="C:\\progra~1\\tivoli\\tsm\\baclient\\";
		our ${host_directory}="C:\\progra~1\\tivoli\\tsm\\baclient\\";
		our $baclient_directory="C:\\progra~1\\tivoli\\tsm\\baclient\\";
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


##### Make Devclasses
###

sub make_devclass_macros {
	}
##### Make Macros
###
sub make_policy_macros {
use Time::HiRes qw(gettimeofday);
our $timestamp = int (gettimeofday * 1000);
open (HELIX_MACRO_CREATE, ">${macro_dir}/HELIX_MACRO_CREATE_$timestamp.txt") or &been_an_error;
###
### Macro Create
###		
if ($policy_win_dly == 1 ||  $policy_win_mon == 1 ||  $policy_win_yr == 1 ||  $policy_win_img == 1 || $policy_win_wk == 1) 
{
	print "Windows Domains Required...\n";
	
		if ($policy_win_dly == 1) {
	print HELIX_MACRO_CREATE "/*============= WIN_DLY ==================/*\n";   
	print HELIX_MACRO_CREATE "define domain WIN_DLY desc=\"Generated: $datetime2 - Daily Domain for Windows\"\n";	
	print HELIX_MACRO_CREATE "define policyset WIN_DLY WIN_DLY desc=\"Generated: $datetime2 - Daily Policyset for Windows\"\n";		print HELIX_MACRO_CREATE "define mgmt WIN_DLY WIN_DLY WIN_DLY desc=\"Generated: $datetime2 - Daily Retention Backup Management Class for Windows\"\n";
	print HELIX_MACRO_CREATE "define mgmt WIN_DLY WIN_DLY DIRMC desc=\"Generated: $datetime2 - Daily Directory Retention Backup Management Class for Windows\"\n";		
	print HELIX_MACRO_CREATE "assign DEFMGmtclass WIN_DLY WIN_DLY WIN_DLY\n";	
	print HELIX_MACRO_CREATE "define copygroup WIN_DLY WIN_DLY WIN_DLY STANDARD Type=Backup DESTination=$primary_pool FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=31 RETOnly=31 MODE=MODIFIED SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "define copygroup WIN_DLY WIN_DLY DIRMC STANDARD Type=Backup DESTination=DIRPOOL FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=31 RETOnly=31 MODE=MODIFIED SERialization=SHRSTATIC\"\n";		print HELIX_MACRO_CREATE "define copygroup WIN_DLY WIN_DLY WIN_DLY STANDARD Type=Archive DESTination=$primary_pool FREQuency=CMD RETVer=31 MODE=ABSOLUTE SERialization=SHRSTATIC\"\n";		print HELIX_MACRO_CREATE "activate policyset WIN_DLY WIN_DLY\n\n\n";	
	print HELIX_MACRO_CREATE "y\n\n\n";
	}
	if ($policy_win_wk == 1) {
	print HELIX_MACRO_CREATE "/*============= WIN_WK ==================/*\n";   
	print HELIX_MACRO_CREATE "define domain WIN_WK desc=\"Generated: $datetime2 - Daily Domain for Windows\"\n";	
	print HELIX_MACRO_CREATE "define policyset WIN_WK WIN_WK desc=\"Generated: $datetime2 - Weekly Policyset for Windows\"\n";	
	print HELIX_MACRO_CREATE "define mgmt WIN_WK WIN_WK WIN_WK desc=\"Generated: $datetime2 - Weekly Retention Backup Management Class for Windows\"\n";
	print HELIX_MACRO_CREATE "define mgmt WIN_WK WIN_WK DIRMC desc=\"Generated: $datetime2 - Weekly Directory Retention Backup Management Class for Windows\"\n";		
	print HELIX_MACRO_CREATE "assign DEFMGmtclass WIN_WK WIN_WK WIN_WK\n";	
	print HELIX_MACRO_CREATE "define copygroup WIN_WK WIN_WK WIN_WK STANDARD Type=Backup DESTination=$primary_pool FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=31 RETOnly=31 MODE=MODIFIED SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "define copygroup WIN_WK WIN_WK DIRMC STANDARD Type=Backup DESTination=DIRPOOL FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=31 RETOnly=31 MODE=MODIFIED SERialization=SHRSTATIC\"\n";	
	print HELIX_MACRO_CREATE "define copygroup WIN_WK WIN_WK WIN_WK STANDARD Type=Archive DESTination=$primary_pool FREQuency=CMD RETVer=31 MODE=ABSOLUTE SERialization=SHRSTATIC\"\n";	
	print HELIX_MACRO_CREATE "activate policyset WIN_WK WIN_WK\n\n\n";
	print HELIX_MACRO_CREATE "y\n\n\n";	
	}
	
	if ($policy_win_mon == 1) {
	print HELIX_MACRO_CREATE "/*============= WIN_MON ==================/*\n";   
	print HELIX_MACRO_CREATE "define domain WIN_MON desc=\"Generated: $datetime2 - Monthly Domain for Windows\"\n";	
	print HELIX_MACRO_CREATE "define policyset WIN_MON WIN_MON desc=\"Generated: $datetime2 - Monthly Policyset for Windows\"\n";
	print HELIX_MACRO_CREATE "define mgmt WIN_MON WIN_MON WIN_MON desc=\"Generated: $datetime2 - Monthly Retention Backup Management Class for Windows\"\n";
	print HELIX_MACRO_CREATE "define mgmt WIN_MON WIN_MON DIRMC desc=\"Generated: $datetime2 - Monthly Directory Retention Backup Management Class for Windows\"\n";
	print HELIX_MACRO_CREATE "assign DEFMGmtclass WIN_MON WIN_MON WIN_MON\n";
	print HELIX_MACRO_CREATE "define copygroup WIN_MON WIN_MON WIN_MON STANDARD Type=Backup DESTination=$primary_pool FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=366 RETOnly=366 MODE=MODIFIED SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "define copygroup WIN_MON WIN_MON DIRMC STANDARD Type=Backup DESTination=DIRPOOL FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=366 RETOnly=366 MODE=MODIFIED SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "define copygroup WIN_MON WIN_MON WIN_MON STANDARD Type=Archive DESTination=$primary_pool FREQuency=CMD RETVer=366 MODE=ABSOLUTE SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "activate policyset WIN_MON WIN_MON\n\n\n";
	print HELIX_MACRO_CREATE "y\n\n\n";
	}
	if ($policy_win_yr == 1) {
	print HELIX_MACRO_CREATE "/*============= WIN_YR ==================/*\n";   
	print HELIX_MACRO_CREATE "define domain WIN_YR desc=\"Generated: $datetime2 - Yearly Domain for Windows\"\n";
	print HELIX_MACRO_CREATE "define policyset WIN_YR WIN_YR desc=\"Generated: $datetime2 - Yearly Policyset for Windows\"\n";
	print HELIX_MACRO_CREATE "define mgmt WIN_YR WIN_YR WIN_YR desc=\"Generated: $datetime2 - Yearly Retention Backup Management Class for Windows\"\n";
	print HELIX_MACRO_CREATE "define mgmt WIN_YR WIN_YR DIRMC desc=\"Generated: $datetime2 - Yearly Directory Retention Backup Management Class for Windows\"\n";	
	print HELIX_MACRO_CREATE "assign DEFMGmtclass WIN_YR WIN_YR WIN_YR\n";
	print HELIX_MACRO_CREATE "define copygroup WIN_YR WIN_YR WIN_YR STANDARD Type=Backup DESTination=$primary_pool FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=2562 RETOnly=2562 MODE=MODIFIED SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "define copygroup WIN_YR WIN_YR DIRMC STANDARD Type=Backup DESTination=DIRPOOL FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=2562 RETOnly=2562 MODE=MODIFIED SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "define copygroup WIN_YR WIN_YR WIN_YR STANDARD Type=Archive DESTination=$primary_pool FREQuency=CMD RETVer=2562 MODE=ABSOLUTE SERialization=SHRSTATIC\"\n";	
	print HELIX_MACRO_CREATE "activate policyset WIN_YR WIN_YR\n\n\n";
	print HELIX_MACRO_CREATE "y\n\n\n";
	}
	if ($policy_win_img == 1) {
	print HELIX_MACRO_CREATE "/*============= WIN_IMG==================/*\n";   
	print HELIX_MACRO_CREATE "define domain WIN_DLY desc=\"Generated: $datetime2 - Image Domain for Windows\"\n";	
	print HELIX_MACRO_CREATE "define policyset WIN_DLY WIN_DLY desc=\"Generated: $datetime2 - Image Policyset for Windows\"\n";	
	print HELIX_MACRO_CREATE "define mgmt WIN_DLY WIN_DLY WIN_DLY desc=\"Generated: $datetime2 - Image Backup Management Class for Windows\"\n";		
	print HELIX_MACRO_CREATE "assign DEFMGmtclass WIN_DLY WIN_DLY WIN_DLY\n";	
	print HELIX_MACRO_CREATE "define copygroup WIN_DLY WIN_DLY WIN_DLY STANDARD Type=Backup DESTination=$primary_pool FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=31 RETOnly=31 MODE=MODIFIED SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "define copygroup WIN_DLY WIN_DLY WIN_DLY STANDARD Type=Archive DESTination=$primary_pool FREQuency=CMD RETVer=31 MODE=ABSOLUTE SERialization=SHRSTATIC\"\n";	
	print HELIX_MACRO_CREATE "activate policyset WIN_DLY WIN_DLY\n\n\n";	
	print HELIX_MACRO_CREATE "y\n\n\n";
	}
}

if ($policy_unx_dly == 1 ||  $policy_unx_mon == 1 ||  $policy_unx_yr == 1 ||  $policy_unx_img == 1 || $policy_unx_wk == 1) {
	print "Unix Domains Required...\n";
	if ($policy_unx_dly == 1) {
	print HELIX_MACRO_CREATE "/*============= UNX_DLY ==================/*\n";   
	print HELIX_MACRO_CREATE "define domain UNX_DLY desc=\"Generated: $datetime2 - Daily Domain for UNIX\"\n";	
	print HELIX_MACRO_CREATE "define policyset UNX_DLY UNX_DLY desc=\"Generated: $datetime2 - Daily Policyset for UNIX\"\n";	
	print HELIX_MACRO_CREATE "define mgmt UNX_DLY UNX_DLY UNX_DLY desc=\"Generated: $datetime2 - Daily Retention Backup Management Class for UNIX\"\n";
	print HELIX_MACRO_CREATE "define mgmt UNX_DLY UNX_DLY DIRMC desc=\"Generated: $datetime2 - Daily Directory Retention Backup Management Class for UNIX\"\n";		
	print HELIX_MACRO_CREATE "assign DEFMGmtclass UNX_DLY UNX_DLY UNX_DLY\n";	
	print HELIX_MACRO_CREATE "define copygroup UNX_DLY UNX_DLY UNX_DLY STANDARD Type=Backup DESTination=$primary_pool FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=31 RETOnly=31 MODE=MODIFIED SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "define copygroup UNX_DLY UNX_DLY DIRMC STANDARD Type=Backup DESTination=DIRPOOL FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=31 RETOnly=31 MODE=MODIFIED SERialization=SHRSTATIC\"\n";	
	print HELIX_MACRO_CREATE "define copygroup UNX_DLY UNX_DLY UNX_DLY STANDARD Type=Archive DESTination=$primary_pool FREQuency=CMD RETVer=31 MODE=ABSOLUTE SERialization=SHRSTATIC\"\n";	
	print HELIX_MACRO_CREATE "activate policyset UNX_DLY UNX_DLY\n\n\n";	
	print HELIX_MACRO_CREATE "y\n\n\n";
	}
	if ($policy_unx_wk == 1) {
	print HELIX_MACRO_CREATE "/*============= UNX_WK ==================/*\n";   
	print HELIX_MACRO_CREATE "define domain UNX_WK desc=\"Generated: $datetime2 - Weekly Domain for UNIX\"\n";	
	print HELIX_MACRO_CREATE "define policyset UNX_WK UNX_WK desc=\"Generated: $datetime2 - Weekly Policyset for UNIX\"\n";	
	print HELIX_MACRO_CREATE "define mgmt UNX_WK UNX_WK UNX_WK desc=\"Generated: $datetime2 - Weekly Retention Backup Management Class for UNIX\"\n";
	print HELIX_MACRO_CREATE "define mgmt UNX_WK UNX_WK DIRMC desc=\"Generated: $datetime2 - Weekly Directory Retention Backup Management Class for UNIX\"\n";		
	print HELIX_MACRO_CREATE "assign DEFMGmtclass UNX_WK UNX_WK UNX_WK\n";	
	print HELIX_MACRO_CREATE "define copygroup UNX_WK UNX_WK UNX_WK STANDARD Type=Backup DESTination=$primary_pool FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=31 RETOnly=31 MODE=MODIFIED SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "define copygroup UNX_WK UNX_WK DIRMC STANDARD Type=Backup DESTination=DIRPOOL FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=31 RETOnly=31 MODE=MODIFIED SERialization=SHRSTATIC\"\n";	
	print HELIX_MACRO_CREATE "define copygroup UNX_WK UNX_WK UNX_WK STANDARD Type=Archive DESTination=$primary_pool FREQuency=CMD RETVer=31 MODE=ABSOLUTE SERialization=SHRSTATIC\"\n";	
	print HELIX_MACRO_CREATE "activate policyset UNX_WK UNX_WK\n\n\n";
	print HELIX_MACRO_CREATE "y\n\n\n";	
	}
	if ($policy_unx_mon == 1) {
	print HELIX_MACRO_CREATE "/*============= UNX_MON ==================/*\n";   
	print HELIX_MACRO_CREATE "define domain UNX_MON desc=\"Generated: $datetime2 - Monthly Domain for UNIX\"\n";	
	print HELIX_MACRO_CREATE "define policyset UNX_MON UNX_MON desc=\"Generated: $datetime2 - Monthly Policyset for UNIX\"\n";
	print HELIX_MACRO_CREATE "define mgmt UNX_MON UNX_MON UNX_MON desc=\"Generated: $datetime2 - Monthly Retention Backup Management Class for UNIX\"\n";
	print HELIX_MACRO_CREATE "define mgmt UNX_MON UNX_MON DIRMC desc=\"Generated: $datetime2 - Monthly Directory Retention Backup Management Class for UNIX\"\n";
	print HELIX_MACRO_CREATE "assign DEFMGmtclass UNX_MON UNX_MON UNX_MON\n";
	print HELIX_MACRO_CREATE "define copygroup UNX_MON UNX_MON UNX_MON STANDARD Type=Backup DESTination=$primary_pool FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=366 RETOnly=366 MODE=MODIFIED SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "define copygroup UNX_MON UNX_MON DIRMC STANDARD Type=Backup DESTination=DIRPOOL FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=366 RETOnly=366 MODE=MODIFIED SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "define copygroup UNX_MON UNX_MON UNX_MON STANDARD Type=Archive DESTination=$primary_pool FREQuency=CMD RETVer=366 MODE=ABSOLUTE SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "activate policyset UNX_MON UNX_MON\n\n\n";
	print HELIX_MACRO_CREATE "y\n\n\n";
	}
	if ($policy_unx_yr == 1) {
	print HELIX_MACRO_CREATE "/*============= UNX_YR ==================/*\n";   
	print HELIX_MACRO_CREATE "define domain UNX_YR desc=\"Generated: $datetime2 - Yearly Domain for UNIX\"\n";
	print HELIX_MACRO_CREATE "define policyset UNX_YR UNX_YR desc=\"Generated: $datetime2 - Yearly Policyset for UNIX\"\n";
	print HELIX_MACRO_CREATE "define mgmt UNX_YR UNX_YR UNX_YR desc=\"Generated: $datetime2 - Yearly Retention Backup Management Class for UNIX\"\n";
	print HELIX_MACRO_CREATE "define mgmt UNX_YR UNX_YR DIRMC desc=\"Generated: $datetime2 - Yearly Directory Retention Backup Management Class for UNIX\"\n";	
	print HELIX_MACRO_CREATE "assign DEFMGmtclass UNX_YR UNX_YR UNX_YR\n";
	print HELIX_MACRO_CREATE "define copygroup UNX_YR UNX_YR UNX_YR STANDARD Type=Backup DESTination=$primary_pool FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=2562 RETOnly=2562 MODE=MODIFIED SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "define copygroup UNX_YR UNX_YR DIRMC STANDARD Type=Backup DESTination=DIRPOOL FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=2562 RETOnly=2562 MODE=MODIFIED SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "define copygroup UNX_YR UNX_YR UNX_YR STANDARD Type=Archive DESTination=$primary_pool FREQuency=CMD RETVer=2562 MODE=ABSOLUTE SERialization=SHRSTATIC\"\n";	
	print HELIX_MACRO_CREATE "activate policyset UNX_YR UNX_YR\n\n\n";
	print HELIX_MACRO_CREATE "y\n\n\n";
	}
	if ($policy_unx_img == 1) {
	print HELIX_MACRO_CREATE "/*============= UNX_IMG==================/*\n";   
	print HELIX_MACRO_CREATE "define domain UNX_IMG desc=\"Generated: $datetime2 - Image Domain for UNIX\"\n";	
	print HELIX_MACRO_CREATE "define policyset UNX_IMG UNX_IMG desc=\"Generated: $datetime2 - Image Policyset for UNIX\"\n";	
	print HELIX_MACRO_CREATE "define mgmt UNX_IMG UNX_IMG UNX_IMG desc=\"Generated: $datetime2 - Image Backup Management Class for UNIX\"\n";		
	print HELIX_MACRO_CREATE "assign DEFMGmtclass UNX_IMG UNX_IMG UNX_IMG\n";	
	print HELIX_MACRO_CREATE "define copygroup UNX_IMG UNX_IMG UNX_IMG STANDARD Type=Backup DESTination=$primary_pool FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=31 RETOnly=31 MODE=MODIFIED SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "define copygroup UNX_IMG UNX_IMG UNX_IMG STANDARD Type=Archive DESTination=$primary_pool FREQuency=CMD RETVer=31 MODE=ABSOLUTE SERialization=SHRSTATIC\"\n";	
	print HELIX_MACRO_CREATE "activate policyset UNX_IMG UNX_IMG\n\n\n";
	print HELIX_MACRO_CREATE "y\n\n\n";
	}

}
if ($policy_exc_dly == 1 ||  $policy_exc_wk == 1 || $policy_exc_mon == 1 ||  $policy_exc_yr == 1) {
	print "Exchange Domains Required...\n";
	if ($policy_exc_dly == 1) {
	print HELIX_MACRO_CREATE "/*============= EXC_DLY ==================/*\n";   
	print HELIX_MACRO_CREATE "define domain EXC_DLY desc=\"Generated: $datetime2 - Daily Domain for EXCHANGE\"\n";	
	print HELIX_MACRO_CREATE "define policyset EXC_DLY EXC_DLY desc=\"Generated: $datetime2 - Daily Policyset for EXCHANGE\"\n";	
	print HELIX_MACRO_CREATE "define mgmt EXC_DLY EXC_DLY EXC_DLY desc=\"Generated: $datetime2 - Daily Retention Backup Management Class for EXCHANGE\"\n";
	print HELIX_MACRO_CREATE "define mgmt EXC_DLY EXC_DLY EXC_DLY desc=\"Generated: $datetime2 - Daily Directory Retention Backup Management Class for EXCHANGE\"\n";		
	print HELIX_MACRO_CREATE "assign DEFMGmtclass EXC_DLY EXC_DLY EXC_DLY\n";	
	print HELIX_MACRO_CREATE "define copygroup EXC_DLY EXC_DLY EXC_DLY STANDARD Type=Backup DESTination=$primary_pool FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=31 RETOnly=31 MODE=MODIFIED SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "define copygroup EXC_DLY EXC_DLY EXC_DLY STANDARD Type=Archive DESTination=$primary_pool FREQuency=CMD RETVer=31 MODE=ABSOLUTE SERialization=SHRSTATIC\"\n";	
	print HELIX_MACRO_CREATE "activate policyset EXC_DLY EXC_DLY\n\n\n";	
	print HELIX_MACRO_CREATE "y\n\n\n";
	}
	if ($policy_exc_wk == 1) {
	print HELIX_MACRO_CREATE "/*============= EXC_WK ==================/*\n";   
	print HELIX_MACRO_CREATE "define domain EXC_WK desc=\"Generated: $datetime2 - Weekly Domain for EXCHANGE\"\n";	
	print HELIX_MACRO_CREATE "define policyset EXC_WK EXC_WK desc=\"Generated: $datetime2 - Weekly Policyset for EXCHANGE\"\n";	
	print HELIX_MACRO_CREATE "define mgmt EXC_WK EXC_WK EXC_WK desc=\"Generated: $datetime2 - Weekly Retention Backup Management Class for EXCHANGE\"\n";
	print HELIX_MACRO_CREATE "define mgmt EXC_WK EXC_WK EXC_WK desc=\"Generated: $datetime2 - Weekly Directory Retention Backup Management Class for EXCHANGE\"\n";		
	print HELIX_MACRO_CREATE "assign DEFMGmtclass EXC_WK EXC_WK EXC_WK\n";	
	print HELIX_MACRO_CREATE "define copygroup EXC_WK EXC_WK EXC_WK STANDARD Type=Backup DESTination=$primary_pool FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=31 RETOnly=31 MODE=MODIFIED SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "define copygroup EXC_WK EXC_WK EXC_WK STANDARD Type=Archive DESTination=$primary_pool FREQuency=CMD RETVer=31 MODE=ABSOLUTE SERialization=SHRSTATIC\"\n";	
	print HELIX_MACRO_CREATE "activate policyset EXC_WK EXC_WK\n\n\n";	
	print HELIX_MACRO_CREATE "y\n\n\n";
	}
	if ($policy_exc_mon == 1) {
	print HELIX_MACRO_CREATE "/*============= EXC_MON ==================/*\n";   
	print HELIX_MACRO_CREATE "define domain EXC_MON desc=\"Generated: $datetime2 - Monthly Domain for EXCHANGE\"\n";	
	print HELIX_MACRO_CREATE "define policyset EXC_MON EXC_MON desc=\"Generated: $datetime2 - Monthly Policyset for EXCHANGE\"\n";	
	print HELIX_MACRO_CREATE "define mgmt EXC_MON EXC_MON EXC_MON desc=\"Generated: $datetime2 - Monthly Retention Backup Management Class for EXCHANGE\"\n";
	print HELIX_MACRO_CREATE "define mgmt EXC_MON EXC_MON EXC_MON desc=\"Generated: $datetime2 - Monthly Directory Retention Backup Management Class for EXCHANGE\"\n";		
	print HELIX_MACRO_CREATE "assign DEFMGmtclass EXC_MON EXC_MON EXC_MON\n";	
	print HELIX_MACRO_CREATE "define copygroup EXC_MON EXC_MON EXC_MON STANDARD Type=Backup DESTination=$primary_pool FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=366 RETOnly=366 MODE=MODIFIED SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "define copygroup EXC_MON EXC_MON EXC_MON STANDARD Type=Archive DESTination=$primary_pool FREQuency=CMD RETVer=366 MODE=ABSOLUTE SERialization=SHRSTATIC\"\n";	
	print HELIX_MACRO_CREATE "activate policyset EXC_MON EXC_MON\n\n\n";	
	print HELIX_MACRO_CREATE "y\n\n\n";
	}
	if ($policy_exc_yr == 1) {
	print HELIX_MACRO_CREATE "/*============= EXC_YR ==================/*\n";   
	print HELIX_MACRO_CREATE "define domain EXC_YR desc=\"Generated: $datetime2 - Yearly Domain for EXCHANGE\"\n";	
	print HELIX_MACRO_CREATE "define policyset EXC_YR EXC_YR desc=\"Generated: $datetime2 - Yearly Policyset for EXCHANGE\"\n";	
	print HELIX_MACRO_CREATE "define mgmt EXC_YR EXC_YR EXC_YR desc=\"Generated: $datetime2 - Yearly Retention Backup Management Class for EXCHANGE\"\n";
	print HELIX_MACRO_CREATE "define mgmt EXC_YR EXC_YR EXC_YR desc=\"Generated: $datetime2 - Yearly Directory Retention Backup Management Class for EXCHANGE\"\n";		
	print HELIX_MACRO_CREATE "assign DEFMGmtclass EXC_YR EXC_YR EXC_YR\n";	
	print HELIX_MACRO_CREATE "define copygroup EXC_YR EXC_YR EXC_YR STANDARD Type=Backup DESTination=$primary_pool FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=2556 RETOnly=2556 MODE=MODIFIED SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "define copygroup EXC_YR EXC_YR EXC_YR STANDARD Type=Archive DESTination=$primary_pool FREQuency=CMD RETVer=2556 MODE=ABSOLUTE SERialization=SHRSTATIC\"\n";	
	print HELIX_MACRO_CREATE "activate policyset EXC_YR EXC_YR\n\n\n";	
	print HELIX_MACRO_CREATE "y\n\n\n";
	}
}
if ($policy_sql_dly == 1 ||  $policy_sql_wk == 1 || $policy_sql_mon == 1 ||  $policy_sql_yr == 1 ) {
	print "SQL Domains Required...\n";
	
if ($policy_sql_dly == 1) {
	print HELIX_MACRO_CREATE "/*============= SQL_DLY ==================/*\n";   
	print HELIX_MACRO_CREATE "define domain SQL_DLY desc=\"Generated: $datetime2 - Daily Domain for SQL\"\n";	
	print HELIX_MACRO_CREATE "define policyset SQL_DLY SQL_DLY desc=\"Generated: $datetime2 - Daily Policyset for SQL\"\n";	
	print HELIX_MACRO_CREATE "define mgmt SQL_DLY SQL_DLY SQL_DLY desc=\"Generated: $datetime2 - Daily Retention Backup Management Class for SQL\"\n";
	print HELIX_MACRO_CREATE "define mgmt SQL_DLY SQL_DLY SQLMETA_DLY desc=\"Generated: $datetime2 - Daily Metadata Retention Backup Management Class for SQL\"\n";		
	print HELIX_MACRO_CREATE "assign DEFMGmtclass SQL_DLY SQL_DLY SQL_DLY\n";	
	print HELIX_MACRO_CREATE "define copygroup SQL_DLY SQL_DLY SQL_DLY STANDARD Type=Backup DESTination=$primary_pool FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=31 RETOnly=31 MODE=MODIFIED SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "define copygroup SQL_DLY SQL_DLY SQLMETA_DLY STANDARD Type=Backup DESTination=SQLMETAPOOL FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=31 RETOnly=31 MODE=MODIFIED SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "define copygroup SQL_DLY SQL_DLY SQL_DLY STANDARD Type=Archive DESTination=$primary_pool FREQuency=CMD RETVer=31 MODE=ABSOLUTE SERialization=SHRSTATIC\"\n";	
	print HELIX_MACRO_CREATE "activate policyset SQL_DLY SQL_DLY\n\n\n";
	print HELIX_MACRO_CREATE "y\n\n\n";
	}
	if ($policy_sql_wk == 1) {
	print HELIX_MACRO_CREATE "/*============= SQL_WK ==================/*\n";   
	print HELIX_MACRO_CREATE "define domain SQL_WK desc=\"Generated: $datetime2 - Weekly Domain for SQL\"\n";	
	print HELIX_MACRO_CREATE "define policyset SQL_WK SQL_WK desc=\"Generated: $datetime2 - Weekly Policyset for SQL\"\n";	
	print HELIX_MACRO_CREATE "define mgmt SQL_WK SQL_WK SQL_WK desc=\"Generated: $datetime2 - Weekly Retention Backup Management Class for SQL\"\n";
	print HELIX_MACRO_CREATE "define mgmt SQL_WK SQL_WK SQLMETA_WK desc=\"Generated: $datetime2 - Weekly Metadata Retention Backup Management Class for SQL\"\n";		
	print HELIX_MACRO_CREATE "assign DEFMGmtclass SQL_WK SQL_WK SQL_WK\n";	
	print HELIX_MACRO_CREATE "define copygroup SQL_WK SQL_WK SQL_WK STANDARD Type=Backup DESTination=$primary_pool FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=31 RETOnly=31 MODE=MODIFIED SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "define copygroup SQL_WK SQL_WK SQLMETA_WK STANDARD Type=Backup DESTination=SQLMETAPOOL FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=31 RETOnly=31 MODE=MODIFIED SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "define copygroup SQL_WK SQL_WK SQL_WK STANDARD Type=Archive DESTination=$primary_pool FREQuency=CMD RETVer=31 MODE=ABSOLUTE SERialization=SHRSTATIC\"\n";	
	print HELIX_MACRO_CREATE "activate policyset SQL_WK SQL_WK\n\n\n";
	print HELIX_MACRO_CREATE "y\n\n\n";	
	}
	if ($policy_sql_mon == 1) {
	print HELIX_MACRO_CREATE "/*============= SQL_MON ==================/*\n";   
	print HELIX_MACRO_CREATE "define domain SQL_MON desc=\"Generated: $datetime2 - Monthly Domain for SQL\"\n";	
	print HELIX_MACRO_CREATE "define policyset SQL_MON SQL_MON desc=\"Generated: $datetime2 - Monthly Policyset for SQL\"\n";	
	print HELIX_MACRO_CREATE "define mgmt SQL_MON SQL_MON SQL_MON desc=\"Generated: $datetime2 - Monthly Retention Backup Management Class for SQL\"\n";
	print HELIX_MACRO_CREATE "define mgmt SQL_MON SQL_MON SQLMETA_MON desc=\"Generated: $datetime2 - Monthly Metadata Retention Backup Management Class for SQL\"\n";		
	print HELIX_MACRO_CREATE "assign DEFMGmtclass SQL_MON SQL_MON SQL_MON\n";	
	print HELIX_MACRO_CREATE "define copygroup SQL_MON SQL_MON SQL_MON STANDARD Type=Backup DESTination=$primary_pool FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=366 RETOnly=366 MODE=MODIFIED SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "define copygroup SQL_MON SQL_MON SQLMETA_MON STANDARD Type=Backup DESTination=SQLMETAPOOL FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=366 RETOnly=366 MODE=MODIFIED SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "define copygroup SQL_MON SQL_MON SQL_MON STANDARD Type=Archive DESTination=$primary_pool FREQuency=CMD RETVer=366 MODE=ABSOLUTE SERialization=SHRSTATIC\"\n";	
	print HELIX_MACRO_CREATE "activate policyset SQL_MON SQL_MON\n\n\n";
	print HELIX_MACRO_CREATE "y\n\n\n";	
	}
	if ($policy_sql_yr == 1) {
	print HELIX_MACRO_CREATE "/*============= SQL_YR ==================/*\n";   
	print HELIX_MACRO_CREATE "define domain SQL_YR desc=\"Generated: $datetime2 - Yearly Domain for SQL\"\n";	
	print HELIX_MACRO_CREATE "define policyset SQL_YR SQL_YR desc=\"Generated: $datetime2 - Yearly Policyset for SQL\"\n";	
	print HELIX_MACRO_CREATE "define mgmt SQL_YR SQL_YR SQL_YR desc=\"Generated: $datetime2 - Yearly Retention Backup Management Class for SQL\"\n";
	print HELIX_MACRO_CREATE "define mgmt SQL_YR SQL_YR SQLMETA_YR desc=\"Generated: $datetime2 - Yearly Metadata Retention Backup Management Class for SQL\"\n";		
	print HELIX_MACRO_CREATE "assign DEFMGmtclass SQL_YR SQL_YR SQL_YR\n";	
	print HELIX_MACRO_CREATE "define copygroup SQL_YR SQL_YR SQL_YR STANDARD Type=Backup DESTination=$primary_pool FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=2556 RETOnly=2556 MODE=MODIFIED SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "define copygroup SQL_YR SQL_YR SQLMETA_YR STANDARD Type=Backup DESTination=SQLMETAPOOL FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=2556 RETOnly=2556 MODE=MODIFIED SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "define copygroup SQL_YR SQL_YR SQL_YR STANDARD Type=Archive DESTination=$primary_pool FREQuency=CMD RETVer=2556 MODE=ABSOLUTE SERialization=SHRSTATIC\"\n";	
	print HELIX_MACRO_CREATE "activate policyset SQL_YR SQL_YR\n\n\n";
	print HELIX_MACRO_CREATE "y\n\n\n";	
	}
	
}

if ($policy_ve_dly == 1 ||  $policy_ve_wk == 1 || $policy_ve_mon == 1 ||  $policy_ve_yr == 1 ) {
	print "SP for VE Domains Required...\n";
	if ($policy_ve_dly == 1) {
	print HELIX_MACRO_CREATE "/*============= VE_DLY ==================/*\n";   
	print HELIX_MACRO_CREATE "define domain VE_DLY desc=\"Generated: $datetime2 - Daily Domain for DP for VE\"\n";	
	print HELIX_MACRO_CREATE "define policyset VE_DLY VE_DLY desc=\"Generated: $datetime2 - Daily Policyset for DP for VE\"\n";	
	print HELIX_MACRO_CREATE "define mgmt VE_DLY VE_DLY VE_DLY desc=\"Generated: $datetime2 - Daily Retention Backup Management Class for DP for VE\"\n";
	print HELIX_MACRO_CREATE "define mgmt VE_DLY VE_DLY VE_DLY desc=\"Generated: $datetime2 - Daily Directory Retention Backup Management Class for DP for VE\"\n";		
	print HELIX_MACRO_CREATE "assign DEFMGmtclass VE_DLY VE_DLY VE_DLY\n";	
	print HELIX_MACRO_CREATE "define copygroup VE_DLY VE_DLY VE_DLY STANDARD Type=Backup DESTination=$primary_pool FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=31 RETOnly=31 MODE=MODIFIED SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "define copygroup VE_DLY VE_DLY VE_DLY STANDARD Type=Archive DESTination=$primary_pool FREQuency=CMD RETVer=31 MODE=ABSOLUTE SERialization=SHRSTATIC\"\n";	
	print HELIX_MACRO_CREATE "activate policyset VE_DLY VE_DLY\n\n\n";
	print HELIX_MACRO_CREATE "y\n\n\n";	
	}
	if ($policy_ve_wk == 1) {
	print HELIX_MACRO_CREATE "/*============= VE_WK ==================/*\n";   
	print HELIX_MACRO_CREATE "define domain VE_WK desc=\"Generated: $datetime2 - Weekly Domain for DP for VE\"\n";	
	print HELIX_MACRO_CREATE "define policyset VE_WK VE_WK desc=\"Generated: $datetime2 - Weekly Policyset for DP for VE\"\n";	
	print HELIX_MACRO_CREATE "define mgmt VE_WK VE_WK VE_WK desc=\"Generated: $datetime2 - Weekly Retention Backup Management Class for DP for VE\"\n";
	print HELIX_MACRO_CREATE "define mgmt VE_WK VE_WK VE_WK desc=\"Generated: $datetime2 - Weekly Directory Retention Backup Management Class for DP for VE\"\n";		
	print HELIX_MACRO_CREATE "assign DEFMGmtclass VE_WK VE_WK VE_WK\n";	
	print HELIX_MACRO_CREATE "define copygroup VE_WK VE_WK VE_WK STANDARD Type=Backup DESTination=$primary_pool FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=31 RETOnly=31 MODE=MODIFIED SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "define copygroup VE_WK VE_WK VE_WK STANDARD Type=Archive DESTination=$primary_pool FREQuency=CMD RETVer=31 MODE=ABSOLUTE SERialization=SHRSTATIC\"\n";	
	print HELIX_MACRO_CREATE "activate policyset VE_WK VE_WK\n\n\n";
	print HELIX_MACRO_CREATE "y\n\n\n";	
	}
	if ($policy_ve_mon == 1) {
	print HELIX_MACRO_CREATE "/*============= VE_MON ==================/*\n";   
	print HELIX_MACRO_CREATE "define domain VE_MON desc=\"Generated: $datetime2 - Monthly Domain for DP for VE\"\n";	
	print HELIX_MACRO_CREATE "define policyset VE_MON VE_MON desc=\"Generated: $datetime2 - Monthly Policyset for DP for VE\"\n";	
	print HELIX_MACRO_CREATE "define mgmt VE_MON VE_MON VE_MON desc=\"Generated: $datetime2 - Monthly Retention Backup Management Class for DP for VE\"\n";
	print HELIX_MACRO_CREATE "define mgmt VE_MON VE_MON VE_MON desc=\"Generated: $datetime2 - Monthly Directory Retention Backup Management Class for DP for VE\"\n";		
	print HELIX_MACRO_CREATE "assign DEFMGmtclass VE_MON VE_MON VE_MON\n";	
	print HELIX_MACRO_CREATE "define copygroup VE_MON VE_MON VE_MON STANDARD Type=Backup DESTination=$primary_pool FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=366 RETOnly=366 MODE=MODIFIED SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "define copygroup VE_MON VE_MON VE_MON STANDARD Type=Archive DESTination=$primary_pool FREQuency=CMD RETVer=366 MODE=ABSOLUTE SERialization=SHRSTATIC\"\n";	
	print HELIX_MACRO_CREATE "activate policyset VE_MON VE_MON\n\n\n";
	print HELIX_MACRO_CREATE "y\n\n\n";	
	}
	if ($policy_ve_yr == 1) {
	print HELIX_MACRO_CREATE "/*============= VE_YR ==================/*\n";   
	print HELIX_MACRO_CREATE "define domain VE_YR desc=\"Generated: $datetime2 - Yearly Domain for DP for VE\"\n";	
	print HELIX_MACRO_CREATE "define policyset VE_YR VE_YR desc=\"Generated: $datetime2 - Yearly Policyset for DP for VE\"\n";	
	print HELIX_MACRO_CREATE "define mgmt VE_YR VE_YR VE_YR desc=\"Generated: $datetime2 - Yearly Retention Backup Management Class for DP for VE\"\n";
	print HELIX_MACRO_CREATE "define mgmt VE_YR VE_YR VE_YR desc=\"Generated: $datetime2 - Yearly Directory Retention Backup Management Class for DP for VE\"\n";		
	print HELIX_MACRO_CREATE "assign DEFMGmtclass VE_YR VE_YR VE_YR\n";	
	print HELIX_MACRO_CREATE "define copygroup VE_YR VE_YR VE_YR STANDARD Type=Backup DESTination=$primary_pool FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=2556 RETOnly=2556 MODE=MODIFIED SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "define copygroup VE_YR VE_YR VE_YR STANDARD Type=Archive DESTination=$primary_pool FREQuency=CMD RETVer=2556 MODE=ABSOLUTE SERialization=SHRSTATIC\"\n";	
	print HELIX_MACRO_CREATE "activate policyset VE_YR VE_YR\n\n\n";
	print HELIX_MACRO_CREATE "y\n\n\n";	
	}
}

if ($policy_doc_dly == 1 ) {
	print "Docave Domain Required...\n";
	if ($policy_doc_dly == 1) {
	print HELIX_MACRO_CREATE "/*============= DOCAV ==================/*\n";   
	print HELIX_MACRO_CREATE "define domain DOCAV desc=\"Generated: $datetime2 - Daily Domain for DP for VE\"\n";	
	print HELIX_MACRO_CREATE "define policyset DOCAV DOCAV desc=\"Generated: $datetime2 - Daily Policyset for DP for VE\"\n";	
	print HELIX_MACRO_CREATE "define mgmt DOCAV DOCAV DOCAV desc=\"Generated: $datetime2 - Daily Retention Backup Management Class for DP for VE\"\n";
	print HELIX_MACRO_CREATE "define mgmt DOCAV DOCAV DOCAV desc=\"Generated: $datetime2 - Daily Directory Retention Backup Management Class for DP for VE\"\n";		
	print HELIX_MACRO_CREATE "assign DEFMGmtclass DOCAV DOCAV DOCAV\n";	
	print HELIX_MACRO_CREATE "define copygroup DOCAV DOCAV DOCAV STANDARD Type=Backup DESTination=$primary_pool FREQuency=0 VERExists=1 VERDeleted=0 RETExtra=0 RETOnly=0 MODE=MODIFIED SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "define copygroup DOCAV DOCAV DOCAV STANDARD Type=Archive DESTination=$primary_pool FREQuency=CMD RETVer=31 MODE=ABSOLUTE SERialization=SHRSTATIC\"\n";	
	print HELIX_MACRO_CREATE "activate policyset DOCAV DOCAV\n\n\n";
	print HELIX_MACRO_CREATE "y\n\n\n";	
	}
}
if ($policy_ora_dly == 1 ) {
	print "Oracle Domain Required...\n";
	if ($policy_ora_dly == 1) {
	print HELIX_MACRO_CREATE "/*============= ORACLE ==================/*\n";   
	print HELIX_MACRO_CREATE "define domain ORACLE desc=\"Generated: $datetime2 - Daily Domain for ORACLE\"\n";	
	print HELIX_MACRO_CREATE "define policyset ORACLE ORACLE desc=\"Generated: $datetime2 - Daily Policyset for ORACLE\"\n";	
	print HELIX_MACRO_CREATE "define mgmt ORACLE ORACLE ORACLE desc=\"Generated: $datetime2 - Daily Retention Backup Management Class for ORACLE\"\n";
	print HELIX_MACRO_CREATE "define mgmt ORACLE ORACLE ORACLE desc=\"Generated: $datetime2 - Daily Directory Retention Backup Management Class for ORACLE\"\n";		
	print HELIX_MACRO_CREATE "assign DEFMGmtclass ORACLE ORACLE ORACLE\n";	
	print HELIX_MACRO_CREATE "define copygroup ORACLE ORACLE ORACLE STANDARD Type=Backup DESTination=$primary_pool FREQuency=0 VERExists=1 VERDeleted=0 RETExtra=0 RETOnly=0 MODE=MODIFIED SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "define copygroup ORACLE ORACLE ORACLE STANDARD Type=Archive DESTination=$primary_pool FREQuency=CMD RETVer=31 MODE=ABSOLUTE SERialization=SHRSTATIC\"\n";	
	print HELIX_MACRO_CREATE "activate policyset ORACLE ORACLE\n\n\n";
	print HELIX_MACRO_CREATE "y\n\n\n";	
	}
}

if ($policy_erp_dly == 1 ) {
	print "SAP ERP (Oracle) Domain Required...\n";
	if ($policy_erp_dly == 1) {
	print HELIX_MACRO_CREATE "/*============= ERP_ORACLE ==================/*\n";   
	print HELIX_MACRO_CREATE "define domain ERP_ORACLE desc=\"Generated: $datetime2 - Daily Domain for ERP for ORACLE\"\n";	
	print HELIX_MACRO_CREATE "define policyset ERP_ORACLE ERP_ORACLE desc=\"Generated: $datetime2 - Daily Policyset for ERP for ORACLE\"\n";	
	print HELIX_MACRO_CREATE "define mgmt ERP_ORACLE ERP_ORACLE ERP_ORACLE desc=\"Generated: $datetime2 - Daily Retention Backup Management Class for ERP for ORACLE\"\n";
	print HELIX_MACRO_CREATE "define mgmt ERP_ORACLE ERP_ORACLE ERP_ORACLE desc=\"Generated: $datetime2 - Daily Directory Retention Backup Management Class for ERP for ORACLE\"\n";		
	print HELIX_MACRO_CREATE "assign DEFMGmtclass ERP_ORACLE ERP_ORACLE ERP_ORACLE\n";	
	print HELIX_MACRO_CREATE "define copygroup ERP_ORACLE ERP_ORACLE ERP_ORACLE STANDARD Type=Backup DESTination=$primary_pool FREQuency=0 VERExists=1 VERDeleted=0 RETExtra=0 RETOnly=0 MODE=MODIFIED SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "define copygroup ERP_ORACLE ERP_ORACLE ERP_ORACLE STANDARD Type=Archive DESTination=$primary_pool FREQuency=CMD RETVer=31 MODE=ABSOLUTE SERialization=SHRSTATIC\"\n";	
	print HELIX_MACRO_CREATE "activate policyset ERP_ORACLE ERP_ORACLE\n\n\n";
	print HELIX_MACRO_CREATE "y\n\n\n";	
	}
}if ($policy_db2_dly == 1 ) {
	print "SAP ERP (DB2) Domain Required...\n";
	if ($policy_db2_dly == 1) {
	print HELIX_MACRO_CREATE "/*============= ERP_DB2 ==================/*\n";   
	print HELIX_MACRO_CREATE "define domain ERP_DB2 desc=\"Generated: $datetime2 - Daily Domain for ERP for DB2\"\n";	
	print HELIX_MACRO_CREATE "define policyset ERP_DB2 ERP_DB2 desc=\"Generated: $datetime2 - Daily Policyset for ERP for DB2\"\n";	
	print HELIX_MACRO_CREATE "define mgmt ERP_DB2 ERP_DB2 ERP_DB2 desc=\"Generated: $datetime2 - Daily Retention Backup Management Class for ERP for DB2\"\n";
	print HELIX_MACRO_CREATE "define mgmt ERP_DB2 ERP_DB2 ERP_DB2 desc=\"Generated: $datetime2 - Daily Directory Retention Backup Management Class for ERP for DB2\"\n";		
	print HELIX_MACRO_CREATE "assign DEFMGmtclass ERP_DB2 ERP_DB2 ERP_DB2\n";	
	print HELIX_MACRO_CREATE "define copygroup ERP_DB2 ERP_DB2 ERP_DB2 STANDARD Type=Backup DESTination=$primary_pool FREQuency=0 VERExists=1 VERDeleted=0 RETExtra=0 RETOnly=0 MODE=MODIFIED SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "define copygroup ERP_DB2 ERP_DB2 ERP_DB2 STANDARD Type=Archive DESTination=$primary_pool FREQuency=CMD RETVer=31 MODE=ABSOLUTE SERialization=SHRSTATIC\"\n";	
	print HELIX_MACRO_CREATE "activate policyset ERP_DB2 ERP_DB2\n\n\n";
	print HELIX_MACRO_CREATE "y\n\n\n";	
	}
}
if ($policy_dom_dly == 1 ||  $policy_dom_wk == 1 ||  $policy_dom_mon == 1 ||  $policy_dom_yr == 1 ) {
	print "Domino Domains Required...\n";
	if ($policy_dom_dly == 1) {
	print HELIX_MACRO_CREATE "/*============= DOMINO_DLY ==================/*\n";   
	print HELIX_MACRO_CREATE "define domain DOMINO_DLY desc=\"Generated: $datetime2 - Daily Domain for DP for DOMINO\"\n";	
	print HELIX_MACRO_CREATE "define policyset DOMINO_DLY DOMINO_DLY desc=\"Generated: $datetime2 - Daily Policyset for DP for DOMINO\"\n";	
	print HELIX_MACRO_CREATE "define mgmt DOMINO_DLY DOMINO_DLY DOMINO_DLY desc=\"Generated: $datetime2 - Daily Retention Backup Management Class for DP for DOMINO\"\n";
	print HELIX_MACRO_CREATE "define mgmt DOMINO_DLY DOMINO_DLY DOMINO_DLY desc=\"Generated: $datetime2 - Daily Directory Retention Backup Management Class for DP for DOMINO\"\n";		
	print HELIX_MACRO_CREATE "assign DEFMGmtclass DOMINO_DLY DOMINO_DLY DOMINO_DLY\n";	
	print HELIX_MACRO_CREATE "define copygroup DOMINO_DLY DOMINO_DLY DOMINO_DLY STANDARD Type=Backup DESTination=$primary_pool FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=7 RETOnly=7 MODE=MODIFIED SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "define copygroup DOMINO_DLY DOMINO_DLY DOMINO_DLY STANDARD Type=Archive DESTination=$primary_pool FREQuency=CMD RETVer=31 MODE=ABSOLUTE SERialization=SHRSTATIC\"\n";	
	print HELIX_MACRO_CREATE "activate policyset DOMINO_DLY DOMINO_DLY\n\n\n";
	print HELIX_MACRO_CREATE "y\n\n\n";	
	}
	if ($policy_dom_wk == 1) {
	print HELIX_MACRO_CREATE "/*============= DOMINO_WK ==================/*\n";   
	print HELIX_MACRO_CREATE "define domain DOMINO_WK desc=\"Generated: $datetime2 - Weekly Domain for DP for DOMINO\"\n";	
	print HELIX_MACRO_CREATE "define policyset DOMINO_WK DOMINO_WK desc=\"Generated: $datetime2 - Weekly Policyset for DP for DOMINO\"\n";	
	print HELIX_MACRO_CREATE "define mgmt DOMINO_WK DOMINO_WK DOMINO_WK desc=\"Generated: $datetime2 - Weekly Retention Backup Management Class for DP for DOMINO\"\n";
	print HELIX_MACRO_CREATE "define mgmt DOMINO_WK DOMINO_WK DOMINO_WK desc=\"Generated: $datetime2 - Weekly Directory Retention Backup Management Class for DP for DOMINO\"\n";		
	print HELIX_MACRO_CREATE "assign DEFMGmtclass DOMINO_WK DOMINO_WK DOMINO_WK\n";	
	print HELIX_MACRO_CREATE "define copygroup DOMINO_WK DOMINO_WK DOMINO_WK STANDARD Type=Backup DESTination=$primary_pool FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=15 RETOnly=15 MODE=MODIFIED SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "define copygroup DOMINO_WK DOMINO_WK DOMINO_WK STANDARD Type=Archive DESTination=$primary_pool FREQuency=CMD RETVer=31 MODE=ABSOLUTE SERialization=SHRSTATIC\"\n";	
	print HELIX_MACRO_CREATE "activate policyset DOMINO_WK DOMINO_WK\n\n\n";
	print HELIX_MACRO_CREATE "y\n\n\n";	
	}
	if ($policy_dom_mon == 1) {
	print HELIX_MACRO_CREATE "/*============= DOMINO_MON ==================/*\n";   
	print HELIX_MACRO_CREATE "define domain DOMINO_MON desc=\"Generated: $datetime2 - Monthly Domain for DP for DOMINO\"\n";	
	print HELIX_MACRO_CREATE "define policyset DOMINO_MON DOMINO_MON desc=\"Generated: $datetime2 - Monthly Policyset for DP for DOMINO\"\n";	
	print HELIX_MACRO_CREATE "define mgmt DOMINO_MON DOMINO_MON DOMINO_MON desc=\"Generated: $datetime2 - Monthly Retention Backup Management Class for DP for DOMINO\"\n";
	print HELIX_MACRO_CREATE "define mgmt DOMINO_MON DOMINO_MON DOMINO_MON desc=\"Generated: $datetime2 - Monthly Directory Retention Backup Management Class for DP for DOMINO\"\n";		
	print HELIX_MACRO_CREATE "assign DEFMGmtclass DOMINO_MON DOMINO_MON DOMINO_MON\n";	
	print HELIX_MACRO_CREATE "define copygroup DOMINO_MON DOMINO_MON DOMINO_MON STANDARD Type=Backup DESTination=$primary_pool FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=366 RETOnly=366 MODE=MODIFIED SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "define copygroup DOMINO_MON DOMINO_MON DOMINO_MON STANDARD Type=Archive DESTination=$primary_pool FREQuency=CMD RETVer=366 MODE=ABSOLUTE SERialization=SHRSTATIC\"\n";	
	print HELIX_MACRO_CREATE "activate policyset DOMINO_MON DOMINO_MON\n\n\n";
	print HELIX_MACRO_CREATE "y\n\n\n";	
	}
	if ($policy_dom_yr == 1) {
	print HELIX_MACRO_CREATE "/*============= DOMINO_YR ==================/*\n";   
	print HELIX_MACRO_CREATE "define domain DOMINO_YR desc=\"Generated: $datetime2 - Yearly Domain for DP for DOMINO\"\n";	
	print HELIX_MACRO_CREATE "define policyset DOMINO_YR DOMINO_YR desc=\"Generated: $datetime2 - Yearly Policyset for DP for DOMINO\"\n";	
	print HELIX_MACRO_CREATE "define mgmt DOMINO_YR DOMINO_YR DOMINO_YR desc=\"Generated: $datetime2 - Yearly Retention Backup Management Class for DP for DOMINO\"\n";
	print HELIX_MACRO_CREATE "define mgmt DOMINO_YR DOMINO_YR DOMINO_YR desc=\"Generated: $datetime2 - Yearly Directory Retention Backup Management Class for DP for DOMINO\"\n";		
	print HELIX_MACRO_CREATE "assign DEFMGmtclass DOMINO_YR DOMINO_YR DOMINO_YR\n";	
	print HELIX_MACRO_CREATE "define copygroup DOMINO_YR DOMINO_YR DOMINO_YR STANDARD Type=Backup DESTination=$primary_pool FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=2556 RETOnly=2556 MODE=MODIFIED SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "define copygroup DOMINO_YR DOMINO_YR DOMINO_YR STANDARD Type=Archive DESTination=$primary_pool FREQuency=CMD RETVer=2556 MODE=ABSOLUTE SERialization=SHRSTATIC\"\n";	
	print HELIX_MACRO_CREATE "activate policyset DOMINO_YR DOMINO_YR\n\n\n";
	print HELIX_MACRO_CREATE "y\n\n\n";	
	}
}
if ($policy_mac_dly == 1 ||  $policy_mac_wk == 1 ||  $policy_mac_mon == 1 ||  $policy_mac_yr == 1 ) {
	print "Mac Domains Required...\n";
	if ($policy_mac_dly == 1) {
	print HELIX_MACRO_CREATE "/*============= MAC_DLY ==================/*\n";   
	print HELIX_MACRO_CREATE "define domain MAC_DLY desc=\"Generated: $datetime2 - Daily Domain for Mac\"\n";	
	print HELIX_MACRO_CREATE "define policyset MAC_DLY MAC_DLY desc=\"Generated: $datetime2 - Daily Policyset for Mac\"\n";	
	print HELIX_MACRO_CREATE "define mgmt MAC_DLY MAC_DLY MAC_DLY desc=\"Generated: $datetime2 - Daily Retention Backup Management Class for Mac\"\n";
	print HELIX_MACRO_CREATE "define mgmt MAC_DLY MAC_DLY MAC_DLY desc=\"Generated: $datetime2 - Daily Directory Retention Backup Management Class for Mac\"\n";		
	print HELIX_MACRO_CREATE "assign DEFMGmtclass MAC_DLY MAC_DLY MAC_DLY\n";	
	print HELIX_MACRO_CREATE "define copygroup MAC_DLY MAC_DLY MAC_DLY STANDARD Type=Backup DESTination=$primary_pool FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=31 RETOnly=31 MODE=MODIFIED SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "define copygroup MAC_DLY MAC_DLY MAC_DLY STANDARD Type=Backup DESTination=DIRPOOL FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=31 RETOnly=31 MODE=MODIFIED SERialization=SHRSTATIC\"\n";	
	print HELIX_MACRO_CREATE "define copygroup MAC_DLY MAC_DLY MAC_DLY STANDARD Type=Archive DESTination=$primary_pool FREQuency=CMD RETVer=31 MODE=ABSOLUTE SERialization=SHRSTATIC\"\n";	
	print HELIX_MACRO_CREATE "activate policyset MAC_DLY MAC_DLY\n\n\n";
	print HELIX_MACRO_CREATE "y\n\n\n";	
	}
	if ($policy_mac_wk == 1) {
	print HELIX_MACRO_CREATE "/*============= MAC_WK ==================/*\n";   
	print HELIX_MACRO_CREATE "define domain MAC_WK desc=\"Generated: $datetime2 - Daily Domain for Mac\"\n";	
	print HELIX_MACRO_CREATE "define policyset MAC_WK MAC_WK desc=\"Generated: $datetime2 - Daily Policyset for Mac\"\n";	
	print HELIX_MACRO_CREATE "define mgmt MAC_WK MAC_WK MAC_WK desc=\"Generated: $datetime2 - Daily Retention Backup Management Class for Mac\"\n";
	print HELIX_MACRO_CREATE "define mgmt MAC_WK MAC_WK MAC_WK desc=\"Generated: $datetime2 - Daily Directory Retention Backup Management Class for Mac\"\n";		
	print HELIX_MACRO_CREATE "assign DEFMGmtclass MAC_WK MAC_WK MAC_WK\n";	
	print HELIX_MACRO_CREATE "define copygroup MAC_WK MAC_WK MAC_WK STANDARD Type=Backup DESTination=$primary_pool FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=31 RETOnly=31 MODE=MODIFIED SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "define copygroup MAC_WK MAC_WK MAC_WK STANDARD Type=Backup DESTination=DIRPOOL FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=31 RETOnly=31 MODE=MODIFIED SERialization=SHRSTATIC\"\n";	
	print HELIX_MACRO_CREATE "define copygroup MAC_WK MAC_WK MAC_WK STANDARD Type=Archive DESTination=$primary_pool FREQuency=CMD RETVer=31 MODE=ABSOLUTE SERialization=SHRSTATIC\"\n";	
	print HELIX_MACRO_CREATE "activate policyset MAC_WK MAC_WK\n\n\n";
	print HELIX_MACRO_CREATE "y\n\n\n";	
	}
	
	if ($policy_mac_mon == 1) {
	print HELIX_MACRO_CREATE "/*============= MAC_MON ==================/*\n";   
	print HELIX_MACRO_CREATE "define domain MAC_MON desc=\"Generated: $datetime2 - Monthly Domain for Mac\"\n";	
	print HELIX_MACRO_CREATE "define policyset MAC_MON MAC_MON desc=\"Generated: $datetime2 - Monthly Policyset for Mac\"\n";
	print HELIX_MACRO_CREATE "define mgmt MAC_MON MAC_MON MAC_MON desc=\"Generated: $datetime2 - Monthly Retention Backup Management Class for Mac\"\n";
	print HELIX_MACRO_CREATE "define mgmt MAC_MON MAC_MON MAC_MON desc=\"Generated: $datetime2 - Monthly Directory Retention Backup Management Class for Mac\"\n";
	print HELIX_MACRO_CREATE "assign DEFMGmtclass MAC_MON MAC_MON MAC_MON\n";
	print HELIX_MACRO_CREATE "define copygroup MAC_MON MAC_MON MAC_MON STANDARD Type=Backup DESTination=$primary_pool FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=366 RETOnly=366 MODE=MODIFIED SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "define copygroup MAC_MON MAC_MON MAC_MON STANDARD Type=Backup DESTination=DIRPOOL FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=366 RETOnly=366 MODE=MODIFIED SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "define copygroup MAC_MON MAC_MON MAC_MON STANDARD Type=Archive DESTination=$primary_pool FREQuency=CMD RETVer=366 MODE=ABSOLUTE SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "activate policyset MAC_MON MAC_MON\n\n\n";
	print HELIX_MACRO_CREATE "y\n\n\n";
	}
	if ($policy_mac_yr == 1) {
	print HELIX_MACRO_CREATE "/*============= MAC_YR ==================/*\n";   
	print HELIX_MACRO_CREATE "define domain MAC_YR desc=\"Generated: $datetime2 - Yearly Domain for Mac\"\n";
	print HELIX_MACRO_CREATE "define policyset MAC_YR MAC_YR desc=\"Generated: $datetime2 - Yearly Policyset for Mac\"\n";
	print HELIX_MACRO_CREATE "define mgmt MAC_YR MAC_YR MAC_YR desc=\"Generated: $datetime2 - Yearly Retention Backup Management Class for Mac\"\n";
	print HELIX_MACRO_CREATE "define mgmt MAC_YR MAC_YR MAC_YR desc=\"Generated: $datetime2 - Yearly Directory Retention Backup Management Class for Mac\"\n";	
	print HELIX_MACRO_CREATE "assign DEFMGmtclass MAC_YR MAC_YR MAC_YR\n";
	print HELIX_MACRO_CREATE "define copygroup MAC_YR MAC_YR MAC_YR STANDARD Type=Backup DESTination=$primary_pool FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=2562 RETOnly=2562 MODE=MODIFIED SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "define copygroup MAC_YR MAC_YR MAC_YR STANDARD Type=Backup DESTination=DIRPOOL FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=2562 RETOnly=2562 MODE=MODIFIED SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "define copygroup MAC_YR MAC_YR MAC_YR STANDARD Type=Archive DESTination=$primary_pool FREQuency=CMD RETVer=2562 MODE=ABSOLUTE SERialization=SHRSTATIC\"\n";	
	print HELIX_MACRO_CREATE "activate policyset MAC_YR MAC_YR\n\n\n";
	print HELIX_MACRO_CREATE "y\n\n\n";
	}
}

if ($policy_ndmp_dly == 1 ||  $policy_ndmp_wk == 1 ||  $policy_ndmp_mon == 1 ||  $policy_ndmp_yr == 1 ) {
	print "NDMP Domains Required...\n";
	if ($policy_ndmp_dly == 1) {
	print HELIX_MACRO_CREATE "/*============= NDMP_DLY ==================/*\n";   
	print HELIX_MACRO_CREATE "define domain NDMP_DLY desc=\"Generated: $datetime2 - Daily Domain for NDMP\"\n";	
	print HELIX_MACRO_CREATE "define policyset NDMP_DLY NDMP_DLY desc=\"Generated: $datetime2 - Daily Policyset for NDMP\"\n";	
	print HELIX_MACRO_CREATE "define mgmt NDMP_DLY NDMP_DLY NDMP_DLY desc=\"Generated: $datetime2 - Daily Retention Backup Management Class for NDMP\"\n";
	print HELIX_MACRO_CREATE "define mgmt NDMP_DLY NDMP_DLY NDMP_DLY desc=\"Generated: $datetime2 - Daily Directory Retention Backup Management Class for NDMP\"\n";		
	print HELIX_MACRO_CREATE "assign DEFMGmtclass NDMP_DLY NDMP_DLY NDMP_DLY\n";	
	print HELIX_MACRO_CREATE "define copygroup NDMP_DLY NDMP_DLY NDMP_DLY STANDARD Type=Backup DESTination=$primary_pool FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=7 RETOnly=7 MODE=MODIFIED SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "define copygroup NDMP_DLY NDMP_DLY NDMP_DLY STANDARD Type=Archive DESTination=$primary_pool FREQuency=CMD RETVer=31 MODE=ABSOLUTE SERialization=SHRSTATIC\"\n";	
	print HELIX_MACRO_CREATE "activate policyset NDMP_DLY NDMP_DLY\n\n\n";
	print HELIX_MACRO_CREATE "y\n\n\n";	
	}
	if ($policy_ndmp_wk == 1) {
	print HELIX_MACRO_CREATE "/*============= NDMP_WK ==================/*\n";   
	print HELIX_MACRO_CREATE "define domain NDMP_WK desc=\"Generated: $datetime2 - Weekly Domain for NDMP\"\n";	
	print HELIX_MACRO_CREATE "define policyset NDMP_WK NDMP_WK desc=\"Generated: $datetime2 - Weekly Policyset for NDMP\"\n";	
	print HELIX_MACRO_CREATE "define mgmt NDMP_WK NDMP_WK NDMP_WK desc=\"Generated: $datetime2 - Weekly Retention Backup Management Class for NDMP\"\n";
	print HELIX_MACRO_CREATE "define mgmt NDMP_WK NDMP_WK NDMP_WK desc=\"Generated: $datetime2 - Weekly Directory Retention Backup Management Class for NDMP\"\n";		
	print HELIX_MACRO_CREATE "assign DEFMGmtclass NDMP_WK NDMP_WK NDMP_WK\n";	
	print HELIX_MACRO_CREATE "define copygroup NDMP_WK NDMP_WK NDMP_WK STANDARD Type=Backup DESTination=$primary_pool FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=15 RETOnly=15 MODE=MODIFIED SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "define copygroup NDMP_WK NDMP_WK NDMP_WK STANDARD Type=Archive DESTination=$primary_pool FREQuency=CMD RETVer=31 MODE=ABSOLUTE SERialization=SHRSTATIC\"\n";	
	print HELIX_MACRO_CREATE "activate policyset NDMP_WK NDMP_WK\n\n\n";
	print HELIX_MACRO_CREATE "y\n\n\n";	
	}
	if ($policy_ndmp_mon == 1) {
	print HELIX_MACRO_CREATE "/*============= NDMP_MON ==================/*\n";   
	print HELIX_MACRO_CREATE "define domain NDMP_MON desc=\"Generated: $datetime2 - Monthly Domain for NDMP\"\n";	
	print HELIX_MACRO_CREATE "define policyset NDMP_MON NDMP_MON desc=\"Generated: $datetime2 - Monthly Policyset for NDMP\"\n";	
	print HELIX_MACRO_CREATE "define mgmt NDMP_MON NDMP_MON NDMP_MON desc=\"Generated: $datetime2 - Monthly Retention Backup Management Class for NDMP\"\n";
	print HELIX_MACRO_CREATE "define mgmt NDMP_MON NDMP_MON NDMP_MON desc=\"Generated: $datetime2 - Monthly Directory Retention Backup Management Class for NDMP\"\n";		
	print HELIX_MACRO_CREATE "assign DEFMGmtclass NDMP_MON NDMP_MON NDMP_MON\n";	
	print HELIX_MACRO_CREATE "define copygroup NDMP_MON NDMP_MON NDMP_MON STANDARD Type=Backup DESTination=$primary_pool FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=366 RETOnly=366 MODE=MODIFIED SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "define copygroup NDMP_MON NDMP_MON NDMP_MON STANDARD Type=Archive DESTination=$primary_pool FREQuency=CMD RETVer=366 MODE=ABSOLUTE SERialization=SHRSTATIC\"\n";	
	print HELIX_MACRO_CREATE "activate policyset NDMP_MON NDMP_MON\n\n\n";
	print HELIX_MACRO_CREATE "y\n\n\n";	
	}
	if ($policy_ndmp_yr == 1) {
	print HELIX_MACRO_CREATE "/*============= NDMP_YR ==================/*\n";   
	print HELIX_MACRO_CREATE "define domain NDMP_YR desc=\"Generated: $datetime2 - Yearly Domain for NDMP\"\n";	
	print HELIX_MACRO_CREATE "define policyset NDMP_YR NDMP_YR desc=\"Generated: $datetime2 - Yearly Policyset for NDMP\"\n";	
	print HELIX_MACRO_CREATE "define mgmt NDMP_YR NDMP_YR NDMP_YR desc=\"Generated: $datetime2 - Yearly Retention Backup Management Class for NDMP\"\n";
	print HELIX_MACRO_CREATE "define mgmt NDMP_YR NDMP_YR NDMP_YR desc=\"Generated: $datetime2 - Yearly Directory Retention Backup Management Class for NDMP\"\n";		
	print HELIX_MACRO_CREATE "assign DEFMGmtclass NDMP_YR NDMP_YR NDMP_YR\n";	
	print HELIX_MACRO_CREATE "define copygroup NDMP_YR NDMP_YR NDMP_YR STANDARD Type=Backup DESTination=$primary_pool FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=2556 RETOnly=2556 MODE=MODIFIED SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "define copygroup NDMP_YR NDMP_YR NDMP_YR STANDARD Type=Archive DESTination=$primary_pool FREQuency=CMD RETVer=2556 MODE=ABSOLUTE SERialization=SHRSTATIC\"\n";	
	print HELIX_MACRO_CREATE "activate policyset NDMP_YR NDMP_YR\n\n\n";
	print HELIX_MACRO_CREATE "y\n\n\n";	
	}
}

if ($policy_snapdiff_dly == 1 ||  $policy_snapdiff_wk == 1 ||  $policy_snapdiff_mon == 1 ||  $policy_snapdiff_yr == 1 ) {
	print "SnapDiff Domains Required...\n";
	if ($policy_snapdiff_dly == 1) {
	print HELIX_MACRO_CREATE "/*============= SNAPDIFF_DLY ==================/*\n";   
	print HELIX_MACRO_CREATE "define domain SNAPDIFF_DLY desc=\"Generated: $datetime2 - Daily Domain for SNAPDIFF\"\n";	
	print HELIX_MACRO_CREATE "define policyset SNAPDIFF_DLY SNAPDIFF_DLY desc=\"Generated: $datetime2 - Daily Policyset for SNAPDIFF\"\n";	
	print HELIX_MACRO_CREATE "define mgmt SNAPDIFF_DLY SNAPDIFF_DLY SNAPDIFF_DLY desc=\"Generated: $datetime2 - Daily Retention Backup Management Class for SNAPDIFF\"\n";
	print HELIX_MACRO_CREATE "define mgmt SNAPDIFF_DLY SNAPDIFF_DLY SNAPDIFF_DLY desc=\"Generated: $datetime2 - Daily Directory Retention Backup Management Class for SNAPDIFF\"\n";		
	print HELIX_MACRO_CREATE "assign DEFMGmtclass SNAPDIFF_DLY SNAPDIFF_DLY SNAPDIFF_DLY\n";	
	print HELIX_MACRO_CREATE "define copygroup SNAPDIFF_DLY SNAPDIFF_DLY SNAPDIFF_DLY STANDARD Type=Backup DESTination=$primary_pool FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=31 RETOnly=31 MODE=MODIFIED SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "define copygroup SNAPDIFF_DLY SNAPDIFF_DLY SNAPDIFF_DLY STANDARD Type=Archive DESTination=$primary_pool FREQuency=CMD RETVer=31 MODE=ABSOLUTE SERialization=SHRSTATIC\"\n";	
	print HELIX_MACRO_CREATE "activate policyset SNAPDIFF_DLY SNAPDIFF_DLY\n\n\n";
	print HELIX_MACRO_CREATE "y\n\n\n";	
	}
	if ($policy_snapdiff_wk == 1) {
	print HELIX_MACRO_CREATE "/*============= SNAPDIFF_WK ==================/*\n";   
	print HELIX_MACRO_CREATE "define domain SNAPDIFF_WK desc=\"Generated: $datetime2 - Weekly Domain for SNAPDIFF\"\n";	
	print HELIX_MACRO_CREATE "define policyset SNAPDIFF_WK SNAPDIFF_WK desc=\"Generated: $datetime2 - Weekly Policyset for SNAPDIFF\"\n";	
	print HELIX_MACRO_CREATE "define mgmt SNAPDIFF_WK SNAPDIFF_WK SNAPDIFF_WK desc=\"Generated: $datetime2 - Weekly Retention Backup Management Class for SNAPDIFF\"\n";
	print HELIX_MACRO_CREATE "define mgmt SNAPDIFF_WK SNAPDIFF_WK SNAPDIFF_WK desc=\"Generated: $datetime2 - Weekly Directory Retention Backup Management Class for SNAPDIFF\"\n";		
	print HELIX_MACRO_CREATE "assign DEFMGmtclass SNAPDIFF_WK SNAPDIFF_WK SNAPDIFF_WK\n";	
	print HELIX_MACRO_CREATE "define copygroup SNAPDIFF_WK SNAPDIFF_WK SNAPDIFF_WK STANDARD Type=Backup DESTination=$primary_pool FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=31 RETOnly=31 MODE=MODIFIED SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "define copygroup SNAPDIFF_WK SNAPDIFF_WK SNAPDIFF_WK STANDARD Type=Archive DESTination=$primary_pool FREQuency=CMD RETVer=31 MODE=ABSOLUTE SERialization=SHRSTATIC\"\n";	
	print HELIX_MACRO_CREATE "activate policyset SNAPDIFF_WK SNAPDIFF_WK\n\n\n";
	print HELIX_MACRO_CREATE "y\n\n\n";
	}
	if ($policy_snapdiff_mon == 1) {
	print HELIX_MACRO_CREATE "/*============= SNAPDIFF_MON ==================/*\n";   
	print HELIX_MACRO_CREATE "define domain SNAPDIFF_MON desc=\"Generated: $datetime2 - Monthly Domain for SNAPDIFF\"\n";	
	print HELIX_MACRO_CREATE "define policyset SNAPDIFF_MON SNAPDIFF_MON desc=\"Generated: $datetime2 - Monthly Policyset for SNAPDIFF\"\n";	
	print HELIX_MACRO_CREATE "define mgmt SNAPDIFF_MON SNAPDIFF_MON SNAPDIFF_MON desc=\"Generated: $datetime2 - Monthly Retention Backup Management Class for SNAPDIFF\"\n";
	print HELIX_MACRO_CREATE "define mgmt SNAPDIFF_MON SNAPDIFF_MON SNAPDIFF_MON desc=\"Generated: $datetime2 - Monthly Directory Retention Backup Management Class for SNAPDIFF\"\n";		
	print HELIX_MACRO_CREATE "assign DEFMGmtclass SNAPDIFF_MON SNAPDIFF_MON SNAPDIFF_MON\n";	
	print HELIX_MACRO_CREATE "define copygroup SNAPDIFF_MON SNAPDIFF_MON SNAPDIFF_MON STANDARD Type=Backup DESTination=$primary_pool FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=366 RETOnly=366 MODE=MODIFIED SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "define copygroup SNAPDIFF_MON SNAPDIFF_MON SNAPDIFF_MON STANDARD Type=Archive DESTination=$primary_pool FREQuency=CMD RETVer=366 MODE=ABSOLUTE SERialization=SHRSTATIC\"\n";	
	print HELIX_MACRO_CREATE "activate policyset SNAPDIFF_MON SNAPDIFF_MON\n\n\n";
	print HELIX_MACRO_CREATE "y\n\n\n";	
	}
	if ($policy_snapdiff_yr == 1) {
	print HELIX_MACRO_CREATE "/*============= SNAPDIFF_YR ==================/*\n";   
	print HELIX_MACRO_CREATE "define domain SNAPDIFF_YR desc=\"Generated: $datetime2 - Yearly Domain for SNAPDIFF\"\n";	
	print HELIX_MACRO_CREATE "define policyset SNAPDIFF_YR SNAPDIFF_YR desc=\"Generated: $datetime2 - Yearly Policyset for SNAPDIFF\"\n";	
	print HELIX_MACRO_CREATE "define mgmt SNAPDIFF_YR SNAPDIFF_YR SNAPDIFF_YR desc=\"Generated: $datetime2 - Yearly Retention Backup Management Class for SNAPDIFF\"\n";
	print HELIX_MACRO_CREATE "define mgmt SNAPDIFF_YR SNAPDIFF_YR SNAPDIFF_YR desc=\"Generated: $datetime2 - Yearly Directory Retention Backup Management Class for SNAPDIFF\"\n";		
	print HELIX_MACRO_CREATE "assign DEFMGmtclass SNAPDIFF_YR SNAPDIFF_YR SNAPDIFF_YR\n";	
	print HELIX_MACRO_CREATE "define copygroup SNAPDIFF_YR SNAPDIFF_YR SNAPDIFF_YR STANDARD Type=Backup DESTination=$primary_pool FREQuency=0 VERExists=NOLIMIT VERDeleted=NOLIMIT RETExtra=2556 RETOnly=2556 MODE=MODIFIED SERialization=SHRSTATIC\"\n";
	print HELIX_MACRO_CREATE "define copygroup SNAPDIFF_YR SNAPDIFF_YR SNAPDIFF_YR STANDARD Type=Archive DESTination=$primary_pool FREQuency=CMD RETVer=2556 MODE=ABSOLUTE SERialization=SHRSTATIC\"\n";	
	print HELIX_MACRO_CREATE "activate policyset SNAPDIFF_YR SNAPDIFF_YR\n\n\n";
	print HELIX_MACRO_CREATE "y\n\n\n";	
	}
}


## Close Files
close (HELIX_MACRO_CREATE);
system ("notepad ${macro_dir}/HELIX_MACRO_CREATE_$timestamp.txt");}

## Draw Heading
sub draw_heading {
use Win32::Console::ANSI;
  use Term::ANSIColor;


	print color 'bold red';
	system ("cls");
print "Tectrade - HELIX Config Tool";
print color 'reset'; 
print "\nVERSION: $software_version $released\n";
print "--------------------------------------------------------\n\n";
print color 'reset'; 
}


## make dsmserv.opt

sub make_dsmserv {
open (STATUS_TUNING_CREATE, ">${option_dir}/HELIX_STATUS_TUNING_MACRO_CREATE.txt") or &been_an_error;
print STATUS_TUNING_CREATE "/*============= dsmserv.opt ==================/*\n";
print STATUS_TUNING_CREATE "/*============= Tectrade: Created $datetime2 ==================/*\n";
print STATUS_TUNING_CREATE "";
print STATUS_TUNING_CREATE "COMMMethod    		TCPIP\n";
print STATUS_TUNING_CREATE "TCPPort 		1500\n";
print STATUS_TUNING_CREATE "DEVCONFIG     		devconf.dat\n";
print STATUS_TUNING_CREATE "VOLUMEHISTORY 		volhist.dat\n";
print STATUS_TUNING_CREATE "DEDUPEREQUIRESBACKUP 	NO\n";
print STATUS_TUNING_CREATE "Clientdeduptxnlimit 	1024\n";
print STATUS_TUNING_CREATE "Serverdeduptxnlimit 	2048\n";
print STATUS_TUNING_CREATE "ALLOWREORGINDEX 	Yes\n";
print STATUS_TUNING_CREATE "ALLOWREORGTABLE 	Yes\n";
print STATUS_TUNING_CREATE "DISABLEREORGTABLE 	BF_AGGREGATED_BITFILES, BF_BITFILE_EXTENTS, ARCHIVE_OBJECTS, BACKUP_OBJECTS\n";
print STATUS_TUNING_CREATE "REORGBEGINTIME 		13:00\n";
print STATUS_TUNING_CREATE "REORGDURATION 		3\n";
print STATUS_TUNING_CREATE "DB_DB2_KEEPTABLELOCK 	Yes\n";
print STATUS_TUNING_CREATE "DB2 			LockList\n";
print STATUS_TUNING_CREATE "ACTIVELOGSIZE 		131072\n";
print STATUS_TUNING_CREATE "MAXSESSIONS 		200\n";
print STATUS_TUNING_CREATE "SCHEDMODE 		Polling\n";
print STATUS_TUNING_CREATE "QUERYSCHEDPERIOD 	1\n";
print STATUS_TUNING_CREATE "/*============= End of tools generated content (18 lines of content) ==================/*\n";
close (STATUS_TUNING_CREATE);
system ("notepad ${option_dir}/HELIX_STATUS_TUNING_MACRO_CREATE.txt");
}

## HELIX GUI PANEL

sub get_the_variables { 


our $gd_managementsummary="";
our $traffic_light="GREEN";

## Containers

our $gd_unavailable_containerscolor="green";
our $gd_readonly_containerscolor="green";
our $gd_num_containers = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select count from stgpools where stg_type='DIRECTORY'");
chomp $gd_num_containers;
$gd_num_containers=~ s/ //g; ## spaces are returned from this cound for some reason
if ($gd_num_containers >= 1)
{
	our $gd_readonly_containers = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select count(state) from containers where state='READONLY'");
	chomp $gd_readonly_containers;

	if ($gd_readonly_containers >= 1)
	{
		our $gd_readonly_containers_recommendation="There are $gd_readonly_containers READONLY containers in the $gd_num_containers directory container pools. Check for container maintenance processes or issues.";
		our $gd_readonly_containers_status="WARNING";
		if ($traffic_light eq "GREEN") { 
			$gd_readonly_containerscolor="orange";
			$traffic_light="ORANGE"
			}
	}
	if ($gd_readonly_containers == 0)
	{
		our $gd_readonly_containers_recommendation="There are no READONLY containers in the $gd_num_containers directory container pools. This is OK.";
		our $gd_readonly_containers_status="OK";
		
	}
	our $gd_unavailable_containers = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select count(state) from containers where state='UNAVAILABLE'");
	chomp $gd_unavailable_containers;

	if ($gd_unavailable_containers > 1)
	{
		our $gd_unavailable_containers_recommendation="There are $gd_unavailable_containers UNAVAILABLE containers in the $gd_num_containers directory container pools. Check for disk or filesystem mount issues (SAN?).";
		our $gd_unavailable_containers_status="FAILED";
		$gd_unavailable_containerscolor="red";
		$traffic_light="RED";
	}
	if ($gd_unavailable_containers == 0)
	{
		our $gd_unavailable_containers_recommendation="There are no UNAVAILABLE containers in the $gd_num_containers directory container pools. This is OK.";
		our $gd_unavailable_containers_status="OK";
		
	}
	
}

if ($gd_num_containers == 0)
{
        $gd_readonly_containers="N/A";
        our $gd_readonly_containers_status="OK";
	our $gd_readonly_containers_recommendation="There are no directory containers so this check is not applicable.";
	$gd_unavailable_containers="N/A";
	our $gd_unavailable_containers_status="OK";
	our $gd_unavailable_containers_recommendation="There are no directory containers so this check is not applicable.";
}

open (READONLY_CONTAINERS, ">$test_dir/${tsm_server}_READONLY_CONTAINERS.txt");
$temp_command=qx("${baclient_directory}dsmadmc.exe -id=$tsm_user -pa=$tsm_password -optfile=${host_directory}/dsm_custom.opt select * from containers where state='READONLY'");
print READONLY_CONTAINERS $temp_command;
close READONLY_CONTAINERS; 
open (UNAVAILABLE_CONTAINERS, ">$test_dir/${tsm_server}_UNAVAILABLE_CONTAINERS.txt");
$temp_command=qx("${baclient_directory}dsmadmc.exe -id=$tsm_user -pa=$tsm_password -optfile=${host_directory}/dsm_custom.opt select * from containers where state='UNAVAILABLE'");
print UNAVAILABLE_CONTAINERS $temp_command;
close UNAVAILABLE_CONTAINERS;
## MoveBatchSize
our $gd_movebatchsizecolor="green";
our $gd_movebatchsize = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select option_value from options where lower(option_name)='movebatchsize'");
chomp $gd_movebatchsize;
our $gd_movebatchsize_status;
if ($gd_movebatchsize < 1000) {
	our $gd_movebatchsizerecommendation="1000 is the recommended value. $gd_movebatchsize is current value and is low.";
	our $gd_movebatchsizecolor="aquamarine";
	our $gd_movebatchsize_status="CHECK";
	}
if ($gd_movebatchsize >=1000 ) {
	our $gd_movebatchsizerecommendation="1000 is the recommended value. $gd_movebatchsize is current value and is OK.";
	our $gd_movebatchsize_status="OK";
	}
	
open (MOVEBATCHSIZE, ">$test_dir/${tsm_server}_MOVEBATCHSIZE.txt");
$temp_command=qx("${baclient_directory}dsmadmc.exe -id=$tsm_user -pa=$tsm_password -optfile=${host_directory}/dsm_custom.opt select OPTION_NAME, option_value from options where lower(option_name)='movebatchsize'");
print MOVEBATCHSIZE $temp_command;
close MOVEBATCHSIZE;
	## MoveSizeThresh
our $gd_movesizethreshcolor="green";
our $gd_movesizethresh = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select option_value from options where lower(option_name)='movesizethresh'");
chomp $gd_movesizethresh;
our $gd_movesizethresh_status;
if ($gd_movesizethresh < 32768) {
	our $gd_movesizethreshrecommendation="32768 is the recommended value if MIGRATION is slow. $gd_movesizethresh is current value and is OK unless MIGRATION is under-performing.";
	our $gd_movesizethreshcolor="aquamarine";
	our $gd_movesizethresh_status="CHECK";
	}
if ($gd_movebatchsize >=32768 ) {
	our $gd_movesizethreshrecommendation="32768 is the recommended value if MIGRATION is slow. $gd_movesizethresh is current value and is OK.";
	our $gd_movesizethresh_status="OK";
	}	
open (MOVESIZETHRESH, ">$test_dir/${tsm_server}_MOVESIZETHRESH.txt");
$temp_command=qx("${baclient_directory}dsmadmc.exe -id=$tsm_user -pa=$tsm_password -optfile=${host_directory}/dsm_custom.opt select OPTION_NAME, option_value from options where lower(option_name)='movesizethresh'");
print MOVESIZETHRESH $temp_command;
close MOVESIZETHRESH;
	## TXNGroupMax
our $gd_txngroupmaxcolor="green";
our $gd_txngroupmax = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select option_value from options where lower(option_name)='txngroupmax'");
chomp $gd_txngroupmax;
our $gd_txngroupmax_status;
if ($gd_txngroupmax < 65000) {
	our $gd_txngroupmaxrecommendation="65000 is the recommended value if backups are slow. $gd_txngroupmax is current value and is OK unless backups are under-performing.";
	our $gd_txngroupmaxcolor="aquamarine";
	our $gd_txngroupmax_status="CHECK";
	}
if ($gd_txngroupmax >=65000 ) {
	our $gd_txngroupmaxrecommendation="65000 is the recommended value if backups are slow. $gd_txngroupmax is current value and is OK.";
	our $gd_txngroupmax_status="OK";
	}	

open (TXNGROUPMAX, ">$test_dir/${tsm_server}_TXNGROUPMAX.txt");
$temp_command=qx("${baclient_directory}dsmadmc.exe -id=$tsm_user -pa=$tsm_password -optfile=${host_directory}/dsm_custom.opt select OPTION_NAME, option_value from options where lower(option_name)='txngroupmax'");
print TXNGROUPMAX $temp_command;
close TXNGROUPMAX;

## FILEPROCESS

our $gd_fileprocesscolor="green";our $gd_fulldevclass = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select d.devtype from devclasses d, db b where d.devclass_name=b.FULL_DEV_CLASS");
our $gd_fileprocess = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select fileprocess from drmstatus");
our $gd_fileprclassname = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select d.devclass_name from devclasses d, db b where d.devclass_name=b.FULL_DEV_CLASS");
our $gd_aretheredbfilebackups = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select COUNT from volhistory where type='BACKUPFULL' and volume_name like '%.DBV%'");
chomp $gd_fulldevclass;chomp $gd_fileprocess;
chomp $gd_fileprclassname;
chomp $gd_aretheredbfilebackups;
$gd_aretheredbfilebackups=~ s/ //g;

our $gd_fileprocess_status;
if ($gd_fileprocess eq "No" && $gd_fulldevclass ne "FILE" && $gd_aretheredbfilebackups == 0) {
	our $gd_fileprocessrecommendation="File DB backup processing is OFF (in DRMSTATUS) and there are no FILE DB backups (default devc is $gd_fileprclassname). This is OK.";
	our $gd_fileprocess_status="OK";
	}
if ($gd_fileprocess eq "No" && $gd_fulldevclass ne "FILE" && $gd_aretheredbfilebackups > 0) {
	our $gd_fileprocessrecommendation="File DB backup processing is OFF (in DRMSTATUS) but there are FILE DB backups (default devc is $gd_fileprclassname). Turn it on.";
	our $gd_fileprocess_status="FAILED";
	our $gd_fileprocesscolor="red";
	$traffic_light="RED";
	}
if ($gd_fileprocess eq "No" && $gd_fulldevclass eq "FILE" ) {
	our $gd_fileprocessrecommendation="File DB backup processing is OFF (in DRMSTATUS) but a FILE class is the default devc (default devc is $gd_fileprclassname). Turn it on.";
	our $gd_fileprocess_status="FAILED";
	our $gd_fileprocesscolor="red";
	$traffic_light="RED";
	}
if ($gd_fileprocess eq "Yes" && $gd_fulldevclass eq "FILE" && $gd_aretheredbfilebackups > 0) {
	our $gd_fileprocessrecommendation="File DB backup processing is ON. This is OK regardless of whether it is being used (it is). DB Backups go to $gd_fileprclassname";
	our $gd_fileprocess_status="OK";
	}
if ($gd_fileprocess eq "Yes" && $gd_fulldevclass ne "FILE" && $gd_aretheredbfilebackups == 0) {
	our $gd_fileprocessrecommendation="File DB backup processing is ON. This is OK regardless of whether it is being used (it isn't). DB Backups go to $gd_fileprclassname";
	our $gd_fileprocess_status="OK";
	}
	
open (FILEPROCESS, ">$test_dir/${tsm_server}_FILEPROCESS.txt");
$temp_command=qx("${baclient_directory}dsmadmc.exe -id=$tsm_user -pa=$tsm_password -optfile=${host_directory}/dsm_custom.opt q DRMSTATUS");
print FILEPROCESS $temp_command;
open (FILEPROCESS, ">>$test_dir/${tsm_server}_FILEPROCESS.txt");
$temp_command=qx("${baclient_directory}dsmadmc.exe -id=$tsm_user -pa=$tsm_password -optfile=${host_directory}/dsm_custom.opt select date(date_time),volume_name from volhistory where type='BACKUPFULL' and volume_name like '%.DBV%'");
print FILEPROCESS $temp_command;
close FILEPROCESS;

## License Compliance
our $gd_compliancecolor="green";
our $gd_compliance = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select compliance from licenses");
chomp $gd_compliance;
our $gd_compliance_status;
if ($gd_compliance ne "Valid") {
	our $gd_compliancerecommendation="Spectrum Protect License is not Valid. Investigate";
	our $gd_compliance_status="FAILED";
	our $gd_compliancecolor="red";
	$traffic_light="RED";
	}
if ($gd_compliance eq "Valid") {
	our $gd_compliancerecommendation="Spectrum Protect License is Valid. All OK";
	our $gd_compliance_status="OK";
	}
open (LICENCE, ">$test_dir/${tsm_server}_LICENCE.txt");
$temp_command=qx("${baclient_directory}dsmadmc.exe -id=$tsm_user -pa=$tsm_password -optfile=${host_directory}/dsm_custom.opt SELECT * FROM LICENSES");
print LICENCE $temp_command;
close LICENCE;
## ADMIN locked out
our $gd_adminlockedcolor="green";
our $gd_countadmin = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select count from admins where admin_name='ADMIN'");
our $gd_adminlocked = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select count(locked) from admins where admin_name='ADMIN'");
chomp $gd_countadmin;
chomp $gd_adminlocked;
our $gd_adminlocked_status;
if ($gd_countadmin == 1 && $gd_adminlocked == 0 ) {
	our $gd_adminlockedrecommendation="The ADMIN user exists but is not locked. Delete or lock user!";	
	our $gd_adminlocked_status="WARNING";
	our $gd_adminlockedcolor="orange";
	if ($traffic_light eq "GREEN") { $traffic_light="ORANGE"}
	}
if ($gd_countadmin == 0 && $gd_adminlocked == 0 ) {
	our $gd_adminlockedrecommendation="The ADMIN user does not exist. This is OK";	
	our $gd_adminlocked_status="OK";
	}
if ($gd_countadmin == 1 && $gd_adminlocked == 1 ) {
	our $gd_adminlockedrecommendation="The ADMIN user exists and is locked. This is OK.";	
	our $gd_adminlocked_status="OK";
	}
open (ADMINS, ">$test_dir/${tsm_server}_ADMINS.txt");
$temp_command=qx("${baclient_directory}dsmadmc.exe -id=$tsm_user -pa=$tsm_password -optfile=${host_directory}/dsm_custom.opt SELECT ADMIN_NAME, SYSTEM_PRIV FROM ADMINS WHERE ADMIN_NAME LIKE '%ADMIN%'");
print ADMINS $temp_command;
close ADMINS;	
## IDLETIMEOUT
our $gd_idletimeoutcolor="green";
our $gd_idletimeout = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select option_value from options where lower(option_name)='idletimeout'");
chomp $gd_idletimeout;
our $gd_idletimeout_status;
if ($gd_idletimeout < 60) {
	our $gd_idletimeoutrecommendation="60 is the recommended timeout. $gd_idletimeout is current value and is low.";
	our $gd_idletimeout_status="WARNING";
	our $gd_idletimeoutcolor="orange";
	if ($traffic_light eq "GREEN") { $traffic_light="ORANGE"}
	}
if ($gd_idletimeout >=60 ) {
	our $gd_idletimeoutrecommendation="60 and above is recommended. $gd_idletimeout is current value and is OK.";
	our $gd_idletimeout_status="OK";
	}
	
	open (IDLETIMEOUT, ">$test_dir/${tsm_server}_IDLETIMEOUT.txt");
$temp_command=qx("${baclient_directory}dsmadmc.exe -id=$tsm_user -pa=$tsm_password -optfile=${host_directory}/dsm_custom.opt select OPTION_NAME, option_value from options where lower(option_name)='idletimeout'");
print IDLETIMEOUT $temp_command;
close IDLETIMEOUT;
## COMMTIMEOUT
our $gd_commtimeoutcolor="green";
our $gd_commtimeout = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select decimal(option_value) from options where lower(option_name)='commtimeout'");
chomp $gd_commtimeout;
our $gd_commtimeout_status;
if ($gd_commtimeout < 3600) {
	our $gd_commtimeoutrecommendation="3600 is the recommended timeout. $gd_commtimeout is current value and is low.";
	our $gd_commtimeout_status="WARNING";
	our $gd_commtimeoutcolor="orange";
	if ($traffic_light eq "GREEN") { $traffic_light="ORANGE"}
	}
if ($gd_commtimeout >=3600 ) {
	our $gd_commtimeoutrecommendation="3600 and above is recommended. $gd_commtimeout is current value and is OK.";
	our $gd_commtimeout_status="OK";
	}

open (COMMTIMEOUT, ">$test_dir/${tsm_server}_COMMTIMEOUT.txt");
$temp_command=qx("${baclient_directory}dsmadmc.exe -id=$tsm_user -pa=$tsm_password -optfile=${host_directory}/dsm_custom.opt select OPTION_NAME, option_value from options where lower(option_name)='commtimeout'");
print COMMTIMEOUT $temp_command;
close COMMTIMEOUT;
	
## Query Sched Period
our $gd_schedperiodcolor="green";
our $gd_schedperiod = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select decimal(queryschedperiod) from status");
chomp $gd_schedperiod;
our $gd_schedperiod_status;
if ($gd_schedperiod eq "") {
	our $gd_schedperiodrecommendation="The parameter is not set (SQL query). Likely to be set to CLIENT. Suggest setting it on server.";
	our $gd_schedperiod_status="WARNING";
	our $gd_schedperiodcolor="orange";
	if ($traffic_light eq "GREEN") { $traffic_light="ORANGE"}
	}
if ($gd_schedperiod > 1) {
	our $gd_schedperiodrecommendation="1 hour is the recommended time period";
	our $gd_schedperiod_status="WARNING";
	our $gd_schedperiodcolor="orange";
	if ($traffic_light eq "GREEN") { $traffic_light="ORANGE"}
	}
if ($gd_schedperiod == 1) {
	our $gd_schedperiodrecommendation="1 hour is OK and recommended";
	our $gd_schedperiod_status="OK";
	}

open (QSCHEDPERIOD, ">$test_dir/${tsm_server}_QSCHEDPERIOD.txt");
$temp_command=qx("${baclient_directory}dsmadmc.exe -id=$tsm_user -pa=$tsm_password -optfile=${host_directory}/dsm_custom.opt select * from status");
$temp_command=~ s/QUERYSCHEDPERIOD:/***  QUERYSCHEDPERIOD  ***:/g;
print QSCHEDPERIOD $temp_command;
close QSCHEDPERIOD;
## Schedmode
our $gd_schedmodecolor="green";
our $gd_schedmode = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select schedmode from status");
chomp $gd_schedmode;
our $gd_schedmode_status;
if ($gd_schedmode eq "PROMPTED") {
	our $gd_schedmoderecommendation="PROMPTED would be unusual...!";
	our $gd_schedmode_status="WARNING";
	our $gd_schedmodecolor="orange";
	if ($traffic_light eq "GREEN") { $traffic_light="ORANGE"}
	}
if ($gd_schedmode eq "POLLING" || $gd_schedmode eq "ANY") {
	our $gd_schedmoderecommendation="POLLING or ANY is generally OK and recommended";
	our $gd_schedmode_status="OK";
	}

open (SCHEDMODE, ">$test_dir/${tsm_server}_SCHEDMODE.txt");
$temp_command=qx("${baclient_directory}dsmadmc.exe -id=$tsm_user -pa=$tsm_password -optfile=${host_directory}/dsm_custom.opt select * from status");
$temp_command=~ s/SCHEDMODE:/***  SCHEDMODE  ***:/g;
print SCHEDMODE $temp_command;
close SCHEDMODE;
	
## Maxsessions
our $gd_maxsessionscolor="green";
our $gd_maxsessions = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select maxsessions from status");
chomp $gd_maxsessions;
our $gd_maxsessions_status;
if ($gd_maxsessions < 100) {
	our $gd_maxsessrecommendation="Less than the recommended 200 sessions (and less than 100).";
	our $gd_maxsessions_status="FAILED";
	our $gd_maxsessionscolor="red";
	$traffic_light="RED";
	}
if ($gd_maxsessions >= 100 && $gd_maxsessions < 200) {
	our $gd_maxsessrecommendation="Less than the recommended 200 sessions (but greater than 100).";
	our $gd_maxsessions_status="WARNING";
	our $gd_maxsessionscolor="orange";
	if ($traffic_light eq "GREEN") { $traffic_light="ORANGE"}
	}
if ($gd_maxsessions >= 200 && $gd_maxsessions < 2000) {
	our $gd_maxsessrecommendation="Greater or equal to recommended 200 sessions.";
	our $gd_maxsessions_status="OK";
	}
if ($gd_maxsessions >= 2000 ) {
	our $gd_maxsessrecommendation="$gd_maxsessions seems high! Check this setting is suitable for this server";
	our $gd_maxsessions_status="CHECK";
	our $gd_maxsessionscolor="aquamarine";	
	}
open (MAXSESSIONS, ">$test_dir/${tsm_server}_MAXSESSIONS.txt");
$temp_command=qx("${baclient_directory}dsmadmc.exe -id=$tsm_user -pa=$tsm_password -optfile=${host_directory}/dsm_custom.opt select * from status");
$temp_command=~ s/MAXSESSIONS:/***  MAXSESSIONS  ***:/g;
print MAXSESSIONS $temp_command;
close MAXSESSIONS;	
	## Maxschedsessions
our $gd_maxschedsessionscolor="green";
our $gd_maxschedsessions = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select int(100*(decimal(maxschedsessions)/decimal(maxsessions))) from status");
chomp $gd_maxschedsessions;
our $gd_maxschedsessions_status;
if ($gd_maxschedsessions < 80) {
	our $gd_maxschedsessrecommendation="Less than the recommended 80%.";
	our $gd_maxschedsessions_status="FAILED";
	our $gd_maxschedsessionscolor="red";
	$traffic_light="RED";
	}
if ($gd_maxschedsessions >= 80) {
	our $gd_maxschedsessrecommendation="Greater or equal to recommended 80%.";
	our $gd_maxschedsessions_status="OK";
	}
open (MAXSCHEDSESSIONS, ">$test_dir/${tsm_server}_MAXSCHEDSESSIONS.txt");
$temp_command=qx("${baclient_directory}dsmadmc.exe -id=$tsm_user -pa=$tsm_password -optfile=${host_directory}/dsm_custom.opt select * from status");
$temp_command=~ s/MAXSCHEDSESSIONS:/***  MAXSCHEDSESSIONS  ***:/g;
print MAXSCHEDSESSIONS $temp_command;
close MAXSCHEDSESSIONS;
	
## Actlog Retention
our $gd_actlogcolor="green";
our $gd_actlogretention = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt SELECT ACTLOGRETENTION FROM  STATUS");
chomp $gd_actlogretention;
our $gd_actlog_status;
if ($gd_actlogretention < 30) {
	our $gd_actlogrecommendation="Less than the recommended 30 days.";
	$gd_managementsummary="$gd_managementsummary<w:br/>- The activity log setting is too low at $gd_actlogretention days and requires increasing to 30.";
	our $gd_actlog_status="FAILED";
	our $gd_actlogcolor="red";
	$traffic_light="RED";
	}
if ($gd_actlogretention == 30) {
	our $gd_actlogrecommendation="Set to 30 days, the recommended level.";
	our $gd_actlog_status="OK";
	}
if ($gd_actlogretention > 30) {
	our $gd_actlogrecommendation="Greater than 30 days but OK.";
	our $gd_actlog_status="OK";
	}

open (ACTLOGRET, ">$test_dir/${tsm_server}_ACTLOGRET.txt");
$temp_command=qx("${baclient_directory}dsmadmc.exe -id=$tsm_user -pa=$tsm_password -optfile=${host_directory}/dsm_custom.opt select * from status");
$temp_command=~ s/ACTLOGRETENTION:/***  ACTLOGRETENTION  ***:/g;
print ACTLOGRET $temp_command;
close ACTLOGRET;

	## Summary Retention
our $gd_sumlogcolor="green";
our $gd_sumlogretention = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt SELECT SUMMARYRETENTION FROM  STATUS");
chomp $gd_sumlogretention;
our $gd_sumlog_status;
if ($gd_sumlogretention < 30) {
	our $gd_sumlogrecommendation="Less than the recommended 30 days.";
	$gd_managementsummary="$gd_managementsummary<w:br/>- The summary log setting is too low at $gd_sumlogretention days and requires increasing to 30.";
	$gd_sumlog_status="FAILED";
	our $gd_sumlogcolor="red";
	$traffic_light="RED";
	}
if ($gd_sumlogretention == 30) {
	our $gd_sumlogrecommendation="Set to 30 days, the recommended level.";
	$gd_sumlog_status="OK";
	}
if ($gd_sumlogretention > 30) {
	our $gd_sumlogrecommendation="Greater than 30 days but OK.";
	$gd_sumlog_status="OK";
	}
open (SUMMRET, ">$test_dir/${tsm_server}_SUMMRET.txt");
$temp_command=qx("${baclient_directory}dsmadmc.exe -id=$tsm_user -pa=$tsm_password -optfile=${host_directory}/dsm_custom.opt select * from status");
$temp_command=~ s/SUMMARYRETENTION:/***  SUMMARYRETENTION  ***:/g;
print SUMMRET $temp_command;
close SUMMRET;	
	## Event Retention
our $gd_evlogcolor="green";
our $gd_evlogretention = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt SELECT EVENTRETENTION FROM  STATUS");
chomp $gd_evlogretention;
our $gd_evlog_status;
if ($gd_evlogretention < 30) {
	our $gd_evlogrecommendation="Less than the recommended 30 days.";
	$gd_managementsummary="$gd_managementsummary<w:br/>- The event log setting is too low at $gd_evlogretention days and requires increasing to 30.";
	$gd_evlog_status="FAILED";
	our $gd_evlogcolor="red";
	$traffic_light="RED";
	}
if ($gd_evlogretention == 30) {
	our $gd_evlogrecommendation="Set to 30 days, the recommended level.";
	$gd_evlog_status="OK";
	}
if ($gd_evlogretention > 30) {
	our $gd_evlogrecommendation="Greater than 30 days but OK.";
	$gd_evlog_status="OK";
	}open (EVRET, ">$test_dir/${tsm_server}_EVRET.txt");
$temp_command=qx("${baclient_directory}dsmadmc.exe -id=$tsm_user -pa=$tsm_password -optfile=${host_directory}/dsm_custom.opt select * from status");
$temp_command=~ s/EVENTRETENTION:/***  EVENTRETENTION  ***:/g;
print EVRET $temp_command;
close EVRET;	
	
## Expire Interval
our $gd_expintervalcolor="green";
our $gd_expinterval = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt SELECT decimal(option_value) FROM OPTIONS WHERE OPTION_NAME = 'ExpInterval'");
chomp $gd_expinterval;
#$gd_expinterval=~s/OPTION_VALUE://;

if ($gd_expinterval > 0) {
	our $gd_expintervalrecommend="Recommended value is 0 which forces expiration to be scheduled. Current value is (every) $gd_expinterval hours.";
	$gd_managementsummary="$gd_managementsummary<w:br/>- The expire interval is set to $gd_expinterval - the recommended value is 0.";
	our $gd_expinterval_status="WARNING";
	our $gd_expintervalcolor="orange";
	if ($traffic_light eq "GREEN") { $traffic_light="ORANGE"}
	}
if ($gd_expinterval == 0) {
	our $gd_expintervalrecommend="Expire interval setting is 0 which is the recommended value provided the expiration is scheduled in housekeeping (check this).";
	our $gd_expinterval_status="OK";
	}

open (EXPINTERVAL, ">$test_dir/${tsm_server}_EXPINTERVAL.txt");
$temp_command=qx("${baclient_directory}dsmadmc.exe -id=$tsm_user -pa=$tsm_password -optfile=${host_directory}/dsm_custom.opt q opt");
$temp_command=~ s/ExpInterval/***  ExpInterval**/g;
print EXPINTERVAL $temp_command;
close EXPINTERVAL;

## Client Accounting

our $gd_clientaccstatuscolor="green";our $gd_clientaccstatus_status="OK";
our $gd_clientaccounting = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt SELECT ACCOUNTING FROM STATUS");
chomp $gd_clientaccounting;

if ($gd_clientaccounting eq "OFF") {
	our $gd_accountingrecommend="Client Accounting is OFF. It is recommended this is switched ON";
	$gd_managementsummary="$gd_managementsummary<w:br/>- Client Accounting is OFF. It is recommended this is switched ON.";
	$gd_clientaccstatus_status="FAILED";
	our $gd_clientaccstatuscolor="red";
	$traffic_light="RED";
	}
if ($gd_clientaccounting eq "ON") {
	our $gd_accountingrecommend="Client Accounting is ON, the recommended value.";
	$gd_clientaccstatus_status="OK";}

open (CLIENTACCOUNTING, ">$test_dir/${tsm_server}_CLIENTACCOUNTING.txt");
$temp_command=qx("${baclient_directory}dsmadmc.exe -id=$tsm_user -pa=$tsm_password -optfile=${host_directory}/dsm_custom.opt select * from status");
$temp_command=~ s/ACCOUNTING:/***  ACCOUNTING  ***:/g;
print CLIENTACCOUNTING $temp_command;
close CLIENTACCOUNTING;

## Random Access Disk Volumes
our $gd_randomcolor="green";
our $gd_randomaccess = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt SELECT COUNT(VOLUME_NAME) FROM VOLUMES WHERE DEVCLASS_NAME='DISK'");
our $gd_randomoffline = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt SELECT COUNT(VOLUME_NAME) FROM VOLUMES WHERE DEVCLASS_NAME='DISK' AND STATUS!='ONLINE'");
chomp $gd_randomaccess;
chomp $gd_randomoffline;
our $gd_randomstatus_status;
if ($gd_randomoffline == 0) {
	our $gd_randomrecommend="All random access volumes are ONLINE (there are $gd_randomaccess DISK volumes)";
	$gd_randomstatus_status="OK";
	}
if ($gd_randomoffline > 0) {
	our $gd_randomrecommend="$gd_randomaccess random access volumes are OFFLINE. (there are $gd_randomaccess DISK volumes).";
	$gd_managementsummary="$gd_managementsummary<w:br/>- $gd_ranexpirationdomaccess random access volumes are OFFLINE. This should be investigated and rectified.";
	$gd_randomstatus_status="FAILED";
	our $gd_randomcolor="red";
	$traffic_light="RED";
	}

open (RANDOMONLINE, ">$test_dir/${tsm_server}_RANDOMONLINE.txt");
$temp_command=qx("${baclient_directory}dsmadmc.exe -id=$tsm_user -pa=$tsm_password -optfile=${host_directory}/dsm_custom.opt q vol devc=disk");
print RANDOMONLINE $temp_command;
close RANDOMONLINE;


## Drives ONLINE

our $gd_drives_olcolor="green";our $gd_drives_ol_status;
our $gd_numberofscsilibraries = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select count from libraries where library_type='SCSI' or library_type='VTL'");
chomp $gd_numberofscsilibraries;our $gd_drivesonline = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select count from drives where online='NO'");
chomp $gd_drivesonline;

if ($gd_drivesonline == 0 && $gd_numberofscsilibraries >=1) {
	$gd_drivesonlinerecommend="All drives are online.";
	$gd_drives_ol_status="OK";
	}

if ($gd_numberofscsilibraries == 0 ) {
	$gd_drivesonlinerecommend="There are no locally controlled libraries and therefore no drives.";
	our $gd_volumes_statistics="(There are no locally controlled libraries)";
	$gd_drives_ol_status="OK";
	}
	
if ($gd_drivesonline == 1 && $gd_numberofscsilibraries >=1 ) {
	$gd_drivesonlinerecommend="There is 1 drive offline!";
	$gd_managementsummary="$gd_managementsummary<w:br/>- There is 1 drive offline. Check for drive, library or SAN issues.";
	$gd_drives_ol_status="FAILED";
	our $gd_drives_olcolor="red";
	$traffic_light="RED";
	}

if ($gd_drivesonline > 1 && $gd_numberofscsilibraries >=1 ) {
	$gd_drivesonlinerecommend="Warning: There are $gd_drivesonline drives offline . Check for drive, library or SAN issues";
	$gd_managementsummary="$gd_managementsummary<w:br/>- There are $gd_drivesonline drives offline . Check for drive, library or SAN issues.";
	$gd_drives_ol_status="FAILED";
	our $gd_drives_olcolor="red";
	$traffic_light="RED";
	}
open (DRIVESOL, ">$test_dir/${tsm_server}_DRIVESOL.txt");
$temp_command=qx("${baclient_directory}dsmadmc.exe -id=$tsm_user -pa=$tsm_password -optfile=${host_directory}/dsm_custom.opt q drive");
print DRIVESOL $temp_command;
close DRIVESOL;	

## Paths ONLINE

our $gd_paths_olcolor="green";our $gd_paths_ol_status;
our $gd_pathsonline = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select count from paths where online='NO'");
chomp $gd_pathsonline;

if ($gd_pathsonline == 0 && $gd_numberofscsilibraries >=1) {
	$gd_pathsonlinerecommend="All paths are online. There may still be drives offline so check the previous section.";}
	$gd_paths_ol_status="OK";
		if ($gd_numberofscsilibraries == 0) {
	$gd_pathsonlinerecommend="There are no locally controlled libraries and therefore no paths.";}
	$gd_paths_ol_status="OK";
	
if ($gd_pathsonline == 1 && $gd_numberofscsilibraries >=1) {
	$gd_pathsonlinerecommend="There is 1 path offline!";
	$gd_managementsummary="$gd_managementsummary<w:br/>- There is 1 drive offline. Check for drive, library or SAN issues.";
	$gd_paths_ol_status="FAILED";
	our $gd_paths_olcolor="red";
	$traffic_light="RED";
	}
if ($gd_pathsonline > 1 && $gd_numberofscsilibraries >=1) {
	$gd_pathsonlinerecommend="Warning: There are $gd_pathsonline paths offline.";
	$gd_managementsummary="$gd_managementsummary<w:br/>- There are $gd_drivesonline drives offline . Check for drive, library or SAN issues.";
	$gd_paths_ol_status="FAILED";
	our $gd_paths_olcolor="red";
	$traffic_light="RED";
	}

open (PATHSOL, ">$test_dir/${tsm_server}_PATHSOL.txt");
$temp_command=qx("${baclient_directory}dsmadmc.exe -id=$tsm_user -pa=$tsm_password -optfile=${host_directory}/dsm_custom.opt q path");
print PATHSOL $temp_command;
close PATHSOL;
## DRM Check Label

our $gd_checklcolor="green";our $gd_totalnumberoflibraries = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select count from libraries");
chomp $gd_totalnumberoflibraries;our $gd_checklabel = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt SELECT CHECKLABEL FROM DRMSTATUS");
chomp $gd_checklabel;

if ($gd_checklabel eq  "No" && $gd_totalnumberoflibraries >=1) {
	our $gd_checklrecommend="The CHECKLABEL DRM setting is set to No. This is the recommended setting.";
	our $gd_checkl_status="OK";
	}
		if ($gd_totalnumberoflibraries == 0) {
	our $gd_checklrecommend="There are no libraries and therefore parameter is not applicable";}
	our $gd_checkl_status="OK";
	
if ($gd_checklabel eq "Yes" && $gd_totalnumberoflibraries >=1 ) {
	our $gd_checklrecommend="The CHECKLABEL DRM setting is set to Yes. This may slow down the checking out of DRM tapes.";
	$gd_managementsummary="$gd_managementsummary<w:br/>- The CHECKLABEL DRM setting is set to Yes. This may slow down the checking out of DRM tapes. It is recommended to set this to No.";
	our $gd_checkl_status="WARNING";
	our $gd_checklcolor="orange";
	if ($traffic_light eq "GREEN") { $traffic_light="ORANGE"}
	}
	
open (DRMCHECKL, ">$test_dir/${tsm_server}_DRMCHECKL.txt");
$temp_command=qx("${baclient_directory}dsmadmc.exe -id=$tsm_user -pa=$tsm_password -optfile=${host_directory}/dsm_custom.opt q DRMSTATUS");
print DRMCHECKL $temp_command;
close DRMCHECKL;		
## Nodes Defined and Unique

our $gd_definednodes = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select count from nodes");
chomp $gd_definednodes;
our $gd_uniquenodes = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select count(unique(TCP_ADDRESS)) from nodes");
chomp $gd_uniquenodes;
## Filespaces not being backed up

our $gd_filespaces = `${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt "select count FROM FILESPACEVIEW where TIMESTAMPDIFF  (16,CHAR(current_timestamp-backup_end)) >=30"`;
chomp $gd_filespaces;

if ($gd_filespaces == 0) {$gd_filespacerecommend="All filespaces have been backed up within the last 30 days.";}
if ($gd_filespaces == 1) {$gd_filespacerecommend="Warning: 1 filespace has not been backed up within the last 30 days. Check if this filespace is required and consider deleting from TSM to save space. Modify backup setting if the filespace is active.";
$gd_managementsummary="$gd_managementsummary<w:br/>- 1 filespace has not been backed up within the last 30 days. Check if this filespace is required and consider deleting from TSM to save space. Modify backup setting if the filespace is active.";}
if ($gd_filespaces > 1) {$gd_filespacerecommend="Warning: $gd_filespaces filespaces have not been backed up within the last 30 days. Check if these filespaces are required and consider deleting them from TSM to save space. Modify backup settings if the filespaces are active.";
$gd_managementsummary="$gd_managementsummary<w:br/>- $gd_filespaces filespaces have not been backed up within the last 30 days. Check if these filespaces are required and consider deleting them from TSM to save space. Modify backup settings if the filespaces are active.";}



# select COUNT(VOLUME_NAME)/COUNT(DISTINCT(VOLUME_SEQ)) FROM volhistory where type='BACKUPFULL'
## Database
our $gd_drmdbcolor="green";
our $gd_drmdb24hourscolor="green";
our $gd_drmdbstatus_status="OK";
our $gd_drmdb24hours_status="OK";
our $gd_numdbestimate = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt  select count(distinct(date(date_time))) FROM volhistory where type='BACKUPFULL'");
chomp $gd_numdbestimate;
our $gd_numdatabasebackups = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt  select count from volhistory where type='BACKUPFULL'");
chomp $gd_numdatabasebackups;
our $gd_drmdbstatus = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt  select dbbexpiredays from drmstatus");
chomp $gd_drmdbstatus;
our $gd_drmdb24hours = `${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt  "select count from volhistory where type='BACKUPFULL' and date_time>current_timestamp-24 hours"`;
chomp $gd_drmdb24hours;

if ($gd_numdatabasebackups =~ m/ANR2940E/) {
	$gd_numdatabasebackups=0;
}

if ($gd_numdatabasebackups == 0 ) {
	$gd_numdbrecommendation="No DB backups currently. Check setup.";
	$gd_managementsummary="$gd_managementsummary<w:br/>-  There are no no TSM database backups currently. This will make DR recovery impossible.";
	our $gd_drmdbstatus_status="FAILED";
	our $gd_drmdbcolor="red";
	$traffic_light="RED";
}
else {
	if ($gd_numdatabasebackups < $gd_drmdbstatus && $gd_drmdbstatus >= 3 && $gd_numdatabasebackups != 0) {
		our $gd_numdbrecommendation="The number of DB backups is less than $gd_drmdbstatus. Check setup.";
		$gd_managementsummary="$gd_managementsummary<w:br/>-  There are not enough TSM database backups at present.";
		our $gd_drmdbstatus_status="FAILED";
		our $gd_drmdbcolor="red";
		$traffic_light="RED";
	}
	if ($gd_drmdbstatus < 3) {
		our $gd_numdbrecommendation="DRMSTATUS setting is too low at $gd_drmdbstatus (should be 3).";
	        $gd_managementsummary="$gd_managementsummary<w:br/>-  The DRMSTATUS is too low at $gd_drmdbstatus - this should be set at least 3 for DR recovery.";
		our $gd_drmdbstatus_status="FAILED";
		our $gd_drmdbcolor="red";
		$traffic_light="RED";
	}

	if ($gd_numdatabasebackups > $gd_drmdbstatus && $gd_drmdbstatus == 3) {
		our $gd_numdbrecommendation="$gd_numdatabasebackups DB backups available. Too high? Investigate (Distinct Days Suggest $gd_numdbestimate Full Backups).";
		$gd_managementsummary="$gd_managementsummary<w:br/>-  There are more TSM database backups being kept than the DRMSTATUS would suggest. This may need investigating.";
		our $gd_drmdbstatus_status="WARNING";
		our $gd_drmdbcolor="orange";
		if ($traffic_light eq "GREEN") { $traffic_light="ORANGE"}
		}
	if ($gd_drmdbstatus > 3) {
		our $gd_numdbrecommendation="DRMSTATUS is high at $gd_drmdbstatus. Should be 3.";
		our $gd_drmdbstatus_status="WARNING";
		our $gd_drmdbcolor="orange";
		if ($traffic_light eq "GREEN") { $traffic_light="ORANGE"}
		
	}
	if ($gd_numdatabasebackups == $gd_drmdbstatus && $gd_drmdbstatus == 3) {
		$gd_numdbrecommendation="DRMSTATUS OK at $gd_drmdbstatus and DB backups is $gd_numdatabasebackups";
	        $gd_managementsummary="$gd_managementsummary<w:br/>-  The DRMSTATUS is too low at $gd_drmdbstatus - this should be set at least 3 for DR recovery.";
		our $gd_drmdbstatus_status="OK";
	}
}

if ($gd_drmdb24hours == 0 ) { $gd_db24hoursrecommendation="There were no database backups within the last 24 hours.";
$gd_managementsummary="$gd_managementsummary<w:br/>-  There were no TSM database backups within the last 24 hours.";
$gd_drmdb24hours_status="FAILED";
our $gd_drmdb24hourscolor="red";
$traffic_light="RED";}
else {$gd_db24hoursrecommendation="No action required";}

open (DBBACKUP, ">$test_dir/${tsm_server}_DBBACKUP.txt");
$temp_command=qx("${baclient_directory}dsmadmc.exe -id=$tsm_user -pa=$tsm_password -optfile=${host_directory}/dsm_custom.opt q volhist type=dbbackup");
print DBBACKUP $temp_command;
close DBBACKUP;

open (DBBACKUPRET, ">$test_dir/${tsm_server}_DBBACKUPRET.txt");
$temp_command=qx("${baclient_directory}dsmadmc.exe -id=$tsm_user -pa=$tsm_password -optfile=${host_directory}/dsm_custom.opt q DRMSTATUS");
print DBBACKUPRET $temp_command;
close DBBACKUPRET;

## DISK POOLS TO NULL

our $gd_recnumdiskpoolsnullcolor="green";our $gd_diskpoolnext = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select count(*) from stgpools where devclass='DISK' and nextstgpool is NULL");
chomp $gd_diskpoolnext;

if ($gd_diskpoolnext == 0) {
		our $gd_recnumdiskpoolsnull="All DISK pools have a NEXT pool";        
		our $gd_recnumdiskpoolsnull_status="OK";
	}
if ($gd_diskpoolnext == 1) {
		our $gd_recnumdiskpoolsnull="There is $gd_numdiskpoolsnull DISK pool with no NEXT pool set";        
		our $gd_recnumdiskpoolsnull_status="FAILED";
		our $gd_recnumdiskpoolsnullcolor="red";
		$traffic_light="RED";
	}
if ($gd_diskpoolnext > 1) {
		our $gd_recnumdiskpoolsnull="There are $gd_numdiskpoolsnull DISK pools with no NEXT pool set";        
		our $gd_recnumdiskpoolsnull_status="FAILED";
		our $gd_recnumdiskpoolsnullcolor="red";
		$traffic_light="RED";
	}

open (RANDOMONNEXT, ">$test_dir/${tsm_server}_RANDOMONNEXT.txt");
$temp_command=qx("${baclient_directory}dsmadmc.exe -id=$tsm_user -pa=$tsm_password -optfile=${host_directory}/dsm_custom.opt q stg");
print RANDOMONNEXT $temp_command;
close RANDOMONNEXT;
	
	## REUSE DELAYS

our $gd_reusedbcolor="green";
our $gd_reusedelays = `${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt "select count(*) from stgpools,drmstatus where devclass!='DISK' and stgpools.reusedelay<drmstatus.dbbexpiredays"`;
our $gd_rud = `${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt "select dbbexpiredays from drmstatus"`;our $gd_reusehigh = `${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt "select count(*) from stgpools,drmstatus where devclass!='DISK' and stgpools.reusedelay>drmstatus.dbbexpiredays"`;our $gd_drmstatus_expire = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select dbbexpiredays from drmstatus");

chomp $gd_reusedelays;
chomp $gd_drmstatus_expire;
chomp $gd_reusehigh;
$gd_reusetotal=$gd_reusedelays+$gd_reusehigh;

if ($gd_reusedelays == 0 && $gd_reusehigh == 0) {
		our $gd_recreusedelay="All Reuse delays are OK";        
		our $gd_reusedbstatus_status="OK";
	}
if ($gd_reusedelays >= 1 && $gd_reusehigh == 0) {
		our $gd_recreusedelay="There are $gd_reusedelays sequential pools with REUSE less than DBEXPIREDAYS ($gd_drmdbstatus)";        
		our $gd_reusedbstatus_status="FAILED";
		our $gd_reusedbcolor="red";
		$traffic_light="RED";
	}
if ($gd_reusehigh > 0 && $gd_reusedelays == 0) {
		our $gd_recreusedelay="There are $gd_reusehigh sequential pools with REUSE greater than DBEXPIREDAYS ($gd_drmdbstatus)";        
		our $gd_reusedbstatus_status="WARNING";
		our $gd_reusedbcolor="orange";
		if ($traffic_light eq "GREEN") { $traffic_light="ORANGE"}
	}
	if ($gd_reusehigh > 0 && $gd_reusedelays > 0) {
		our $gd_recreusedelay="$gd_reusetotal pools have REUSE greater AND less than DBEXPIREDAYS ($gd_drmdbstatus)";        
		our $gd_reusedbstatus_status="FAILED";
		our $gd_reusedbcolor="red";
		$traffic_light="RED";
	}

open (REUSEDELAY, ">$test_dir/${tsm_server}_REUSEDELAY.txt");
$temp_command=qx("${baclient_directory}dsmadmc.exe -id=$tsm_user -pa=$tsm_password -optfile=${host_directory}/dsm_custom.opt SELECT STGPOOL_NAME, REUSEDELAY FROM STGPOOLS");
print REUSEDELAY $temp_command;
close REUSEDELAY;


## Scratch Tape Warnings

our $gd_numscratchwarnings = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt  select count from actlog where (msgno='0692' or msgno='1403' or msgno='1404' or msgno='1405' or msgno='1407' or msgno='3516' or msgno='4583' or msgno='6984' or msgno='8945') ");
chomp $gd_numscratchwarnings;

if ($gd_numscratchwarnings == 0) { $gd_scratchrecommendations="There have been no warnings about lack of scratch tapes using analysis of the most common messages over the period of the activity log retention. If the administrator knows otherwise then more scratch should be freed up or added.";}
else { $gd_scratchrecommendations="There have been $gd_numscratchwarnings warnings about lack of scratch tapes in this environment using analysis of the most common messages over the period of the activity log retention. Action should be taken to make more scratch media available and reclamation and drm procedures should be reviewed. The maxscratch settings should be reviewed.";
$gd_managementsummary="$gd_managementsummary<w:br/>-  There have been warnings for scratch tapes. Review the number of tapes available and the maxscratch setting on the storage pools.";
}

## Databsse Levels

our $gd_dbutilcolor="green";our $gd_dbutil_status="";
our $gd_dbutilisation = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select cast((100*(USED_DB_SPACE_MB/TOT_FILE_SYSTEM_MB)) as decimal(5,2)) FROM db");
chomp $gd_dbutilisation;

if ($gd_dbutilisation >= 80) { 
	$gd_dbutilrecommendations="Database Utilisation too high at >= 80%";
	$gd_dbutil_status="FAILED";
	our $gd_dbutilcolor="red";
	$traffic_light="RED";
	}
if ($gd_dbutilisation < 80) {
	$gd_dbutilrecommendations="Database Utilisation OK at < 80%";
	$gd_dbutil_status="OK";
	}
open (DBLEVEL, ">$test_dir/${tsm_server}_DBLEVEL.txt");
$temp_command=qx("${baclient_directory}dsmadmc.exe -id=$tsm_user -pa=$tsm_password -optfile=${host_directory}/dsm_custom.opt q db f=d");
print DBLEVEL $temp_command;
close DBLEVEL;	

## Storage Pool Backups in Scripts

our $gd_stgpscriptcolor="green";
our $gd_stgpscript_status="";
our $gd_stgpscript = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select count(unique(c.command)) from scripts c,admin_schedules s where lower(c.command) like '%ba% stg%' and lower(c.name) in (select substr(s.command,5) from admin_schedules) and s.active='YES'");
our $gd_stgpcount = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select count from stgpools where pooltype='PRIMARY' and devclass!='CLOUD' and devclass!='DIRECTORY'");
chomp $gd_stgpscript;
chomp $gd_stgpcount;
$gd_stgshortfall=($gd_stgpcount-$gd_stgpscript);

if ($gd_stgshortfall > 0) { 
	$gd_stgpscriptrecommendations="There are $gd_stgpcount primary (non CLOUD/non CONTAINER) pools and $gd_stgpscript unique stgpool backup lines in ACTIVE (being run) scripts. Needs checking!";
	$gd_stgpscript_status="CHECK";
	our $gd_stgpscriptcolor="aquamarine";
	}
if ($gd_stgshortfall == 0) { 
	$gd_stgpscriptrecommendations="There are the same number of primary (non CLOUD/non CONTAINER) pools as backup lines in ACTIVE (being run) scripts. Advice is to check regardless.";
	$gd_stgpscript_status="OK";
	}
open (STGPSCRIPT, ">$test_dir/${tsm_server}_STGPSCRIPT.txt");
$temp_command=qx("${baclient_directory}dsmadmc.exe -id=$tsm_user -pa=$tsm_password -optfile=${host_directory}/dsm_custom.opt select c.name, c.command from scripts c,admin_schedules s where lower(c.command) like '%ba% stg%' and lower(c.name) in (select substr(s.command,5) from admin_schedules)");
print STGPSCRIPT $temp_command;
close STGPSCRIPT;	
open (STGPSCRIPT, ">>$test_dir/${tsm_server}_STGPSCRIPT.txt");
$temp_command=qx("${baclient_directory}dsmadmc.exe -id=$tsm_user -pa=$tsm_password -optfile=${host_directory}/dsm_custom.opt select stgpool_name, devclass from stgpools where pooltype='PRIMARY' and devclass!='CLOUD' and devclass!='DIRECTORY'");
print STGPSCRIPT $temp_command;
close STGPSCRIPT;

	
	## Databsse Backup in script

our $gd_dbscriptcolor="green";
our $gd_dbscript_status="";
our $gd_dbscript = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select count from scripts c,admin_schedules s where lower(c.command) like '%ba% db%' and lower(c.name) in (select lower(substr(s.command,5)) from admin_schedules) and s.active='YES'");
our $gd_dbadminsched = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select COUNT from admin_schedules where lower(command) like '%ba% db%' and active='YES' and lower(command) not like '%select%'");
chomp $gd_dbscript;
chomp $gd_dbadminsched;
$gd_total_scriptlines=($gd_dbscript+$gd_dbadminsched);

if ($gd_dbscript == 0 && $gd_dbadminsched == 0) { 
	$gd_dbscriptrecommendations="There are no lines in any server script or any ACTIVE admin schedule that back up the database. This needs to be rectified or is running manually.";
	$gd_dbscript_status="FAILED";
	our $gd_dbscriptcolor="red";
	$traffic_light="RED";
	}
if ($gd_dbscript > 0 || $gd_dbadminsched > 0 ) {
	$gd_dbscriptrecommendations="There are $gd_dbscript line(s) in ACTIVE scheduled server scripts and $gd_dbadminsched ACTIVE admin scripts (that specifically back up the database).";
	$gd_dbscript_status="OK";
	}
open (DBSCRIPT, ">$test_dir/${tsm_server}_DBSCRIPT.txt");
$temp_command=qx("${baclient_directory}dsmadmc.exe -id=$tsm_user -pa=$tsm_password -optfile=${host_directory}/dsm_custom.opt select name, command from scripts where lower(command) like '%ba% db%'");
print DBSCRIPT $temp_command;
close DBSCRIPT;	
open (DBSCRIPT, ">>$test_dir/${tsm_server}_DBSCRIPT.txt");
$temp_command=qx("${baclient_directory}dsmadmc.exe -id=$tsm_user -pa=$tsm_password -optfile=${host_directory}/dsm_custom.opt select SCHEDULE_name,active, command from ADMIN_SCHEDULES where lower(command) like '%ba% db%'");
print DBSCRIPT $temp_command;
close DBSCRIPT;
open (DBSCRIPT, ">>$test_dir/${tsm_server}_DBSCRIPT.txt");
$temp_command=qx("${baclient_directory}dsmadmc.exe -id=$tsm_user -pa=$tsm_password -optfile=${host_directory}/dsm_custom.opt select SCHEDULE_name,active, command from ADMIN_SCHEDULES");
print DBSCRIPT $temp_command;
close DBSCRIPT;
## Log Levels

our $gd_logutilcolor="green";
our $gd_logutil_status="";
our $gd_logutilisation = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select cast((USED_SPACE_MB / decimal(TOTAL_SPACE_MB)*100) as decimal(5,2)) from log");
chomp $gd_logutilisation;

if ($gd_logutilisation >= 50) { 
	$gd_logutilrecommendations="Log Utilisation too high at >= 50%";
	$gd_logutil_status="WARNING";
	our $gd_logutilcolor="orange";
	if ($traffic_light eq "GREEN") { $traffic_light="ORANGE"}
	}
if ($gd_logutilisation < 50) {
	$gd_logutilrecommendations="Log Utilisation OK at < 50%";
	$gd_logutil_status="OK";
	}
	
open (LOGLEVEL, ">$test_dir/${tsm_server}_LOGLEVEL.txt");
$temp_command=qx("${baclient_directory}dsmadmc.exe -id=$tsm_user -pa=$tsm_password -optfile=${host_directory}/dsm_custom.opt q log f=d");
print LOGLEVEL $temp_command;
close LOGLEVEL;		
## Log Mirror

our $gd_logprotectcolor="green";
our $gd_logprotect_status="";
our $gd_logprotect = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select MIRROR_LOG_DIR from log");
chomp $gd_logprotect;

if ($gd_logprotect eq "" ) { 
	$gd_logprotectrecommendations="There is no log mirror (log protection). It is not required but should be checked.";
	$gd_logprotect_status="CHECK";
	our $gd_logprotectcolor="aquamarine";
	our $gd_logprotyesorno="No";
	}
if ($gd_logprotect ne "") {
	$gd_logprotectrecommendations="Log is protected with a mirror (directory is $gd_logprotect)";
	$gd_logprotect_status="OK";
	our $gd_logprotyesorno="Yes";
	}
	
open (LOGPROTECT, ">$test_dir/${tsm_server}_LOGPROTECT.txt");
$temp_command=qx("${baclient_directory}dsmadmc.exe -id=$tsm_user -pa=$tsm_password -optfile=${host_directory}/dsm_custom.opt q log f=d");
print LOGPROTECT $temp_command;
close LOGPROTECT;		
## ArchLog Failover

our $gd_archlogfailcolor="green";
our $gd_archlogfail_status="";
our $gd_archlogfail = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt select AFAILOVER_LOG_DIR from log");
chomp $gd_archlogfail;

if ($gd_archlogfail eq "" ) { 
	$gd_archlogfailrecommendations="There is no archivelog failover dir. It is not required but should be checked.";
	$gd_archlogfail_status="CHECK";
	our $gd_archlogfailcolor="aquamarine";
	our $gd_archlogfailyesorno="No";
	}
if ($gd_archlogfail ne "") {
	$gd_archlogfailrecommendations="Archive log has a failover destination (directory is $gd_archlogfail)";
	$gd_archlogfail_status="OK";
	our $gd_archlogfailyesorno="Yes";
	}
	
open (ARCHFAIL, ">$test_dir/${tsm_server}_ARCHFAIL.txt");
$temp_command=qx("${baclient_directory}dsmadmc.exe -id=$tsm_user -pa=$tsm_password -optfile=${host_directory}/dsm_custom.opt q log f=d");
print ARCHFAIL $temp_command;
close ARCHFAIL;	

## Code Level
$gd_codecolor="green";
our $gd_tsmcodelevel = qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${host_directory}dsm_custom.opt  select version,release,level,sublevel from status");
chomp $gd_tsmcodelevel;
($gd_tsm_version,$gd_tsm_release,$gd_tsm_level,$gd_tsm_sublevel ) = (split /,/,$gd_tsmcodelevel)[0,1,2,3];
$gd_tsmcodelevel=~s/,/./g;

if ($gd_tsm_version < 7) {
	$gd_tsmcoderecommendation="$gd_tsm_version.x is no longer supported by IBM.";
	$gd_managementsummary="$gd_managementsummary<w:br/>-  $gd_tsmcoderecommendation";
	$gd_codecolor="red";
	$gd_codestatus="FAILED";
}

if ($gd_tsm_version == 7  ) {
	$gd_tsmcoderecommendation="Version $gd_tsm_version.$gd_tsm_release.x.x is currently supported by IBM.";
	$gd_managementsummary="$gd_managementsummary<w:br/>-  $gd_tsmcoderecommendation";
	$gd_codestatus="OK";
	}


if ($gd_tsm_version == 8  ) {
	$gd_tsmcoderecommendation="Version $gd_tsm_version.$gd_tsm_release.x.x is currently supported by IBM.";
	$gd_managementsummary="$gd_managementsummary<w:br/>-  $gd_tsmcoderecommendation";
	$gd_codestatus="OK";
	}
	
	if ($gd_tsm_version == 9  ) {
	$gd_tsmcoderecommendation="Version $gd_tsm_version.$gd_tsm_release.x.x is currently supported by IBM.";
	$gd_managementsummary="$gd_managementsummary<w:br/>-  $gd_tsmcoderecommendation";
	$gd_codestatus="OK";
	}

open (CODELEVEL, ">$test_dir/${tsm_server}_CODELEVEL.txt");
$temp_command=qx("${baclient_directory}dsmadmc.exe -id=$tsm_user -pa=$tsm_password -optfile=${host_directory}/dsm_custom.opt select * from status");
print CODELEVEL $temp_command;
close CODELEVEL;	
	
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

###############################################
#### MAX and MINS Processing
###############################################

### Finally, the management summary - this needs to be last
###

}
sub helix_panel
{
#########
######### Set libraries and dates
#########
	
use Tk;
use File::Spec;
our ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime;
$year += 1900;
$mon += 1;
our $datetime = sprintf "%04d%02d%02d%02d%02d%02d", $year, $mon, $mday, $hour, $min, $sec;
print "$datetime\n";
use POSIX;
our ${datetime2} = strftime( '%d_%m_%Y', localtime );
chomp ${datetime2};

{
   
DRAWQHELIXMENU:
	our ${datetime2} = strftime( '%d_%m_%Y', localtime );
	chomp ${datetime2};
	&draw_heading;
	
print "\n==== HELIX MENU OPEN ====\n";


#########
######### Make Window
#########

our $mw = MainWindow->new;
$mw->resizable( 0, 0 );
$mw->geometry("1920x1080+2+2");
$mw->Frame(-background => 'orange')->pack(-ipadx => 10, -side => "left", -fill => "y");
$mw->Frame->pack(-ipadx => 5, -side => "left", -fill => "y");
$frame1 = $mw->Frame->pack(-ipadx=>50,-side=> "left",-fill => "y");
$frame2 = $mw->Frame->pack(-ipadx=>50,-side=> "left",-fill => "y");
# $frame3 = $mw->Frame->pack(-ipadx=>35,-side=> "left",-fill => "y");
# $frame4 = $mw->Frame->pack(-ipadx=>50,-side=> "left",-fill => "y");
$mw->configure(-title => 'Tectrade: Helix Check');
#########
######### Print Gap
#########
$frame1->Label(-text => "", -font => [
            -size   => 6,      
	],
) ->pack (-side => 'top', -anchor => 'w');

$frame1->Label (
         -text => "Server: $tsm_server Report Date: ${datetime2} Ver: $software_version",
         -font => [
            -family => 'Verdana',
            -size   => 10,
            -weight => 'bold',
            
         ],
      )->pack (-side => 'top', -anchor => 'w');


# $image = $mw->Photo(-file => "$host_ps_directory/tectrade.bmp");
# $frame1->Button(-text => 'Exit', -command => sub { exit },
            # -image => $image)->pack (-side => 'top', -anchor => 'w');
            

#########
######### TSM credentials
#########

###
### Address
###

# # $frame1->Label(-anchor => 'w', -width => 25, -height => 1, -text => "SP server address", -font => [
            # # -family => 'Verdana',
            # # -size   => 6,
            # # -weight => 'bold',
	# # ],
# # ) ->pack (-side => 'top', -anchor => 'w'); 
# # #) ->pack (-side => 'top'); 
# $spaddr=$frame1->Entry (-textvariable => \$tsm_server)->pack(-side => 'top');



# ###
# ### Port
# ###


# # $frame1->Label(-anchor => 'w', -width => 25, -height => 1, -text => "SP server port", -font => [
            # # -family => 'Verdana',
            # # -size   => 6,
            # # -weight => 'bold',
	# # ],
# # #) ->pack (-side => 'top', -anchor => 'w');
# # ) ->pack (-side => 'top');
# $spport=$frame1->Entry(-textvariable => \$tsm_port)->pack(-side => 'top');


# ###
# ### User
# ###

# # $frame1->Label(-anchor => 'w', -width => 25, -height => 1, -text => "SP user", -font => [
            # # -family => 'Verdana',
            # # -size   => 6,
            # # -weight => 'bold',
	# # ],
# # #) ->pack (-side => 'top', -anchor => 'w');
# # ) ->pack (-side => 'top');
# $spuser=$frame1->Entry(-textvariable => \$tsm_user)->pack(-side => 'top');

# ###
# ### Password
# ###


# # $frame1->Label(-anchor => 'w', -width => 25, -height => 1, -text => "SP user password", -font => [
            # # -family => 'Verdana',
            # # -size   => 6,
            # # -weight => 'bold',
	# # ],
# # #) ->pack (-side => 'top', -anchor => 'w');
# # ) ->pack (-side => 'top');
# $sppass=$frame1->Entry (-textvariable => \$tsm_password,-show => 'x')->pack(-side => 'top');

chomp $tsm_server;
chomp $tsm_port;
chomp $tsm_user;
chomp $tsm_password;

## Variables

## Print Heading

$frame1->Label(-anchor => 'w', -height => 1, -text => "Helix Tests", -font => [
            -family => 'Verdana',
            -size   => 8,
            -weight => 'bold',
            
	],
) ->pack (-side => 'top', -anchor => 'w');

### Traffic Lights

if ($traffic_light eq "GREEN") { $cmd_button = $frame1->Button(-width => 50, -height => 1, -background => 'green', -text => " Overall Test Status: $traffic_light (click to generate report)", -font => [
            -family => 'Verdana',
            -size   => 7,
         ],
)->pack (-anchor => 'w');
}
if ($traffic_light eq "RED") { 
$cmd_button = $frame1->Button(-width => 50, -height => 1, -background => 'red', -text => " Overall Test Status: $traffic_light (click to generate report)", -font => [
            -family => 'Verdana',
            -size   => 7,
         ],
)->pack (-anchor => 'w');
}
if ($traffic_light eq "ORANGE") { 
$cmd_button = $frame1->Button(-width => 50, -height => 1, -background => 'orange', -text => " Overall Test Status: $traffic_light (click to generate report)", -font => [
            -family => 'Verdana',
            -size   => 7,
         ],
)->pack (-anchor => 'w');
}

#########
######### Print Gap
#########
$frame1->Label(-text => "", -font => [
            -size   => 6,      
	],
) ->pack (-side => 'top', -anchor => 'w');

## Spectrum Code Level
$sp_code_level=$frame1->Button(-anchor => 'w', -width => 200, -height => 1, -background => $gd_codecolor, -text => "Spectrum Protect Code Level:\t$gd_tsm_version.$gd_tsm_release.$gd_tsm_level.$gd_tsm_sublevel\t\t\tStatus: $gd_codestatus\t\t$gd_tsmcoderecommendation (click for EOS dates)", -command =>sub{
		system ("start https://tinyurl.com/y2tp7cqk");
		system ("start notepad $test_dir/${tsm_server}_CODELEVEL.txt");
		
}, -font => [
            -family => 'Verdana',
            -size   => 6,         
	],	
) ->pack (-side => 'top', -anchor => 'w');

## Database Utilisation

$frame1->Button(-anchor => 'w', -width => 200, -height => 1, -background => $gd_dbutilcolor, -text => "SP Database Utilisation:\t\t${gd_dbutilisation}%\t\t\tStatus: $gd_dbutil_status\t\t$gd_dbutilrecommendations", -command =>sub{
		system ("start notepad $test_dir/${tsm_server}_DBLEVEL.txt");
}, -font => [
            -family => 'Verdana',
            -size   => 6,         
	],	
) ->pack (-side => 'top', -anchor => 'w');

## Active Log Utilisation

$frame1->Button(-anchor => 'w', -width => 200, -height => 1, -background => $gd_logutilcolor, -text => "SP Activelog Utilisation:\t\t${gd_logutilisation}%\t\t\tStatus: $gd_logutil_status\t\t$gd_logutilrecommendations", -command =>sub{
		system ("start notepad $test_dir/${tsm_server}_LOGLEVEL.txt");
}, -font => [
            -family => 'Verdana',
            -size   => 6,         
	],	
) ->pack (-side => 'top', -anchor => 'w');

## Active Log Protection

$frame1->Button(-anchor => 'w', -width => 200, -height => 1, -background => $gd_logprotectcolor, -text => "SP Activelog Protection:\t\t$gd_logprotyesorno\t\t\tStatus: $gd_logprotect_status\t\t$gd_logprotectrecommendations", -command =>sub{
		system ("start notepad $test_dir/${tsm_server}_LOGPROTECT.txt");
}, -font => [
            -family => 'Verdana',
            -size   => 6,         
	],	
) ->pack (-side => 'top', -anchor => 'w');

## Archive Log Failover

$frame1->Button(-anchor => 'w', -width => 200, -height => 1, -background => $gd_archlogfailcolor, -text => "SP Archive Log Failover:\t\t$gd_archlogfailyesorno\t\t\tStatus: $gd_archlogfail_status\t\t$gd_archlogfailrecommendations", -command =>sub{
		system ("start notepad $test_dir/${tsm_server}_ARCHFAIL.txt");
}, -font => [
            -family => 'Verdana',
            -size   => 6,         
	],	
) ->pack (-side => 'top', -anchor => 'w');

## Database backups are scheduled?

$frame1->Button(-anchor => 'w', -width => 200, -height => 1, -background => $gd_dbscriptcolor, -text => "Database Backups are Scheduled?:\t$gd_total_scriptlines (methods)\t\tStatus: $gd_dbscript_status\t\t$gd_dbscriptrecommendations", -command =>sub{
		system ("start notepad $test_dir/${tsm_server}_DBSCRIPT.txt");
}, -font => [
            -family => 'Verdana',
            -size   => 6,         
	],	
) ->pack (-side => 'top', -anchor => 'w');



## Database backups in 24 hours

$frame1->Button(-anchor => 'w', -width => 200, -height => 1, -background => $gd_drmdb24hourscolor, -text => "Database Backups in Last 24 Hours?:\t$gd_drmdb24hours (number)\t\tStatus: $gd_drmdb24hours_status\t\t(Total Backup Vols = $gd_numdatabasebackups/Est $gd_numdbestimate days)", -command =>sub{
		system ("start notepad $test_dir/${tsm_server}_DBBACKUP.txt");
}, -font => [
            -family => 'Verdana',
            -size   => 6,         
	],	
) ->pack (-side => 'top', -anchor => 'w');

## Database backup Retention

$frame1->Button(-anchor => 'w', -width => 200, -height => 1, -background => $gd_drmdbcolor, -text => "DRM Database Retention:\t\t$gd_drmdbstatus (days)\t\t\tStatus: $gd_drmdbstatus_status\t\t$gd_numdbrecommendation", -command =>sub{
		system ("start notepad $test_dir/${tsm_server}_DBBACKUPRET.txt");
}, -font => [
            -family => 'Verdana',
            -size   => 6,         
	],	
) ->pack (-side => 'top', -anchor => 'w');

## REUSE Delays

$frame1->Button(-anchor => 'w', -width => 200, -height => 1, -background => $gd_reusedbcolor, -text => "REUSE Delays Hi/Low:\t\t$gd_reusetotal (pools)\t\t\tStatus: $gd_reusedbstatus_status\t\t$gd_recreusedelay", -command =>sub{
		system ("start notepad $test_dir/${tsm_server}_REUSEDELAY.txt");
}, -font => [
            -family => 'Verdana',
            -size   => 6,         
	],	
) ->pack (-side => 'top', -anchor => 'w');

## Process FILE class DB backups

$frame1->Button(-anchor => 'w', -width => 200, -height => 1, -background => $gd_fileprocesscolor, -text => "Process File DB Backups?:\t\t(Yes or No?)\t\tStatus: $gd_fileprocess_status\t\t$gd_fileprocessrecommendation", -command =>sub{
		system ("start notepad $test_dir/${tsm_server}_FILEPROCESS.txt");
}, -font => [
            -family => 'Verdana',
            -size   => 6,         
	],	
) ->pack (-side => 'top', -anchor => 'w');

## Actlog Retention
$frame1->Button(-anchor => 'w', -width => 200, -height => 1, -background => $gd_actlogcolor, -text => "Activity Log Retention:\t\t$gd_actlogretention (days)\t\tStatus: $gd_actlog_status\t\t$gd_actlogrecommendation", -command =>sub{
		system ("start notepad $test_dir/${tsm_server}_ACTLOGRET.txt");
}, -font => [
            -family => 'Verdana',
            -size   => 6,         
	],	
) ->pack (-side => 'top', -anchor => 'w');

## Summary Log Retention
$frame1->Button(-anchor => 'w', -width => 200, -height => 1, -background => $gd_sumlogcolor, -text => "Summary Log Retention:\t\t$gd_sumlogretention (days)\t\tStatus: $gd_sumlog_status\t\t$gd_sumlogrecommendation", -command =>sub{
		system ("start notepad $test_dir/${tsm_server}_SUMMRET.txt");
}, -font => [
            -family => 'Verdana',
            -size   => 6,         
	],	
) ->pack (-side => 'top', -anchor => 'w');

## Event Log Retention
$frame1->Button(-anchor => 'w', -width => 200, -height => 1, -background => $gd_evlogcolor, -text => "Event Log Retention:\t\t$gd_evlogretention (days)\t\tStatus: $gd_evlog_status\t\t$gd_evlogrecommendation", -command =>sub{
		system ("start notepad $test_dir/${tsm_server}_EVRET.txt");;
}, -font => [
            -family => 'Verdana',
            -size   => 6,         
	],	
) ->pack (-side => 'top', -anchor => 'w');

## Expiration Interval
$frame1->Button(-anchor => 'w', -width => 200, -height => 1, -background => $gd_expintervalcolor, -text => "Expiration Interval:\t\t\t$gd_expinterval\t\t\tStatus: $gd_expinterval_status\t\t$gd_expintervalrecommend", -command =>sub{
		system ("start notepad $test_dir/${tsm_server}_EXPINTERVAL.txt");
}, -font => [
            -family => 'Verdana',
            -size   => 6,         
	],	
) ->pack (-side => 'top', -anchor => 'w');

## MAXSESSIONS

$frame1->Button(-anchor => 'w', -width => 200, -height => 1, -background => $gd_stgpscriptcolor, -text => "Scheduled Backup Stgpool?:\t\t$gd_stgshortfall (missing)\t\tStatus: $gd_stgpscript_status\t\t$gd_stgpscriptrecommendations", -command =>sub{
		system ("start notepad $test_dir/${tsm_server}_STGPSCRIPT.txt");
}, -font => [
            -family => 'Verdana',
            -size   => 6,         
	],	
) ->pack (-side => 'top', -anchor => 'w');
## MAXSESSIONS

$frame1->Button(-anchor => 'w', -width => 200, -height => 1, -background => $gd_maxsessionscolor, -text => "Maximum Client Sessions:\t\t$gd_maxsessions (sessions)\t\tStatus: $gd_maxsessions_status\t\t$gd_maxsessrecommendation", -command =>sub{
		system ("start notepad $test_dir/${tsm_server}_MAXSESSIONS.txt");
}, -font => [
            -family => 'Verdana',
            -size   => 6,         
	],	
) ->pack (-side => 'top', -anchor => 'w');
## MAXSCHEDSESSIONS

$frame1->Button(-anchor => 'w', -width => 200, -height => 1, -background => $gd_maxschedsessionscolor, -text => "Maximum Scheduled Sessions:\t${gd_maxschedsessions}%\t\t\tStatus: $gd_maxschedsessions_status\t\t$gd_maxschedsessrecommendation", -command =>sub{
		system ("start notepad $test_dir/${tsm_server}_MAXSCHEDSESSIONS.txt");
}, -font => [
            -family => 'Verdana',
            -size   => 6,         
	],	
) ->pack (-side => 'top', -anchor => 'w');
## SCHEDMODE

$frame1->Button(-anchor => 'w', -width => 200, -height => 1, -background => $gd_schedmodecolor, -text => "Schedule Mode:\t\t\t${gd_schedmode}\t\t\tStatus: $gd_schedmode_status\t\t$gd_schedmoderecommendation", -command =>sub{
		system ("start notepad $test_dir/${tsm_server}_SCHEDMODE.txt");
}, -font => [
            -family => 'Verdana',
            -size   => 6,         
	],	
) ->pack (-side => 'top', -anchor => 'w');

## QUERY SCHED PERIOD

$frame1->Button(-anchor => 'w', -width => 200, -height => 1, -background => $gd_schedperiodcolor, -text => "Query Schedule Period:\t\t${gd_schedperiod} (hours)\t\t\tStatus: $gd_schedperiod_status\t\t$gd_schedperiodrecommendation", -command =>sub{
		system ("start notepad $test_dir/${tsm_server}_QSCHEDPERIOD.txt");
}, -font => [
            -family => 'Verdana',
            -size   => 6,         
	],	
) ->pack (-side => 'top', -anchor => 'w');

## MoveBatchSize

$frame1->Button(-anchor => 'w', -width => 200, -height => 1, -background => $gd_movebatchsizecolor, -text => "MOVEBATCHSIZE Setting:\t\t${gd_movebatchsize}     \t\t\tStatus: $gd_movebatchsize_status\t\t$gd_movebatchsizerecommendation", -command =>sub{
		system ("start notepad $test_dir/${tsm_server}_MOVEBATCHSIZE.txt");
}, -font => [
            -family => 'Verdana',
            -size   => 6,         
	],	
) ->pack (-side => 'top', -anchor => 'w');
## MoveSizeThresh

$frame1->Button(-anchor => 'w', -width => 200, -height => 1, -background => $gd_movesizethreshcolor, -text => "MOVESIZETHRESH Setting:\t\t${gd_movesizethresh}      \t\t\tStatus: $gd_movesizethresh_status\t\t$gd_movesizethreshrecommendation", -command =>sub{
		system ("start notepad $test_dir/${tsm_server}_MOVESIZETHRESH.txt");
}, -font => [
            -family => 'Verdana',
            -size   => 6,         
	],	
) ->pack (-side => 'top', -anchor => 'w');

## TxnGroupMax

$frame1->Button(-anchor => 'w', -width => 200, -height => 1, -background => $gd_txngroupmaxcolor, -text => "TXNGROUPMAX Setting:\t\t${gd_txngroupmax}      \t\t\tStatus: $gd_txngroupmax_status\t\t$gd_txngroupmaxrecommendation", -command =>sub{
		system ("start notepad $test_dir/${tsm_server}_TXNGROUPMAX.txt");
}, -font => [
            -family => 'Verdana',
            -size   => 6,         
	],	
) ->pack (-side => 'top', -anchor => 'w');
## COMMTIMEOUT

$frame1->Button(-anchor => 'w', -width => 200, -height => 1, -background => $gd_commtimeoutcolor, -text => "COMMTIMEOUT Setting:\t\t${gd_commtimeout}\t\t\tStatus: $gd_commtimeout_status\t\t$gd_commtimeoutrecommendation", -command =>sub{
		system ("start notepad $test_dir/${tsm_server}_COMMTIMEOUT.txt");
}, -font => [
            -family => 'Verdana',
            -size   => 6,         
	],	
) ->pack (-side => 'top', -anchor => 'w');

## IDLETIMEOUT

$frame1->Button(-anchor => 'w', -width => 200, -height => 1, -background => $gd_idletimeoutcolor, -text => "IDLETIMEOUT Setting:\t\t${gd_idletimeout}\t\t\tStatus: $gd_idletimeout_status\t\t$gd_idletimeoutrecommendation", -command =>sub{
		system ("start notepad $test_dir/${tsm_server}_IDLETIMEOUT.txt");
}, -font => [
            -family => 'Verdana',
            -size   => 6,         
	],	
) ->pack (-side => 'top', -anchor => 'w');

## ADMIN User

$frame1->Button(-anchor => 'w', -width => 200, -height => 1, -background => $gd_adminlockedcolor, -text => "ADMIN User Security:\t\t($gd_countadmin user)\t\t\tStatus: $gd_adminlocked_status\t\t$gd_adminlockedrecommendation", -command =>sub{
		system ("start notepad $test_dir/${tsm_server}_ADMINS.txt");
}, -font => [
            -family => 'Verdana',
            -size   => 6,         
	],	
) ->pack (-side => 'top', -anchor => 'w');
## License Compliance

$frame1->Button(-anchor => 'w', -width => 200, -height => 1, -background => $gd_compliancecolor, -text => "License Compliance:\t\t\t\t\tStatus: $gd_compliance_status\t\t$gd_compliancerecommendation", -command =>sub{
		system ("start notepad $test_dir/${tsm_server}_LICENCE.txt");
}, -font => [
            -family => 'Verdana',
            -size   => 6,         
	],	
) ->pack (-side => 'top', -anchor => 'w');

## Client Accounting
$frame1->Button(-anchor => 'w', -width => 200, -height => 1, -background => $gd_clientaccstatuscolor, -text => "Client Accounting:\t\t\t$gd_clientaccounting\t\t\tStatus: $gd_expinterval_status\t\t$gd_accountingrecommend", -command =>sub{
		system ("start notepad $test_dir/${tsm_server}_CLIENTACCOUNTING.txt");
}, -font => [
            -family => 'Verdana',
            -size   => 6,         
	],	
) ->pack (-side => 'top', -anchor => 'w');
## DISK Volumes Offline
$frame1->Button(-anchor => 'w', -width => 200, -height => 1, -background => $gd_randomcolor, -text => "DISK Volumes Offline:\t\t$gd_randomoffline (vols)\t\t\tStatus: $gd_randomstatus_status\t\t$gd_randomrecommend", -command =>sub{
		system ("start notepad $test_dir/${tsm_server}_RANDOMONLINE.txt");
}, -font => [
            -family => 'Verdana',
            -size   => 6,         
	],	
) ->pack (-side => 'top', -anchor => 'w');

## No disk NEXT pool
$frame1->Button(-anchor => 'w', -width => 200, -height => 1, -background => $gd_recnumdiskpoolsnullcolor, -text => "Diskpools with no NEXT pool:\t\t$gd_diskpoolnext (pools)\t\t\tStatus: $gd_recnumdiskpoolsnull_status\t\t$gd_recnumdiskpoolsnull",-command =>sub{
		system ("start notepad $test_dir/${tsm_server}_RANDOMONNEXT.txt");
}, -font => [
            -family => 'Verdana',
            -size   => 6,         
	],	
) ->pack (-side => 'top', -anchor => 'w');
## Tape Drives Offline
$frame1->Button(-anchor => 'w', -width => 200, -height => 1, -background => $gd_drives_olcolor, -text => "Tape Drives Offline:\t\t$gd_drivesonline (drives)\t\tStatus: $gd_drives_ol_status\t\t$gd_drivesonlinerecommend", -command =>sub{
		system ("start notepad $test_dir/${tsm_server}_DRIVESOL.txt");
}, -font => [
            -family => 'Verdana',
            -size   => 6,         
	],	
) ->pack (-side => 'top', -anchor => 'w');

## Tape Paths Offline
$frame1->Button(-anchor => 'w', -width => 200, -height => 1, -background => $gd_paths_olcolor, -text => "Tape Paths Offline:\t\t\t$gd_pathsonline (paths)\t\t\tStatus: $gd_paths_ol_status\t\t$gd_pathsonlinerecommend", -command =>sub{
		system ("start notepad $test_dir/${tsm_server}_PATHSOL.txt");
}, -font => [
            -family => 'Verdana',
            -size   => 6,         
	],	
) ->pack (-side => 'top', -anchor => 'w');

## DRM Checklabel
$frame1->Button(-anchor => 'w', -width => 200, -height => 1, -background => $gd_checklcolor, -text => "DRM Checklabel:\t\t\t$gd_checklabel\t\t\tStatus: $gd_checkl_status\t\t$gd_checklrecommend", -command =>sub{
		system ("start notepad $test_dir/${tsm_server}_DRMCHECKL.txt");
}, -font => [
            -family => 'Verdana',
            -size   => 6,         
	],	
) ->pack (-side => 'top', -anchor => 'w');

$frame1->Button(-anchor => 'w', -width => 200, -height => 1, -background => $gd_readonly_containerscolor, -text => "DIR Containers READONLY:\t\t$gd_readonly_containers\t\t\tStatus: $gd_readonly_containers_status\t\t$gd_readonly_containers_recommendation (click to show)", -command =>sub{
		system ("start notepad $test_dir/${tsm_server}_READONLY_CONTAINERS.txt");
}, -font => [
            -family => 'Verdana',
            -size   => 6,         
	],	
) ->pack (-side => 'top', -anchor => 'w');

$frame1->Button(-anchor => 'w', -width => 200, -height => 1, -background => $gd_unavailable_containerscolor, -text => "DIR Containers UNAVAILABLE:\t$gd_unavailable_containers\t\t\tStatus: $gd_unavailable_containers_status\t\t$gd_unavailable_containers_recommendation (click to show)", -command =>sub{
		system ("start notepad $test_dir/${tsm_server}_UNAVAILABLE_CONTAINERS.txt");
}, -font => [
            -family => 'Verdana',
            -size   => 6,         
	],	
) ->pack (-side => 'top', -anchor => 'w');


#########
######### Print Gap
#########
$frame1->Label(-text => "", -font => [
            -size   => 6,      
	],
) ->pack (-side => 'top', -anchor => 'w');


#########
######### Log In
#########

###
### VERSION
###
$versioning_text="(Version: $version)";
# $tsm_button = $frame1->Button(-width => 30, -height => 1, -background => 'yellow', -text => " TSM Stats ", -command =>sub{
	#print "INFO: Loging In with $tsm_server/$tsm_port/$tsm_user/$tsm_password....\n";		
				
$gui_privatevols=qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${baclient_directory}dsm_custom.opt select count(*) from libvolumes where status='Private'");
$gui_missingvols=qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${baclient_directory}dsm_custom.opt select count (unique(volume_name)) from volhistory where devclass in (select devclass_name from devclasses where devtype='LTO' or devclass='3590') and volume_name not in (select volume_name from volumes) and volume_name not in (select volume_name from drmedia) and volume_name not in (select volume_name from libvolumes)");
$gui_scratchvols=qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${baclient_directory}dsm_custom.opt select count(*) from libvolumes where status='Scratch'");
$gui_nodesessions=qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${baclient_directory}dsm_custom.opt select count(*) from sessions where session_type='Node'");
$gui_processes=qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${baclient_directory}dsm_custom.opt select count(*) from processes");
$gui_primphyocc=qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${baclient_directory}dsm_custom.opt select int(sum(physical_mb)/1024) from occupancy WHERE STGPOOL_NAME IN (SELECT STGPOOL_NAME FROM STGPOOLS WHERE POOLTYPE='PRIMARY') AND node_name is not NULL");
$gui_copyphyocc=qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${baclient_directory}dsm_custom.opt select int(sum(physical_mb)/1024) from occupancy WHERE STGPOOL_NAME IN (SELECT STGPOOL_NAME FROM STGPOOLS WHERE POOLTYPE='COPY')  AND node_name is not NULL");
$gui_freedrives=qx("${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${baclient_directory}dsm_custom.opt select count from drives where drive_state='EMPTY' and library_name in (select library_name from libraries where library_type='SCSI' or library_type='3494')");
$gui_dbtf=`${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${baclient_directory}dsm_custom.opt "select count from summary where activity='FULL_DBBACKUP' and start_time>current_timestamp-24 hours and successful='YES'"`;
$gui_nodes=`${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${baclient_directory}dsm_custom.opt "select count from nodes"`;
$gui_uniqnodes=`${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${baclient_directory}dsm_custom.opt "select count(unique(TCP_ADDRESS)) from nodes"`;
@gui_array=`${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=yes -commadelimited -optfile=${baclient_directory}dsm_custom.opt "select unique(volume_name) from volhistory where devclass in (select devclass_name from devclasses where devtype='LTO' or devclass='3590') and volume_name not in (select volume_name from volumes) and volume_name not in (select volume_name from drmedia) and volume_name not in (select volume_name from libvolumes)"`;
s/ANR2034E SELECT: No match found using this criteria./NO MISSING VOLS/ for @gui_array;
s/ANS8001I Return code 11./NO MISSING VOLS/ for @gui_array;
s/\r\n// for @gui_array;
s/\n// for @gui_array;

chomp $gui_dbtf;
chomp $gui_dbtf;
chomp $gui_dbtf;
$gui_dbtf=~s/\r\n//g;
chomp $gui_freedrives;
$gui_freedrives=~s/\r\n//g;

if ($gui_freedrives eq "0") { $gui_freedrives="None free.." }

chomp $gui_privatevols;
$gui_privatevols=~s/\r\n//g;
chomp $gui_missingvols;
$gui_missingvols=~s/\r\n//g;
chomp $gui_scratchvols;
$gui_scratchvols=~s/\r\n//g;
chomp $gui_processes;
$gui_processes=~s/\r\n//g;
chomp $gui_primphyocc;
$gui_primphyocc=~s/\r\n//g;
chomp $gui_nodesessions;
$gui_nodesessions=~s/\r\n//g;
chomp $gui_copyphyocc;
$gui_copyphyocc=~s/\r\n//g;
chomp $gui_nodes;
$gui_nodes=~s/\r\n//g;
chomp $gui_uniqnodes;
$gui_uniqnodes=~s/\r\n//g;

$frame2->Label(-text => "\nSpectrum Protect Statistics:", -font => [
            -family => 'Verdana',
            -size   => 8,
            -weight => 'bold',
         ],
) ->pack (-anchor => 'w');
$frame2->Label(-text => "Library Volumes (Private): \t\t\t$gui_privatevols $gd_volumes_statistics" ) ->pack (-anchor => 'w');
$frame2->Label(-text => "Library Volumes (Scratch): \t\t\t$gui_scratchvols $gd_volumes_statistics" ) ->pack (-anchor => 'w');
$frame2->Label(-text => "Free Drives in Managed Libraries: \t\t$gui_freedrives $gd_volumes_statistics" ) ->pack (-anchor => 'w');
$frame2->Label(-text => "DB Backups within 24 hours and SUCCESSFUL:\t$gui_dbtf" ) ->pack (-anchor => 'w');
$frame2->Label(-text => "Missing Volumes: \t\t\t\t$gui_missingvols $gd_volumes_statistics" ) ->pack (-anchor => 'w');
$frame2->Label(-text => "Number Node Sessions: \t\t\t$gui_nodesessions" )->pack (-anchor => 'w');
$frame2->Label(-text => "Number Processes: \t\t\t\t$gui_processes" ) ->pack (-anchor => 'w');
$frame2->Label(-text => "Physical Primary Occupancy (GB): \t\t$gui_primphyocc" ) ->pack (-anchor => 'w');
$frame2->Label(-text => "Physical Copy Occupancy (GB): \t\t$gui_copyphyocc" )->pack (-anchor => 'w');
$frame2->Label(-text => "Number of Registered Nodes: \t\t\t$gui_nodes" )->pack (-anchor => 'w');
$frame2->Label(-text => "Number of Unique Nodes: \t\t\t$gui_uniqnodes" )->pack (-anchor => 'w');
                       
	
	
# }, -font => [
            # -family => 'Verdana',
            # -size   => 6,
            # #-weight => 'bold',
         # ],
# )->pack (-anchor => 'w');

###
### COMMAND LINE (LOOP)
###

$cmd_button = $frame1->Button(-width => 30, -height => 1, -background => 'green', -text => " TSM CLI (NORMAL) ", -command =>sub{
		
	
                       &make_options_file;	
                       system ("start \"TSM CLI\" cmd.exe /T:$loop_color /k ${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=no -optfile=${baclient_directory}dsm_custom.opt");
                       
	
	
}, -font => [
            -family => 'Verdana',
            -size   => 6,
            #-weight => 'bold',
         ],
)->pack (-anchor => 'w');



###
### COMMAND LINE DELIMITED
###

# $delim_button = $frame1->Button(-width => 30, -height => 1, -background => 'blue', -text => " TSM CLI (DELIMITED) ", -command =>sub{
		
	
                       # &make_options_file;	
                       # system ("start \"TSM CLI (DELIMITED)\" cmd.exe /T:$loop_color /k ${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=no -commadelimited -optfile=${baclient_directory}dsm_custom.opt");
                       
	
	
# }, -font => [
            # -family => 'Verdana',
            # -size   => 6.5,
            # #-weight => 'bold',
         # ],
# )->pack (-anchor => 'w');

###
### CONSOLE
### 

# $console_button = $frame1->Button(-width => 30, -height => 1, -background => 'purple', -text => " TSM CONSOLE ", -command =>sub{
		
	
                       # &make_options_file;	
                        # system ("start \"TSM CONSOLE\" cmd.exe /T:$loop_color /k ${baclient_directory}/dsmadmc.exe -id=$tsm_user -pa=$tsm_password -datao=no -commadelimited -optfile=${baclient_directory}dsm_custom.opt -console");
                       
	
	
# }, -font => [
            # -family => 'Verdana',
            # -size   => 6.5,
            # #-weight => 'bold',
         # ],
# )->pack (-anchor => 'w');


#########
######### Refresh Menu
#########

$refresh_button = $frame1->Button(-width => 30, -height => 1, -background => 'orange', -text => " REFRESH MENU ", -command =>sub{
	print "INFO: Destroying the Menu....\n";
	$mw -> destroy();
	print "INFO: Refreshing Menu....\n";		
	$donothing="refresh";	
	&draw_heading;
	print "INFO: Getting Variables from the Server..... \nINFO: Please Wait (a long time if the server is slow)....\n";
	&get_the_variables;
	
		
}, -font => [
            -family => 'Verdana',
            -size   => 6.5,
            #-weight => 'bold',
         ],
)->pack (-anchor => 'w');

#########
######### Credentials Menu
#########

$refresh_button = $frame1->Button(-width => 30, -height => 1, -background => 'GhostWhite', -text => " CHANGE SERVER ", -command =>sub{
	print "INFO: Destroying the Menu....\n";	$mw -> destroy();
	print "INFO: Changing Credentials....\n";
	&change_credentials;
	print "INFO: Refreshing Menu....\n";		
	$donothing="refresh";	
	&draw_heading;
	print "INFO: Getting Variables from the Server.... \nINFO: Please Wait (a long time if the server is slow)....\n";
	&get_the_variables;
	
		
}, -font => [
            -family => 'Verdana',
            -size   => 6.5,
            #-weight => 'bold',
         ],
)->pack (-anchor => 'w');

#########
######### Exit
#########

$refresh_button = $frame1->Button(-width => 30, -height => 1, -background => 'yellow', -text => " EXIT MENU ", -command =>sub{
	print "INFO: Exiting....\n";		
	
	$mw -> destroy();
	exit;
	
}, -font => [
            -family => 'Verdana',
            -size   => 6.5,
            #-weight => 'bold',
         ],
)->pack (-anchor => 'w');


MainLoop;



if ($donothing eq "refresh") { goto DRAWQHELIXMENU }

}
}##################################
# MAIN ROUTINE

chdir ${host_directory};
&set_client;
&change_credentials;
&draw_heading;
print "INFO: Getting Variables from the Server.... \nINFO: Please Wait (a long time if the server is slow)....\n";
&get_the_variables;&helix_panel;
