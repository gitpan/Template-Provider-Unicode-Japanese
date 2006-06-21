#!/usr/bin/env perl
#
# $Revision: 1.1 $
# $Source: /home/cvs/Template-Provider-Unicode-Japanese/t/01perlcritic.t,v $
# $Date: 2006/06/21 19:09:33 $
#
use strict;
use warnings;
use version;
our $VERSION = version->new(qw$Revision: 1.1 $);

use blib;
use English qw(-no_match_vars);
use Test::More;

if ( $ENV{TEST_CRITIC} || $ENV{TEST_ALL} ) {
    eval {
        my $format = "%l: %m (severity %s)\n";
        if ( $ENV{TEST_VERBOSE} ) {
            $format .= "%p\n%d\n";
        }
        require Test::Perl::Critic;
        Test::Perl::Critic->import( -format => $format, -severity => 1 );
    };
    if ($EVAL_ERROR) {
        plan skip_all =>
          'Test::Perl::Critic required for testing PBP compliance';
    }
}
else {
    plan skip_all => 'set TEST_CRITIC for testing PBP compliance';
}

all_critic_ok();
