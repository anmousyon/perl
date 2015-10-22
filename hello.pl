#!/usr/bin/perl
use strict;
use warnings;

print "Say something: \n";

my $name = <STDIN>;
chomp($name);
if($name eq "hi"){
	print "hi jared\n";
} else{
	print "I couldnt hear you, $name.";
}
