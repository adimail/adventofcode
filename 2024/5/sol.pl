# Problem statement: https://adventofcode.com/2024/day/5

use strict;
use warnings;

open( my $fin, '<', './input.txt' ) or die "Could not open file: $!";

my $content = do { local $/; <$fin> };

close($fin);

my $ans = 0;

my ( $raw_rules, $raw_updates ) = split( /\n\n/, $content );

my @rules;
for my $line ( split /\n/, $raw_rules ) {
	my ( $a, $b ) = split /\|/, $line;
	push @rules, [ $a + 0, $b + 0 ];
}

my @updates;
for my $line ( split /\n/, $raw_updates ) {
	push @updates, [ map { $_ + 0 } split /,/, $line ];
}

sub valid {
	my ($update) = @_;
	my %idx;
	for my $i ( 0 .. $#$update ) {
		$idx{ $update->[$i] } = $i;
	}

	for my $rule (@rules) {
		my ( $a, $b ) = @$rule;
		if ( exists $idx{$a} && exists $idx{$b} && !( $idx{$a} < $idx{$b} ) ) {
			return 0;
		}
	}

	return $update->[ int( @$update / 2 ) ];
}

for my $update (@updates) {
	my $mid = valid($update);
	if ($mid) {
		$ans += $mid;
	}
}

print "$ans\n";
