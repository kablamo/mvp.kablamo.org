# File IO with builtin functions

Perl provides many builtin functions for dealing with files.  Use of these
built in functions is fairly common so its worth learning how they work.  

<div class="tip">
    <div class="tip-title">Alternative<br>Solution</div>
    <div class="tip-content" style="margin-left:6rem">
        Higher level modules like Path::Tiny and IO::All offer more safety
        and convenience in most situations.
        See <a href="/essentials/path-tiny/">File IO with Path::Tiny</a>
        (article available next week).
    </div>
</div>

# `open($filehandle, $mode, $filename)`

Example usage:   

    open(my $filehandle, "<", "data.txt")
        or die "Can't open data.txt for reading: $!";

Valid modes include:

- `<` create a filehandle with read access
- `>` creaet a filehandle with write access
- `+<` create a filehandle with read/write access
- `>>` create a filehandle with append access

`open()` has a ton of functionality and can be used in very complicated ways
but its rarely something you would want to do.  See the official docs for
[open()](https://perldoc.perl.org/functions/open.html) for more info.

`$!`contains the system error string corresponding to the C `errno` variable.
Many C library calls set `errno` on failure.  See the official docs for more:
[$!](https://perldoc.perl.org/perlvar.html#Error-Variables).

# `print($filehandle, @list)`

Example usage:   

    # Write to a file
    print $filehandle "I eat danger for breakfast!\n";

    # Write to stdout
    print "I eat danger for breakfast!\n";
    print STDOUT "I eat danger for breakfast, "\n"; # same as above

Perl makes the filehandles STDOUT, STDERR, and STDIN globally available.  Note
the syntax for these identifiers are a special case and don't use sigils.
(Sigils are the symbol in front of a variable name, such as $ , @ , and %.)

# `close($filehandle)`

Often you won't see developers closing filehandles explicitly.  This is
because a filehandle variable that goes out of scope is garbage collected and
closed automatically.  However this mechanism doesn't do any error checking.  

Example usage: 

    close($filehandle)
       || warn "close failed: $!";


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
filename or filehandle.

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

Example:

    # print files which exist and are plain files
    # ignore everything else (directories, sockets, etc)
    for my $path (@paths) {
        next unless -e $path;  # ignore files that don't exist
        next unless -f $path;  # ignore specials
        print $path, "\n";
    }


The above list of operators is quoted from the official Perl docs for [file
test operators](https://perldoc.perl.org/functions/-X.html).  The docs also
describe some more exotic details of these operators, but you probably don't
need to know about them.
