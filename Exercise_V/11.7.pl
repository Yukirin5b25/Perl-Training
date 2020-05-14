#!/usr/bin/perl

@arrayA = qw(Fill two arrays with several words.);
@arrayB = qw(Some elements within the two arrays should be the same, some different.);

@repeats;

foreach(@arrayA){
    if(($_ ~~ @arrayB) && !($_ ~~ @repeats)){
        push(@repeats, $_);
    }
}

print "@repeats";