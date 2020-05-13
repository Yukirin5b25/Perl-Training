#!/usr/bin/perl

sub sum{
    my($sum);
    foreach (@_){
        if($_<0){
            $sum = $_;
            last;
        }
        $sum += $_;
    }
    $sum;
}

@list = qw(1 1 2 3 5 -8);
print sum(@list)."\n";