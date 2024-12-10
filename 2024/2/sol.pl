# Problem statement: https://adventofcode.com/2024/day/2

open my $file, '<', 'input.txt' or die "could not open file: $!";

my $safe = 0;

while ( my $line = <$file> ) {
	chomp($line);
	my @levels = split /\s+/, $line;

	my $increasing = 1;
	my $decreasing = 1;
	my $valid      = 1;

	for my $i ( 0 .. $#levels - 1 ) {
		my $diff = $levels[ $i + 1 ] - $levels[$i];

		if ( abs($diff) < 1 || abs($diff) > 3 ) {
			$valid = 0;
			last;
		}

		if ( $diff <= 0 ) {
			$increasing = 0;
		}

		if ( $diff >= 0 ) {
			$decreasing = 0;
		}
	}
	if ( $valid && ( $increasing || $decreasing ) ) {
		$safe++;
	}

	print "$line\t $increasing, $decreasing\n";

}

close $file;

print "Number of safe reports: $safe\n";
