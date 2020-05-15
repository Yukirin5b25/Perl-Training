#!/usr/bin/perl

use strict;
use warnings;

sub absolute{
    my(@result);
    foreach(@_){
        push(@result,$_);
        if($_< 0){
        $result[-1] *= -1;
        }
    }
    return @result;
}

my @list = qw(1 -2 3 -4 5);
@list = absolute(@list);
print "@list"."\n";