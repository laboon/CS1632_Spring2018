# CS 1632 - Software Quality Assurance

## Exercise 4

For this assignment, you and a partner will write a systems-level, automated black-box tests for a Ruby compilation visualizer using the Selenium IDE.  You should substantially test the arithmetic functionality for the entire project.

The Ruby compilation visualizer, Hoodpopper, is located here: http://lit-bayou-7912.herokuapp.com/

This is a Rails application written by me for Ruby compilation analysis so that I could improve performance in a Ruby app.  The code is located here: https://github.com/laboon/hoodpopper The tests you write can be black-box tests; you should not need to look at this code unless you're interested.  If you'd prefer to do some grey-box testing, feel free to check out the code, but once again, it is not necessary.

There should be a bare minimum of eight tests, checking various base, edge, and corner cases.  There is a maximum of twenty-five tests.  However, do not focus on the number of tests too heavily; I am more concerned that you cover a broad variety of cases, and ones which are focuses and still likely to find defects.

## Ruby Basics

Ruby is a dynamic, reflective, object-oriented language.  It is heavily used in web applications (mostly via the Rails, and to a lesser extent, Sinatra frameworks).

You may focus only on basic arithmetic (+, -, *, /), variables, and printing for this assignment, e.g.:

Settings variables...

```ruby
a = 10
```

Basic arithmetic operations and precedence...

```ruby
a = 5
b = 6
c = a + (b * 4)
```

Console output...

```ruby
the_best_cat = "Noogie Cat"
puts "The best cat is: #{the_best_cat}"
```


Now, for some compiler theory.  If you have taken compilers, this is a very brief, hand-wavy and possibly less-than-accurate introduction.  If you would like to go more into detail, you can take CS1622 Compiler Design.  Compiling a Ruby program consists of three stages: tokenization, parsing, and actually compiling to bytecode.  First, the tokenizer goes through and separates the code you have written into tokens, e.g., "public", space, "static", space, etc.  The parser puts this into an abstract syntax tree (AST) - just think of it as a regular tree with the structure of your program.  Finally, the compiler goes through the AST and writes the actual machine-level instructions to an executable.  This is how your Java code become JVM bytecode, or your C code becomes x86 instructions.  In this case, we will construct bytecode for the YARV (_Yet Another Ruby VM_, Ruby's default virtual machine).

I do not expect you to understand the entire compilation process, or to memorize all of the operations.  Understanding the following should be enough to write sufficient tests for this assignment.

_Tokenization_: Know that any spaces should show up as `:on_sp`.  Identifiers for functions such as `puts` should show up as `:on_ident`.  Variables such as `a` are also identifiers.  Newlines should show up as `:on_nl`.  Operators such as `+` and `*` are identified with `:on_op`.

_Parsing_: Any non-whitespace (e.g. `:op_nl` or `:on_sp`) tokens (such as `+`, `-`, or `puts`) which appear when being tokenized should also appear in the AST (parse tree).  Whitespace tokens should not appear in the AST.

_Compiling_: Any program that contains `puts` should also have the `putstring` YARV operation.  A program which contains `+` should call the opt_plus operation, plus put any of the values specified on the stack using the `putobject` operation.  Any program which contains `-` (subtraction) should contain the `opt_minus` operation, any program with `/`(division) should contain `opt_div`, any program with `*` should contain `opt_mult`.

Based on these and any other issues or expected behavior you may discover, you should write approximately eight test cases and save them.

## Grading

This is an exercise and thus not graded.  Please feel free to speak to or email me to discuss any problems that you have. 
 
