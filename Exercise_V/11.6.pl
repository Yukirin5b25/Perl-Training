#!/usr/bin/perl

use strict;
use warnings;

my @array = qw(Fill an array with a couple of words of different lengths and create a new array containing
only those words that contain 4 or more letters.);

print "Input cout to print: ";
my $count = int(my $temp = <STDIN>);
if ($count > $#array+1){
    $count = $#array+1;
}
for(my $i = 0; $i < $count; $i ++){
    print $array[$i]." "
}
print "\n";