#!perl -T

use Test::More tests => 8;

use WebService::Muzu;
use utf8;

use lib '.';
use t::MyLWP;

#my $MUZUID = 'EIvOYk1dlF';
#my $muzu = WebService::Muzu::Image->new(muzuid => $MUZUID);

my $MUZUID = 'aBcDeFgHiJ';
my $muzu = WebService::Muzu::Image->new(muzuid => $MUZUID, useragent => MyLWP::useragent);

$muzu->get_results_by_video_id(550557);
is($muzu->{_last_url}, "http://www.muzu.tv/api/image/video?format=xml&id=550557&muzuid=$MUZUID&videotype=hq",'video id url is correctly built.');

my $image1 = $muzu->image;
is(ref($image1), 'WebService::Muzu::Image', 'correct reference in muzu->image result.');
is($image1->width, 108, 'attribute test of image->width correct.');
is($image1->url, 'http://static.muzu.tv/media/images/000/550/557/001/550557-thb5.jpg', 'node test of image->url correct.');

$muzu->get_results_by_channel_token('wbH95PBm3V');
is($muzu->{_last_url}, "http://www.muzu.tv/api/image/channel?format=xml&id=wbH95PBm3V&muzuid=$MUZUID&videotype=hq",'channel token url is correctly built.');

my $image2 = $muzu->image;
is(ref($image2), 'WebService::Muzu::Image', 'correct reference in muzu->image result.');
is($image2->width, 108, 'attribute test of image->width correct.');
is($image2->url, 'http://static.muzu.tv/media/images/001/189/624/001/1189624-thb5.png', 'node test of image->url correct.');
