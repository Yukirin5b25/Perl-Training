#!/usr/bin/perl

use strict;
use warnings;
use File::Copy;

my $dir = "/home/linyd/Documents/Perl-Training/TEMP";
opendir my $DIR, $dir or die "Unable to open $dir\n", $!;
my @files = readdir($DIR);

chdir "$dir";
mkdir "./BAK" or die "mkdir failed.",$!;

foreach (@files){
    if(not -d $_){
        my $new = "./BAK/".$_;
        move ($_, $new);        
    }
}