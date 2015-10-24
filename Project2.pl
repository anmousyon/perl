#!/usr/bin/perl
use strict;
use warnings;

my $result = ask();
greet($result);

sub ask{
	print "Hello, what is your name? ";
	my $name = <>;
	chomp $name;
	return $name;
}
sub greet{
	my ($input) = @_;
	print "Hello $input!\n";
	return;
}
