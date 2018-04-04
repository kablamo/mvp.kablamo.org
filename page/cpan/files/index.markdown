#### TABLE OF CONTENTS

<p class="toc_section">High Level Modules</p>

- Path::Tiny
- IO::All

<p class="toc_section">Misc Useful Modules</p>

- Path::Iterator::Rule
- File::chmod
- File::pushd
- File::ReadBackwards

<p class="toc_section">Lower Level Modules</p>

- Cwd
- File::Basename
- File::Copy
- File::Copy::Recursive
- File::MimeInfo
- File::Path
- File::Slurp
- File::Spec
- File::stat
- File::Temp



<br><br><br>
### High Level Modules

These high level modules making working with files and directories easier by
providing convenience and safety in a single unified object oriented interface.
For most situations choosing one of these is probably the best way to go.

#### Path::Tiny

<div class="module">
    <div class="column">MetaCPAN: <a href="https://metacpan.org/pod/Path::Tiny">Path::Tiny</a></div>
    <div class="column">++ rating: 126</div>
    <div class="column">Last update: 2017</div>
    <div class="column">Maintainer: DAGOLDEN</div>
</div>

Path::Tiny is a small fast library with a fairly traditional object oriented
interface for dealing with files and directories.  Its probably the most
popular high level module.

Path::Tiny began life as a minimalist rewrite of the venerable Path::Class
module with a improved user interface.  Over the years its grown in popularity
and has become a mature, full featured library and one of the most common
choices for dealing with files.  These days anyone interested in Path::Class is
probably better served using Path::Tiny.

#### IO::All

<div class="module">
    <div class="column">MetaCPAN: <a href="https://metacpan.org/pod/IO::All">IO::All</a></div>
    <div class="column">++ rating: 58</div>
    <div class="column">Last update: 2017</div>
    <div class="column">Maintainer: FREW</div>
</div>

IO::All is the other library for dealing with files and directories.  It is
also a good solution and nearly as popular as Path::Tiny.

While Path::Tiny aims to be somewhat minimalist and focused, IO::All does
everything.  It does file and directory IO but it also has functionality from
IO::Socket and MLDBM and LWP.  You can use it to create a web server, get files
from ftp sites, or send email.

The user interface is somewhat contraversial.  Depending on your point of view
its powerful, concise, and convenient or makes for hard to read code at times.

Developers visiting Perl from another language are probably going to be more
comfortable with Path::Tiny.




<br><br><br>
### Misc Useful Modules


#### Path::Iterator::Rule

<div class="module">
    <div class="column">MetaCPAN: <a href="https://metacpan.org/pod/Path::Iterator::Rule">Path::Iterator::Rule</a></div>
    <div class="column">++ rating: 64</div>
    <div class="column">Last update: 2018</div>
    <div class="column">Maintainer: DAGOLDEN</div>
</div>

There are many libraries for iterating over files.  But the bottom line is if
you need to walk a directory tree, select some files, and do stuff you should
almost certainly be using Path::Iterator::Rule.  The user interface is fabulous
and the performance is good.

