#/usr/bin/perl 

use strict;
use warnings;

use lib '/home/linyd/Documents/Perl-Training/Sql_practise';

use DBI;
use Database;

my $test = Database->new("perlconntest","Pg","localhost","5432");
my $flag = $test->Login("linyd","Lub75b25#");

if($flag){
       
       my $sth = $test->ExecuteQuery("select * from storage");

       while ( my @row = $sth->fetchrow_array() )
       {
              print join("\t", @row)."\n";
       }
}