#!perl -T

use Test::More tests => 9;

use WebService::Muzu;
use utf8;

use lib '.';
use t::MyLWP;

#my $MUZUID = 'EIvOYk1dlF';
#my $muzu = WebService::Muzu::Artist->new(muzuid => $MUZUID);

my $MUZUID = 'aBcDeFgHiJ';
my $muzu = WebService::Muzu::Artist->new(muzuid => $MUZUID, useragent => MyLWP::useragent);

$muzu->get_results_by_name('Pop Will Eat Itself');

is($muzu->{_last_url}, "http://www.muzu.tv/api/artist/details?aname=Pop+Will+Eat+Itself&format=xml&muzuid=$MUZUID&videotype=hq",'artist name url is correctly built.');

my @channels = $muzu->channels;
is(@channels, 2, 'correct array size for muzu->channels.');
is(ref($channels[0]), 'WebService::Muzu::Channel', 'correct reference in muzu->channels[0] result.');
is($channels[0]->token, 'wbH95PBm3V', 'attribute test of channels[0]->token correct.');
is($channels[0]->name, 'Pop Will Eat Itself', 'node test of channels[0]->name correct.');

my @videos = $muzu->videos;
is(@videos, 9, 'correct array size for muzu->videos.');
is(ref($videos[0]), 'WebService::Muzu::Video', 'correct reference in muzu->video[0] result.');
is($videos[0]->id, 1558476, 'attribute test of videos[0]->id correct.');
is($videos[0]->title, '92º Fahrenheit', 'node test of videos[0]->title correct.');
