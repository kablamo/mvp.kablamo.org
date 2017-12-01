# Regular expressions

#### m// (the match operator)

    print "hello" if $string =~ m/cowboys/;
    print "hello" if $string =~  /cowboys/;  # same but shorter
    print "hello" if $string =~  /cowboys/i; # same but case insensitive

Useful tricks to avoid escaping tons of stuff inside regexps:

    print "hello" if $string =~ m|https://|; 
    print "hello" if $string =~ m{https://}; 
    print "hello" if $string =~ m'https://'; 
    # etc
    
    # also:
    print "hello" if $string =~ qq{https://}; 

#### s/// (the substitution operator)

    my $string = "cowboys and aliens";
    $string =~ s/cowboys/martians/;
    print $string; 
    # prints "martians and aliens"

Global substitution

    my $string = "pony pony goose";
    $string =~ s/pony/goose/g;
    print $string; 
    # prints "duck duck goose"

The same tricks for case insensitive matches and avoiding escaping stuff in
regexps apply to `s///` as well.

#### qr// (re-using regexps)

    my $xls_regexp = qr/\.xls$/i;

    for my $filename ( filesnames() ) {
        print "hello" if $filename =~ $xls_regexp;
    }

#### Commenting regexps with the /x modifier

Its useful to comment long complicated regular expressions for clarity.
For example, this:

    $code =~ s|/\*.*?\*/||gs;

is equivalent to this:

      # Delete C comments
      $code =~ s|
          /\*     # Match the opening delimiter
          .*?     # Match a minimal number of characters
          \*/     # Match the closing delimiter
      ||gsx;
    

#### For more info

Check out the offical perl docs for more details on Perl regular expressions: 

- [The official regexp documentation](http://perldoc.perl.org/perlre.html) 
- [Regexp Quote Like Operators](http://perldoc.perl.org/perlop.html#Regexp-Quote-Like-Operators)
