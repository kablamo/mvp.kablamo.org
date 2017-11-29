# References

You will need to understand references.  However its also <i>the most
frustrating</i> and time consuming part of learning Perl for everyone.  If you
can master this you will be able to read and write Perl code.  <i>Be sure to
read the section "Key Things to Remember" at the bottom! </i>

#### What is a reference?
A reference is a pointer.  It's a scalar value containing the address of
another value.  Perl will not automatically dereference a variable for you.
Reference variables are scalars so they always start with a <code>$</code>.  

#### List References

Also called list refs for short.

    my @list = (1, 2, 3, 4); # list
    my $listref1 = \@list;   # list reference
    my $listref2 = ['a', 'b', 'c', 'd']; # list reference

    # Access element 0 of the list 
    print $list[0];       # prints 1

    # Dereference + access element 0
    print $listref1->[0]; # prints 1
    print $listref2->[0]; # prints 'a'

    # A list reference inside a list reference
    my $lists_in_lists = [a, b, c, ['roo', 'woo', 'loo']];

    # How to dereference list references
    my @list1 = @{ $lists_in_lists };      # (a, b, c ['roo', 'woo', 'loo'])
    my @list2 = @$listref;                 # same but less typing
    my @list3 = @{ $lists_in_lists->[3] }; # ('roo', 'woo', 'loo')

#### Hash References

Also called hash refs for short.

    my %hash = (a => 1, b => 2, c => 3); 
    my $hashref1 = \%hash;
    my $hashref2 = {x => 11, y => 12, z => 13};

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

#### Code References 

AKA code refs, anonymous subroutines, anonymous functions, closures, or callbacks.

    my $coderef = sub { print "stegasaurus" };
    # Dereference + run the subroutine
    $coderef->(); # prints "stegasaurus"

#### Key things to remember

Mastering this topic requires some memorization and a lot of practice.  Key things to remember:

- <code>[ ... ]</code> creates a list reference
- <code>{ ... }</code> creates a hash reference
- <code>@$var</code> or <code>@{ ... }</code> dereferences a list
- <code>%$var</code> or <code>%{ ... }</code> dereferences a hash

