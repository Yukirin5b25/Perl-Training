#!/usr/bin/perl

use strict;
use warnings;

my $system_dir = '/bin';

opendir my $dh, $system_dir or die "Cannot open $system_dir: $!";
my @files = readdir $dh;
my $files_modified_IN_24h;
foreach my $file (@files){
    if(-M $file >1 and not -d $file){
        print $file."\n";
    }
    else{
        $files_modified_IN_24h += 1;
    }
}
print "Count of files modified in one day: ".$files_modified_IN_24h."\n";
#Vm is reinstalled totay..

