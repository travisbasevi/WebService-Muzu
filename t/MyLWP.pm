package MyLWP;

use LWP::UserAgent;
use HTTP::Response;
use Test::MockObject::Extends;

sub useragent
	{
	my $ua = LWP::UserAgent->new();
	$ua = Test::MockObject::Extends->new($agent);
	$ua->mock('get', \&response);
	return $ua;
	}

sub response
	{
	my $self = shift;
	my $url = shift;

	my $file = $url;
	$file =~ s!^(http://)?www.muzu.tv/api/!!;
	$file =~ s/\?.*$//;
	$file =~ s!/!_!g;

	if (open(IN, "t/$file.xml"))
		{
		local $/ = undef;
		$content = <IN>;
		close(IN);
		return HTTP::Response->new(200, '', ['Content-Type', 'test/html'], $content);
		}
	else
		{
		return HTTP::Response->new(500, "cannot open t/$file.xml: $!");
		}
	}

1;
