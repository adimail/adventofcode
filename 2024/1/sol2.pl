# Problem statement: https://adventofcode.com/2024/day/1

open my $file, '<', 'input.txt' or die "could not open file: $!";

my @l_arr;
my @r_arr;
my $score = 0;

while ( my $line = <$file> ) {
	chomp($line);

	my ( $l, $r ) = $line =~ /^(\d+).*?(\d+)$/;

	if ( defined $l && defined $r ) {
		push @l_arr, $l;
		push @r_arr, $r;
	}
}

for my $i ( 0 .. $#l_arr ) {
	my $occurence = grep { $_ == $l_arr[$i] } @r_arr;

	print "$score\t $l_arr[$i] * $occurence \n";
	$score += ( $l_arr[$i] * $occurence );
}

print "\n\n $score\n";
