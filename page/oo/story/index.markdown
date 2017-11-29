# The (weird) story of Perl OO

Perl OO is difficult to grok for outsiders because the syntax and keywords are
unfortunately not the standard ones that all the other languages use.  However
the concepts are the same and all the same functionality (and more) is there.

#### Native Perl OO
Native Perl OO is solid but strange.  Essentially OO in the Perl core is
unfinished -- it has great fundamentals but lacks any sort of sugary syntax for
developers.  For various reasons native Perl OO has been stuck in this limbo
for years (and still is) although there have been and continue to be many
attempts to finish and polish it.

#### Modern Perl
However the Perl language is so flexible you can essentially define your
own keywords in a library.  Several groups of developers used this
flexibility to create a (somewhat) more normal OO sugar syntax on top of Perl's
native OO fundamentals which make it much easier to use the power thats there.  
These new libraries created a sort of rebirth in Perl as OO was now much
easier and had all the modern features you could find in other languages.  This
rebirth is commonly referred to as "Modern Perl".

#### Moo vs Moose
There are many OO systems (libraries) and there are new ones all the time.  But
over the years community consensus has landed on
[Moo](https://metacpan.org/pod/Moo) and [Moose](https://metacpan.org/pod/Moose)
libraries.  

Both libraries provide all the modern OO techniques you are
accustomed to in your other favorite languages (albeit with some quirky Perlish
syntax).  I'm over simplifying but to keep things concise I'll say that

1. Moo is essentially a subset of Moose and 
2. The main difference is that Moose provides introspection. 

#### Blah bladdy blah what are we going to learn here?
I am going to teach you Moo.
