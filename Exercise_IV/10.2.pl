#!/usr/bin/perl

$system_dir = '/bin';

opendir $dh, $system_dir or die "Cannot open $system_dir: $!";
@files = readdir $dh;
$modified_IN_24h;
foreach $file (@files){
    if(-M $file >1){
        print $file."\n";
    }
    else{
        $modified_IN_24h += 1;
    }
}
print "Count of files & folders modified in one day: ".$files_modified_IN_24h."\n";
#Vm is reinstalled totay..

