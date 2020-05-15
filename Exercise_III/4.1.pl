#!/usr/bin/perl

use strict;
use warnings;

sub increment{
    $_[0] += 1;
} 

my $x = 233;

increment($x);
increment($x);
increment($x);
print $x."\n";