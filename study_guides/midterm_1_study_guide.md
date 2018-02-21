# CS 1632 Midterm 1 Exam Study Guide - Spring 2018

The midterm is on 28 FEB 2018 (M/W classes) or 1 MAR (T/H class).

The midterm will cover everything we have covered up to the exerise the class before.  I recommend you review the slides and the textbook (see syllabus.md for reminders of which chapters were required reading).

Here are the key topics to study in preparation for the test.

## TESTING THEORY AND TERMINOLOGY
* Equivalence class partitioning
* Boundary and interior values
* Base, Edge, and Corner cases
* Static vs Dynamic testing
  * Know the differences and examples of each
* Black/White/Grey box testing
  * Know the differences and examples of each

## REQUIREMENTS ANALYSIS
* What makes a good or bad requirement?
* Testability - requirements must be:
  * Complete, consistent, unambiguous, quantitative, feasible
* Functional vs Non-Functional Requirements  (Quality Attributes)
  * Be able to define and write your own
* Traceability Matrices
  * Be able to define and write your own

## TEST PLANS
* Given a list of requirements, be able to write a test plan
* Terminology: test cases, test plans, test suites, test runs
* Verification vs validation

## DEFECT REPORTING
* Be prepared to report a defect based on a test case
* Remember the defect template:
  * SUMMARY, DESCRIPTION, REPRODUCTION STEPS, EXPECTED BEHAVIOR, OBSERVED BEHAVIOR
  * Optionally: SEVERITY/IMPACT, NOTES
  * Levels of severity: BLOCKER, CRITICAL, MAJOR, NORMAL, MINOR, TRIVIAL
* Coding mistakes vs defects

## Smoke, Exploratory, and Path-based testing
* Define all of these concepts
* I will not ask you to calculate cyclomatic complexity for a given method but I expect you to understand the concept and explain why a method with a higher or lower complexity might be easier/harder to test and why

## AUTOMATED TESTING
* Pros and cons of automated testing
* Unit tests vs system/acceptance/integration tests

## UNIT TESTING
* Unit tests
  * Pay special attention to assertions
  * Understand how to write a Minitest unit test (basic syntax)
  * Understand how to make a double
  * Understand how to make a mock
  * Understand how to make a stub
* Understand difference between mock, double, stub
* Given some Ruby code, be able to perform an equivalence class partitioning and write tests for it

## BREAKING SOFTWARE
* Be prepared to think of happy path vs edge case testing
* What are various ways that software can break?

## TDD
* Basic concepts of test-first development
* The red-green-refactor loop
* Benefits and drawbacks of TDD
  * When to use it?
  * When not to use it?

## WRITING TESTABLE CODE
* What do we mean by "testable code"?
* Basic strategies for testable code
* Code segmentation
* "Give yourself something to test"
* Pure vs impure methods - be prepared to define and/or determine if a method is pure
* The DRY Principle
* Understand seams

## Pairwise and Combinatorial testing
* Understand concepts, be able to define
* I will not make you create your own pairwise tests BUT you may be asked to determine if something is a valid pairwise or combinatorial test (i.e., checks all possible t-way interactions)

## PERFORMANCE TESTING
* Understand concepts on how to test performance
* Be able to write test plans for different performance indicators and systems
* Terminology: Service-Oriented vs Efficiency-Oriented Indicators
* Availability, Response Time, Throughput, Utilization
* Performance targets, performance thresholds, KPIs - understand and be able to generate!
* Measuring response time - methodologies
* Understand different concepts of time: user, system, total, real
* Measuring availability, concurrency, scalability, throughput
* Understand n 9's (e.g., 5 9s vs 6 9s)
* Load testing - baseline, soak/stability, stress tests
