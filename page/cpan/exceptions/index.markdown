#### Table of Contents

- die/eval
- Syntax::Keyword::Try
- Try::Tiny
- Try::Tiny::Tiny
- Try::Catch
- TryCatch
- Benchmarks


#### die/eval

Not a library, but this is the most popular way to handle exceptions.  The
performance is unbeatable and since `eval` is a builtin function you don't have
to `use` a module at the top of every file.  Unfortunately
there are drawbacks -- especially for developers visiting Perl for the first
time.  

The first hurdle for beginners is that the syntax is unique to Perl. Most
languages use try/catch.  There are also some significant traps
available for beginners to tumble into:

1. `$@` is a global variable.
2. `eval` blocks behave more like anonymous subroutines than `if` blocks.
3. You probably want to defend against exception objects that evaluate as false.

If that last one worries you then your code contains hard to read idioms like: 

    unless ( eval { try_something_risky(); return 1 } ) {
        handle_exception();
    }

Anyone designing a new language would not ask developers to do this.  And
explaining this idiom to a beginner is going make them want to run the other
direction.

However, over 40% of Perl developers prefer to handle exceptions with die/eval
so you will want to be familiar with the syntax and pitfalls.

I explain the syntax and how to handle all the potential pitfalls in [Handling
exceptions with die/eval](/essentials/die-eval/).  

