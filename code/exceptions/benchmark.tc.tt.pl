#!/usr/bin/env perl

use strict;
use warnings;

use Benchmark 'cmpthese';
use Try::Catch;
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

sub try_catch {
    Try::Catch::try {
        my ($a, $b) = (2, 4);
        my $c = $a+$b;
    } 
    Try::Catch::catch {

    };
}

cmpthese(10_000_000, {
    'Try::Tiny'  => \&try_tiny,
    'Try::Catch' => \&try_catch,
});
