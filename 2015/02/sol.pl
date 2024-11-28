use strict;
use warnings;

open my $file, "<", "input.txt" or die "Could not open file: $!";

my $total_paper = 0;

while ( my $line = <$file> ) {
	chomp($line);

	my @dim = split( /x/, $line );
	my ( $l, $w, $h ) = @dim;

	my $surface_area = 2 * $l * $w + 2 * $w * $h + 2 * $h * $l;

	my $slack = $l * $w;
	$slack = $w * $h if $w * $h < $slack;
	$slack = $h * $l if $h * $l < $slack;

	$total_paper += $surface_area + $slack;
}

close $file;

print "$total_paper\n";
