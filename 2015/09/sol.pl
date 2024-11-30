use Algorithm::Permute;
use List::Util 'min';

open my $file, '<', 'input.txt' or die "Could not open file: $!";

my %distances;

while ( my $line = <$file> ) {
	chomp($line);
	if ( $line =~ /(\w+) to (\w+) = (\d+)/ ) {
		my ( $city1, $city2, $distance ) = ( $1, $2, $3 );
		$distances{"$city1,$city2"} = $distance;
		$distances{"$city2,$city1"} = $distance;
	}
}
close $file;

my @cities = keys %{ { map { split /,/, $_ } keys %distances } };

my $p = Algorithm::Permute->new( \@cities );

sub calculate_distance {
	my @route          = @_;
	my $total_distance = 0;

	for my $i ( 0 .. $#route - 1 ) {
		$total_distance += $distances{"$route[$i],$route[$i+1]"};
	}

	return $total_distance;
}

my $min_distance = 'inf';
while ( my @perm = $p->next ) {
	my $distance = calculate_distance(@perm);
	$min_distance = min( $min_distance, $distance );
}

print "$min_distance\n";
