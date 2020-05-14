#!/usr/bin/perl

use File::Copy;

$dir = "/home/linyd/Documents/Perl-Training/TEMP/BAK";
opendir ($DIR, $dir) or die "Unable to open $dir\n", $!;
@files = readdir($DIR);

chdir "$dir";

foreach (@files){
    if(not -d $_){
        unlink $_;       
    }
}

chdir "..";
rmdir "./BAK";