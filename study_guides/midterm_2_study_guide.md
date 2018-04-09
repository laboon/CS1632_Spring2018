# CS 1632 Midterm 2 Study Guide
SPRING 2018

The second midterm is MONDAY 16 APR (for Mon/Wed classes) or TUESDAY 17 APR (for Tue/Thu classes).

Note that the second midterm is _not_ cumulative, except in the sense that the topics covered in the second half of the semester depend upon understanding of the more fundamental concepts taught in the beginning of the course.

## WEB TESTING
* Be able to explain how you would test a web page with Katalon
* You should know basic Selenese (Katalon/Selenium scripting language), e.g.
  * Opening a URL
  * Clicking on a link
  * Testing for text
  * You will not need to know about specifying target selection, but do need to know what target selection is and recognize it (i.e. if I show you a webpage, I will note specific target values for different elements - you will not need to read raw HTML)
  
## PROPERTY-BASED TESTING
* Be able to write simple property-based tests with Rantly
* Be able to name invariants given a function and sample input/output
* Be able to show how invariants are broken
* Understand what shrinking is and be able to shrink an input given an error
* For what kinds of functions is property-based testing useful?  For what kinds is it less useful?

## STATIC ANALYSIS
* Understand static vs dynamic testing
* Understand limitations of static testing
* Know different kinds of static analysis, and tools and methods used (e.g. linters, bug finders, code coverage, code metrics, code reviews)
* You do NOT need to know specific Rubocop/Reek errors, but should understand what they do and what they might catch or not
* Understand code coverage and be able to calculate
* Understand difference between statement and method coverage

## INTERACTING WITH STAKEHOLDERS
* Be able to name some stakeholders and what is important to them (upper management, project management, testers, other developers)
* Be prepared for some "fake" interaction with various stakeholders
* Be able to put together a red-yellow-green template report

## TESTING STRATEGY
* Understand the testing pyramid
* Understand common anti-patterns (ice cream cone, cupcake)
* Given a description of a program, be able to develop your own testing strategy

## SECURITY TESTING
* The CIA/InfoSec Triad
* Terminology: passive vs active, vulnerability, exploit
* Terminology: interruption, interception, modification, fabrication
* Be able to describe/test for common attacks: injection, broken authentication, XSS, insecure storage, buffer overruns, security misconfiguration, insecure object references, social engineering
* How does security testing differ from other kinds of testing?
