#!/usr/bin/perl
use strict;
use warnings;
use File::Path qw(make_path);

if ( @ARGV == 2 ) {
	my $year    = $ARGV[0];
	my $problem = $ARGV[1];

	my $dir = "$year/$problem";

	make_path($dir) or die "Failed to create directory $dir: $!\n";

	open my $input_file, '>', "$dir/input.txt"
	  or die "Could not create input.txt: $!\n";
	open my $que_file, '>', "$dir/que.txt"
	  or die "Could not create que.txt: $!\n";
	open my $sol_file, '>', "$dir/sol.pl"
	  or die "Could not create sol.pl: $!\n";
	open my $sol2_file, '>', "$dir/sol2.pl"
	  or die "Could not create sol2.pl: $!\n";

	print $sol_file
	  "open my \$file, '<', 'input.txt' or die \"Could not open file: \$!\";\n";
	print $sol2_file
	  "open my \$file, '<', 'input.txt' or die \"Could not open file: \$!\";\n";

	close $input_file;
	close $que_file;
	close $sol_file;
	close $sol2_file;

	print "Directory created for $dir advent of code\n";
}
else {
	print "Error: You must provide both 'year' and 'problem'.\n";
	print "Usage: $0 <year> <problem>\n";
}
