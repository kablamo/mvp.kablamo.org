
The standard Perl syntax for handling exceptions (die/eval) is quirky and has
some pitfalls that are easy to tumble into.  However its pretty common so 
you will need to understand it.

<div class="tip">
    <div class="tip-title">Alternate<br>Solution</div>
    <div class="tip-content" style="margin-left:6rem">
        If your prefer try/catch, several modules exist that add try/catch syntax to Perl. 
        As always there are some trade offs.  See <a
href="/essentials/try-catch/"> Handling
exceptions with try/catch</a> for details.
    </div>
</div>

#### Throwing exceptions

To throw an exception call `die()`.  If the exception is not caught, an error
message is displayed to STDERR and the process exits with a non-zero value.

    die "Something bad happened";
    # prints "Something bad happened at line 123." 
    # and then the process exits;

#### Catching exceptions

To catch an exception, use `eval()`.  `eval()` parses, compiles, and evaluates
a block of code at compile time and catches any exceptions that are raised at
runtime.  The exception is placed in the global variable `$@`.  

    eval { die "Something bad happened" }; # try (and catch)
    warn $@ if $@;                         # handle exception

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

*1. `$@` is a global variable*

If your exception handling code calls `eval()`, `$@` will get clobbered.  This
is easy to forget.  Here is one way to avoid it:

    eval { die "something bad" };
    if ($@) {
        my $error = $@;
        disconnect_from_the_database(); # calls eval()
        warn $error;
    }

If you are a module author and want to be polite and not modify `$@` globally
you need to jump through hoops like this:
    
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

*2. Exception objects that evaluate as false*

You can [overload](https://metacpan.org/pod/overload) Perl operators.  For
example, you could have an exception object evaluate to "error" in string
context.  You could also have an exception object evaluate to -1 in string
context.

This would cause mysterious problems for most people because the common
idiom `handle_exception() if $@` will silently fail and the exception won't be
handled.  

One solution is to use a safer but more verbose idiom everywhere:

    unless ( eval { try_something_risky(); return 1 } ) {
        handle_exception();
    }

*3. `eval` blocks behave more like anonymous subroutines than if blocks.*

For example:

- A `return` statement will exit the `eval` block -- not the containing function.
- Loop control statements like `redo`, `next`, and `last` only work in the context of whats inside the `eval` block.


#### See also
For more info read the documentation for 
[die()](http://perldoc.perl.org/functions/die.html) and
[eval()](http://perldoc.perl.org/functions/eval.html)
    

