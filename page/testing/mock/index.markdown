#### Inject new methods

Inject a new method into Some::Class:

    use Test::V0 qw/mock/;

    my $mock = mock 'Some::Class' => (
        add => [
            is_active => sub { ... }
        ]
    );

    Some::Class->is_active(); # Calls our newly injected method.

Inject a new method into an anonymous class:

    use Test::V0 qw/mock/;

    my $simple_mock = mock {} => (
        add => [
            is_active => sub { ... }
        ]
    );

    $simple_mock->is_active(); # Calls our newly injected method.

#### Override existing methods

Override an existing method in Some::Class:

    my $mock = mock 'Some::Class' => (
        override => [
            replace_method => sub { ... },
        ],
    );
    
    Some::Class->replace_method();    # Calls our replacement method.
    
    $mock->override(...) # Override some more
    
#### Restore original methods

    $mock = undef; # Undoes all the mocking, restoring all original methods.
    

#### For more info

For more details see [Test2::Tools::Mock](https://metacpan.org/pod/Test2::Tools::Mock).
