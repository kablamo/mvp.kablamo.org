#!/usr/bin/env perl

use strict;
use warnings;

use Benchmark 'cmpthese';
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

sub syntax_keyword_try {
    try {
        my ($a, $b) = (2, 4);
        my $c = $a+$b;
    } 
    catch {

    }
}

cmpthese(20_000_000, {
    'eval'      => \&eval,
    'no eval'   => \&no_eval,
    'S:K:T'     => \&syntax_keyword_try,
});
