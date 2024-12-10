# Problem statement: https://adventofcode.com/2024/day/5

use strict;
use warnings;

open my $file, '<', 'input.txt' or die "Could not open file: $!";

my %order;
my @updates;
my $sum_of_middles = 0;

while ( my $line = <$file> ) {
	chomp($line);
	if ( $line =~ /^(\d+)\|(\d+)$/ ) {

		my ( $a, $b ) = ( $1, $2 );
		push @{ $order{$b} }, $a;
	}
	elsif ( $line =~ /^\d+(,\d+)*$/ ) {

		my @nums = split( ',', $line );
		push @updates, \@nums;
	}
}

close $file;

sub is_valid_update {
	my ( $pages, $order_ref ) = @_;
	my %seen;

	print join( " ", @$pages );
	print "\n";

	foreach my $page (@$pages) {
		$seen{$page} = 1;

		if ( exists $order_ref->{$page} ) {

			#foreach my $required_before ( @{ $order_ref->{$page} } ) {
			#
			#	return 0 unless $seen{$required_before};
			#}
		}
	}
	return 1;
}

foreach my $update (@updates) {
	if ( is_valid_update( $update, \%order ) ) {

		my $middle_index = int( @$update / 2 );
		$sum_of_middles += $update->[$middle_index];
	}
}

print "Sum of middle page numbers: $sum_of_middles\n";
