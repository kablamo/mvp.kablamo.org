# Functions

Basic example:

    sub rawr {
        print "RAWR!";
    }
    
    rawr();

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

Functions are also sometimes called "subroutines" -- hence the keyword <code>sub</code>.

