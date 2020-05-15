#!/usr/bin/perl

use strict;
use warnings;

sub sort_rand_list{
    my @numlist;
    for(my $i=0;$i<20000;$i++){
        push(@numlist,int(1+rand(20000)));
    }
    print "@numlist"."\n";
    @numlist = sort @numlist;
    print "@numlist"."\n";
}

my $start_time = time();
sort_rand_list;
my $end_time = time();
printf "start: %s\tend: %s\tcost: %s\n",$start_time,$end_time,$end_time-$start_time;

#shell:  time sort_rand_list

