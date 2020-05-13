#!/usr/bin/perl

$a = "114";
$b = "514";

#$temp = $b;
#$b = $a;
#$a = $temp;

($a, $b) = ($b, $a);
print $a,$b;
print "\n";
