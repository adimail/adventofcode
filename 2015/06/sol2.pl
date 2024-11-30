open my $file, '<', 'input.txt' or die "Could not open file: $!";

my %lights;

while ( my $line = <$file> ) {
	chomp($line);
	my @digits = $line =~ /\d+/g;
	my ( $x1, $y1, $x2, $y2 ) = @digits;

	my $op = '';
	if ( $line =~ /turn on/ ) {
		$op = 'on';
	}
	elsif ( $line =~ /turn off/ ) {
		$op = 'off';
	}
	elsif ( $line =~ /toggle/ ) {
		$op = 'toggle';
	}

	for ( my $a = $x1 ; $a <= $x2 ; $a++ ) {
		for ( my $b = $y1 ; $b <= $y2 ; $b++ ) {
			handlelightbrightness( $a, $b, $op );
		}
	}

	print "$line\n";
}

sub handlelightbrightness {
	my ( $x, $y, $op ) = @_;

	if ( $op eq 'on' ) {
		$lights{ $x, $y } += 1;
	}
	elsif ( $op eq 'off' ) {
		$lights{ $x, $y } =
			$lights{ $x, $y } > 0
		  ? $lights{ $x, $y } - 1
		  : 0;
	}
	elsif ( $op eq 'toggle' ) {
		$lights{ $x, $y } += 2;
	}
}

my $totalbrightness = 0;
foreach my $brightness ( values %lights ) {
	$totalbrightness += $brightness;
}

print "Total brightness: $totalbrightness\n";
