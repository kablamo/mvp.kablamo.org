#!/usr/bin/env perl

use strict;
use warnings;

use Benchmark 'cmpthese';
use Try::Tiny;

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

cmpthese(100_000_000, {
    'eval'      => \&eval,
    'no eval'   => \&no_eval,
    'Try::Tiny' => \&try_tiny,
});
