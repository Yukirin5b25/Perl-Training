#!/usr/bin/env perl
use Mojolicious::Lite;

# Documentation browser under "/perldoc"
plugin 'PODRenderer';

use lib '/home/linyd/Documents/Perl-Training/WebTest/Modules';

use DBI;
use Database;
use Vm;
use Storage;

my $o_database = Database->new("perlconntest","Pg","localhost","5432");
$o_database->Login("linyd","Lub75b25#");

helper db => sub {$o_database};

get '/' => sub {
  my $self = shift;
  my @a_vms = $self->db->SelectAll("vm");
  my @a_storages = $self->db->SelectAll("storage");
  $self->render(template => 'index',
                a_vms => \@a_vms,
                a_storages => \@a_storages);
};

get '/VM' => sub {
	my $self = shift;

	$self->render(template => 'VM');
};

get '/creatVM' => sub {
	my $self = shift;
  	my @a_VM_show_storages = $self->db->SelectAll("storage");
	$self->render(template => 'creatVM',
                a_VM_show_storages => \@a_VM_show_storages);
  
  if($self->param('name')){
  	my $s_name = $self->param('name');
  	my $s_md5 = $self->param('md5');
  	my $s_storage = $self->param('storage');
  	my $s_os = lc($self->param('os'));
  	my $o_new_vm = Vm->create($s_name, $s_os, $s_md5, $s_storage);
  	$self->db->Add($o_new_vm->{table},$o_new_vm->GetOutputArray());
  	$self->redirect_to("/");
  }
};

get '/creatStorage' => sub {
	my $self = shift;
	$self->render(
		template => 'creatStorage'
	);

	if($self->param('name')){
		my $s_name = $self->param('name');
		my $s_capcity = $self->param('capcity');
		my $o_new_storage = Storage->create($s_name, $s_capcity);
		$self->db->Add($o_new_storage->{table},$o_new_storage->GetOutputArray());
		$self->redirect_to("/");
	}
};

app->start;
__DATA__

@@ /template/index.html.ep

@@ VM.html.ep

@@ creatVM.html.ep
@@ creatStorage.html.ep

@@ layouts/default.html.ep

