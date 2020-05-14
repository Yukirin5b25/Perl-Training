#!/usr/bin/perl

@array = qw(Fill an array with a couple of words of different lengths and create a new array containing
only those words that contain 4 or more letters.);

print "Input cout to print: ";
$count = int($temp = <STDIN>);
if ($count > $#array+1){
    $count = $#array+1;
}
for($i = 0; $i < $count; $i ++){
    print $array[$i]." "
}
print "\n";