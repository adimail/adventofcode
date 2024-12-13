# Problem statement: https://adventofcode.com/2024/day/6

use List::Util qw(min max);

open my $file, '<', 'input.txt' or die "Could not open file: $!";
my @C;

while ( my $line = <$file> ) {
	chomp($line);
	push @C, [ split //, $line ];
}

my $rows = scalar @C;
my $cols = scalar @{ $C[0] };

my @dx         = ( -1, 0, 1,  0 );
my @dy         = (  0, 1, 0, -1 );
my %directions = (
	'^' => 0,
	'>' => 1,
	'v' => 2,
	'<' => 3,
);

sub simulate_with_obstruction {
	my ( $C, $rows, $cols, $obstruct_x, $obstruct_y, $guard_x, $guard_y, $dir )
	  = @_;
	my %visited;
	my $loop_detected = 0;

	$C->[$obstruct_x][$obstruct_y] = '#';

	while (1) {
		my $state = "$guard_x,$guard_y,$dir";
		return 0 if $visited{$state}++;

		my $next_x = $guard_x + $dx[$dir];
		my $next_y = $guard_y + $dy[$dir];

		if (   $next_x < 0
			|| $next_x >= $rows
			|| $next_y < 0
			|| $next_y >= $cols )
		{
			last;
		}

		if ( $C->[$next_x][$next_y] eq '#' ) {
			$dir = ( $dir + 1 ) % 4;
		}
		else {
			$guard_x = $next_x;
			$guard_y = $next_y;
		}
	}

	$C->[$obstruct_x][$obstruct_y] = '.';
	return $loop_detected;
}

my ( $guard_x, $guard_y, $dir );
for my $x ( 0 .. $rows - 1 ) {
	for my $y ( 0 .. $cols - 1 ) {
		if ( $C[$x][$y] =~ /^[\^v<>]$/ ) {
			( $guard_x, $guard_y, $dir ) =
			  ( $x, $y, $directions{ $C[$x][$y] } );
			$C[$x][$y] = '.';
		}
	}
}

my %visited;
$visited{"$guard_x,$guard_y"} = 1;

my $valid_positions = 0;

for my $x ( 0 .. $rows - 1 ) {
	for my $y ( 0 .. $cols - 1 ) {
		next if $C[$x][$y] ne '.';    # Only consider empty cells
		next
		  if $x == $guard_x && $y == $guard_y;  # Skip guard's starting position

		if (
			simulate_with_obstruction(
				\@C, $rows, $cols, $x, $y, $guard_x, $guard_y, $dir
			)
		  )
		{
			$valid_positions++;
		}
	}
}

print $valid_positions, "\n";
