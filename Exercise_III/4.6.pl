#!/usr/bin/perl

$x = 33;
$y = 44;
$a = -21;
$b = -33;

sub pri_sub{
    my($a,$b) = @_;
    return $a-$b;
}

sub nom_sub{
    ($a,$b) = @_;
    return $a-$b;
}

print pri_sub(($x,$y))."\t";
print pri_sub(($a,$b))."\t";
print nom_sub(($x,$y))."\t";
print nom_sub(($a,$b))."\t";