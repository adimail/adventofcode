open my $file, "<", "input.txt" or die "Could not open file: $!";

my $total_ribbon = 0;

while ( my $line = <$file> ) {
	chomp($line);

	my @dim    = split( /x/, $line );
	my @sorted = sort { $a <=> $b } @dim;
	my ( $l, $w, $h ) = @sorted;

	my $vol    = $l * $w * $h;
	my $ribbon = 2 * $l + 2 * $w;

	$total_ribbon += $vol + $ribbon;
}

close $file;

print "$total_ribbon\n";
