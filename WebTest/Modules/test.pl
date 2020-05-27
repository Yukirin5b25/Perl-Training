#/usr/bin/perl 

use strict;
use warnings;

use lib '/home/linyd/Documents/Perl-Training/WebTest/Modules';

use DBI;
use Database;
use Vm;
use Storage;

my $test = Database->new("perlconntest","Pg","localhost","5432");
$test->Login("linyd","Lub75b25#");

my $query = "select * from vm where storage = 10003";

my @a_check = $test->ExecuteReadQuery($query);

if($#a_check>=0){
	print 0;
};
if($a_check[0]){
	print 0;
};


=pod

my @result = $test->ExecuteReadQuery("select * from storage");

foreach (@result){
	print "@$_"."\n";
}

my $vm = Vm->create("vm2", "linux", "0cc1e850b94af1e06c616d7441cb2b89", "10003");

$test->Add($vm->{table}, $vm->GetOutputArray());

foreach ($test->SelectAll("storage")){
	print "@$_"."\n";
}


my @a = $test->Get("10002", "storage");
print "@a"."\n";

my $storage2 = Storage->new(@a);

$test->Delete($storage2->{id},$storage2->{table});

my $storage2 = Storage->create("storage2",4096);
$test->Add($storage2->{table},$storage2->GetOutputArray());

my @a = $test->Get("1001", "vm");
print "@a"."\n";

my $vm = Vm->new(@a);
my @output = $vm->GetOutputArray();

print join ',',(splice @output, 1, $#output-1);

$test->Update($vm->{table}, $vm->GetOutputArray());

@a = $test->GetItemByID("1001", "vm");
print "@a"."\n";
=cut