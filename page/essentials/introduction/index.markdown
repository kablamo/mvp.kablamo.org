This chapter is about built in functions.  Sort of.  

Perl has many built in functions and I wanted to make this chapter all about
how to use them.  However in some situations there are modules on MetaCPAN
which are a better choice because they provide a better user interface or make
it harder to poke yourself in the eye.  

So while a large part of this chapter is dedicated to the most
commonly used built in functions, a significant portion is dedicated to
MetaCPAN modules which improve on the basic functionality.

# Advantages of built in functions

Perl provides many builtin functions.  They are powerful, fast, concise, and
are mostly backwards compatible.  Also you don't need to choose, install, and
manage a module from MetaCPAN.  Use of built in functions is widespread so it's
almost always worth learning how they work.


# Disadvantages of some built in functions

Perl syntax is heavily influenced by C and shell languages (among others). 
Built in functions occasionally expose the underlying implementation.
If you are comfortable with C and shell this might be fine.  Here are some
examples:

1. **Built in functions don't throw exceptions.**  Developers need
to remember to check for errors.
2. **Special variables.**  Sometimes errors are reported via mysteriously named
global variables like `$!`, `$?`, `$@`, or `$^E`.
3. **User interface quirks**.  For example `stat()` returns a list of
13 different attributes like uid, size, and ctime which describe a file's
state.  Getting the attribute you need requires memorizing the array index or
looking at the docs.

# Alternatives

Again, depending on your preferences and your project, this might be fine.
However, for many, it's preferable and arguably easier and safer to use more
modern or higher level mechanisms.  If that's you, consider some of the
alternatives on MetaCPAN which solve these problems.  In this chapter I'll
go over your options so you can choose the solution that's right for you.

# Documentation
By the way, the official documentation for all Perl built in functions is
available here:

- [Functions A-Z](https://perldoc.perl.org/index-functions.html)
- [Functions by category](https://perldoc.perl.org/index-functions-by-cat.html)
