# References

You will need to understand references.  However its also <i>the most
frustrating</i> and time consuming part of learning Perl for everyone.  If you
can master this you will be able to read and write Perl code.  <i>Be sure to
read the section "Key Things to Remember" at the bottom! </i>

#### What is a reference?
A reference is like a pointer.  It's a scalar value containing the address of
another value.  Perl will not automatically dereference a variable for you.
References are scalars so they always start with a <code>$</code>.  

#### Array references

Also called array refs for short.

    my @array = (1, 2, 3, 4);             # array
    my $arrayref1 = \@array;              # array reference
    my $arrayref2 = ['a', 'b', 'c', 'd']; # array reference

    # Access element 0 of the array
    print $array[0];       # prints 1

    # Dereference + access element 0
    print $arrayref1->[0]; # prints 1
    print $arrayref2->[0]; # prints 'a'

    # A array reference inside a array reference
    my $arrays_in_arrays = [a, b, c, ['roo', 'woo', 'loo']];

    # How to dereference array references
    my @array1 = @{ $arrays_in_arrays };      # (a, b, c ['roo', 'woo', 'loo'])
    my @array2 = @$arrays_in_arrays;          # same but less typing
    my @array3 = @{ $arrays_in_arrays->[3] }; # ('roo', 'woo', 'loo')

#### Hash references

Also called hash refs for short.

    my %hash = (a => 1, b => 2, c => 3);        # hash
    my $hashref1 = \%hash;                      # hash reference
    my $hashref2 = {x => 11, y => 12, z => 13}; # hash reference

    # Access hash value 
    print $hash{a};       # prints 1

    # Dereference + access hash value 
    print $hashref1->{a}; # prints 1
    print $hashref2->{x}; # prints 11

    # A hash reference inside a hash reference
    my $hashes_in_hashes = { 
        a => 1,
        b => 2,
        c => { x => 1, y => 2 },
    };

    # How to dereference hash references
    my %hash1 = %{ $hashes_in_hashes };      # (a => 1, b => 2, c => {x => 1, y => 2})
    my %hash2 = %$hashes_in_hashes;          # same but less typing
    my %hash3 = %{ $hashes_in_hashes->{c} }; # (x => 1, y => 2)

#### Code references 

AKA code refs, anonymous subroutines, anonymous functions, closures, or callbacks.

    my $coderef = sub { print "stegasaurus" };
    # Dereference and run the subroutine
    $coderef->(); # prints "stegasaurus"

#### Key things to remember

Mastering this topic requires some memorization and a lot of practice.  Key things to remember:

- <code>[ ... ]</code> creates a array reference
- <code>{ ... }</code> creates a hash reference
- <code>@$var</code> or <code>@{ ... }</code> dereferences a array
- <code>%$var</code> or <code>%{ ... }</code> dereferences a hash

