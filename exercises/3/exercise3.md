# Exercise 3 - Performance Testing Exercise

For this exercise, you and a partner will profile some monkey simulation software, and improve its performance by refactoring one method (to be determined by the results of the profiling).  This will consist of several parts:

1. Timing and profiling (before any changes) to determine which methods are the most CPU-intensive
3. Refactoring one method to be more performant (from a CPU and time perspective)
4. Timing and Profiling (after) showing that your rewrite helped make your method more performant

Code is available in the file monkey_sim.rb in this directory.

This code runs MonkeySim, which simulates a group of monkeys throwing a banana back around until it gets to the first monkey.  It accepts one argument, which states which monkey has the banana initially.

The game shall continue until the first monkey gets the banana, at which point the simulation shall end.

The monkey who has the banana shall throw it to another monkey during each round.

If a monkey is even-numbered (e.g., monkey #2, monkey #4, etc.), then the monkey with the banana shall throw the banana to the monkey equal to one-half of that initial monkey's number.  For example, monkey #4 shall throw the banana to monkey #2, and monkey #20 shall throw the banana to monkey #10.

If a monkey is odd-numbered (and not monkey #1), the monkey with the banana shall throw it to the monkey equal to three times the number of that monkey plus one `(3n + 1)`.  For example, monkey #5 shall throw the banana to monkey #16 `((3 * 5) + 1)`.

If Monkey #1 catches the banana, the system shall display the number of rounds it took for Monkey #1 to catch the banana and then the program shall exit.

At each round, the current status of who is doing the throwing and who is catching shall be displayed, along with the round number (which should start at 1).  It should use the following format: "Round 1: Threw banana from Monkey (#54 / ID ) to Monkey (#27 / ID )"

Each monkey has an ID; this ID shall remain constant.  For instance, Monkey #5 shall always have ID , and Monkey #160 shall always have ID .  Any changes to the code should not modify the ID value.

Output for a given input should be EXACTLY the same as the initial output (i.e., you cannot just give each  monkey a random identifier).  Sample runs are shown in the sample_runs.txt file.  Please be sure that your code operates the exact same way as the initial code.

In case of ambiguity in the requirements, the sample_runs.txt file shall be considered the correct implementation.

If you encounter an infinite loop (where, if the algorithm is implemented correctly, the first monkey NEVER gets the banana), you will receive a __sizable__ amount of extra credit, assuming you let me know the initial number you entered.

In order to determine the "hot spots" of the application, you will use the flamegraph gem.  Using a profiler, determine a method you can use to measurably increase the speed of the application without modifying behavior.

This program should work EXACTLY the same as before, except it should be faster and take up less CPU time.  You can prove this by checking the monkey_sim pinning tests includes.


