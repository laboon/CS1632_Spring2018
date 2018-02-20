## CitySim9006 Requirements

FUN-CITY-LOCS. The program shall simulate a city with four locations: Hospital, Cathedral, Hillman, and Museum.

FUN-AVENUES. The city shall have two one-way avenues, Fourth Ave and Fifth Ave.  Fourth Ave shall connect, in order, Outside City -> Hospital -> Cathedral -> Outside City.  Fifth Ave shall connect, in order, Outside City -> Museum -> Hillman -> Outside City.

FUN-STREETS. The city shall have two two-way streets, Foo St. and Bar St.  Foo St. shall connect Hospital and Hillman.  Bar St. shall connect Cathedral and Museum.

FUN-FIVE-DRIVERS. Five drivers (named "Driver 1", "Driver 2", "Driver 3", "Driver 4", and "Driver 5") shall traverse the city, one after the other, and their routes shall be displayed on the console.

FUN-START-LOC. A driver may start in any of the four locations listed in FUN-CITY-LOCS.  Drivers may not start outside of the city.

FUN-ITERATION. At each iteration, a Driver will drive from the current Location to one of the possible Locations that can be reached from the original Location.  The decision shall be made pseudorandomly based on a seed passed in from the command line, as covered by FUN-ARGS.

FUN-ARGS. The system shall accept an integer seed from the command line for the pseudorandom number generator.  No other arguments shall be accepted.  If no arguments are provided, or more than one argument is provided, the system shall inform the user and exit.  If the argument is not a valid integer, the program shall assume the user meant the seed 0.

FUN-OTHER-PLACES. If a driver exits the city via Fourth Avenue, then the program shall display that the driver has gone to Monroeville.  If a driver exits the city via Fifth Avenue, then the program shall display that the driver has gone to Downtown.

FUN-BOOKS-AND-DINOS: At the conclusion of each Driver's simulation, the simulator will note how many books and dinosaur toys the driver obtained.  A Driver starts with zero books and zero dinosaur toys at the beginning of their simulation, and obtains one book each time they are at the Library and one dinosaur toy every time they are at the Museum.  This shall include starting locations (e.g., if the Driver starts at the Museum, they will obtain one dinosaur toy).  The program shall print this out using the correct singular or plural forms (e.g., "1 book", "2 books", "0 books") and end with an exclamation point ("!").

FUN-CLASSES: At the conclusion of each Driver's simulation, the simulator will note how many classes the Driver attended.  The driver starts with one class and the number of classes *doubles* each time they are at the Cathedral (1, 2, 4, etc.).  This shall include if the Cathedral is the starting location.  The program shall print this out using the correct singular or plural form (e.g. "1 class", "2 classes", "0 classes") and end with an exclamation point ("!").

FUN-END. The simulation shall end for a specific Driver once that Driver is leaving towards Monroeville or Downtown.  If there are more Drivers, then the next Driver's simulation will start; otherwise the program shall exit.

Any ambiguities in the above requirements should be clarified by examining the sample_output.txt file in this directory.  This should be considered the "gold standard" of what proper output should look like.  Note that given a particular seed, different runs may occur in different programs, but for the same program, the same seed should always produce the exact same results.

It may be easier to understand the map of the city visually.

```
City Map
	
                ---> [Hospital] ----> [Cathedral] ----> Fourth Ave. (to Monroeville)
                      ^  |              ^  |
              Foo St. |  |              |  | Bar St.
                      |  V              |  V
 (to Downtown)  <--- [Hillman]  <---- [Museum] <--- Fifth Ave.
```	

