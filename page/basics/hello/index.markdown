# Hello world

The code:

    #!/usr/bin/env perl
    use strict;
    use warnings;
    
    print "hello world\n";

How to run it:

    $ perl hello.pl
    hello world

#### strict and warnings

Its considered bad form to not
[use](https://perldoc.perl.org/functions/use.html)
[strict](https://perldoc.perl.org/strict.html) and
[warnings](https://perldoc.perl.org/warnings.html) in all your code.

- `use strict` makes it an error to use certain expressions.
- `use warnings` enables additional warnings for certain expressions.

In both cases, the goal is to protect the developer from bad old syntax which
the Perl interpreter will accept as valid but will most likely cause your code
to behave unexpectedly and cause errors that are hard to debug.  

