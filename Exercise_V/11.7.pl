#!/usr/bin/perl

use strict;
use warnings;

my @arrayA = qw(Fill two arrays with several words.);
my @arrayB = qw(Some elements within the two arrays should be the same some different.);

my @repeats;

foreach(@arrayA){
    if(($_ ~~ @arrayB) && !($_ ~~ @repeats)){
        push(@repeats, $_);
    }
}

print "@repeats";