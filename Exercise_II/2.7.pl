#!/usr/bin/perl

use strict;
use warnings;

my @str_array = qw(Fred Wilma PebBles);
my $room = splice @str_array, 1, 1, qw(Barney Betty);
splice @str_array, 1, 0, "Bamm-Bamm";
print "@str_array";
