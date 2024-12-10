# Problem statement: https://adventofcode.com/2024/day/3

open my $file, '<', 'input.txt' or die "could not open file: $!";

sub mul {
	my ( $x, $y ) = @_;
	return $x * $y;
}

my $ans    = 0;
my $enable = 1;

while ( my $line = <$file> ) {
	chomp($line);

	my @muloperations = $line =~ /(mul\(\d+,\d+\))|(do\(\))|(don\'t\(\))/g;

	print "@muloperations\n\n";

	foreach my $o (@muloperations) {

		if ( $o eq 'do()' ) {
			$enable = 1;
		}
		if ( $o eq 'don\'t()' ) {
			$enable = 0;
		}

		if ( $enable && $o =~ /mul\((\d+),(\d+)\)/ ) {
			my ( $a, $b ) = ( $1, $2 );
			$ans += mul( $a, $b );
		}
	}
}

print "$ans\n";
