One way to handle exceptions in Perl is with
[Syntax::Keyword::Try](https://metacpan.org/pod/Syntax::Keyword::Try) which
adds `try` and `catch` keywords to Perl. As always there are trade offs and it
depends on your goals and preferences. 

It has no dependencies and plays nicely with perltidy and perlcritic.  However,
it is 2.6 times slower than `eval()` and it's not included in the Perl core so
you will need to install it.  

<div class="tip">
    <div class="tip-title">Alternate<br>Solutions</div>
    <div class="tip-content" style="margin-left:6rem">
        There is more than one way to handle exceptions in Perl and several modules
on MetaCPAN which add try/catch keywords to Perl.  To find out which solution
is best for you, see <a href="/cpan/exceptions/">Whats the best way to handle
exceptions?</a>
    </div>
</div>

#### Throwing exceptions
To throw an exception call `die()`.  If the exception is not caught, an error
message is displayed to STDERR and the process exits with a non-zero value.
Syntax::Keyword::Try doesn't change how exceptions are thrown.  

    die "Something bad happened";
    # prints "Something bad happened at line 123." 
    # and then the process exits;

#### Catching exceptions with Syntax::Keyword::Try

    use Syntax::Keyword::Try

    try {
        die "it's only a flesh wound";
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
These are not really pitfalls.  Syntax::Keyword::Try works the same as
try/catch works in other languages.  However if you are used to handling
exceptions with die/eval or Try::Tiny here are a few things that you may have
forgotten about try/catch:

*1. A `try` block must be followed by `catch` or `finally` or both.*

    try { do_something_risk() } # syntax error

*2. A `try` block does not catch exceptions.*  The `catch` block catches exceptions.

    try     { die "it's just a flesh wound" }
    finally { say "hello" }
    # no exception is caught
    # prints "it's just a flesh wound" to STDERR
    # process exits

*3. A `return` statement will exit the containing function -- not the `try` block.*

*4. Loop control statements like `redo`, `next`, and `last` act on any containing loops.*

