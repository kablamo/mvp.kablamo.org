#### If statements

Comparing numbers:

    if ($eyeballs >= 2) {
        print "its an alien\n";
    }
    elsif ($eyeballs == 2) {
        print "its human\n";
    }
    else {
        print "its a rock\n";
    }

Comparing strings requires different operaters:

    if ($location eq 'rodeo') {       # if equal
        print "yipikiyiyay\n";
    }
    elsif ($location ne 'bedroom') {  # if not equal
        print "yawn\n";
    }
    else {
        print "I am in the bedroom\n";
    }


#### Postfix conditionals

These allow you to write code that reads more like natural language:

    print "hello" if $your_name eq 'Barry';
    print "hello" unless the_person_looks_scary();


#### Ternary operator

    my $english = $chicken_count == 1
        ? "1 chicken";
        : $chicken_count . " chickens";
