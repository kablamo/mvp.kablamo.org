This chapter is about built in functions.  Sort of.  

Perl has many built in functions and I wanted to make this chapter all about
how to use them.  However in some situations there are modules on MetaCPAN
which are a better choice because they provide a better user interface or make
it harder to poke yourself in the eye.  

Perl syntax is heavily influenced by C and shell languages (among others) and
built in functions occasionally expose the underlying implementation in some
ways.  Some examples include:

1. **Built in functions don't throw exceptions.**  Developers need
to remember to check for errors .
2. **Special variables.**  Sometimes errors are reported via special
global variables like (`$!`, `$?`, `$@`, or `$^E`).
3. **Other user interface quirks**.  For example `stat()` returns a list of
13 different attributes like uid, size, and ctime which describe a file's state.

Depending on your preferences and your project, this might be fine or you might
want to consider some of the alternatives on MetaCPAN.  So while a large part
of this chapter is dedicated to the most commonly used built in functions, a
significant portion is dedicated to MetaCPAN modules which improve on the
basic functionality.

By the way, the official documentation for all Perl built in functions is
available here:

- [Functions A-Z](https://perldoc.perl.org/index-functions.html)
- [Functions by category](https://perldoc.perl.org/index-functions-by-cat.html)
