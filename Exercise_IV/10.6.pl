#!/usr/bin/perl

use File::Copy;

$dir = "/home/linyd/Documents/Perl-Training/TEMP";
opendir ($DIR, $dir) or die "Unable to open $dir\n", $!;
@files = readdir($DIR);

chdir "$dir";
mkdir "./BAK" or die "mkdir failed.",$!;

foreach (@files){
    if(not -d $_){
        $new = "./BAK/".$_;
        move ($_, $new);        
    }
}