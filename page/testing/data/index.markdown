# Testing data structures

#### Hashes

    use Test2::V0 qw/hash match DNE all_vals all_keys end/;

    my $expected_hash = hash {
        field foo => 1;
        field bar => 2;
    
        # Ensure the 'baz' key Does Not Exist in the hash.
        field baz => DNE();
    
        # Ensure the key exists, but is set to undef
        field bat => undef;
    
        # Any check can be used
        field boo => hash { ... },
    
        # Set checks that apply to all keys or values. Can be done multiple
        # times, and each call can define multiple checks, all will be run.
        all_vals match qr/a/, match qr/b/;    # All keys must have an 'a' and a 'b'
        all_keys match qr/x/;                 # All keys must have an 'x'
    
        ...
    
        end(); # optional, enforces that no other keys are present.
    };

    is(
        $some_hash,
        $expected_hash,
        "Got the expected hash"
    );

#### Arrays

    use Test2::V0 qw/filter_items all_items match DNE end/;

    my $expected_array = array {
        # Uses the next index, in this case index 0;
        item 'a';
    
        # Gets index 1 automatically
        item 'b';
    
        # Specify the index
        item 2 => 'c';
    
        # We skipped index 3, which means we don't care what it is.
        item 4 => 'e';
    
        # Gets index 5.
        item 'f';
    
        # Remove any REMAINING items that contain 0-9.
        filter_items { grep {!m/[0-9]/} @_ };
    
        # Set checks that apply to all items. Can be done multiple times, and
        # each call can define multiple checks, all will be run.
        all_items match qr/a/, match qr/b/;
        all_items match qr/x/;
    
        # Of the remaining items (after the filter is applied) the next one
        # (which is now index 6) should be 'g'.
        item 6 => 'g';
    
        item 7 => DNE; # Ensure index 7 does not exist.
    
        end(); # Ensure no other indexes exist.
    };

    is(
        $some_array,
        $expected_array,
        "Got the expected array"
    );

#### Ordered subsets

    my $expected = subset {
        item 'a';
        item 'b';
        item 'c';
    
        # Doesn't matter if the array has 'd', the check will skip past any
        # unknown items until it finds the next one in our subset.
    
        item 'e';
        item 'f';
    };

#### Bags

A bag is like an array, but we don't care about the order of the items. In the
example, the test will pass if it matches either `['a','b']` and `['b','a']`.

    my $expected_bag = bag {
        item 'a';
        item 'b';
    
        end(); # Ensure no other elements exist.
    };

#### For more info

See the documentation for [Test2::Tools::Compare](https://metacpan.org/pod/Test2::Tools::Compare).
