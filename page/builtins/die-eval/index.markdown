Use [Syntax::Keyword::Try]() when working with exceptions. Its adds `try` and
`catch` keywords to Perl and helps you avoid some of the pitfalls of the
standard Perl syntax (described below).  

The standard Perl syntax for handling exceptions is annoying to visitors from
other languages.  However its pretty common so you will need to grok this
syntax.

#### die

Many languages have `throw()`.  In Perl its called `die()` and it throws an
exception.  If the exception is not caught, the process exits with a non-zero
value and an error message is displayed to STDERR.

    die "Something bad happened";
    # process prints "Something bad happened at line 123." and exits;

#### eval

Many languages have `try()`.  In Perl its called `eval()` but
its a little different.  `eval()` parses, compiles, and evaluates a block of
code at runtime and catches any exceptions that are raised.  The exception is
placed in the global variable `$@`.

    eval { die "Something bad happened" }; # try
    warn $@ if $@;                         # catch

#### Exceptions as objects

Exceptions are often strings, but you can throw objects too.

    eval {
        die My::Exception->new(
            error    => 'Something bad happened',
            request  => $request,
            response => $response,
        );
    };
    warn $@->error if $@;

#### Avoiding the pitfalls

**Remember $@ is a global variable**

If your exception handling code calls `eval()`, `$@` will get clobbered.  This
is easy to forget.  Here is one way to avoid it:

    eval { die "something bad" };
    if ($@) {
        my $error = $@;
        disconnect_from_the_database(); # calls eval()
        warn $error;
    }

If you are a module author and want to be polite and not modify `$@` you would
need to jump through hoops like this (no one actually does this because its too
much typing):
    
    my ($error1, $error2);
    {
        local $@;
        unless (eval { ...; return 1 }) {
            $error1 = 1;
            $error2 = $@;
        }
    }
    if ($error1) {
        # handle exception
    }

**Don't use exception objects that evalute as false**

You can [overload]() Perl's operators.  For example, you could have an
exception object evaluate to "error" in string context.  You could also have an
exception object evaluate to -1 in string context.

This would cause mysterious problems for most people because the common
idiom `handle_exception() if $@` will silently fail and the exception won't be
handled.  

One solution is use a safer but more verbose idiom everywhere:

    if ( eval { try_something_risky(); return 1 } ) {
        handle_exception();
    }


#### See also
For more info read the documentation for 
[die()](http://perldoc.perl.org/functions/die.html) and
[eval()](http://perldoc.perl.org/functions/eval.html)
    

