---
title: The Perl REPL
---

# The Perl REPL

#### One liners with Perl
    $ perl -E 'say "hello"'
    hello

#### Interactive session with Reply
    $ reply
    0> 1 + 1
    $res[0] = 2
    1> say "hello";
    hello
    $res[1] = 1
    2> use URI;
    3> URI->new("https://duckduckgo.com");
    $res[2] = bless( do{\(my $o = 'https://duckduckgo.com')}, 'URI::https' )

#### Suggested configuration for Reply
Create the file $HOME/.replyrc

    script_line1 = use strict
    script_line2 = use warnings
    script_line3 = use 5.016003
    
    [Interrupt]
    [FancyPrompt]
    [DataDumper]
    [Colors]
    [ReadLine]
    [Hints]
    [Packages]
    [LexicalPersistence]
    [LoadClass]
    [ResultCache]
    [Autocomplete::Packages]
    [Autocomplete::Lexicals]
