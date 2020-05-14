#!/usr/bin/perl

$system_dir = '/bin';

opendir $dh, $system_dir or die "Cannot open $system_dir: $!";
@files = readdir $dh;
printf "Totally %d files in %s.\n", $#files+1, $system_dir;

