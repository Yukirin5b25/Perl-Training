#!/usr/bin/perl

use strict;
use warnings;

sub sum{
    my($sum);
    foreach (@_){
        if($_<0){
            $sum = $_;
            last;
        }
        $sum += $_;
    }
    return $sum;
}

my @list = qw(1 1 2 3 5 -8);
print sum(@list)."\n";