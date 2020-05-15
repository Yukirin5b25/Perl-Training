#!/usr/bin/perl

use strict;
use warnings;

my $system_dir = '/bin';

opendir my $dh, $system_dir or die "Cannot open $system_dir: $!";
my @files = readdir $dh;
printf "Totally %d files in %s.\n", $#files+1, $system_dir;

