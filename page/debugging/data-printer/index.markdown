# Examining data structures

There are lots of good modules that make this easy. I recommend
[Data::Printer](https://metacpan.org/pod/Data::Printer).

Example code:

    eric@eric:~ $ cat foo.pl 
    #!/usr/bin/env perl
    use strict;
    use warnings;
    use DDP;

    my $data_structure = {
        scalar  => 42,
        listref => [1, 2, 3],
        hashref => {a => 1, b => 2, c => 3},
        coderef => sub { print "hello\n" },
    };

    p $data_structure;

On the command line:

    eric@eric:~ $ perl foo.pl 
    \ {
        coderef   sub { ... },
        hashref   {
            a   1,
            b   2,
            c   3
        },
        listref   [
            [0] 1,
            [1] 2,
            [2] 3
        ],
        scalar    42
    }

