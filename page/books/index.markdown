---
data:
  books:
    - title: Modern Perl
      published: 2016
      description: Modern Perl is arguably the most current Perl book and is written by Chromatic, an active member of the community.
      img: /images/modernperl.jpg
      amazon: 'https://www.amazon.com/gp/product/1680500880/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=1680500880&linkCode=as2&tag=kablamo-20&linkId=5f19d40e8ef0b4d3bebb5f81994e2bb8'
      free: 'http://modernperlbooks.com/books/modern_perl_2016/index.html'
    - title: Learning Perl
      published: 2016
      description: Also known as the Llama book, Learning Perl teaches basic Perl concepts.  
      topics:
        - Perl data and variable types
        - Subroutines
        - File operations
        - Regular expressions
        - String manipulation (including Unicode)
        - Lists and sorting
        - Process management
        - Smart matching
        - Use of third party modules
      img: /images/learning-perl-7th.jpg
      amazon: 'https://www.amazon.com/gp/product/1491954329/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=1491954329&linkCode=as2&tag=kablamo-20&linkId=a8be12c69572be50bd6d56f6a0547961'
    - title: Mastering Perl
      published: 2014
      description: Also known as the Alpaca book, this book starts where Intermediate Perl ends.
      topics:
        - Explore advanced regular expressions features
        - Avoid common problems when writing secure programs
        - Profile and benchmark Perl programs to see where they need work
        - Wrangle Perl code to make it more presentable and readable
        - Understand how Perl keeps track of package variables
        - Define subroutines on the fly
        - Jury-rig modules to fix code without editing the original source
        - Use bit operations and bit vectors to store large data efficiently
        - Learn how to detect errors that Perl doesn’t report
        - Dive into logging, data persistence, and the magic of tied variables
      img: /images/mastering-perl.gif
      no-border: 1
      amazon: 'https://www.amazon.com/gp/product/144939311X/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=144939311X&linkCode=as2&tag=kablamo-20&linkId=23530cc63259eb61e8a930874b5c6650'
    - title: Programming Perl
      published: 2012
      description: Also known as the Camel Book, this is a widely respected reference book written by the creator of Perl, Larry Wall.  The latest edition covers Perl 5.14.
      img: /images/programming-perl.gif
      amazon: 'https://www.amazon.com/gp/product/0596004923/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=0596004923&linkCode=as2&tag=kablamo-20&linkId=bb4582a7afa9130cf6176f072ed216d1'
    - title: Intermediate Perl
      published: 2012
      description: Also known as the Alpaca book, this book starts where Learning Perl ends.
      topics:
        - Packages and namespaces
        - References and scoping, including regular expression references
        - Manipulating complex data structures
        - Object-oriented programming
        - Writing and using modules
        - Testing Perl code
        - Contributing to CPAN
      img: /images/intermediate-perl.gif
      no-border: 1
      amazon: 'https://www.amazon.com/gp/product/1449393098/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=1449393098&linkCode=as2&tag=kablamo-20&linkId=12f2fe7c892c2f5d464eb2810d1733aa'
    - title: Beginning Perl
      published: 2012
      description: An introduction to Perl for new and experienced programmers written by Ovid, an active member of the Perl community.
      img: /images/beginning-perl.jpg
      no-border: 1
      amazon: 'https://www.amazon.com/gp/product/1118013840/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=1118013840&linkCode=as2&tag=kablamo-20&linkId=9433fc47b5918191876c98c08facb86c'
    - title: Regular Expressions Cookbook
      published: 2012
      description: This book covers regular expressions in C#, Java, JavaScript, Perl, PHP, Python, Ruby, and VB.NET.
      img: /images/regexps-cookbook.gif
      no-border: 1
      amazon: 'https://www.amazon.com/gp/product/1449319432/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=1449319432&linkCode=as2&tag=kablamo-20&linkId=fcbbffcf6d77fc1a03b42a2edd03465b'
    - title: Perl Pocket Reference
      published: 2011
      no-border: 1
      description: A quick reference which includes summaries of Perl syntax, operators, and core functions for Perl 5.14.
      img: /images/perl-pocket-reference.gif
      amazon: 'https://www.amazon.com/gp/product/1449303706/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=1449303706&linkCode=as2&tag=kablamo-20&linkId=6909fba99244deac34b8c2c22782e2df'
    - title: Working Effectively With Legacy Code
      published: 2005
      description: Not a Perl book, but its a good book.  This book was published in 2005 but I'd argue its timeless.
      img: /images/legacy-code.jpg
      amazon: 'https://www.amazon.com/gp/product/0131177052/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=0131177052&linkCode=as2&tag=kablamo-20&linkId=667d392b057a70629d98c65523ca91ba'

---
# Perl Books

If you swallowed the red pill and want to go deeper, or if you learn
better with a cherished physical object that you can lovingly (maniacally?)
caress and display on your bookshelf, you may want to read a Perl book.  

Here is a curated list of recommended Perl books.  This list only includes
books published after 2010.  The list is ordered by the publishing date of the
most recent edition.
<br>
<br>
<br>

% for my $book (@{ $page->data->{books} }) {
<div class="perl-book">
    <div class="perl-book-left">
        <a href="<%= $book->{amazon} %>"><img class="perl-book-img <%= "no-border" if $book->{"no-border"} %>" src="<%= $book->{img} %>"></a>
    </div>
    <div class="perl-book-right">
        <a href="<%= $book->{amazon} %>"><h4 class="perl-book-title"><%= $book->{title} %></h4></a>
        <b>Published <%= $book->{published} %></b>
        <p>
            <%= $book->{description} %>
        % if ($book->{topics}) {
            Topics include:   
        %}
        </p>
        % if ($book->{topics}) {
            <ul>
            % for my $topic (@{ $book->{topics} }) {
                <li><%= $topic %></li>
            %}
            </ul>
        %}

        <p>
        % if ($book->{free}) {
        <a href="<%= $book->{free} %>">Free version</a> &nbsp;&nbsp;
        % }
        </p>
    </div>
</div>
% }
