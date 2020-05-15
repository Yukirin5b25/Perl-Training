#!/usr/bin/perl

use strict;
use warnings;
use File::Copy;

my $dir = "/home/linyd/Documents/Perl-Training";
chdir "$dir";

copy ("./Exercise_IV/10.7.pl","./TEMP");