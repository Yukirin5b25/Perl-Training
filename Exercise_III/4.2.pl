#!/usr/bin/perl

sub absolute{
    if($_[0]<0){
        $_[0] *= -1;
    }
}

print absolute(-9)."\n";