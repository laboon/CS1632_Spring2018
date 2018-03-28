# CS 1632 - Software Quality Assurance

Spring Semester 2018

DUE: 4 APR (Mon/Wed classes), 5 APR (Tue/Thu class)

## OPTIONAL ASSIGNMENT

This assignment is optional.  If you choose to do it, it is worth 10% of your grade and deliverable 6 will be worth 15% of your grade.  If you choose not to do it, deliverable 6 is worth 25% of your grade.

## Description

You (NOT with a partner) will refactor your deliverable 2 assignment by using the following tools: rubocop, reek, and simplecov.

Do NOT use the same repository as D2 - you should copy the code and create a new D5 repository.

After refactoring, statement coverage for your entire project, as measured by simplecov, should be 90% or greater.  This will almost certainly necessitate writing more unit tests (unless you were very thorough in your original tests, in which case, good work!).

You should fix all problems caused by reek and rubocop.  However, I am giving you four "get out of jail free" cards for each, *if* you also include an explanation of why you did not fix it.  This should be printed out and included with your cover page.  This should be a valid explanation (e.g., we tried to modify it by doing X but it caused additional failures, the performance impact would be too high, etc.).  Saying "I didn't understand what it was telling me" or "I didn't feel like it" or "I had one more get-out-of-jail-free card and felt like using it" are NOT considered valid explanations.

## Format
Every assignment should have a title page with:
* The name of the student their GitHub usernames
* The title "CS 1632 - DELIVERABLE 5: Static Analysis"
* The URL for your git repository

There should be an additional page (or pages) explaining any deviations from rubocop or reek suggestions.

There is no need to print out the code, only the deliverable paperwork.  The code itself should be available on GitHub or a similar code-sharing site BY THE BEGINNING OF CLASS.

## Grading
* All issues from rubocop fixed (or <= 4 explained) - 25%
* All issues from reek fixed ((or <= 4 explained) - 20%
* Simplecov statement coverage >= 90% - 30%
* Unit tests (well-written, commented, etc.): 25%

Functionality should not have changed at all from D2.

Please feel free to email me or come to office hours to discuss any problems you have. 