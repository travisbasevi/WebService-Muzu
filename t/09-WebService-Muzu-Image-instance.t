#!perl -T

use Test::More tests => 2;

use WebService::Muzu;

my $MUZUID = 'aBcDeFgHiJ';

my $muzu = WebService::Muzu::Image->new(muzuid => $MUZUID);

is(ref($muzu), 'WebService::Muzu::Image','$muzu is a WebService::Muzu::Image instance.');
is($muzu->{_query}->{muzuid}, $MUZUID,'muzuid is properly set.');
