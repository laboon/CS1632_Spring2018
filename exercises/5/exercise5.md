# CS 1632 - Software Quality Assurance

## Exercise 5

For this assignment, you and a partner will use three static analysis tools (rubocop, reek, and simplecov) to clean up the `graph.rb` sample code.  Note that you do NOT need to clean up any of the other Ruby files in this directory such as `node.rb`.

## Before you begin...

Please make sure to do a `bundle install` in this directory to ensure that minitest, rubocop, reek, and simplecov are installed.  Note that rubocop may take a while to be installed.

While running Rubocop and Reek, you may be warned of some odd violations which you do not understand.  Please look at the `Notes` section of each to double-check if your question is answered there.

## Tool 1 - Rubocop

Rubocop is a linter which looks for style violations according to the Ruby Style Guide by Bozhidar Batsov ( https://github.com/bbatsov/ruby-style-guide ) which acts as a kind of unofficial guide to how Ruby _should_ be written.

By running `rubocop filename.rb`, you will be able to see a list of all violations of the Ruby Style Guide.  These should all be fixed before moving on the the next step.

### Notes

1. Rubocop may ask you to use the &:method_name shortcut.  This is a very cool Ruby shortcut but I did not teach you it.  The change is pretty self-explanatory but to understand what it is asking you, please see this page: https://stackoverflow.com/questions/1961030/ruby-ampersand-colon-shortcut
2. You may not be able to see trailing whitespace in your editor - rubocop knows that it is there, though!  

## Tool 2 - Reek

Reek looks for code smells - places where the code may not be wrong _per se_ but where issues might be lurking, or where the code is unclear.

By running `reek filename.rb`, you will be able to see a list of code smells.  These should all be fixed before moving on to the next step.

### Notes

1. The following error message may seem strange: `Graph#add_node refers to 'node' more than self`.  This should go away if you fix the other code smells.  You should NOT add it to a different class.

## Tool 3 - Simplecov

Simplecov will let you know where your tests are not testing by performing a code coverage analysis - specifically, statement coverage (remember that

First, open the `graph_test.rb` file and note the top few lines which start `simplecov`.  These lines are necessary for using simplecov.

Make sure that you change any code here that is necessary after making the `rubocop` and `reek` changes!

Now, run the graph_test minitest test suites as you normally would.  That is, just type `ruby graph_test.rb`.  All tests should pass.  There will be an additional final line at the bottom of the run, however, which should look similar to this:

```
Coverage report generated for MiniTest to /Users/laboon/pitt/CS1632_Spring2018/exercises/5/coverage. 28 / 40 LOC (70.0%) covered.
```

This lets us know that only 70% (28 out of 40 lines of code) of all the files tested by graph_test.rb have actually been executed by the test suite.  Note that ths includes both `graph.rb` *and* `node.rb`.  We are only concerned with `graph.rb`.  In order to find out which lines and which files we will need to add tests for, we need to look at the coverage report.

Go the `./coverage` subdirectory and open the `index.html` file.  You may do this with `open index.html` with OS X or navigate to it using your favorite web browser (via Open File).  This file will be refreshed with subsequent runs so that you can just refresh that page.

You can see that `node.rb` and `graph.rb` have different coverage ratios.  Click on the magnifying glass icon next to `graph.rb` to see which particular lines are never called.

Add additional unit tests to ensure that you have gotten code coverage _in graph.rb_ up to 100%.

## Notes

1. When testing output, remember about carriage returns (\n)s.
2. A pseudograph is defined as a graph where at least one node links to itself.  This should be easy to do using stubbing.
3. Note that you need to get 100% coverage ONLY in `graph.rb`.
4. Note that you may need to stub multiple methods in a single test case!  Verify which ones you need by reviewing the code.
5. You should ONLY be doubling node objects and stubbing node methods.  Do not stub any `graph` methods or double `graph` itself, as `graph` is the class under test.

## Grading

This is an exercise and thus not graded.  Please feel free to speak to or email me to discuss any problems that you have. 
 
