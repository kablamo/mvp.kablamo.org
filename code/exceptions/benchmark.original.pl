#!/usr/bin/env perl

use strict;
use warnings;
use lib '../lib';
use Try::Catch();
use Try::Tiny();
 
use Benchmark qw(:all) ;
 
##simple
cmpthese(1_000_000, {
    'Try::Tiny' => sub {
        Try::Tiny::try {
 
        }  Try::Tiny::catch {
 
        };
    },
    'Try::Catch' => sub {
        Try::Catch::try {
 
        }  Try::Catch::catch {
 
        };
    },
});
 
##try dies
cmpthese(1_000_000, {
    'Try::Tiny Dies' => sub {
        my @t = Try::Tiny::try {
            die "foo";
        }  Try::Tiny::catch {
 
        };
    },
    'Try::Catch Dies' => sub {
        my @t = Try::Catch::try {
            die "foo";
        }  Try::Catch::catch {
 
        };
    },
});
 
##try finally no die
cmpthese(1_000_000, {
    'Try::Tiny Finally no die' => sub {
        my @t = Try::Tiny::try {
 
        }  Try::Tiny::finally {
 
        };
    },
    'Try::Catch finally no die' => sub {
        my @t = Try::Catch::try {
 
        }  Try::Catch::finally {
 
        };
    },
});
 
###try catch and finally blocks
cmpthese(1_000_000, {
    'Try::Tiny with finally' => sub {
        Try::Tiny::try {
            die "foo";
        } Try::Tiny::catch {
 
        } Try::Tiny::finally {
 
        };
    },
    'Try::Catch with finally' => sub {
        Try::Catch::try {
            die "foo";
        }  Try::Catch::catch {
 
        } Try::Catch::finally {
 
        };
    }
});
