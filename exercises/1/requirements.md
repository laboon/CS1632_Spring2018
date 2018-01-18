FUN-BASIC-CALC - The system shall calculate the results of switching or staying, according to the defined Monty Hall problem, for "number of times" iterations.  
FUN-DISPLAY-RESULTS - After calculating, the system shall display this information to the user after calculating, using percentages with up to three places after the decimal, and then stop execution.  This display shall print out the passed-in String versions of the "good" and "bad" options as defined in the arguments.

FUN-ARGS-NUMBER - The system shall accept four arguments from the command line, in the following order: good option, bad option, number of times, number of threads.  If there are fewer or more than four arguments, the system will display the usage information for the program and shut down..

FUN-ARGS-INVALID - If an argument is invalid for any reason (such as, the arguments for the number of times or number of threads cannot be parsed as a positive integer), then the system shall explain the reason that it cannot run and will shut down.  At no point shall the system display a Java exception or stack trace directly to the user.

FUN-SMALL-NUM - If the "number of times" argument is less than 100, the system shall issue a warning and ask the user if they wish to continue.
