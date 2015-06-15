#!perl -T

use Test::More tests => 1;

BEGIN
	{
	use_ok( 'WebService::Muzu' ) || print "Bail out!\n";
	}

diag( "Testing WebService::Muzu $WebService::Muzu::VERSION, Perl $], $^X" );
