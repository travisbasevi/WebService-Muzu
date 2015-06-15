#!perl -T

use Test::More tests => 2;

use WebService::Muzu;

my $MUZUID = 'aBcDeFgHiJ';

my $muzu = WebService::Muzu->new(muzuid => $MUZUID);

is(ref($muzu), 'WebService::Muzu','$muzu is a WebService::Muzu instance.');
is($muzu->{_query}->{muzuid}, $MUZUID,'muzuid is properly set.');
