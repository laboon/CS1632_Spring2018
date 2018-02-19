# CS 1632 - Software Quality Assurance
Spring Semester 2018  
DUE 19 FEB (Mon/Wed classes) or 20 FEB (Tue/Thu class)    

## Deliverable 2

For this assignment, you (not a group) will write code and unit tests for CitySim9006.

Requirements for this program are in the requirements.txt file in this directory.  Sample output is also provided for several runs of the program.  In case of ambiguity, please see the sample output as an example of what to display and how the system should work.  Note that the sample output shows specific routes for given seeds - you do NOT have to have your seeds create the exact same routes.  They are purely for demonstration purposes.

This program must be written in Ruby and use minitest for the unit tests.

All code and tests should be on GitHub or GitLab in a private repository accessible to me.

## Format
You should turn in a title page with:

* The title "CS 1632 - DELIVERABLE 2: Unit Testing CitySim9006"
* Your name
* Your GitHub username
* The URL of your code and tests on GitHub or GitLab

ENSURE THAT THE THE TA AND I ARE ADDED AS A COLLABORATOR ON GITHUB!  My username is `laboon`.  The TA's username will be emailed to you shortly - for Mon/Wed classes it is `KrithikaGanesh`, for Tue/Thu it is `aky13`.  You will lose an automatic 10 points if either I or the TA cannot access your repository.  

Before turning this assignment in, I HIGHLY recommend you double-check that all of the code that you think is committed is in fact committed by (1) looking at the code on the GitHub web interface and (2) cloning it down to a new directory on your machine and trying to run it from there.

Add a short ( < 1 page ) description of issues you faced when writing this code and tests.  If any tests you wrote fail, they should be included here, along with why you think that they are failing.

After this, ON A SEPARATE PAGE, include a screen shot of the executed unit tests (this usually means a SCREENSHOT of your terminal - do not just copy and paste the results).    If a test doesn't pass, it should be included in the concerns section above.  Ideally, for a perfect grade, all tests should be green (passing).  However, if you have what you think is a valid test and it is not passing, I would prefer that you include a defect report (in the proper template!) rather than just deleting it.  Knowing that a defect exists and reporting it is much better than having it discovered by the customer (me)!

There is no need to print out the code itself.  It should be on GitHub BY THE BEGINNING OF CLASS.

At least four (4) unit tests should use stubbing of methods.

At least three (3) unit tests should testing an edge case.  These should be marked in the comments above with the term "EDGE CASE" in all-caps on its own line, like so:

```ruby
# This unit test checks what happens if we try to set a value
# larger than the maximum value.  It should return -1 in that case.
# EDGE CASE
```

There should be a minimum of sixteen (16) unit tests.

Note that the above are ABSOLUTE MINIMUM values.  You may have more of any of them.

I expect unit tests for AT LEAST each method, using a variety of assertions and looking at different failure modes, equivalence classes, and edge cases.

Group the unit tests for each method together (see format below).  Before each group of unit tests for a method, do an equivalence class partitioning for that method OR, for a method that does not lend itself to this, indicate why not.  For example, assume you have a method which just prints a line of asterisks to the console:

```ruby
def print_line
  80.times { print '*' }
  puts
end
```

You can write down that as the method does the same thing every time, and has no parameters, it does not make sense to partition it.  Generally, this should be a rare case.  The following method, for example, definitely does have multiple equivalence classes and should be partitioned!

```ruby
def print_line n
  n.times { print '*' }
  puts
end
```
If you have a method which seems like it would have an extreme number of equivalence classes (>6), perhaps due to a large number of parameters, you may instead just write down a list of possible success and failure cases.  For example,

```ruby
# Returns concatenated version of all vars.
# SUCCESS CASES: All variables are valid and contain something that can be stringified
# FAILURE CASES: If any variable is nil, that area is blank
#                If g or h is not a number, will return ---
#                If any other variable cannot have .to_s called on it, will return ---

# REFERENCED METHOD
def concat_stuff a, b, c, d, e, f, g, h
  "#{a}: #{b} and #{c} / #{d} / #{e} (#{f}:#{g + h}"
rescue
  "---"  
end
```

The following format should be used:

```ruby
# UNIT TESTS FOR METHOD absolute_value(x)
# Equivalence classes:
# x= -INFINITY..-1 -> returns -x
# x= 0..INFINITY -> returns x
# x= (not a number) -> returns nil

# If a negative value is given for x, then -x is returned.
def test_negative_val
  assert_equal 1, absolute_value(-1)
end

# If a positive value is given for x, then x is returned.
def test_positive_val
  assert_equal 1, absolute_value(1)
end

# If an invalid value, such as a string, is given for x,
# then nil is returned.
# EDGE CASE
def test_invalid_val
  assert_nil absolute_value("poodle")
end
```

Keep in mind some of the things we learned when doing manual testing; you should be cognizant of equivalence classes, boundary values, etc. and focus on them.

The program should use appropriate object-oriented design.  Think of what objects could possibly exist to describe this world, and what methods they should have.  Do not attempt to do this with no classes or methods, etc.  It is, of course, possible, but will make testing more difficult!

For this project, you should endeavour to get a good sampling of different equivalence classes and success/failure cases.

If you are not familiar with seeds for random number generators, recall that in the absence of external input, a computer can only generate data deterministically.  This seed will act as our "external input".  I recommend you review the Ruby Random class: http://ruby-doc.org/core-2.5.0/Random.html  Remember that running your program twice with the same seed should always produce the same output.

Before each test, add some comments (two or three sentences, on average) explaining what the test is checking.  

## Grading
I remind you that grammar and good code count as well as functionality.  By good code, I mean: no commented-out code unless there's an EXPLICIT reason, properly indented code, no misspelled words  bad grammar, in comments or summaries, etc.

The program must be run by typing "ruby city_sim_9006.rb" (with a seed parameter) at the command line.  It will be run using Ruby 2.5.0 and so I recommend you ensure that you have the same version.  You should be fine with Ruby 2.2.0 or above (changes have been relatively minor since then), but I recommend that you use the latest version just to be safe.

The unit tests must be run by typing the following at the command line:

1. `for file in *_test.rb; do ruby $file; done` (OS X, Linux, or other Unix-like OS running bash)
2. "ruby foo_test.rb", "ruby bar_test.rb" for each of the test files

## Grading Breakdown
* Summary and Testing Concerns- 10%
* Screenshot of executed unit tests - 5%
* Program Functionality - 40%
* Test Code - 45%

Please feel free to email me or come to office hours to discuss any problems you have. 
