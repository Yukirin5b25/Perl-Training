#/usr/bin/perl

use strict;
use warnings;

package Storage;

sub new(){
    my ($class, $id, $name, $capacity, $lastupdate) = @_;
    my $new_storage = bless {}, $class;

    $new_storage->{table} = "storage";

    $new_storage->{id} = $id;
    $new_storage->{name} = $name;
    $new_storage->{capacity} = $capacity;
    $new_storage->{lastupdate} = $lastupdate;

    return $new_storage;
}

sub create(){
	my ($class, $name, $capacity, ) = @_;
	my $new_storage = bless {}, $class;

	$new_storage->{table} = "storage";

	$new_storage->{id} = undef;
	$new_storage->{name} = $name;
	$new_storage->{capacity} = $capacity;
	$new_storage->{lastupdate} = undef;

	return $new_storage;
}

sub GetOutputArray(){
	my ($self) = @_;
	my @output;

	push(@output, $self->{id});
	push(@output, $self->{name});
	push(@output, $self->{capacity});
	push(@output, $self->{lastupdate});

    return @output;
}

1;

