# Problem statement: https://adventofcode.com/2018/day/4

open my $file, '<', 'input.txt' or die "could not open file: $!";

while ( my $l = <$file> ) {
	chomp($l);
	print "$l\n";
}
