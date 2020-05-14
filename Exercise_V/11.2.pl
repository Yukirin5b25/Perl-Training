#!/usr/bin/perl

$answer = int(1+rand(100));

#Instead guess with Binary search

$start = 1;
$end = 100;
$current = int(($start + $end)/2);
print "target: ".$answer."\n";
printf "start: %d\tend: %d\tcurrent: %d\n", $start,$end,$current;
while($current != $answer){
    $current < $answer ? $start = $current : $end = $current;
    $current = int(($start + $end)/2);
    printf "start: %d \tend: %d \tcurrent: %d \n", $start,$end,$current;
}


