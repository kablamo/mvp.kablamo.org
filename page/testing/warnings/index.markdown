# Testing warnings and exceptions

#### Testing for unintentional warnings

Ideally your code doesn't generate warnings.
[Test2::Plugin::NoWarnings](https://metacpan.org/pod/Test2::Plugin::NoWarnings)
will cause your test to fail if any warnings are generated.  Here is how to use
it:

    use Test2::V0;
    use Test2::Plugin::NoWarnings;

By default this module suppresses any warnings.  If you want to see the warnings in your test output:

    use Test2::V0;
    use Test2::Plugin::NoWarnings echo => 1;

#### Testing for intentional warnings

    use Test2::V0;

    ok warns { warn 'a' }, "the code warns";
    ok !warns { 1 }, "The code does not warn";
    is warns { warn 'a'; warn 'b' }, 2, "got 2 warnings";
    
    ok no_warnings { ... }, "code did not warn";
    
    like
        warning { warn 'xxx' },
        qr/xxx/,
        "Got expected warning"
    ;
    
    is
        warnings { warn "a\n"; warn "b\n" },
        [ "a\n", "b\n", ],
        "Got 2 warnings"
    ;

For more details see [Test2::Tools::Warnings](https://metacpan.org/pod/Test2::Tools::Warnings).

#### Testing for exceptions

    use Test2::V0;
    
    like(
        dies { die 'xxx' },
        qr/xxx/,
        "Got exception"
    );
    
    ok(lives { ... }, "did not die") or note($@);

For more details see [Test2::Tools::Exceptions](https://metacpan.org/pod/Test2::Tools::Exception).
