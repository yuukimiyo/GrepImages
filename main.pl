#
# GrepImages by yuuki miyoshi.
# Get image uri from htmlfile or other.
#
# [License]
# MIT License. or WTFPL
#
# [usage]
# main.pl [filename] [filename] ...
#

$LF = "\n";

@lines = ();
foreach (@ARGV) {
	push(@lines,read_file($_));
}

$line='';
@words = ();
foreach (@lines) {
	@w = $_ =~ /"(http[^\"]+?\.jpg)"/g;
	push(@words,@w);
}

foreach (@words) {
	print $_ . $LF;
}

sub read_file {
	local @p = ();
	open(IN, @_[0]);
	while (<IN>) {
		chomp($_);
		push(@p,$_);
	}
	close(IN);
	@p;
}