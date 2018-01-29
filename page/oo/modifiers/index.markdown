#### before()

Run a coderef *before* calling the method being modified.  Things to note:

1. The coderef receives the same params as the original method.
2. The return value of the coderef is ignored.
3. `before` is good for adding extra validation

Example:

    package Brontosaurus;
    use Moo;
    extends 'Dinosaur';

    before eat => sub {
        my ($self, $food) = @_;

        die "bad params" if $food eq 'meat';
    };


#### after()

Run a coderef *after* calling the method being modified.  Things to note:

1. The coderef receives same params as the original method.
2. The return value of the coderef is ignored.
3. `after` is good for logging/debugging.

Example:

    package Brontosaurus;
    use Moo;
    extends 'Dinosaur';

    after eat => sub {
        my ($self, $food) = @_;

        $self->log->warning("Brontosaurus does not like to eat $food")
            if $food eq 'meat';
    };

#### around()

Run a coderef instead of the method being modified.  Use `around` to:

1. Pass the original method modified parameters.
2. Change the return value of the original method.
3. Avoid calling the original method conditionally.

Example:

    package Brontosaurus;
    extends 'Dinosaur';

    around eat => sub {
        my ($orig, $self, $food) = @_;
        uc $orig->($self, $food);
    };

#### More details

See [https://metacpan.org/pod/Class::Method::Modifiers](https://metacpan.org/pod/Class::Method::Modifiers)
