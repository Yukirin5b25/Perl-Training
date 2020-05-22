#/usr/bin/perl

use strict;
use warnings;

use DBI;

package Database;


sub new(){
	my ($class, $s_name, $s_driver, $s_host, $s_port) = @_;
	my $new_database = bless {}, $class;

	$new_database->{name} = $s_name;
	$new_database->{driver} = $s_driver;
	$new_database->{host} = $s_host;
	$new_database->{port} = $s_port;

	$new_database->{connFlag} = 0;
	$new_database->{dsn} = "DBI:$s_driver:dbname=$s_name;host=$s_host;port=$s_port";

	$new_database->{dbh} = undef;
	$new_database->{tables} = undef;

	return $new_database;
}


sub Login(){
	my ($self, $s_user, $s_pwd) = @_;
	$self->{dbh} = DBI->connect($self->{dsn}, $s_user, $s_pwd ) or die $DBI::errstr;
	$self->{connFlag} = 1;
	my @a_tables = $self->ExecuteReadQuery("select tablename from pg_tables where schemaname = 'public'");
	$self->{tables} = \@a_tables;
	return 1;
}

sub SelectAll{
	my ($self, $s_table) = @_;
	return $self->ExecuteReadQuery("select * from $s_table");
}

sub Add(){
	my ($self, $s_table, @a_inputarray) = @_;

	my @a_columns = $self->GetTableColumns($s_table);
	my @a_values = @a_inputarray;
	my $s_id = $a_values[0];

	my $s_query = "insert into $s_table (";
	$s_query .= join ',',(splice @a_columns, 1, $#a_columns-1);
	$s_query .= ") values ('";
	$s_query .= join "','",(splice @a_values, 1, $#a_values-1);
	$s_query .= "')";

	$self->ExecuteWriteQuery($s_query) or die "Execute query failed: $!";
}


sub Delete(){
	my ($self, $s_id, $s_table) = @_;
	#my $tableList = $self->{tables};

	#if (! $table ~~ @$tableList){
	#    return 0 ;
	#}
	my $s_query = "Delete from $s_table where id = '$s_id'";
	$self->ExecuteWriteQuery($s_query);
	return 1;
}


sub Update(){
	my ($self, $s_table, @a_inputarray) = @_;

	my @a_columns = $self->GetTableColumns($s_table);
	my @a_values = @a_inputarray;
	my $s_id = $a_values[0];

	my $s_query = "update $s_table set ";
	for (my $i = 1; $i <= $#a_columns; $i++){
		if ($i < $#a_columns){
			$s_query .= $a_columns[$i]." = '".$a_values[$i]."', ";
		}else{
			$s_query .= $a_columns[$i]." = now() ";
		}
	}
	$s_query .= "where id = $s_id";

	$self->ExecuteWriteQuery($s_query);
}


sub Get(){
	my ($self, $s_id, $s_table) = @_;
	#my $tableList = $self->{tables};

	#if (! $table ~~ @$tableList){
	#    return 0 ;
	#}
	my $s_query = "select * from $s_table where id = '$s_id'";
	my @a_result = $self->ExecuteReadQuery($s_query);
	my $ref_first = $a_result[0];
	if ($#a_result < 0){
		return 0;
	}
	return @$ref_first;
}


sub GetTableColumns(){
	my($self, $s_tablename) = @_;
	if($self->{connFlag} != 1){
		return;
	}
	my @a_result = $self->ExecuteReadQuery(
		"select column_name from information_schema.columns 
                                    where table_schema = 'public' and table_name = '$s_tablename'"
	);
	my @a_columns;
	foreach (@a_result){
		push(@a_columns, @$_);
	}
	return @a_columns;
}


sub ExecuteReadQuery(){
	my ($self, $s_query) = @_;
	if($self->{connFlag} != 1){
		return;
	}
	my $sth = $self->{dbh}->prepare($s_query);
	$sth->execute();
	my @a_result;
	while(my @a_row = $sth->fetchrow_array()) {
		push(@a_result, \@a_row);
	}
	$sth->finish();
	return @a_result;
}


sub ExecuteWriteQuery(){
	my ($self, $s_query) = @_;
	if($self->{connFlag} != 1){
		return;
	}
	my $sth = $self->{dbh}->prepare($s_query);
	$sth->execute();
	$sth->finish();
	return 1;
}


sub DESTROY(){
	my ($self) = @_;
	$self->{dbh}->disconnect();
}
1;