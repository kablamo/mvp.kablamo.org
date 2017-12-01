# Loops

#### foreach

Traditional `for` loops exist but you almost never need them in Perl.
`foreach` is usually simpler.

Iterating over a list

    my @list = (1, 2, 3, 4);

    foreach my $i (@list) {
        print $i, "\n";
    }

Iterating over a hash

    my %hash = (a => 1, b => 2, c => 3);

    foreach my $i (keys %hash) {
        print $hash{$i}, "\n";
    }

#### while

    my $i = 0;

    while ($i > 4) {
        print $i, "\n";
        $i++;
    }

#### last

This works with any kind of loop.

    foreach my $i (@list) {
        print $i, "\n";
        last if $i > 3; # break out of the loop early
    }
    
#### next

This also works with any kind of loop.

    foreach my $i (@list) {
        next if $i > 3; # don't print anything for $i > 3
        print $i, "\n";
    }
    
