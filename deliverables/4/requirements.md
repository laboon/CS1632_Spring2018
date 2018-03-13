## App homepage: https://cs1632ex.herokuapp.com/

1. The homepage shall display the text "Welcome, friend, to a land of pure calculation" as well as "Used for CS1632 Software Quality Assurance, taught by Bill Laboon".  There may or may not be carriage returns ("\n") in either of these texts.
2. Every page shall include five links at the top, to "CS1632 D3 Home", "Factorial", "Fibonacci", "Hello", and "Cathedral Pics".  These shall link to `/`, `/fact`, `/fib`, `/hello`, and `/cathy`, respectively.
3. The factorial page (`/fact`) shall allow a user to enter a positive integer from 1 to 100, and upon pressing submit, shall show to the user the factorial of the value (e.g. "Factorial of 5 is 120!").
4. The Fibonacci page (`/fib`) shall allow a user to enter a positive integer from 1 to 100, and upon pressing submit, shall show to the user the Fibonnaci of the value (e.g. "Fibonacci of 5 is 8!").
5. For both the Fibonacci and Factorial pages, if a user enters an invalid value of any kind, they shall be informed that the value is 1 (e.g., "Fibonacci of -100 is 1!")
6. Accessing the hello page (`/hello`) with no trailing values in the URL shall display the message "Hello CS1632, from Prof. Laboon!".
7. If a trailing value is provided in the URL when accessing the `/hello` page, then the message shall display hello from that trailing value.  For example, when accessing `/hello/Jazzy`, the system shall display "Hello CS1632, from Jazzy!".  This shall work for all input values.
8. The Cathedral page (`/cathy`) shall display three images of the Cathedral of Learning in a numbered list.
