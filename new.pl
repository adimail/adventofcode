#!/usr/bin/perl
use strict;
use warnings;
use File::Path qw(make_path);

if ( @ARGV == 2 ) {
	my $year    = $ARGV[0];
	my $problem = $ARGV[1];

	$problem =~ s/^0+//g;

	my $dir = "$year/$problem";

	make_path($dir) or die "Failed to create directory $dir: $!\n";

	open my $input_file, '>', "$dir/input.txt"
	  or die "Could not create input.txt: $!\n";
	open my $sol_file, '>', "$dir/sol.pl"
	  or die "Could not create sol.pl: $!\n";
	open my $sol2_file, '>', "$dir/sol2.pl"
	  or die "Could not create sol2.pl: $!\n";

	my $header =
	  "# Problem statement: https://adventofcode.com/$year/day/$problem\n\n";
	$header = $header
	  . "open my \$file, '<', 'input.txt' or die \"could not open file: \$!\";\n";

	print $sol_file $header;
	print $sol2_file $header;

	close $input_file;
	close $sol_file;
	close $sol2_file;

	print "Directory created for $dir advent of code\n";
}
else {
	print "Error: You must provide both 'year' and 'problem'.\n";
	print "Usage: $0 <year> <problem>\n";
}
