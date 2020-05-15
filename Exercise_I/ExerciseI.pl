#!usr/bin/perl

use strict;
use warnings;

#Exercise 1.1 
#Check test.pl instead

#Exercise 1.2
print "======================================================\n1.2:\n";

print "Hello WORLD\\PLANET!\nHello \"Universe\"\n";

#Exercise 1.3
print "======================================================\n1.3:\n";

my $output;
$output = ("ha" x 3).(" "."ho" x 3).(" "."ha" x 3);
print $output."\n";

#Exercise 1.4
print "======================================================\n1.4:\n";

print "Add: ".(5+4)."\n";
print "Sub: ".(5-4)."\n";
print "Mult: ".(5*4)."\n";
print "Div: ".(5/4)."\n";

#Exercise 1.5
print "======================================================\n1.5:\n";

print "num1: \n";
my $num1;
my $num2;
chomp($num1 = <STDIN>);
print "num2: \n";
chomp($num2 = <STDIN>);
print $num1." + ".$num2." = ".($num1 + $num2)."\n";

#Exercise 1.6
print "======================================================\n1.6:\n";

print "string1: \n";
my $string1;
my $string2;
chomp($string1 = <STDIN>);
print "string2: \n";
chomp($string1 = <STDIN>);
if($string1 == $string2){
    print "same\n";
}
else{
    print "not same\n";
}
print "\n";

#Exercise 1.7
print "======================================================\n1.7:\n";

print "input: \n";
my $input;
chomp($input = <STDIN>);
for(my $i=1;$i<=$input;$i++){
    print "$i ";
}

#Exercise 1.8
print "======================================================\n1.8:\n";

print "input: \n";
chomp($input = <STDIN>);
for(my $i=1;$i<=$input;$i++){
    print "$i ";
    $i%2 == 0 ? print "even" : print "odd";
    print "\t";
}
print "\n";