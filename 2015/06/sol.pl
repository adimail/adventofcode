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
			handlelight( $a, $b, $op );
		}
	}

	print "$line\n";
}

sub handlelight {
	my ( $x, $y, $op ) = @_;

	if ( $op eq 'on' ) {
		$lights{ $x, $y } = 1;
	}
	elsif ( $op eq 'off' ) {
		$lights{ $x, $y } = 0;
	}
	elsif ( $op eq 'toggle' ) {
		$lights{ $x, $y } = $lights{ $x, $y } ? 0 : 1;
	}
}

my $on_count = 0;
foreach my $state ( values %lights ) {
	$on_count++ if $state == 1;
}

print "Number of lights that are on: $on_count\n";
