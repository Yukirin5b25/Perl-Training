#!/usr/bin/perl

print "Input sentence:\n";
chomp($input = <STDIN>);
@input = split / /, $input;
foreach(@input){
    print $_."\n";
}
