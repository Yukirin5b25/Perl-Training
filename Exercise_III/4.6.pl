#!/usr/bin/perl

use strict;
use warnings;

my $x = 33;
my $y = 44;
my $a = -21;
my $b = -33;

sub pri_sub{
    my($a,$b) = @_;
    return $a-$b;
}

sub nom_sub{
    my ($a,$b) = @_;
    return $a-$b;
}

print pri_sub(($x,$y))."\t";
print pri_sub(($a,$b))."\t";
print nom_sub(($x,$y))."\t";
print nom_sub(($a,$b))."\t";