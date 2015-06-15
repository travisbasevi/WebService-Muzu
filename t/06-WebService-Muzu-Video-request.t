#!perl -T

use Test::More tests => 8;

use WebService::Muzu;

use lib '.';
use t::MyLWP;

#my $MUZUID = 'EIvOYk1dlF';
#my $muzu = WebService::Muzu::Video->new(muzuid => $MUZUID);

my $MUZUID = 'aBcDeFgHiJ';
my $muzu = WebService::Muzu::Video->new(muzuid => $MUZUID, useragent => MyLWP::useragent);

$muzu->get_results_by_video_id(550557);

is($muzu->{_last_url}, "http://www.muzu.tv/api/video/details?format=xml&id=550557&muzuid=$MUZUID&videotype=hq", 'video_id url is correctly built.');

my $video = $muzu->video;
is(ref($video), 'WebService::Muzu::Video', 'correct reference in muzu->video result.');
is($video->artistid, 15892, 'attribute test of video->artistid correct.');
is($video->artistname, 'Pop Will Eat Itself', 'node test of video->artistname correct.');
is($video->max_resolution, 480, 'test of video->max_resolution correct.');

is($video->channel_vanityname, 'popwilleatitself', 'test of video->channel->vanityname correct.');

my @thumbnails = $muzu->thumbnails;
is(ref($thumbnails[0]), 'WebService::Muzu::Image', 'correct reference in muzu->thumbnails[0] result.');
is($thumbnails[0]->url, 'http://static.muzu.tv/media/images/000/550/557/001/550557-thb1.jpg', 'node test of thumbnails[0]->url correct.');
