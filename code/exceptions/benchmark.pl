#!/usr/bin/env perl

use strict;
use warnings;

use Benchmark 'cmpthese';
use Try::Tiny qw//;
use Syntax::Keyword::Try;

sub eval {
    eval {
        my ($a, $b) = (2, 4);
        my $c = $a+$b;
    }
}

sub no_eval {
    my ($a, $b) = (2, 4);
    my $c = $a+$b;
}

sub try_tiny {
    Try::Tiny::try {
        my ($a, $b) = (2, 4);
        my $c = $a+$b;
    } 
    Try::Tiny::catch {

    };
}

sub syntax_keyword_try {
    try {
        my ($a, $b) = (2, 4);
        my $c = $a+$b;
    } 
    catch {

    }
}

cmpthese(10_000_000, {
    'eval'      => \&eval,
    'no eval'   => \&no_eval,
    'Try::Tiny' => \&try_tiny,
    'S:K:T'     => \&syntax_keyword_try,
});
