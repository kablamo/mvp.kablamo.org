#### Default behavior

By default perl doesn't print a stack trace when errors occur.  For example:

    $ cat foo.pl
    #!/usr/bin/env perl
    use strict;
    use warnings;

    sub function3 { function4() }
    sub function2 { function3() }
    sub function1 { function2() }

    function1();
    $ perl foo.pl 
    Undefined subroutine &main::function4 called at foo.pl line 5.

#### How to force a stack trace
If you want to see a stack trace you should use [Devel::Confess](https://metacpan.org/pod/Devel::Confess).

Example on the command line:

    $ perl -d:Confess foo.pl
    Undefined subroutine &main::function4 called at foo.pl line 5.
            main::function3() called at foo.pl line 6
            main::function2() called at foo.pl line 7
            main::function1() called at foo.pl line 9

Example from inside your program:

    #!/usr/bin/env perl
    use strict;
    use warnings;

    use Devel::Confess 'color';

    sub function3 { function4() }
    sub function2 { function3() }
    sub function1 { function2() }

    function1();

How to force a stack trace in just one place in your code with
[Carp](https://metacpan.org/pod/Carp):

    #!/usr/bin/env perl
    use strict;
    use warnings;

    use Carp 'confess';

    sub function3 { confess 'die with a stack trace' }
    sub function2 { function3() }
    sub function1 { function2() }

    function1();
