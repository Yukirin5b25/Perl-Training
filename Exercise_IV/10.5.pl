#!/usr/bin/perl

$dir = "/home/linyd/Documents/Perl-Training/TEMP";
opendir ($DIR, $dir) or die "Unable to open $dir\n", $!;
@files = readdir($DIR);

foreach (@files){
    if($_ =~ /\.txt$/){
        chdir "$dir";
        $new = $_;
        $new =~ s/\.txt$/.bak/;
        rename $_ => $new or die "$_ rename failed.\n",$!;
    };
}