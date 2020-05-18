#/usr/bin/perl

use strict;
use warnings;

use DBI;

package Database;

sub new(){
    my ($class, $name, $driver, $host, $port) = @_;
    my $new_database = bless {}, $class;

    $new_database->{name} = $name;
    $new_database->{driver} = $driver;
    $new_database->{host} = $host;
    $new_database->{port} = $port;

    $new_database->{dsn} = "DBI:$driver:dbname=$name;host=$host;port=$port";

    $new_database->{dbh} = undef;

    return $new_database;
}

sub Login(){
    my ($self, $user, $pwd) = @_;
    $self->{dbh} = DBI->connect($self->{dsn}, $user, $pwd ) or die $DBI::errstr;
    return 1;
}

sub ExecuteQuery(){
    my ($self, $query) = @_;
    my $sth = $self->{dbh}->prepare($query);
    my $result = $sth->execute();
    $sth->finfish();
    return $result;
}

sub DESTROY(){
    my $self = @_;
    $self->{dbh}->disconnect();
}
1;