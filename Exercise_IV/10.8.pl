#!/usr/bin/perl

use File::Copy;

$dir = "/home/linyd/Documents/Perl-Training";
chdir "$dir";

copy ("./Exercise_IV/10.7.pl","./TEMP");