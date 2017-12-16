# Files

To do file io using core Perl use the 
[`open()`](https://perldoc.perl.org/functions/open.html) and [`close()`](https://perldoc.perl.org/functions/close.html) functions.  
Another common solution which is simpler, less quirky, and object oriented is to use
[Path::Tiny](https://metacpan.org/pod/Path::Tiny).


#### Creating Path::Tiny objects

    use Path::Tiny;

    my $dir  = path("/tmp");
    my $file = path("foo.txt");

#### Navigating the filesystem

    my $subdir = $dir->child("foo");
    my $file   = $subdir->child("bar.txt");

    # Reading directories

    for ( $dir->children ) { ... }

    my $iter = $dir->iterator;
    while ( my $next = $iter->() ) { ... }

#### Reading files

    my $file = path("./foo.txt");

    # Read the entire file into a string
    my $contents = $file->slurp; 
    my $contents = $file->slurp_utf8;

    # Each line of the file is an item in the array
    my @lines = $file->lines; 
    my @lines = $file->lines_utf8;

    my ($head) = $file->lines( {count => 1} );
    my ($tail) = $file->lines( {count => -1} );

#### Writing files

    my $file = path("./foo.txt");
    $file->spew( @data );
    $file->spew_utf8( @data );

#### Stringifies as cleaned up path

    my $foo_file = path("./foo.txt");
    print $foo_file; # "foo.txt"


#### For more info
Thats just an introduction.  There is more.  See the 
[documentation](https://metacpan.org/pod/Path::Tiny) for details.    
