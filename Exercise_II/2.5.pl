#!/usr/bin/perl


use strict;
use warnings;

my @num_list = (1..5,11..15);

foreach(@num_list){
    $_ *= 2;
}

foreach(@num_list){
    print $_."\t";
}
print "\n";