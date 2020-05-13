#!/usr/bin/perl

print "Input sentence:\n";
chomp($input = <STDIN>);
@input = split / /, $input;
for($i; $i<=$#input; $i++){
    print $input[$i]."\n";
}
