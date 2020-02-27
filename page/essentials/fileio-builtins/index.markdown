# File IO with open() and close()

Perl provides many built in functions for dealing with files.  They are commonly
used so it's worth learning how they work.  

If built in functions are your weapon of choice, you will also want to know
which CPAN module to use when things get more complicated (File::Spec,
File::Temp, File::Copy, etc).  Check out the Recommended Modules chapter to see
the list of [recommended modules for working with
files](http://localhost:3000/cpan/files/).

<div class="tip">
    <div class="tip-title">Alternative<br>Solution</div>
    <div class="tip-content" style="margin-left:6rem">
        Higher level modules like Path::Tiny and IO::All offer more
        safety, nicer syntax, and more over all convenience.  Developers visiting
        from other languages will likely be more comfortable using one of these
        modules.  See <a href="/essentials/path-tiny/">File IO with Path::Tiny</a>
        (article available next week).
    </div>
</div>

# Opening files

To open a file, call `open()`.  This will associate the file with a filehandle.
The filehandle can be used to manipulate the file.  `open()` returns false on
failure so don't forget to check for errors.  The error message can be found in
the special global variable `$!`.

    open(my $filehandle, $mode, $path)
        or die "Can't open $path: $!";

    open(my $filehandle, "<", "/path/to/data.txt")
        or die "Can't open data.txt for reading: $!";

The mode indicates what level of access the filehandle will have.  When you see
mode values, think: unix shell redirection operators.  Valid modes include:

- `<` read access
- `>` write access
- `+<` read/write access
- `>>` append access

See also in the official docs: [opentut](https://perldoc.perl.org/perlopentut.html), 
[open()](https://perldoc.perl.org/functions/open.html) and
[$!](https://perldoc.perl.org/perlvar.html#Error-Variables).

# Writing to files

    # Write to a filehandle
    open(my $filehandle, '>', $path) or die "Can't open $path: $!";
    print $filehandle "I eat danger for breakfast!\n";

    # Write to stdout
    print "I eat danger for breakfast!\n";
    print STDOUT "I eat danger for breakfast, "\n"; # same as above


For your convenience, Perl sets up some special filehandles that are already
open when your program starts: STDOUT, STDERR, and STDIN.  

Notice there is some unusual syntax happening:

1. There is no comma after the filehandle.  
2. The special filehandles STDOUT, STDERR, and STDIN don't use [sigils](https://perldoc.perl.org/perlglossary.html#S) (the `$`)
at the beginning of the identifier.


# Closing files

    close($filehandle)
       || warn "close failed: $!";

Often you won't see developers closing filehandles explicitly.  This is
because a filehandle variable that goes out of scope is garbage collected and
closed automatically.  However this mechanism doesn't do any error checking.  


# Example 1: Read the whole file into memory

    # Open the file read-only
    open(my $filehandle, "<", "data.txt")
        or die "Can't open data.txt for reading: $!";

    # Read the whole file into an array
    my @lines = <$filehandle>; 

    # Print the whole file to STDOUT
    print @lines;

    close($filehandle);

# Example 2: Process a file line by line

    # Open the file read-only
    open(my $filehandle, "<", "data.txt")
        or die "Can't open data.txt for reading: $!";

    # Read the file line by line
    while (my $line = <$filehandle>) {
        chomp $line; # remove newline characater
        # Print each line to STDOUT
        print $line, "\n";
    }

    close($filehandle);

# File test operators

File tests operators test a file for some condition (eg does the file exist?)
and return true or false.  The operators take a single argument which is a
path or filehandle.

    -r  File is readable by effective uid/gid.
    -w  File is writable by effective uid/gid.
    -x  File is executable by effective uid/gid.
    -o  File is owned by effective uid.

    -R  File is readable by real uid/gid.
    -W  File is writable by real uid/gid.
    -X  File is executable by real uid/gid.
    -O  File is owned by real uid.

    -e  File exists.
    -z  File has zero size (is empty).
    -s  File has nonzero size (returns size in bytes).

    -f  File is a plain file.
    -d  File is a directory.
    -l  File is a symbolic link (false if symlinks aren't
        supported by the file system).
    -p  File is a named pipe (FIFO), or Filehandle is a pipe.
    -S  File is a socket.
    -b  File is a block special file.
    -c  File is a character special file.
    -t  Filehandle is opened to a tty.

    -u  File has setuid bit set.
    -g  File has setgid bit set.
    -k  File has sticky bit set.

    -T  File is an ASCII or UTF-8 text file (heuristic guess).
    -B  File is a "binary" file (opposite of -T).

    -M  Script start time minus file modification time, in days.
    -A  Same for access time.
    -C  Same for inode change time (Unix, may differ for other
        platforms)

The list of operators above is quoted from the official Perl docs for [file
test operators](https://perldoc.perl.org/functions/-X.html).  The docs also
describe some more exotic details of these operators, but you probably don't
need to know about them.

Example:

    # print files which exist and are plain files
    # ignore everything else (directories, sockets, etc)
    for my $path (@paths) {
        next unless -e $path;  # ignore files that don't exist
        next unless -f $path;  # ignore specials
        print $path, "\n";
    }

