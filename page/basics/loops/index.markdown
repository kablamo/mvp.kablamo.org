# Loops

#### foreach

C style `for` loops exist but you almost never need them in Perl.
`foreach` is usually simpler.

Iterating over an array

    my @array = ('a', 'b', 'c', 1, 2, 3);

    foreach my $i (@array) {
        print $i;
    }
    # prints 'abc123'

Iterating over a hash

    my %hash = (a => 1, b => 2, c => 3);

    foreach my $i (keys %hash) {
        print $hash{$i};
    }
    # prints '123'

#### while

    my $i = 0;

    while ($i < 4) {
        print $i;
        $i++;
    }
    # prints '0123'

#### Postfix loops

Postfix notation exists for `foreach`, `for`, `while`, and `until` loops.

    print $_ foreach ('a', 'b', 'c');
    print $_ for     ('a', 'b', 'c');
    # both statemets print 'abc'

#### last

Exit the loop immediately.  This works with any kind of loop.

    foreach my $i (@array) {
        print $i;
        last if $i > 3; # break out of the loop early
    }

#### next

Start the next iteration of the loop immediately.  This also works with any kind of loop.

    foreach my $i (@array) {
        next if $i > 3; # don't print anything for $i > 3
        print $i;
    }

