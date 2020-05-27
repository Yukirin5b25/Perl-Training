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

get '/vm' => sub {
	my $self = shift;	
	my $s_id = $self->param('id');
	my $o_target_vm = Vm->new($self->db->Get($s_id,"vm"));
	my @ar_out_put_array = $o_target_vm->GetOutputArray();
	my @a_VM_show_storages = $self->db->SelectAll("storage");
	$self->render(template => 'vm',
				ar_out_put_array => \@ar_out_put_array,
				ar_VM_show_storages => \@a_VM_show_storages);

	if($self->param('name')){
		my $s_id = $self->param('id');
		my $s_name = $self->param('name');
		my $s_md5 = $self->param('md5');
		my $s_storage = $self->param('storage');
		my $s_os = $self->param('os');
		my $o_vm = Vm->new($s_id, $s_name, $s_os, $s_md5, $s_storage);
		$self->db->Update($o_vm->{table},$o_vm->GetOutputArray());
		$self->redirect_to("/");
	}
};

get '/storage' => sub {
	my $self = shift;
	my $s_id = $self->param('id');
	my $o_target_storage = Storage->new($self->db->Get($s_id,"storage"));
	my @ar_out_put_array = $o_target_storage->GetOutputArray();
	my $s_reminder = "hidden";#"style=\"visibility: hidden;\"";

	if($self->param('flag')){
 		$s_reminder = "";
	}
	$self->render(
		template => 'storage',
		ar_out_put_array => \@ar_out_put_array,
		reminder => $s_reminder
	);

	if($self->param('name')){
		my $s_id = $self->param('id');
		my $s_name = $self->param('name');
		my $s_capcity = $self->param('capcity');
		my $o_storage = Storage->new($s_id,$s_name,$s_capcity);
		$self->db->Update($o_storage->{table},$o_storage->GetOutputArray());
		$self->redirect_to("/");
	}
};

get '/creatvm' => sub {
	my $self = shift;
  	my @a_VM_show_storages = $self->db->SelectAll("storage");
	$self->render(template => 'creatvm',
                a_VM_show_storages => \@a_VM_show_storages);
  
  	if($self->param('name')){
		my $s_id = $self->param('id');
  		my $s_name = $self->param('name');
  		my $s_md5 = $self->param('md5');
  		my $s_storage = $self->param('storage');
  		my $s_os = lc($self->param('os'));
  		my $o_new_vm = Vm->create($s_name, $s_os, $s_md5, $s_storage);
  		$self->db->Add($o_new_vm->{table},$o_new_vm->GetOutputArray());
  		$self->redirect_to("/");
  	}
};

get '/creatstorage' => sub {
	my $self = shift;
	$self->render(
		template => 'creatstorage'
	);

	if($self->param('name')){
		my $s_name = $self->param('name');
		my $s_capcity = $self->param('capcity');
		my $o_new_storage = Storage->create($s_name, $s_capcity);
		$self->db->Add($o_new_storage->{table},$o_new_storage->GetOutputArray());
		$self->redirect_to("/");
	}
};

get '/deletevm' => sub {
	my $self = shift;
	my $s_id = $self->param('id');
	$self->db->Delete($s_id, "vm");
	$self->redirect_to("/");
};

get '/deletestorage' => sub {
	my $self = shift;
	my $s_id = $self->param('id');

	my $s_query = "select * from vm where storage = $s_id";
	my @a_check = $self->db->ExecuteReadQuery($s_query);

	if(!@a_check){
		$self->db->Delete($s_id, "storage");
		$self->redirect_to("/");
	}
	else{
		$self->redirect_to("/storage?id=$s_id&flag=1");
	}
};

app->start;
__DATA__

@@ /template/index.html.ep

@@ vm.html.ep
@@ storage.htl.ep
@@

@@ creatvm.html.ep
@@ creatstorage.html.ep

@@ layouts/default.html.ep

