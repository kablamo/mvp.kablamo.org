[Syntax::Keyword::Try](https://metacpan.org/pod/Syntax::Keyword::Try) is the
best way to handle exceptions in Perl. It adds `try` and `catch` keywords to
Perl. Unfortunately the module is not in core, so you will need to install it.

#### Throwing exceptions
To throw an exception call `die()`.  Other languages call it `throw()`, but in
Perl its called `die()`.  If the exception is not caught, an error message is
displayed to STDERR and the process exits with a non-zero value.
Syntax::Keyword::Try doesn't change how exceptions are thrown.  

    die "Something bad happened";
    # prints "Something bad happened at line 123." 
    # and then the process exits;

#### Catching exceptions with Syntax::Keyword::Try

    use Syntax::Keyword::Try

    try {
        die "its only a flesh wound";
    }
    catch {
        warn "something bad happened: $@";
    }

The catch block can inspect the exception by looking at `$@`.  

#### Exceptions as objects

Exceptions are usually strings, but you can throw objects too.

    try {
        die My::Exception->new(
            error    => 'Something bad happened',
            request  => $request,
            response => $response,
        );
    }
    catch {
        warn "something bad happened: " . $@->error();
    }

#### Pitfalls for Perl programmers
These are not really pitfalls unless you are used to the standard Perl
mechanism for handling exceptions -- `die` and `eval`.  If thats you, here are
a few things that you may have forgotten about handling exceptions with
try/catch:

*1. A `try` block must be followed by `catch` or `finally` or both.*

    try { do_something_risk() } # syntax error

*2. A `try` block does not catch exceptions.*  The `catch` block catches exceptions.

    try     { die "its just a flesh wound" }
    finally { say "hello" }
    # no exception is caught
    # prints "its just a flesh wound" to STDERR
    # process exits

*3. A `return` statement will exit the containing function -- not the `try` block.*

*4. Loop control statements like `redo`, `next`, and `last` act on any containing loops.*

