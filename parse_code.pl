#!/usr/bin/perl
#

#use strict;
#use warnings;
use Data::Dumper qw(Dumper);
         
#print Dumper \@ARGV;
my ($kode,$start,$end)=@ARGV;

if ( (not defined $kode) or (not defined $start) or (not defined $end) ) {
	die "Need arg \n";
}
print "\n -------------------------------- \n";
print $kode,"\n";
print $start,"\n";
print $end,"\n";
print "\n -------------------------------- \n";

$length_start=length $start;
$length_end=length $end;

print "\n -------------------------------- \n";
print "Length start - $length_start \n";
print "Length end - $length_end \n";
print "\n -------------------------------- \n";

if ($length_start ne $length_end) {
	die "WTF \n";
}

my @char_start=();
my @char_end=();

for ($i=0; $i<$length_start;$i++) {

	push @char_start, substr( $start, $i , 1 );

	}

for ($i=0; $i<$length_end;$i++) {

	push @char_end, substr( $end, $i , 1 );

	}

print "\n -------------------------------- \n";	
print Dumper \@char_start;
print Dumper \@char_end;
print "\n -------------------------------- \n";


$flag_eq=0;
print "\n -------------------------------- \n";
for ($i=0; $i<$length_start;$i++) {
	if ($char_start[$i] eq $char_end[$i]) {
		print "char ".($i+1)." eq \n";
	} else {
		print "char ".($i+1)." diff \n";
		$flag_eq=1;
		last;
	}

}
if ( $flag_eq eq 0 ) { die "WTF \n";}
print "\n -------------------------------- \n";

print "\n -------------------------------- \n";
$j=$i;
for ($i=0;$i<$j;$i++) {
	print $char_start[$i];
	$kode=$kode.$char_start[$i];
	}	
print "\n -------------------------------- \n";


print "\n -------------------------------- \n";
print "Kode - $kode";
print "\n -------------------------------- \n";

@last_char_start=();
@last_char_end=();
for ($i=$j;$i<$length_start;$i++) {
	push @last_char_start, $char_start[$i];
	}
for ($i=$j;$i<$length_end;$i++) {
	push @last_char_end, $char_end[$i];
	}

print "\n -------------------------------- \n";
print Dumper \@last_char_start;
print Dumper \@last_char_end;
print "\n -------------------------------- \n";

print "\n -------------------------------- \n";
print "Array size : ",$#last_char_start,"\n";
print "Array size : ",$#last_char_end,"\n";
if ($#last_char_start ne $#last_char_end) {
	die "WTF \n";
	}
print "\n -------------------------------- \n";

print $start,":",$end,"\n";
for ($i=$#last_char_start;$i>0;$i--) {
	print "i: $i, ",$last_char_start[$i],':',$last_char_end[$i],"\n";
	if (($i==$#last_char_start) and (($last_char_start[$i] eq 0) and ($last_char_end[$i] eq 9 ))) {
		$add_code="@last_char_start[0..($i-1)]";
		$last_kode=$kode.$add_code;
		$last_kode =~ s/\s//g;
		print "Code : ",$last_kode,"\n";
		next;
		}
	$add_code="@last_char_start[0..($i-1)]";
	$last_kode=$kode.$add_code;
	$last_kode =~ s/\s//g;
	print "Code : ",$last_kode,"\n";

	}
$i=0;
print "\n -------------------------------- \n";
print "i: $i, ",$last_char_start[$i],':',$last_char_end[$i],"\n";
print "\n -------------------------------- \n";


