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

$max_code_value=$kode.$end;
$min_code_value=$kode.$start;


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

print "Start Code : $kode ; ",$start,":",$end,"\n";
for ($i=$#last_char_start;$i>0;$i--) {
	print "i: $i, ",$last_char_start[$i],':',$last_char_end[$i],"\n";
	if (($i eq $#last_char_start) and (($last_char_start[$i] eq 0) and ($last_char_end[$i] eq 9 ))) {
		@add_code_array=();
		@add_code_array=@last_char_start[0 .. ($i-1)];
		$add_code='';
		foreach (@add_code_array) {
			$add_code=$add_code.$_;
			}
		#$add_code = @last_char_start[0 .. $j];
		$last_kode=$kode.$add_code;
		$last_kode =~ s/\s//g;
		print "Block 1; Code : ",$last_kode,"\n";
		$count_9=(length($max_code_value)-length($last_kode));
		$max_code_tmp=$last_kode;
		$min_code_tmp=$last_kode;
		while ($count_9 > 0) {
			$max_code_tmp=$max_code_tmp."9";
			$min_code_tmp=$min_code_tmp."0";
			$count_9--;
		}
		print "Max code : $max_code_tmp<=$max_code_value; Min code : $min_code_value>=$min_code_tmp \n";
		if (($max_code_tmp<=$max_code_value) or ($min_code_value>=$min_code_tmp)) {
			die "WTF \n";
		}
		next;
		}
	if (($i eq $#last_char_start) and (($last_char_start[$i] ne  0) or ($last_char_end[$i] ne 9))) {
		$last_char_start_current=$last_char_start[$i];
		@add_code_array=();
		@add_code_array=@last_char_start[0 .. ($i-1)];
		$add_code='';
		foreach (@add_code_array) {
			$add_code=$add_code.$_;
			}
		#$add_code=@last_char_start[0..($i-1)].$last_char_start[$i];
		$add_code=$add_code.$last_char_start_current;
		$last_kode=$kode.$add_code;
		$last_kode =~ s/\s//g;
		while ( $last_char_start_current <= 9 ) {
			print "Block 2; Code : ",$last_kode,"\n";

			$count_9=(length($max_code_value)-length($last_kode));
			$max_code_tmp=$last_kode;
			$min_code_tmp=$last_kode;
			while ($count_9 > 0) {
				$max_code_tmp=$max_code_tmp."9";
				$min_code_tmp=$min_code_tmp."0";
				$count_9--;
				}
			print "Max code : $max_code_tmp<=$max_code_value; Min code : $min_code_value>=$min_code_tmp \n";
			if (($max_code_tmp<=$max_code_value) or ($min_code_value>=$min_code_tmp)) {
				die "WTF",';',length($max_code_value),';',length($last_kode)," \n";
				}

			$last_kode=$last_kode+1;
			$last_char_start_current++;
			}
		}
	if (($i < $#last_char_start)) {
		$last_char_start_current=$last_char_start[$i];

		@add_code_array=();
		@add_code_array=@last_char_start[0 .. ($i-1)];
		$add_code='';
		foreach (@add_code_array) {
			$add_code=$add_code.$_;
			}
		
		if (($last_char_start[$i] eq 0) and ($last_char_end[$i] eq 9 ))
			{
				print "Block 3.1; Code : ",$kode.$add_code,"\n";

				$count_9=(length($max_code_value)-length($last_kode));
				$max_code_tmp=$last_kode;
				$min_code_tmp=$last_kode;
				while ($count_9 > 0) {
					$max_code_tmp=$max_code_tmp."9";
					$min_code_tmp=$min_code_tmp."0";
					$count_9--;
					}
				print "Max code : $max_code_tmp<=$max_code_value; Min code : $min_code_value>=$min_code_tmp \n";
				if (($max_code_tmp<=$max_code_value) or ($min_code_value>=$min_code_tmp)) {
					die "WTF \n";
					}

				next;

			}
		$add_code=$add_code.$last_char_start_current;
		$last_kode=$kode.$add_code;
		$last_kode =~ s/\s//g;
		while ($last_char_start_current < 9) {
		$last_kode=$last_kode+1;
		$last_char_start_current++;
		print "Block 3; Code : ",$last_kode,"\n";

		$count_9=(length($max_code_value)-length($last_kode));
		$max_code_tmp=$last_kode;
		$min_code_tmp=$last_kode;
		while ($count_9 > 0) {
			$max_code_tmp=$max_code_tmp."9";
			$min_code_tmp=$min_code_tmp."0";
			$count_9--;
			}
		print "Max code : $max_code_tmp<=$max_code_value; Min code : $min_code_value>=$min_code_tmp \n";
		if (($max_code_tmp<=$max_code_value) or ($min_code_value>=$min_code_tmp)) {
			die "WTF \n";
			}

		}

		}

	}
$i=0;
print "\n -------------------------------- \n";
print "i: $i, ",$last_char_start[$i],':',$last_char_end[$i];
print "\n -------------------------------- \n";

$last_char_start_current=$last_char_start[$i];
$last_char_end_current=$last_char_end[$i];
$add_code=$last_char_start_current;
$last_kode=$kode.$add_code;
$last_kode =~ s/\s//g;
$last_kode_f=$last_kode;
$last_char_start_current++;
$last_kode=$last_kode+1;
while ($last_char_start_current < $last_char_end_current)
	{
		print "Block 4; Code : ",$last_kode,"\n";

		$count_9=(length($max_code_value)-length($last_kode));
		$max_code_tmp=$last_kode;
		$min_code_tmp=$last_kode;
		while ($count_9 > 0) {
			$max_code_tmp=$max_code_tmp."9";
			$min_code_tmp=$min_code_tmp."0";
			$count_9--;
			}
		print "Max code : $max_code_tmp<=$max_code_value; Min code : $min_code_value>=$min_code_tmp \n";
		if (($max_code_tmp<=$max_code_value) or ($min_code_value>=$min_code_tmp)) {
			die "WTF \n";
			}

		$last_char_start_current++;
		$last_kode=$last_kode+1;
	}

for ($i=1;$i<=$#last_char_start;$i++) {
	$j=0;
	if ($last_char_end[$i] eq 0) {
		next;
	}
	$last_kode=$last_kode.0;
	while ($j < $last_char_end[$i]) {
		print "Block 5; Code : ",$last_kode,"\n";

		$count_9=(length($max_code_value)-length($last_kode));
		$max_code_tmp=$last_kode;
		$min_code_tmp=$last_kode;
		while ($count_9 > 0) {
			$max_code_tmp=$max_code_tmp."9";
			$min_code_tmp=$min_code_tmp."0";
			$count_9--;
			}
		print "Max code : $max_code_tmp<=$max_code_value; Min code : $min_code_value>=$min_code_tmp \n";
		if (($max_code_tmp<=$max_code_value) or ($min_code_value>=$min_code_tmp)) {
			die "WTF \n";
			}

		$last_kode=$last_kode+1;
		$j++;
		}
	print "Block 6; Code : ",$last_kode,"\n";

	$count_9=(length($max_code_value)-length($last_kode));
	$max_code_tmp=$last_kode;
	$min_code_tmp=$last_kode;
	while ($count_9 > 0) {
		$max_code_tmp=$max_code_tmp."9";
		$min_code_tmp=$min_code_tmp."0";
		$count_9--;
		}
	print "Max code : $max_code_tmp<=$max_code_value; Min code : $min_code_value>=$min_code_tmp \n";
	if (($max_code_tmp<=$max_code_value) or ($min_code_value>=$min_code_tmp)) {
		die "WTF \n";
		}
	}
$size_last_char_start = $#last_char_start + 1;
if ($size_last_char_start eq 1) {
	print "Block 7; Code : ",$kode.$last_char_start[0],"\n";

	$last_kode=$kode.$last_char_start[0];
	$count_9=(length($max_code_value)-length($last_kode));
	$max_code_tmp=$last_kode;
	$min_code_tmp=$last_kode;
	while ($count_9 > 0) {
		$max_code_tmp=$max_code_tmp."9";
		$min_code_tmp=$min_code_tmp."0";
		$count_9--;
		}
	print "Max code : $max_code_tmp<=$max_code_value; Min code : $min_code_value>=$min_code_tmp \n";
	if (($max_code_tmp<=$max_code_value) or ($min_code_value>=$min_code_tmp)) {
		die "WTF \n";
	}

	print "Block 7; Code : ",$kode.$last_char_end[0],"\n";
	$last_kode=$kode.$last_char_end[0];
	$count_9=(length($max_code_value)-length($last_kode));
	$max_code_tmp=$last_kode;
	$min_code_tmp=$last_kode;
	while ($count_9 > 0) {
		$max_code_tmp=$max_code_tmp."9";
		$min_code_tmp=$min_code_tmp."0";
		$count_9--;
		}
	print "Max code : $max_code_tmp<=$max_code_value; Min code : $min_code_value>=$min_code_tmp \n";
	if (($max_code_tmp<=$max_code_value) or ($min_code_value>=$min_code_tmp)) {
		die "WTF \n";
		}


}
