use 5.006;
use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'WebService::Muzu',
    AUTHOR              => q{Travis Basevi <travis@verymetalnoise.com>},
    VERSION_FROM        => 'lib/WebService/Muzu.pm',
    ABSTRACT_FROM       => 'lib/WebService/Muzu.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
	'LWP::UserAgent' => 0,
	'XML::LibXML' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'WebService-Muzu-*' },
);
