# Web Frameworks

#### Mojolicious

Rating: *Shiny*

- Async
- Easy to use
- A nice DSL
- Clean code
- A large ecosystem
- Annual developer conferences
- Excellent documentation
- No dependencies to manage

Mojolicious was written and maintained by Sebastian Riedel who is also the
creator of Catalyst.  Mojolicious is not afraid to deprecate features or
functions.  This allows it to deliver carefully maintained api, tools, and code
that make sense and are unencumbered by weird legacy decisions.

MetaCPAN stats:

- MetaCPAN ++ rating: 354
- Last release: 2018
- [Change log](https://metacpan.org/changes/distribution/Mojolicious)
- [Documenation](https://metacpan.org/pod/Mojolicious)

#### Dancer2

Rating: *Solid and lightweight*  

- A focus on simplicity and ease of use
- A nice DSL
- Built with Moo

Dancer was originally a clone of Ruby's Sinatra web framework.  Over time, it
has evolved into its own thing.  Dancer was built with its own home grown
object system.  Dancer2 is a rewrite which fixes some important problems and is
written with Moo.  

#### Catalyst

Rating: *Venerable*

- A serious, stable, respected, solid solution to building a website
- A large ecosystem of plugins
- A focus on backwords cmpatibility
- Built with Moose

Catalyst has been around longer than most frameworks which means it has a large
ecosystem of plugins.  

Backwards compatibility is a key value.  Thats great if you want your web app
to work without changes 10 years later.  It also means it has more legacy code
and legacy issues than frameworks who don't value backwards compatibility as
much.

#### Plack

Rating: *Awesome but not a web framework*

#### CGI.pm

Rating: *Do not use*  

This is an old library which was created in 1995 and was extremely popular
around 2000.  For a while it was part of the Perl core.  It was a good idea at
the time.  It's not a good idea, 18+ years later, to use this to create new
applications.

[CGI](https://metacpan.org/pod/distribution/CGI/lib/CGI.pod)

- Last updated: 2017
- Metacpan ++ rating: 30
- [Change log](https://metacpan.org/changes/distribution/CGI)
- [Issues](https://github.com/leejo/CGI.pm/issues)
