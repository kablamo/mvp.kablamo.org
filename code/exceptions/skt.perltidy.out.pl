#!/usr/bin/env perl

use strict;
use warnings;

use Benchmark 'cmpthese';
use Syntax::Keyword::Try;

sub eval {
    eval {
        my ( $a, $b ) = ( 2, 4 );
        my $c = $a + $b;
    }
}

sub no_eval {
    my ( $a, $b ) = ( 2, 4 );
    my $c = $a + $b;
}

sub syntax_keyword_try {
    my $foo = 1;

    for my $i ( 0 .. 10 ) {
        try {
            my ( $a, $b ) = ( 2, 4 );
            my $c = $a + $b;
        }
        catch {

        }
        if ( $i == 1 ) {
            print "hii\n";
        }
        $i += 1;
        last;
    }
}

cmpthese(
    10_000_000,
    {
        'eval'    => \&eval,
        'no eval' => \&no_eval,
        'S:K:T'   => \&syntax_keyword_try,
    }
);
