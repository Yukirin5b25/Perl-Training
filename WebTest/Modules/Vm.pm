#/usr/bin/perl

use strict;
use warnings;

package Vm;


sub new(){
	my ($class, $s_id, $s_name, $s_os, $s_checksum, $s_storage, $s_lastupdate) = @_;
	my $new_vm = bless {}, $class;

	$new_vm->{table} = "vm";

	$new_vm->{id} = $s_id;
	$new_vm->{name} = $s_name;
	$new_vm->{operate_system} = $s_os;
	$new_vm->{checksum} = $s_checksum;
	$new_vm->{storage} = $s_storage;
	$new_vm->{lastupdate} = $s_lastupdate;

    return $new_vm;
}

sub create(){
	my ($class, $s_name, $s_os, $s_checksum, $s_storage) = @_;
	my $new_vm = bless {}, $class;

	$new_vm->{table} = "vm";

	$new_vm->{id} = undef;
	$new_vm->{name} = $s_name;
	$new_vm->{operate_system} = $s_os;
	$new_vm->{checksum} = $s_checksum;
	$new_vm->{storage} = $s_storage;
	$new_vm->{lastupdate} = undef;

	return $new_vm;
}


sub GetOutputArray(){
	my ($self) = @_;
	my @a_output;

	push(@a_output, $self->{id});
	push(@a_output, $self->{name});
	push(@a_output, $self->{operate_system});
	push(@a_output, $self->{checksum});
	push(@a_output, $self->{storage});
	push(@a_output, $self->{lastupdate});

    return @a_output;
}

1;
