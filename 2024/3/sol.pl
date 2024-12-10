# Problem statement: https://adventofcode.com/2024/day/3

open my $file, '<', 'input.txt' or die "could not open file: $!";

sub mul {
	my ( $x, $y ) = @_;

	return $x * $y;
}

my $ans = 0;

while ( my $line = <$file> ) {
	chomp($line);

	my @muloperations = $line =~ /mul\(\d+,\d+\)/g;

	foreach my $o (@muloperations) {
		my ( $a, $b ) = $o =~ /(\d+)/g;

		print "$a, $b, $o \t" . mul( $a, $b ) . "\n";

		$ans += mul( $a, $b );
	}
	print "@muloperations\n";
}

print "$ans\n";
