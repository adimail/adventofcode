# Problem statement: https://adventofcode.com/2024/day/1

open my $file, '<', 'input.txt' or die "could not open file: $!";

my @l_arr;
my @r_arr;
my $dist = 0;

while ( my $line = <$file> ) {
	chomp($line);

	my ( $l, $r ) = $line =~ /^(\d+).*?(\d+)$/;

	if ( defined $l && defined $r ) {
		push @l_arr, $l;
		push @r_arr, $r;
	}
}

@l_arr = sort { $a <=> $b } @l_arr;
@r_arr = sort { $a <=> $b } @r_arr;

for my $i ( 0 .. $#l_arr ) {
	my $diff = abs( $l_arr[$i] - $r_arr[$i] );
	print "$diff\t $l_arr[$i] - $r_arr[$i] \n";
	$dist += $diff;
}

print "\n\n $dist\n";
