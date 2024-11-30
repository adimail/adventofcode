open my $file, '<', 'input.txt' or die "Could not open file: $!";

my $literals = 0;
my $values   = 0;

while ( my $line = <$file> ) {
	chomp($line);

	my $l = length($line);
	$literals += $l;

	$line =~ s/^"//;
	$line =~ s/"$//;

	$line =~ s/\\\\/\\/g;
	$line =~ s/\\"/"/g;
	$line =~ s/\\x[0-9a-fA-F]{2}/_/g;

	my $v = length($line);
	$values += $v;
}

close $file;

my $difference = $literals - $values;

print "$literals\n";
print "$values\n";
print "$difference\n";
