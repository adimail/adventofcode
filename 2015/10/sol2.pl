my $input = '1321131112';

sub look_and_say {
	my $str    = shift;
	my $result = '';

	while ( $str =~ /(\d)\1*/g ) {
		my $digit = $1;
		my $count = length($&) / length($digit);
		$result .= $count . $digit;
	}

	return $result;
}

for ( 1 .. 50 ) {
	$input = look_and_say($input);
}

print length($input), "\n";
