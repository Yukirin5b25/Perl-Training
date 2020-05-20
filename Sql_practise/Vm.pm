#/usr/bin/perl

use strict;
use warnings;

package Vm;


sub new(){
	my ($class, $id, $name, $os, $checksum, $storage, $lastupdate) = @_;
	my $new_vm = bless {}, $class;

	$new_vm->{table} = "vm";

	$new_vm->{id} = $id;
	$new_vm->{name} = $name;
	$new_vm->{operate_system} = $os;
	$new_vm->{checksum} = $checksum;
	$new_vm->{storage} = $storage;
	$new_vm->{lastupdate} = $lastupdate;

    return $new_vm;
}

sub create(){
	my ($class, $name, $os, $checksum, $storage) = @_;
	my $new_vm = bless {}, $class;

	$new_vm->{id} = undef;
	$new_vm->{name} = $name;
	$new_vm->{operate_system} = $os;
	$new_vm->{checksum} = $checksum;
	$new_vm->{storage} = $storage;
	$new_vm->{lastupdate} = undef;

	return $new_storage;
}


sub GetOutputArray(){
	my ($self) = @_;
	my @output;

	push(@output, $self->{id});
	push(@output, $self->{name});
	push(@output, $self->{operate_system});
	push(@output, $self->{checksum});
	push(@output, $self->{storage});
	push(@output, $self->{lastupdate});

    return @output;
}

1;
