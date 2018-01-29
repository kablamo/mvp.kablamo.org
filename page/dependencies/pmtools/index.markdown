
The best way to find out what version of a module is installed and where is to
use [pmtools](https://metacpan.org/pod/pmtools).

#### How do I Install pmtools?

    cpanm pmtools

#### What version of that module is installed?

    $ pmvers Moo
    2.003002

#### Where is that module installed?

    $ pmpath Moo
    /opt/perlbrew/libs/perl-5.26.0@mylib/lib/perl5/Moo.pm

#### I don't want to install pmtools

To find the version number:

    $ perl -e 'use Moo 99999'
    Moo version 9999 required--this is only version 2.003003 at -e line 1.
    BEGIN failed--compilation aborted at -e line 1.

To find the location:

    $ perldoc -l Moo
    /home/eric/.anyenv/envs/plenv/versions/5.26.1/lib/perl5/site_perl/5.26.1/Moo.pm
