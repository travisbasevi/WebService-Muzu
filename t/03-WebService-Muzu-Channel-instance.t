#!perl -T

use Test::More tests => 2;

use WebService::Muzu;

my $MUZUID = 'aBcDeFgHiJ';

my $muzu = WebService::Muzu::Channel->new(muzuid => $MUZUID);

is(ref($muzu), 'WebService::Muzu::Channel','$muzu is a WebService::Muzu::Channel instance.');
is($muzu->{_query}->{muzuid}, $MUZUID,'muzuid is properly set.');
