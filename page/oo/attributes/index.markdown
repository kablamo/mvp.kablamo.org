#### Read Only vs Read/Write attributes

A simple class with attributes:

    package Alien;
    use Moo;

    has eyes      => (is => 'rw'); # read/write
    has nostrils  => (is => 'ro'); # read only

    1;

Using the class:

    my $alien = Alien->new( nostrils => 20 );
    $alien->eyes(10);     # succeeds
    $alien->nostrils(10); # dies
          

#### Default vs builders

    package Alien;
    use Moo;

    has eyes     => (is => 'ro', default => sub { 5 });
    has nostrils => (is => 'ro', builder => '_build_nostrils');

    # Perlism: methods that start with _ are private
    sub _build_nostrils { 5 }

Best practices:

- Use `default` for very simple defaults
- Use `builder` for everything else
- Builders can be overridden and method modified
- Roles can require builders
- Builders should be private


#### Lazy attributes

Normal attributes are initialized during object construction.  Lazy attributes
are not initialized until the attribute is used.

    has tentacles => (is => 'ro', lazy => 1, builder => '_build_tentacles');

Best practices:

- Lazy attributes are the best - use them as often as you can
- Lazy attributes are good because defaults are generated during object construction which slows down object construction
- The user might not need that attribute so why waste time setting a default

#### Attribute initialization order is unpredictable

Because the order in which attributes are initialized is random, using
`default` can cause bugs.  In this example if `tentacle_count` is initialized
after `tentacles` the builder will throw an exception because
`$self->tentacle_count` is undefined:

    package Alien;
    use Moo;
    use Tentacle;

    has tentacle_count => (is => 'ro', default => sub { 5 }); # <---- BUG
    has tentacles      => (is => 'ro', builder => '_build_tentacles');

    sub _build_tentacles { 
        my $self = shift;
        my @tentacles;

        push @tentacles, Tentacle->new() for (1..$self->tentacle_count);

        return \@tentacles;
    }


The solution is to use lazy attributes.  Here is the same code with the bug
fixed:

    package Alien;
    use Moo;
    use Tentacle;

    has tentacles      => (is => 'lazy'); # <---- BUG FIXED
    has tentacle_count => (is => 'ro', default => sub { 5 });

    sub _build_tentacles { 
        my $self = shift;
        my @tentacles;

        push @tentacles, Tentacle->new() for (1..$self->tentacle_count);

        return \@tentacles;
    }

