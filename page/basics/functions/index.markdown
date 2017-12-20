# Functions

Functions are also known as "subroutines" -- hence the keyword
<code>sub</code>.  A simple example:

    sub rawr {
        print "RAWR!";
    }
    
    rawr();


#### Passing parameters

How to pass parameters to a function

    sub rawr {
        my ($dinosaur, $how) = @_;
        print "$dinosaur says RAWR $how\n";
    }
    
    rawr("Stegasaurus", "loudly");

How to pass named parameters to a function

    sub rawr {
        my (%params) = @_;
        print "$params{dinosaur} says RAWR $params{how}\n";
    }
    
    rawr(
        dinosaur => "Stegasaurus", 
        how      => "loudly"
    );

#### Returning values

How to return a single value

    sub get_cookie_flavor {
        return "chocolate chip";
    }

    my $flavor = get_cookie_flavor();

How to return multiple values

    sub get_available_flavors {
        return ("chocolate chip", "oatmeal raisin", "peanut butter");
    }

    my @flavors = get_available_flavors();


