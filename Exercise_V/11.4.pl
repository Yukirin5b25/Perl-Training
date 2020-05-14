#!/usr/bin/perl

@stringArray = qw(Fill an array with a couple of words of different lengths and create a new array containing
only those words that contain 4 or more letters.);

@result = grep /^.{4}/,@stringArray;
print "@result";