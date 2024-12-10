# Problem statement: https://adventofcode.com/2024/day/4

open my $file, '<', 'input.txt' or die "Could not open file: $!";
my @grid;
while ( my $line = <$file> ) {
	chomp($line);
	push @grid, [ split //, $line ];
}
close $file;

my $rows = scalar @grid;
my $cols = scalar @{ $grid[0] };
my $p2   = 0;

# Check for "XMAS" patterns
for my $r ( 0 .. $rows - 1 ) {
	for my $c ( 0 .. $cols - 1 ) {
		if (   $r + 2 < $rows
			&& $c + 2 < $cols
			&& $grid[$r][$c] eq 'M'
			&& $grid[ $r + 1 ][ $c + 1 ] eq 'A'
			&& $grid[ $r + 2 ][ $c + 2 ] eq 'S'
			&& $grid[ $r + 2 ][$c] eq 'M'
			&& $grid[$r][ $c + 2 ] eq 'S' )
		{
			$p2++;
		}
		if (   $r + 2 < $rows
			&& $c + 2 < $cols
			&& $grid[$r][$c] eq 'M'
			&& $grid[ $r + 1 ][ $c + 1 ] eq 'A'
			&& $grid[ $r + 2 ][ $c + 2 ] eq 'S'
			&& $grid[ $r + 2 ][$c] eq 'S'
			&& $grid[$r][ $c + 2 ] eq 'M' )
		{
			$p2++;
		}
		if (   $r + 2 < $rows
			&& $c + 2 < $cols
			&& $grid[$r][$c] eq 'S'
			&& $grid[ $r + 1 ][ $c + 1 ] eq 'A'
			&& $grid[ $r + 2 ][ $c + 2 ] eq 'M'
			&& $grid[ $r + 2 ][$c] eq 'M'
			&& $grid[$r][ $c + 2 ] eq 'S' )
		{
			$p2++;
		}
		if (   $r + 2 < $rows
			&& $c + 2 < $cols
			&& $grid[$r][$c] eq 'S'
			&& $grid[ $r + 1 ][ $c + 1 ] eq 'A'
			&& $grid[ $r + 2 ][ $c + 2 ] eq 'M'
			&& $grid[ $r + 2 ][$c] eq 'S'
			&& $grid[$r][ $c + 2 ] eq 'M' )
		{
			$p2++;
		}
	}
}

print "$p2\n";
