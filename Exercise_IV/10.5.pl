#!/usr/bin/perl

use strict;
use warnings;

my $dir = "/home/linyd/Documents/Perl-Training/TEMP";
opendir my $DIR, $dir or die "Unable to open $dir\n", $!;
my @files = readdir($DIR);

foreach (@files){
    if($_ =~ /\.txt$/){
        chdir "$dir";
        my $new = $_;
        $new =~ s/\.txt$/.bak/;
        rename $_ => $new or die "$_ rename failed.\n",$!;
    };
}