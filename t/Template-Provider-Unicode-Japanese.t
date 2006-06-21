#!/usr/bin/env perl
#
# $Revision: 1.1 $
# $Source: /home/cvs/Template-Provider-Unicode-Japanese/t/Template-Provider-Unicode-Japanese.t,v $
# $Date: 2006/06/21 19:09:33 $
#
use strict;
use warnings;
use version;
our $VERSION = version->new(qw$Revision: 1.1 $);

use blib;
use Encode::Guess ( Encode->encodings(':all') );
use FindBin qw($Bin);
use Template;
use Template::Provider::Unicode::Japanese;
use Test::More tests => 11;

my $provider =
  Template::Provider::Unicode::Japanese->new(
    { INCLUDE_PATH => "$Bin/data/" } );
isa_ok( $provider, $Template::Config::PROVIDER );

my $template = Template->new( { LOAD_TEMPLATES => [$provider] } );

foreach my $filename (qw(ascii jis sjis ujis utf8)) {
  TODO: {
        local $TODO;    ## no critic
        if ( $filename eq 'ascii' ) {
            $TODO = 'The output is not utf8 though _load returns utf8';
        }
        $template->process( $filename, {}, \my $output );
        is( eval { Encode::Guess->guess($output)->name },
            'utf8', "$filename: utf8 encoding" );
        ok( utf8::is_utf8($output), "$filename: utf8 flag" );
    }
}