Alternatives include File::Find which is part of core (distributed with Perl).
File::Find has similarly good performance but is a lot less fun to work with
due to its user interface.  For benchmarks and a good description of
some alternatives see this [rjbs
article](https://rjbs.manxome.org/rubric/entry/1981).

#### File::chmod

<div class="module">
    <div class="column">MetaCPAN: <a href="https://metacpan.org/pod/File::chmod">File::chmod</a></div>
    <div class="column">++ rating: 3</div>
    <div class="column">Last update: 2015</div>
    <div class="column">Maintainer: XENO</div>
</div>

The Perl builtin function `chmod()` only accepts octal permissons.  File::chmod
replaces `chmod()` with its own version that accepts octal, symbolic,
or "ls" permissions.

#### File::chdir

<div class="module">
    <div class="column">MetaCPAN: <a href="https://metacpan.org/pod/File::chdir">File::chdir</a></div>
    <div class="column">++ rating: 9</div>
    <div class="column">Last update: 2016</div>
    <div class="column">Maintainer: DAGOLDEN</div>
</div>

The Perl builtin function `chdir()` changes the current working directory
globally.  If any part of your application or and library calls `chdir()`, the
cwd for the entire application changes.  File::chdir provides a mechanism for
changing directory locally.

#### File::pushd

<div class="module">
    <div class="column">MetaCPAN: <a href="https://metacpan.org/pod/File::pushd">File::pushd</a></div>
    <div class="column">++ rating: 9</div>
    <div class="column">Last update: 2016</div>
    <div class="column">Maintainer: DAGOLDEN</div>
</div>

File::pushd provides a way to change directory temporarily for a limited scope.  

#### File::ReadBackwards

<div class="module">
    <div class="column">MetaCPAN: <a href="https://metacpan.org/pod/File::ReadBackwards">File::ReadBackwards</a></div>
    <div class="column">++ rating: 6</div>
    <div class="column">Last update: 2011</div>
    <div class="column">Maintainer: URI</div>
</div>

File::ReadBackwards can read in file contents backwards line by line.




<br><br><br>
### Lower Level Modules

Modules like Path::Tiny and IO::All are built on top of lower level modules
such as these.  None of these provide an object oriented user interface unless
otherwise noted.

#### Cwd

<div class="module">
    <div class="column">MetaCPAN: <a href="https://metacpan.org/pod/Cwd">Cwd</a></div>
    <div class="column">++ rating: 64</div>
    <div class="column">Last update: 2018</div>
    <div class="column">Maintainer: XSAWYERX</div>
</div>

Cwd is a core module (distributed with Perl) which gets the pathname of the
current working directory.

#### File::Basename

<div class="module">
    <div class="column">MetaCPAN: <a href="https://metacpan.org/pod/File::Basename">File::Basename</a></div>
</div>

File::Basename is a core module (distributed with Perl) for parsing paths into
directory, filename, and suffix.

#### File::Copy

<div class="module">
    <div class="column">MetaCPAN: <a href="https://metacpan.org/pod/File::Copy">File::Copy</a></div>
</div>

File::Copy is a core module (distributed with Perl) which provides `copy()` and `move()` functions.

#### File::Copy::Recursive

<div class="module">
    <div class="column">MetaCPAN: <a href="https://metacpan.org/pod/File::Copy::Recursive">File::Copy::Recursive</a></div>
    <div class="column">++ rating: 13</div>
    <div class="column">Last update: 2018</div>
    <div class="column">Maintainer: DMUEY</div>
</div>

File::Copy::Recursive provides methods for copying directories recursively.

#### File::MimeInfo

<div class="module">
    <div class="column">MetaCPAN: <a href="https://metacpan.org/pod/File::MimeInfo">File::MimeInfo</a></div>
    <div class="column">++ rating: 7</div>
    <div class="column">Last update: 2017</div>
    <div class="column">Maintainer: FREW</div>
</div>

File::MimeInfo can determine the mimetype from a given filename.

#### File::Path

<div class="module">
    <div class="column">MetaCPAN: <a href="https://metacpan.org/pod/File::Path">File::Path</a></div>
    <div class="column">++ rating: 38</div>
    <div class="column">Last update: 2017</div>
    <div class="column">Maintainer: JKEENAN</div>
</div>

File::Path can create or remove directory trees.

#### File::Slurp

<div class="module">
    <div class="column">MetaCPAN: <a href="https://metacpan.org/pod/File::Slurp">File::Slurp</a></div>
    <div class="column">++ rating: 62</div>
    <div class="column">Last update: 2011</div>
    <div class="column">Maintainer: URI</div>
</div>

File::Slurp is not recommended.  This was a popular module for a while so
you may see this in older code.  It's abandoned and has critical flaws which
are not fixed -- including issues with unicode.  

#### File::Spec

<div class="module">
    <div class="column">MetaCPAN: <a href="https://metacpan.org/pod/File::Spec">File::Spec</a></div>
    <div class="column">++ rating: 64</div>
    <div class="column">Last update: 2018</div>
    <div class="column">Maintainer: XSAWYERX</div>
</div>

File::Spec is a core module (distributed with Perl) for portably manipulating
filenames.  It's not OO.

#### File::stat

<div class="module">
    <div class="column">MetaCPAN: <a href="https://metacpan.org/pod/File::stat">File::stat</a></div>
    <div class="column">++ rating: 58</div>
    <div class="column">Last update: 2017</div>
    <div class="column">Maintainer: FREW</div>
</div>

Perl's builtin `stat()` function returns a list of 13 file attributes: size,
mode, uid, gid, etc.  All you need to do is remember the order of all those
elements.  File::stat adds sanity by providing an object oriented user
interface to `stat()`.  

#### File::Temp

<div class="module">
    <div class="column">MetaCPAN: <a href="https://metacpan.org/pod/File::Temp">File::Temp</a></div>
    <div class="column">++ rating: 50</div>
    <div class="column">Last update: 2013</div>
    <div class="column">Maintainer: DAGOLDEN</div>
</div>

File::Temp provides an interface for returning the name and handle of a
temporary file safely.  The best part is it automatically cleans up the
temporary file once the variable has gone out of scope.
