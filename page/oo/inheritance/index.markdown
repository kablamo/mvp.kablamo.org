# Inheritance

#### Class definitions

Parent class:

    package Dinosaur;
    use Moo;
    
    has eyes            => (is => 'ro', default => sub { 2 });
    has big_sharp_teeth => (is => 'ro', default => sub { 120 });

    1;

Child class:

    package Stegosaurus;
    use Moo;
    extends 'Dinosaur';

    has tail_with_spikes => (is => 'ro', default => sub { 1 });

    # override the default from the parent
    has '+big_sharp_teeth' => (default => sub { 0 });
    
    1;

#### Resulting object

    use Stegosaurus;
    my $steg = Stegosaurus->new();
    $steg->eyes;              # has 2 eyes
    $steg->tail_with_spikes;  # has a tail with spikes
    $steg->big_sharp_teeth;   # has 0 big sharp teeth
