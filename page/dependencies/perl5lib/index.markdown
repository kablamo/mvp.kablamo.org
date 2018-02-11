When you run a Perl program it looks for libraries (aka
modules/packages/classes/dependencies) in the paths specified in `$PERL5LIB`
before looking in the standard library.

    $ echo $PERL5LIB
    /usr/local/ddg/lib:/opt/perlbrew/libs/perl-5.26.1@mylib/lib/perl5

To load a library from a custom location modify your `$PERL5LIB` environment
variable.  For example, to always load dependencies from the `lib` directory in
your current project:

    $ export PERL5LIB=./lib:$PERL5LIB
    $ echo $PERL5LIB
    ./lib:/usr/local/ddg/lib:/opt/perlbrew/libs/perl-5.26.1@mylib/lib/perl5

Note that order is important.
