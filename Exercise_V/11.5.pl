#!/usr/bin/perl 

use strict;
use warnings;

my @stringArray = qw(Fill an array with a couple of words of different lengths and create a new array containing
only those words that contain 4 or more letters.);

@stringArray = map(uc, @stringArray);

print "@stringArray";