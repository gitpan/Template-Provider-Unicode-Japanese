#!/usr/bin/env perl
#
# $Revision: 1.2 $
# $Source: /home/cvs/Template-Provider-Unicode-Japanese/t/03pod-coverage.t,v $
# $Date: 2006/06/21 21:07:11 $
#
use strict;
use warnings;
use version;
our $VERSION = version->new(qw$Revision: 1.2 $);

use English qw(-no_match_vars);
use Test::More;

if ( $ENV{TEST_POD} || $ENV{TEST_ALL} ) {
    eval {
        require Test::Pod::Coverage;
        Test::Pod::Coverage->import;
    };
    if ($EVAL_ERROR) {
        plan skip_all =>
          'Test::Pod::Coverage required for testing POD coverage';
    }
}
else {
    plan skip_all => 'set TEST_POD for testing POD coverage';
}

all_pod_coverage_ok();
