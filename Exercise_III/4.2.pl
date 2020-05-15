#!/usr/bin/perl

use strict;
use warnings;

sub absolute{
    if($_[0]<0){
        $_[0] *= -1;
    }
}

print absolute(-9)."\n";