# Exceptions

The standard Perl syntax for handling exceptions is annoying to visitors from
other languages.  It works really well if you give a chance though.

If you can't deal with the standard Perl syntax you can use Try::Tiny (described below), a
fairly popular module that adds `try` and `catch` keywords.  

#### Standard Perl syntax

Exceptions as strings:

    eval { die "Something bad happened" };
    warn $@ if $@; 
    # prints "Something bad happened at line x";

An example demonstrating return values:

    my $result = eval { make_api_request() };
    warn $@ if $@;


Exceptions as objects:

    eval {
        die My::Exception->new(
            error    => 'Something bad happened',
            request  => $request,
            response => $response,
        );
    };
    warn $@->error if $@;
    # prints "Something bad happened at line x";

or

    eval {
        My::Exception->throw(
            error    => 'Something bad happened',
            request  => $request,
            response => $response,
        );
    };
    warn $@->error if $a;
    # prints "Something bad happened at line x";


For more info read the documentation for [eval()](http://perldoc.perl.org/functions/eval.html)
    

#### Try::Tiny syntax

Exceptions as strings:

    use Try::Tiny;

    try   { die "Something bad happened" }
    catch { warn $_ };
    # prints "Something bad happened at line x";


Exceptions as objects:

    try {
        My::Exception->throw(
            error    => 'Something bad happened',
            request  => $request,
            response => $response,
        );
    }
    catch {
        warn $_->error;
    };
    # prints "Something bad happened at line x";



Unfortunately this
module has [caveats](https://metacpan.org/pod/Try::Tiny#CAVEATS) and in some
situations performance issues.  But they aren't a problem most of the time.

For more info read the documentation for [Try::Tiny](https://metacpan.org/pod/Try::Tiny).
