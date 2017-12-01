# Installing libraries

The best way to install modules is with
[cpanm](https://metacpan.org/pod/distribution/App-cpanminus/lib/App/cpanminus/fatscript.pm).

#### How to install cpanm

Hopefully its already installed, but if not:

    curl -L https://cpanmin.us | perl - --sudo App::cpanminus

#### Basic usage

    cpanm --help         # get help
    cpanm URI            # install the URI module from CPAN
    cpanm DateTime@1.44  # install version 1.44

#### Installing to a locallib

You will have a different set of dependencies for each project and sometimes
requirements conflict between projects.  Here is how to install your
dependencies to a local directory in your current project:

    cpanm --local-lib <path> <module>[@version]
    cpanm --local-lib local URI   # install to ./local
    cpanm -l local URI            # same but less typing

To use a dependency installed to a locallib, include the path in your
`$PERL5LIB` environment variable:

    $ export PERL5LIB=./lib:./local/lib/perl5:$PERL5LIB
    $ echo $PERL5LIB
    ./lib:./local/lib/perl5:/opt/perlbrew/libs/perl-5.26.1@mylib/lib/perl5

For more information about locallibs see the documentation for [the local::lib
module](https://metacpan.org/pod/local::lib).

#### Best practices

You should almost always install to a locallib rather than the system directory.

