open my $file, '<', 'input.txt' or die "Could not open file: $!";

my $literals = 0;
my $values   = 0;

while ( my $line = <$file> ) {
	chomp($line);
	print "input\t$line\n";
	my $l = length($line);
	$literals += $l;

	$line =~ s/"/\_"/g;
	$line =~ s/\\/\\\\/g;

	$line = '"' . $line . '"';

	my $v = length($line);
	$values += $v;
	print "output\t$line\n\n";
}

close $file;

# Calculate and print the difference
my $difference = $values - $literals;
print "$literals\n";
print "$values\n";
print "$difference\n";
