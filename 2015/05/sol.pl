open my $file, '<', 'input.txt' or die "Could not open file: $!";

my $nice_strings = 0;

while ( my $string = <$file> ) {
	chomp($string);

	my $con1 = $string =~ /(?:[aeiou].*?){3}/;
	my $con2 = $string =~ /([a-z])\1/;
	my $con3 = $string !~ /(ab|cd|pq|xy)/;

	if ( $con1 && $con2 && $con3 ) {
		print "$string\n";
		$nice_strings++;
	}
}

print "$nice_strings\n";
