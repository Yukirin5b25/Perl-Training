#!/usr/bin/perl

@num_list = (1..5,11..15);
shift(@num_list);
$num_list[-1] /=5;
foreach(@num_list){
    print $_."\t";
}
print "\n";