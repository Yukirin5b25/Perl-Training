#!/usr/bin/perl

use strict;
use warnings;

my $answer = int(1+rand(100));

#Instead guess with Binary search

my $start = 1;
my $end = 100;
my $current = int(($start + $end)/2);
print "target: ".$answer."\n";
printf "start: %d\tend: %d\tcurrent: %d\n", $start,$end,$current;
while($current != $answer){
    $current < $answer ? $start = $current : $end = $current;
    $current = int(($start + $end)/2);
    printf "start: %d \tend: %d \tcurrent: %d \n", $start,$end,$current;
}


