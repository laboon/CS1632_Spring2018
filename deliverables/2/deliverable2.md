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

ENSURE THAT THE THE TA AND I ARE ADDED AS A COLLABORATOR ON GITHUB!  My username is `laboon`.  The TA's username will be emailed to you shortly - for Mon/Wed classes it is `KrithikaGanesh`, for Tue/Thu it is ``.  You will lose an automatic 10 points if either I or the TA cannot access your repository.  

Before turning this assignment in, I HIGHLY recommend you double-check that all of the code that you think is comitted is in fact committed by (1) looking at the code on the GitHub web interface and (2) cloning it down to a new directory on your machine and trying to run it from there.

Add a short ( < 1 page ) description of issues you faced when writing this code and tests.  If any tests you wrote fail, they should be included here, along with why you think that they are failing.

After this, ON A SEPARATE PAGE, include a screen shot of the executed unit tests.    If a test doesn't pass, it should be included in the concerns section above.  Ideally, for a perfect grade, all tests should be green (passing).  However, if you have what you think is a valid test and it is not passing, I would prefer that you include a note (and perhaps comment out the tests) rather than just deleting it.  Knowing that a defect exists and reporting it is much better than having it discovered by the customer (me)!

There is no need to print out the code itself.  It should be on GitHub (or GitLab) BY THE BEGINNING OF CLASS.

At least four (4) unit tests should use stubbing of methods.

I expect unit tests for AT LEAST each method, using a variety of assertions and looking at different failure modes and edge cases.  Keep in mind some of the things we learned when doing manual testing; you should be cognizant of equivalence classes, boundary values, etc. and focus on them.

The program should use appropriate object-oriented design.  Think of what objects could possibly exist to describe this world, and what methods they should have.  Do not attempt to do this with no classes or methods, etc.  It is possible but will make testing more difficult!

For this project, you should endeavour to get a good sampling of different equivalence classes and success/failure cases.

If you are not familiar with seeds for random number generators, recall that in the absence of external input, a computer can only generate data deterministically.  This seed will act as our "external input".  I recommend you review the Ruby Random class: http://ruby-doc.org/core-2.5.0/Random.html  Remember that running your program twice with the same seed should always produce the same output.

Before each test, add some comments (two or three sentences, on average) explaining what the test is checking.  

## Grading
I remind you that grammar and good code count as well as functionality.  By good code, I mean: no commented-out code unless there's an EXPLICIT reason, properly indented code, no misspelled words  bad grammar, in comments or summaries, etc.

The program must be run by typing "ruby city_sim_9600.rb" (with an optional seed parameter) at the command line.

The unit tests must be run by typing "ruby *_test.rb" at the command line.

## Grading Breakdown
* Summary and Testing Concerns- 10%
* Screenshot of executed unit tests - 5%
* Program Functionality - 45%
* Test Code - 40%

Please feel free to email me or come to office hours to discuss any problems you have. 
