# Problem statement: https://adventofcode.com/2024/day/4

open my $file, '<', 'input.txt' or die "Could not open file: $!";

my @C;
my $ans = 0;

while ( my $l = <$file> ) {
	chomp($l);
	my @chars = split //, $l;
	push @C, \@chars;
}

my $rows = scalar @C;
my $cols = scalar @{ $C[0] };

for my $r ( 0 .. $rows - 1 ) {
	for my $c ( 0 .. $cols - 1 ) {

		next unless $C[$r][$c] eq 'X';

		# right
		if (   $c + 3 < $cols
			&& $C[$r][ $c + 1 ] eq 'M'
			&& $C[$r][ $c + 2 ] eq 'A'
			&& $C[$r][ $c + 3 ] eq 'S' )
		{
			$ans++;
		}

		# left
		if (   $c - 3 >= 0
			&& $C[$r][ $c - 1 ] eq 'M'
			&& $C[$r][ $c - 2 ] eq 'A'
			&& $C[$r][ $c - 3 ] eq 'S' )
		{
			$ans++;
		}

		# down
		if (   $r + 3 < $rows
			&& $C[ $r + 1 ][$c] eq 'M'
			&& $C[ $r + 2 ][$c] eq 'A'
			&& $C[ $r + 3 ][$c] eq 'S' )
		{
			$ans++;
		}

		# up
		if (   $r - 3 >= 0
			&& $C[ $r - 1 ][$c] eq 'M'
			&& $C[ $r - 2 ][$c] eq 'A'
			&& $C[ $r - 3 ][$c] eq 'S' )
		{
			$ans++;
		}

		# down-right
		if (   $r + 3 < $rows
			&& $c + 3 < $cols
			&& $C[ $r + 1 ][ $c + 1 ] eq 'M'
			&& $C[ $r + 2 ][ $c + 2 ] eq 'A'
			&& $C[ $r + 3 ][ $c + 3 ] eq 'S' )
		{
			$ans++;
		}

		# down-left
		if (   $r + 3 < $rows
			&& $c - 3 >= 0
			&& $C[ $r + 1 ][ $c - 1 ] eq 'M'
			&& $C[ $r + 2 ][ $c - 2 ] eq 'A'
			&& $C[ $r + 3 ][ $c - 3 ] eq 'S' )
		{
			$ans++;
		}

		# up-right
		if (   $r - 3 >= 0
			&& $c + 3 < $cols
			&& $C[ $r - 1 ][ $c + 1 ] eq 'M'
			&& $C[ $r - 2 ][ $c + 2 ] eq 'A'
			&& $C[ $r - 3 ][ $c + 3 ] eq 'S' )
		{
			$ans++;
		}

		# up-left
		if (   $r - 3 >= 0
			&& $c - 3 >= 0
			&& $C[ $r - 1 ][ $c - 1 ] eq 'M'
			&& $C[ $r - 2 ][ $c - 2 ] eq 'A'
			&& $C[ $r - 3 ][ $c - 3 ] eq 'S' )
		{
			$ans++;
		}
	}
}

print "$ans\n";
