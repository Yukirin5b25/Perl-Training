#!/usr/bin/perl

use strict;
use warnings;

my $system_dir = '/bin';

opendir my $dh, $system_dir or die "Cannot open $system_dir: $!";
my @files = readdir $dh;
my $modified_IN_24h;
foreach my $file (@files){
    if(-M $file >1){
        print $file."\n";
    }
    else{
        $modified_IN_24h += 1;
    }
}
print "Count of files & folders modified in one day: ".$modified_IN_24h."\n";
#Vm is reinstalled totay..

