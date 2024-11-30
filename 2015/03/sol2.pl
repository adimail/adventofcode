open my $file, '<', 'input.txt' or die "Could not open file: $!";

my $line = do { local $/; <$file> };
close $file;

my @robot_pos  = ( 0, 0 );
my @santa_pos  = ( 0, 0 );
my @santasturn = 1;

my %visited_houses;
$visited_houses{"$santa_pos[0],$santa_pos[1]"} = 1;

foreach my $char ( split //, $line ) {
	if ( $santasturn == 1 ) {
		if ( $char eq '^' ) { $santa_pos[1] += 1; }
		if ( $char eq 'v' ) { $santa_pos[1] -= 1; }
		if ( $char eq '>' ) { $santa_pos[0] += 1; }
		if ( $char eq '<' ) { $santa_pos[0] -= 1; }
		$santasturn = 0;
		$visited_houses{"$robot_pos[0],$robot_pos[1]"} = 1;
	}
	else {
		if ( $char eq '^' ) { $robot_pos[1] += 1; }
		if ( $char eq 'v' ) { $robot_pos[1] -= 1; }
		if ( $char eq '>' ) { $robot_pos[0] += 1; }
		if ( $char eq '<' ) { $robot_pos[0] -= 1; }
		$santasturn = 1;
		$visited_houses{"$santa_pos[0],$santa_pos[1]"} = 1;
	}

	#print "@santa_pos\n";
	#print "@robot_pos\n";
	#print "$char\n";
}

my $total_houses = keys %visited_houses;
print "\n$total_houses\n";
