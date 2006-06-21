#!/usr/bin/env perl
#
# $Revision: 1.1 $
# $Source: /home/cvs/Template-Provider-Unicode-Japanese/Makefile.PL,v $
# $Date: 2006/06/21 19:09:28 $
#
use strict;
use warnings;
our $VERSION = eval {
    require version;
    version->new(qw$Revision: 1.1 $);
};

use inc::Module::Install;
eval {
    require ExtUtils::MakeMaker::Coverage;
    ExtUtils::MakeMaker::Coverage->import;
};

name 'Template-Provider-Unicode-Japanese';
version '0.01';
all_from 'lib/Template/Provider/Unicode/Japanese.pm';

requires 'version'           => 0;
requires 'Template'          => 0;
requires 'Unicode::Japanese' => 0;

WriteAll;
