#!perl -T

use Test::More tests => 10;

use WebService::Muzu;

use lib '.';
use t::MyLWP;

#my $MUZUID = 'EIvOYk1dlF';
#my $muzu = WebService::Muzu->new(muzuid => $MUZUID);

my $MUZUID = 'aBcDeFgHiJ';
my $muzu = WebService::Muzu->new(muzuid => $MUZUID, useragent => MyLWP::useragent);

$muzu->get_results_by_browse({ft => 'video', g => 'alternative', ob => 'alpha', l => 10});

is($muzu->{_last_url}, "http://www.muzu.tv/api/browse?format=xml&ft=video&g=alternative&l=10&muzuid=$MUZUID&ob=alpha&videotype=hq",'browse url is correctly built.');
is(ref($muzu->{_result}->{videos}->[0]), 'WebService::Muzu::Video','correct reference in result.');

my @bvideos = $muzu->videos;

is(@bvideos, 10, '10 videos retrieved.');
is($bvideos[0]->artistid, 1312, 'attribute test of video->artistid correct.');
is($bvideos[0]->artistname, "The The", 'node test of video->artistname correct.');

$muzu->get_results_by_search({mySearch => 'Pop Will Eat Itself', l => 5});

is($muzu->{_last_url}, "http://www.muzu.tv/api/search?format=xml&l=5&muzuid=$MUZUID&mySearch=Pop+Will+Eat+Itself&videotype=hq",'search url is correctly built.');
is(ref($muzu->{_result}->{videos}->[0]), 'WebService::Muzu::Video','correct reference in result.');

my @svideos = $muzu->videos;

is(@svideos, 5, '5 videos retrieved.');
is($svideos[0]->artistid, 15892, 'attribute test of video->artistid correct.');
is($svideos[0]->artistname, "Pop Will Eat Itself", 'node test of video->artistname correct.');


