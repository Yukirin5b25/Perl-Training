#!/usr/bin/perl

use strict;
use warnings;

my @array;

$array[0] = "a";
$array[1] = "b";
$array[2] = "c";
my $i = 0;
while($i <= $#array){
    print $array[$i]."\t";
    $i += 1;
}
print "\n";