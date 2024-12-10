# Problem statement: https://adventofcode.com/2019/day/1

open my $file, '<', 'input.txt' or die "could not open file: $!";

while ( my $line = <$file> ) {
	chomp($line);

	my @places = split //, $line;

	foreach my $c (@places) {
		print "$c\t";
	}

	print "$line\n";

}
