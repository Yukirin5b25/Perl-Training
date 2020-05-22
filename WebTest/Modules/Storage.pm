#/usr/bin/perl

use strict;
use warnings;

package Storage;

sub new(){
    my ($class, $s_id, $s_name, $s_capacity, $s_lastupdate) = @_;
    my $new_storage = bless {}, $class;

    $new_storage->{table} = "storage";

    $new_storage->{id} = $s_id;
    $new_storage->{name} = $s_name;
    $new_storage->{capacity} = $s_capacity;
    $new_storage->{lastupdate} = $s_lastupdate;

    return $new_storage;
}

sub create(){
	my ($class, $s_name, $s_capacity, ) = @_;
	my $new_storage = bless {}, $class;

	$new_storage->{table} = "storage";

	$new_storage->{id} = undef;
	$new_storage->{name} = $s_name;
	$new_storage->{capacity} = $s_capacity;
	$new_storage->{lastupdate} = undef;

	return $new_storage;
}

sub GetOutputArray(){
	my ($self) = @_;
	my @a_output;

	push(@a_output, $self->{id});
	push(@a_output, $self->{name});
	push(@a_output, $self->{capacity});
	push(@a_output, $self->{lastupdate});

    return @a_output;
}

1;

