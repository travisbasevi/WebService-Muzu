#!perl -T

use Test::More tests => 20;

use WebService::Muzu;

use lib '.';
use t::MyLWP;

#my $MUZUID = 'EIvOYk1dlF';
#my $muzu = WebService::Muzu::Channel->new(muzuid => $MUZUID);

my $MUZUID = 'aBcDeFgHiJ';
my $muzu = WebService::Muzu::Channel->new(muzuid => $MUZUID, useragent => MyLWP::useragent);

$muzu->get_results_by_vanityname('popwilleatitself');

is($muzu->{_last_url}, "http://www.muzu.tv/api/channel/details?format=xml&muzuid=$MUZUID&videotype=hq&vname=popwilleatitself",'vanityname url is correctly built.');

my $channel1 = $muzu->channel;
is(ref($channel1), 'WebService::Muzu::Channel', 'correct reference in muzu->channel result.');
is($channel1->name, 'Pop Will Eat Itself', 'node test of channel->name correct.');

my $image1 = $muzu->image;
is(ref($image1), 'WebService::Muzu::Image', 'correct reference in muzu->image result.');
is($image1->url, 'http://static.muzu.tv/media/images/001/189/624/001/1189624-thb1.png', 'node test of image->url correct.');

my @thumbnails1 = $muzu->thumbnails;
is(ref($thumbnails1[0]), 'WebService::Muzu::Image', 'correct reference in muzu->thumbnails[0] result.');
is($thumbnails1[0]->url, 'http://static.muzu.tv/media/images/001/189/624/001/1189624-thb1.png', 'node test of thumbnails[0]->url correct.');

my @videos1 = $muzu->videos;
is(ref($videos1[0]), 'WebService::Muzu::Video', 'correct reference in muzu->videos[0] result.');
is($videos1[0]->id, 550558, 'attribute test of videos->[0]->id correct.');
is($videos1[0]->title, 'Wise Up Sucker', 'node test of videos->[0]->id correct.');

$muzu->get_results_by_token('wbH95PBm3V');

is($muzu->{_last_url}, "http://www.muzu.tv/api/channel/details?format=xml&muzuid=$MUZUID&token=wbH95PBm3V&videotype=hq",'token url is correctly built.');

my $channel2 = $muzu->channel;
is(ref($channel2), 'WebService::Muzu::Channel', 'correct reference in muzu->channel result.');
is($channel2->name, 'Pop Will Eat Itself', 'node test of channel->name correct.');

my $image2 = $muzu->image;
is(ref($image2), 'WebService::Muzu::Image', 'correct reference in muzu->image result.');
is($image2->url, 'http://static.muzu.tv/media/images/001/189/624/001/1189624-thb1.png', 'node test of image->url correct.');

my @thumbnails2 = $muzu->thumbnails;
is(ref($thumbnails2[0]), 'WebService::Muzu::Image', 'correct reference in muzu->thumbnails[0] result.');
is($thumbnails2[0]->url, 'http://static.muzu.tv/media/images/001/189/624/001/1189624-thb1.png', 'node test of thumbnails[0]->url correct.');

my @videos2 = $muzu->videos;
is(ref($videos2[0]), 'WebService::Muzu::Video', 'correct reference in muzu->videos[0] result.');
is($videos2[0]->id, 550558, 'attribute test of videos->[0]->id correct.');
is($videos2[0]->title, 'Wise Up Sucker', 'node test of videos->[0]->id correct.');

