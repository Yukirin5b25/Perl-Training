#!/usr/bin/perl

@str_array = qw(Fred Wilma PebBles);
$room = splice @str_array, 1, 1, qw(Barney Betty);
splice @str_array, 1, 0, "Bamm-Bamm";
print "@str_array";
