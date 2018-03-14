# CS 1632 - Software Quality Assurance
Spring Semester 2017

DUE 28 MAR (Mon/Wed classes) | 29 MAR (Tue/Thu classes)

## Deliverable 4

For this assignment, you and a partner will write systems-level, automated black-box tests for a web app using the Katalon Automation Recorder, a revamped variant of the Selenium IDE. 

Test code should be on a private repository and GitHub, and the TA and myself should be added as collaborators by the beginning of class on the due date.

The web app is located here: https://cs1632ex.herokuapp.com/

This is an Elixir/Phoenix application.  If you like, you may look at the source code here: https://github.com/laboon/cs1632d3ex.  However, this is NOT necessary (and technically would make this grey-box testing).  I do not expect you to learn yet another language for this course.  It might be interesting for you to see Elixir code, though.

## Format
Everyone should have a title page with:
* Your names and GitHub usernames
* The URL of your code and tests on GitHub
* The title "CS 1632 - DELIVERABLE 4: Automated Web Testing"

For the summary, add a description of issues you faced when writing these tests and problems you would expect going forward based on your experiences.  If any tests you wrote fail (some should!), they should be included here.

After this, there should be a printout or screen shot of the test execution results.

There is no need to print out the code.  It should be shared with me and the TA (i.e., we have been added as collaborators) on GitHub BY THE BEGINNING OF CLASS.

The code should be a saved Katalon test suite.  Note that this should be an HTML file.

There should be a bare minimum of twenty tests, checking various base, edge, and corner cases.  There is a maximum of thirty tests.  However, do not focus on the number of tests too heavily; I am more concerned that you cover a broad variety of cases, check the requirements, and ones which are focused and yet still likely to find defects.

## Requirements

Requirements for the application are listed in the `requirements.md` file in this directory.

Remember to check for implicit as well as explicit requirements!

You should have at least one test for each requirement.

## Defects

This is another buggy product.  You should find at least three defects and report them using the standard defect template (just like in the first deliverable).  These defects should be detected by your automated tests (i.e., there should be at least _three_ failures of your tests).

You may want to do some exploratory testing first to see what kind of issues are found before writing automated tests for them.

## Traceability Matrix

Please make a traceability matrix (just as in the first deliverable).  Tests should be identified by the name of the test case.

## Grading
* Summary and Testing concerns - 10% 
* Screen shot or printout of test results - 5%
* Tests - 50%
* Defect reports - 25%
* Traceability matrix - 10%

Please feel free to email me or come to office hours to discuss any problems you have. 
 
