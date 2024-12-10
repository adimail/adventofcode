# Problem statement: https://adventofcode.com/2024/day/2

open my $file, '<', 'input.txt' or die "Could not open file: $!";

my $safe = 0;

sub check {
	my @levels     = @_;
	my $increasing = 1;
	my $decreasing = 1;
	my $valid      = 1;

	for my $i ( 0 .. $#levels - 1 ) {
		my $diff = $levels[ $i + 1 ] - $levels[$i];

		if ( abs($diff) < 1 || abs($diff) > 3 ) {
			$valid = 0;
			last;
		}

		$increasing = 0 if $diff < 0;
		$decreasing = 0 if $diff > 0;
	}

	return $valid && ( $increasing || $decreasing );
}

while ( my $line = <$file> ) {
	chomp($line);
	my @levels = split /\s+/, $line;

	my $valid = check(@levels);

	if ($valid) {
		$safe++;
	}
	else {
		for my $i ( 0 .. $#levels ) {
			my @modified_levels = @levels;
			splice @modified_levels, $i, 1;
			if ( check(@modified_levels) ) {
				$safe++;
				last;
			}
		}
	}
	print "$line\t" . ( check(@levels) ? "Valid" : "Invalid" ) . "\n";
}

close $file;

print "$safe\n";
