#!/usr/bin/perl
use strict;

use Test::More skip_all => 'GAL::Parser::complete_genomics in developement';

BEGIN {
	use lib '../../';
	use_ok('GAL::Parser::complete_genomics');
}

my $path = $0;
$path =~ s/[^\/]+$//;
$path ||= '.';
chdir($path);

my $parser = GAL::Parser::complete_genomics->new(file => 'data/complete_genomics.csv');

# TEST 2
isa_ok($parser, 'GAL::Parser::complete_genomics');

# Test 3
ok(my $record = $parser->_read_next_record, '$parser->_read_next_record');

# TEST 4
ok($parser->parse_record($record), '$parser->parse_record');

done_testing();

################################################################################
################################# Ways to Test #################################
################################################################################

__END__

# Various other ways to say "ok"
ok($this eq $that, $test_name);

is  ($this, $that,    $test_name);
isnt($this, $that,    $test_name);

# Rather than print STDERR "# here's what went wrong\n"
diag("here's what went wrong");

like  ($this, qr/that/, $test_name);
unlike($this, qr/that/, $test_name);

cmp_ok($this, '==', $that, $test_name);

is_deeply($complex_structure1, $complex_structure2, $test_name);

can_ok($module, @methods);
isa_ok($object, $class);

pass($test_name);
fail($test_name);

BAIL_OUT($why);
