# Variables

Perl variables come in 3 flavors.

#### Scalars
A scalar is a single value: a number, a string, or a reference.  Scalars
variables always start with a <code>$</code>.  For example:

    my $foo = 'dinosaur';

#### Arrays
A array is an ordered set of scalar values.  Array variables always start with
an `@`.  Note however that a variable representing a single array element uses
a `$` because its a single (scalar) value.  For example:

    my @foo = (1, 2, 3, 'cowboy');
    print $foo[1]; # prints 2


#### Hashes
A hash is an unordered collection of key/value pairs.  Hash variables always
start with a `%`.  Note however that a variable representing a single hash
value or hash key uses a `$` because its a single (scalar) value.  For example:

    my %foo = (a => 1, "b" => 2, 'c' => 'batman');
    print $foo{c}; # prints 'batman'
