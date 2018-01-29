#### Simple class definitions

Class definitions (aka "packages" or "modules") go in files with the suffix <code>.pm</code> (Perl Module):

    $ mkdir lib
    $ vi lib/Godzilla.pm

The code:

    package Godzilla;
    use Moo;

    sub breath_fire { ... }
    sub move_to     { ... }

    sub attack {
        my ($self, $where, $when) = @_;
        $self->wait_until($when);
        $self->move_to($where);
        $self->breath_fire();
    }

    1;

#### Creating objects

In `godzilla.pl`:

    use Godzilla;
    my $godzilla = Godzilla->new(@args);
    $godzilla->attack("Tokyo", "later");

Run the code:

    perl -Ilib godzilla.pl

#### Object destruction

Once an object goes out of scope it is destroyed.  If you need to do any
cleanup in a Moo object put that logic into a method called `DEMOLISH()`.

    sub DEMOLISH {
        my ($self) = @_;
        $self->dbh->disconnect;
    }

