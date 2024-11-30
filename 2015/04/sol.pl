use Digest::MD5 qw(md5_hex);

my $secret_key = "bgvyzdsv";

my $number = 1;

while (1) {
	my $input = $secret_key . $number;

	my $hash = md5_hex($input);

	if ( $hash =~ /^00000/ ) {
		print "$number\n";
		print "$hash\n";
		last;
	}

	$number++;
}
