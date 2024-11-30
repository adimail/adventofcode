open my $file, '<', 'input.txt' or die "Could not open file: $!";

my $nice_strings = 0;

while ( my $string = <$file> ) {
	chomp($string);

	my $con1 = $string =~ /(..).*\1/;
	my $con2 = $string =~ /(\w).\1/;

	if ( $con1 && $con2 ) {
		print "$string\n";
		$nice_strings++;
	}
}

print "$nice_strings\n";
