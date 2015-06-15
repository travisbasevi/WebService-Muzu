#!perl -T

use Test::More tests => 2;

use WebService::Muzu;

my $MUZUID = 'aBcDeFgHiJ';

my $muzu = WebService::Muzu::Artist->new(muzuid => $MUZUID);

is(ref($muzu), 'WebService::Muzu::Artist','$muzu is a WebService::Muzu::Artist instance.');
is($muzu->{_query}->{muzuid}, $MUZUID,'muzuid is properly set.');
