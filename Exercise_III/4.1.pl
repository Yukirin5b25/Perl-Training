#!/usr/bin/perl

sub increment{
    $_[0] += 1;
} 

$x = 233;

increment($x);
increment($x);
increment($x);
print $x."\n";