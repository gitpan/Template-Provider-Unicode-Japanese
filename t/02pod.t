#!/usr/bin/env perl
#
# $Revision: 1.1 $
# $Source: /home/cvs/Template-Provider-Unicode-Japanese/t/02pod.t,v $
# $Date: 2006/06/21 19:09:33 $
#
use strict;
use warnings;
use version;
our $VERSION = version->new(qw$Revision: 1.1 $);

use blib;
use English qw(-no_match_vars);
use Test::More;

if ( $ENV{TEST_POD} || $ENV{TEST_ALL} ) {
    eval {
        require Test::Pod;
        Test::Pod->import;
    };
    if ($EVAL_ERROR) {
        plan skip_all => 'Test::Pod required for testing POD';
    }
}
else {
    plan skip_all => 'set TEST_POD for testing POD';
}

all_pod_files_ok();
