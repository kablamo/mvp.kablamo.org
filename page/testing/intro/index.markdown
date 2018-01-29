#### Directory layout

Perl tests traditionally go in the `t` directory at the root of your project.  It should look something like this:

    t
    ├── 00_compile.t        # this test runs first
    ├── data                # dir for test data
    │   ├── alien.json
    │   └── cowboy.json
    ├── lib                 # dir for test libraries
    │   └── t
    │       └── Helper.pm   # t::Helper
    ├── Transmogrifier
    │   ├── In
    │   │   └── Tiger.t     # unit tests for Transmogrifier::In::Tiger
    │   └── Out
    │       ├── Alien.t     # unit tests for Transmogrifier::Out::Alien
    │       └── Cowboy.t    # unit tests for Transmogrifier::Out::Cowboy
    └── Transmogrifier.t    # integration tests for Transmogrifier.pm

The layout of your `.t` files should probably mirror the layout of your `.pm` files.

#### Running tests with prove

On the command line: 

    $ prove --help # get help
    $ prove t # runs tests in the t directory
    $ prove t/cowboy t/alien
    $ prove -r t/cowboy t/alien # recursive
    $ prove          \\
        --lib        \ # add 'lib' dir to your $PERL5LIB
        --verbose    \ # more output
        --recurse    \ # run tests in the t dir recursively
        --jobs 10    \ # run tests in parallel
    $ prove -lvr       # same as above but shorter and no concurrency


prove runs tests in alphabetical order by default and it only runs `.t` files.

#### Writing tests with Test2

Install Test2:

    cpanm -l local Test2

Some basic functions that are made available by Test2:

    # Test for true or false
    ok( $got, $test_name);
    ok(!$got, $test_name);

    # Compare 2 scalar values
    is  ($got, $want, $test_name);
    isnt($got, $want, $test_name);

    # Match against a regex
    like  ($got, qr/want/, $test_name);
    unlike($got, qr/want/, $test_name);

    # Compare data structures
    is_deeply($got_complex_thing, $want_complex_thing, $test_name);

    # Rare, but used for complex logic: 
    # eg, if I get to this place, pass()
    pass "this test will always pass";
    fail "this test will always fail"; 

    # Used to make sure you meant to stop testing here and
    # didn't exit/return/die and skip the rest of your tests.
    done_testing();

Example:

    use Test2::V0;
    use Dinosaur;

    my $dino = Dinosaur->new;

    is $dino->has_tail, 1, "dinosaurs have a tail";

    done_testing();

For more info see the Test2 documentation:

- [Test2::Manual::Testing::Introduction](https://metacpan.org/pod/Test2::Manual::Testing::Introduction)
- [Test2::Tools::Basic](https://metacpan.org/pod/Test2::Tools::Basic)
- [Test2::V0](https://metacpan.org/pod/Test2::V0)
- [Test2](https://metacpan.org/pod/Test2)

