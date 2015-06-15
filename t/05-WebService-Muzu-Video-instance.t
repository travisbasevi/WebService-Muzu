#!perl -T

use Test::More tests => 2;

use WebService::Muzu;

my $MUZUID = 'aBcDeFgHiJ';

my $muzu = WebService::Muzu::Video->new(muzuid => $MUZUID);

is(ref($muzu), 'WebService::Muzu::Video','$muzu is a WebService::Muzu::Video instance.');
is($muzu->{_query}->{muzuid}, $MUZUID,'muzuid is properly set.');
