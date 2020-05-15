#!/usr/bin/perl

use strict;
use warnings;

my $input;
my @input;
print "Input sentence:\n";
chomp($input = <STDIN>);
@input = split / /, $input;
foreach(@input){
    print $_."\n";
}
