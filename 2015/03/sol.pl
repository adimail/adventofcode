open my $file, '<', 'input.txt' or die "Could not open file: $!";

my $line = do { local $/; <$file> };
close $file;

my @curr_pos = ( 0, 0 );

my %visited_houses;
$visited_houses{"$curr_pos[0],$curr_pos[1]"} = 1;

foreach my $char ( split //, $line ) {
	if ( $char eq '^' ) { $curr_pos[1] += 1; }
	if ( $char eq 'v' ) { $curr_pos[1] -= 1; }
	if ( $char eq '>' ) { $curr_pos[0] += 1; }
	if ( $char eq '<' ) { $curr_pos[0] -= 1; }

	$visited_houses{"$curr_pos[0],$curr_pos[1]"} = 1;
}

my $total_houses = keys %visited_houses;
print "\n$total_houses\n";
