#!/usr/bin/perl

use strict;
use warnings;
use feature "say";

my @str_array = qw(Fred Wilma PebBles);
my $room = splice @str_array, 1, 1, qw(Barney Betty);
splice @str_array, 1, 0, "Bamm-Bamm";
say "@str_array";
