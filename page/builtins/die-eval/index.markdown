The standard Perl syntax for handling exceptions (die/eval) is quirky and has
some pitfalls that are easy to tumble into.  However its pretty common so its
likely you will need to understand it.

<div class="tip">
    <div class="tip-title">Best Practice</div>
    <div class="tip-content">
        The recommended way to handle exceptions is with Syntax::Keyword::Try which
        adds `try` and `catch` keywords to Perl.  
        See <a href="http://localhost:3000/builtins/syntax-keyword-try/">
        Exceptions with Syntax::Keyword::Try
        </a>
    </div>
</div>

#### Throwing exceptions

To throw an exception call `die()`.  Other languages call it `throw()`, but in
Perl its called `die()`.  If the exception is not caught, an error message is
displayed to STDERR and the process exits with a non-zero value.

    die "Something bad happened";
    # prints "Something bad happened at line 123." 
    # and then the process exits;

#### Catching exceptions

To catch an exception, use `eval()`. Other languages call it `try()` but in
Perl its called `eval()` and its a little different.  `eval()` parses,
compiles, and evaluates a block of code at runtime and catches any exceptions
that are raised.  The exception is placed in the global variable `$@`.

    eval { die "Something bad happened" }; # try
    warn $@ if $@;                         # catch

#### Exceptions as objects

Exceptions are usually strings, but you can throw objects too.

    eval {
        die My::Exception->new(
            error    => 'Something bad happened',
            request  => $request,
            response => $response,
        );
    };
    warn $@->error if $@;

#### Pitfalls

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

One solution is to use a safer but more verbose idiom everywhere:

    if ( eval { try_something_risky(); return 1 } ) {
        handle_exception();
    }


#### See also
For more info read the documentation for 
[die()](http://perldoc.perl.org/functions/die.html) and
[eval()](http://perldoc.perl.org/functions/eval.html)
    

