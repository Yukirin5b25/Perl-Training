#!/usr/bin/perl

use strict;
use warnings;

my $input;
my @input;
print "Input sentence:\n";
chomp($input = <STDIN>);
@input = split / /, $input;
for(my $i; $i<=$#input; $i++){
    print $input[$i]."\n";
}
