# Problem statement: https://adventofcode.com/2017/day/1

open my $file, '<', 'input.txt' or die "Could not open file: $!";

my $input = <$file>;
chomp $input;
close $file;

my $sum    = 0;
my $length = length($input);
my $step   = $length / 2;

for my $i ( 0 .. $length - 1 ) {
	my $current_digit = substr( $input, $i, 1 );
	my $halfway_digit = substr( $input, ( $i + $step ) % $length, 1 );

	$sum += $current_digit if $current_digit == $halfway_digit;
}
print "$sum\n";
