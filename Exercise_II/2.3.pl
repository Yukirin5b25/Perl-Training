#!/usr/bin/perl

use strict;
use warnings;

my $a = "114";
my $b = "514";

#$temp = $b;
#$b = $a;
#$a = $temp;

($a, $b) = ($b, $a);
print $a,$b;
print "\n";
