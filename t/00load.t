#!/usr/bin/env perl
#
# $Revision: 1.1 $
# $Source: /home/cvs/Template-Provider-Unicode-Japanese/t/00load.t,v $
# $Date: 2006/06/21 19:09:33 $
#
use strict;
use warnings;
use version;
our $VERSION = version->new(qw$Revision: 1.1 $);

use blib;
use English qw(-no_match_vars);
use Test::More tests => 2;

our $WHY_SKIP_SAWAMPERSAND;

BEGIN {
    if ( $ENV{TEST_MATCH_VARS} || $ENV{TEST_ALL} ) {
        eval {
            require Devel::SawAmpersand;
            Devel::SawAmpersand->import(qw(sawampersand));
        };
        if ($EVAL_ERROR) {
            $WHY_SKIP_SAWAMPERSAND =
              'Devel::SawAmpersand required for testing sawampersand';
        }
    }
    else {
        $WHY_SKIP_SAWAMPERSAND = 'set TEST_MATCH_VARS for testing sawampersand';
    }

    use_ok('Template::Provider::Unicode::Japanese');
}

# run sawampersand test if Devel::SawAmpersand is installed.
SKIP: {
    if ($WHY_SKIP_SAWAMPERSAND) {
        skip $WHY_SKIP_SAWAMPERSAND, 1;
    }
    isnt( sawampersand(), 1, q{$`, $&, and $' should not appear} ); ## no critic
}
