#### Create your test library

This code goes in the `t/lib/test` directory of your project.

    package test::Something;

    use Test2::API;
    use Exporter::Shiny qw/test_something/;

    sub test_something {
        my ($something, $name) = @_;

        my $ctx = Test2::API::context();

        my ($success, $error) = check($something);
        if ($success) {
            $ctx->pass($name);
        }
        else {
            $ctx->fail($name);
            $ctx->diag($error);
        }

        $ctx->release;
        return;
    }

    sub check { ... }
    
    1;

The context object represents the context in which a test takes place (File and
Line Number), and provides a quick way to generate events from that context.
For more details see
[Test2::API::Context](https://metacpan.org/pod/Test2::API::Context).

#### Use your test library

This code goes in `t/foo.t`:

    use Test2::V0;
    use Test::Lib; # Add t/lib to @INC
    use test::Something qw/test_something/;

    test_something(...);

    done_testing();
    
