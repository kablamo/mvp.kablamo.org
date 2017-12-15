# Loops

#### foreach

C-like `for` loops exist but you almost never need them in Perl.
`foreach` is usually simpler (but can be spelled as either `for`
or `foreach`).

Iterating over an array

    my @array = ('a', 'b', 'c', 'd');

    foreach my $e (@array) {
        print $e, "\n";         # $e becomes each element of the array
    }
    # outputs "a\nb\nc\nd\n"

    # exactly the same as above, only less typing :-)
    for my $e (@array) {
        print $e, "\n";
    }

Iterating over a hash

    my %hash = (a => 1, b => 2, c => 3);

    for my $k (keys %hash) {
        print $hash{$k}, "\n";
    }

#### while

    my $i = 0;

    while ($i > 4) {
        print $i, "\n";
        $i++;
    }

#### last

Exits the loop immediately.
This works with any kind of loop.

    for my $i (@array) {
        print $i, "\n";
        last if $i > 3; # break out of the loop early
    }
    
#### next

Skips to the next iteration of the loop.
This also works with any kind of loop.

    for my $i (@array) {
        next if $i > 3; # don't print anything for $i > 3
        print $i, "\n";
    }
    
