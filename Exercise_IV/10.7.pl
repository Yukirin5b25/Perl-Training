#!/usr/bin/perl

use strict;
use warnings;
use File::Copy;

my $dir = "/home/linyd/Documents/Perl-Training/TEMP/BAK";
opendir my $DIR, $dir or die "Unable to open $dir\n", $!;
my @files = readdir($DIR);

chdir "$dir";

foreach (@files){
    if(not -d $_){
        unlink $_;       
    }
}

chdir "..";
rmdir "./BAK";