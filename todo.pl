#!/usr/bin/perl

my @todo;
open(my $fh, '<', 'todo.txt') or die;
while(my $row = <$fh>){
	chomp $row;
	unshift @todo, $row;
}
close $fh;
while(true){
	print "\nWhat would you like to do? (add, read, remove or stop)\n";
	my $choice = <>;
	chomp($choice);
	if($choice eq "add"){
		open(my $fh, '>>', 'todo.txt') or die;
		print "\nWhat would you like to add?\n";
		my $toadd = <>;
		chomp $toadd;
		unshift @todo, $toadd;
		say $fh "$toadd";
		close $fh;
	}
	elsif($choice eq "read"){
		my $length = @todo;
		print "\n";
		foreach $a (@todo){
			print "$a\n";
		}
	}
	elsif($choice eq "remove"){
		open(my $fh, '>>', 'todo.txt') or die;
		print "\nWhat would you like to remove? (string or index)\n";
		my $torem = <>;
		chomp $torem;
		my $index = 0;
		my $found = 0;
		foreach $a (@todo){
			if($a eq "$torem" || $torem == $index){
				print "\nAre you sure you want to delete $a (yes or no)\n";
				my $remcheck = <>;
				chomp $remcheck;
				if($remcheck eq 'yes'){
					splice(@todo, $index, 1);
				}
				$found = 1;
				last;
			}
			else{
				$index++;
			}
		}
		if($found == 0){
			print "\nI\'m sorry, I couldn\'t find that element.\n";
			close $fh;
		}
	}
	elsif($choice eq "stop"){
		open(my $fh, '>', 'todo.txt') or die;
		foreach $a (@todo){
			say $fh "$a";
		}
		close $fh;
		last;
	}
	else{
		print "\nSorry, but that was not a correct command\n";
	}
}
