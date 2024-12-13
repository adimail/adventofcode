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

while (1) {

	my $next_x = $guard_x + $dx[$dir];
	my $next_y = $guard_y + $dy[$dir];

	if ( $next_x < 0 || $next_x >= $rows || $next_y < 0 || $next_y >= $cols ) {
		last;
	}

	if ( $C[$next_x][$next_y] eq '#' ) {

		$dir = ( $dir + 1 ) % 4;
	}
	else {
		$guard_x                      = $next_x;
		$guard_y                      = $next_y;
		$visited{"$guard_x,$guard_y"} = 1;
	}
}

print scalar keys %visited;