For more information check out the official Perl docs for
[die](http://perldoc.perl.org/functions/die.html) and
[eval](http://perldoc.perl.org/functions/eval.html).

#### Try::Tiny

<div class="module">
    <div class="column">MetaCPAN: <a href="https://metacpan.org/pod/Try::Tiny">Try::Tiny</a></div>
    <div class="column">++ rating: 153</div>
    <div class="column">Last update: 2017</div>
    <div class="column">Maintainer: ETHER</div>
</div>

Try::Tiny is the most popular try/catch solution and the defacto standard in
the community.  For years it was the best solution available if you wanted
try/catch syntax.  

However, Try::Tiny is an order of magnitude slower than either `eval` or
Syntax::Keyword::Try.  It depends on your application if this is a problem or
not.  For many applications it's not important. 

Also if you are a visitor from another language, Try::Tiny has syntax quirks
which make it not quite the try/catch you are used to.

Be sure to check out Syntax::Keyword::Try as it's probably a better solution for
most people.


#### Syntax::Keyword::Try

<div class="module">
    <div class="column">MetaCPAN: <a href="https://metacpan.org/pod/Syntax::Keyword::Try">Syntax::Keyword::Try</a></div>
    <div class="column">++ rating: 19</div>
    <div class="column">Last update: 2018</div>
    <div class="column">Maintainer: PEVANS</div>
</div>

This is probably the best try/catch solution for handling exceptions in Perl.
This module is not widely used yet and is unlikely to replace die/eval anytime
soon.

Syntax::Keyword::Try is a relatively new module (2016) which adds `try` and
`catch` keywords to Perl.  This solution comes after many many similar
attempts.  Finally, you can handle exceptions in Perl with the same syntax you
would in other languages while enjoying performance comparable to plain `eval`.
This is because under the hood, Syntax::Keyword::Try compiles down to pretty
much the same thing as `eval`.  It also has no dependencies.

While this module introduces new keywords to the language, it still plays
nicely with perlcritic and perltidy.

This module requires XS and is only an option for users with Perl 5.16 and up
(Windows users need Perl 5.22 and up).

See the tutorial on <a
href="/essentials/try-catch/">Handling
exceptions with Syntax::Keyword::Try</a>.  

#### Try::Tiny::Tiny

<div class="module">
    <div class="column">MetaCPAN: <a href="https://metacpan.org/pod/Try::Tiny::Tiny">Try::Tiny::Tiny</a></div>
    <div class="column">++ rating: 0</div>
    <div class="column">Last update: 2017</div>
    <div class="column">Maintainer: ARISTOTLE</div>
</div>

For many apps Try::Tiny's performance problem is not a big deal. In terms of
CPAN it's a bigger deal because anytime you need great performance you need to
worry if your dependencies (or their dependencies) are using Try::Tiny in some
critical part of your code.

Try::Tiny::Tiny is a module which improves the performance of Try::Tiny
anywhere it is loaded in your stack.  My benchmarks showed performance went from
20.2 times  slower than `eval` to 12.9 times slower than `eval` which is nearly
an order of magnitude improvement.

Unlike the other modules reviewed here, Try::Tiny::Tiny isn't really intended
as a replacement solution for die/eval.  It's intended as a fix for
dependencies that use Try::Tiny.

#### Try::Catch

<div class="module">
    <div class="column">MetaCPAN: <a href="https://metacpan.org/pod/Try::Catch">Try::Catch</a></div>
    <div class="column">++ rating: 6</div>
    <div class="column">Last update: 2016</div>
    <div class="column">Maintainer: MAMOD</div>
</div>

Try::Catch is another attempt to improve on Try::Tiny.  My benchmarks showed
this module is  8.4 times slower than `eval`.  This is also a new module
(2017).  The syntax matches try/catch/finally in other languages better
than Try::Tiny.  But it's not as fast as Syntax::Keyword::Try and requires a
semicolon at the end.

#### TryCatch

<div class="module">
    <div class="column">MetaCPAN: <a href="https://metacpan.org/pod/TryCatch">TryCatch</a></div>
    <div class="column">++ rating: 13</div>
    <div class="column">Last update: 2013</div>
    <div class="column">Maintainer: ASH</div>
</div>

TryCatch has first class try/catch semantics and type checking on the catch
block.  My benchmarks showed this module has the same performance
as Syntax::Keyword::Try.  It never was broadly adopted because its
dependencies include Devel::Declare
(see the [warning](https://metacpan.org/pod/Devel::Declare#WARNING)) and Moose (lots of
dependencies).  It also lacks a `finally` block.

#### Benchmarks

*Results*

- Syntax::Keyword::Try is 2.6 times slower than `eval`
- TryCatch is 2.6 times slower than `eval`
- Try::Catch is 8.4 times slower than `eval`
- Try::Tiny::Tiny is 12.9 times slower than `eval`
- Try::Tiny is 20.2 times slower than `eval`

*Raw stats*

The code for generating these benchmarks is available
[here](https://github.com/kablamo/mvp.kablamo.org/tree/master/code/exceptions).

Syntax::Keyword::Try vs eval:

    $ ./benchmark.skt.pl 
                  Rate  S:K:T    eval   no eval
    S:K:T    2564103/s    --    -61%       -72%
    eval     6578947/s  157%      --       -28%
    no eval  9090909/s  255%     38%         --

TryCatch vs eval:

    $  ./benchmark.t.pl 
                Rate   TryCatch  eval  no eval
    TryCatch 2409639/s       --  -61%     -72%
    eval     6250000/s     159%    --     -26%
    no eval  8474576/s     252%   36%       --

Try::Catch vs eval:

    $ ./benchmark.tc.pl 
                  Rate   T::C  eval  no eval
    T::C      763359/s     --  -88%     -91%
    eval     6410256/s   740%    --     -28%
    no eval  8928571/s  1070%   39%       --

Try::Tiny::Tiny vs eval:

    $ ./benchmark.ttt.pl
                  Rate  T:T:T  eval  no eval
    T:T:T    505306/s      --  -92%     -94%
    eval     6493506/s  1185%    --     -25%
    no eval  8695652/s  1621%   34%       --

Try::Tiny vs eval:

    $ ./benchmark.tt.pl                                                                                                                                                                                                                                                                                     
                    Rate  Try::Tiny  eval  no eval
    Try::Tiny   310945/s         --  -95%     -96%
    eval       6410256/s      1962%    --     -16%
    no eval    7633588/s      2355%   19%       --
