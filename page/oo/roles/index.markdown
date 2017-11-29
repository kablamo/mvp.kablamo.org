# Roles 

#### What are roles?

Perl roles are similar to Java interfaces or Ruby mixins.  Roles add behavior
and/or state to a class.  They can have attributes and methods and can do
other roles.

#### Example

A role:

    package Searchable;
    use Moo::Role;

    # state
    has 'number_of_results' => (is => 'ro', default => sub { 5 }); 

    # behavior
    sub search { ... }

A class that consumes Searchable role.

    package Thing;
    use Moo;
    with qw/Searchable/;

Using the object:

    my $thing = Thing->new();
    $thing->search();


#### Terminology

- Classes *do* or *consume* roles
- Roles are *composed* into classes

#### Requires

The `require` keyword requires the class which consumes this role to implement
a method.  If the method does not exist an exception is thrown.

Example role:

    package Searchable;
    use Moo::Role;

    requires 'search_engine';

    sub search { 
        my ($self, $query) = @_;
        my $json = $self->search_engine->search($query);
        return JSON->new->utf8->decode($json);
    }

Example class which consumes the role:

    package Thing;
    use Moo;
    with qw/Searchable/;

    sub search_engine {
        return Bing->new();
    }


#### Zen of roles

- Roles are shareable between unrelated classes
- Roles are what a class does not what a class is
- Roles add functionality, inheritance specializes

#### Suggestions for naming roles

- The names of roles often end in 'able'.  For example:
  - Printable
  - Searchable
- The names of roles often start with 'Has' or 'Is' or 'Can'
  - HasEngine
  - IsFragile
  - CanBreakDance

#### Roles vs Inheritance

- Brontosaurus isa Dinosaur
- Brontosaurus does ForagingForPlants (behavior)
- Other Dinosaurs also do the ForagingForPlants role
- Brontosaurus does HasLongTail (state)

