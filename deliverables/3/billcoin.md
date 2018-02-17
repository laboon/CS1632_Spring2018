# Billcoin

You have probably heard of Bitcoin or another cryptocurrency such as Ethereum, Litecoin, or Monero.  For this deliverable, we will verify blockchains created 

Blockchains work by creating a "block" of data, and connecting a next block

Hashing gives you a specific, finite value for a larger sequence of values.  It will allow us to compare data without looking at every single character.  Let us imagine an extremely simple hash function, which only accepts capital letters, and returns a single value between 0 and 25 for that string.  The function accepts a string (which consists only of capital letters), and converts each letter to an equivalent value based on its alphabetical location (e.g A = 1, B = 2, C = 3, ... Z = 26).  We now add each value, and then take that final value, modulo 26.

Let's walk through an example using the phrase "AVOCADOS".  We start with a counter - call it n - at 0.  A is equal to 1, so we add 1 to the counter.  V is equal to 22, and so on.  This can also be expressed as 1 + 22 + 15 + 3 + 1 + 4 + 15 + 19, or 80.  Remember that we are mapping to a finite range of 0..25, though, so we take 80 % 26 = 2.  The "hash" of the string is thus 2.  Modifying any character would give a different hash.  We can thus "prove" that the hash goes along with the data, or compare data by comparing hashes.  Although in our case there is a 1 in 26 chance of a "hash collision" (different data leading to the same hash), by increasing the size of the hash value, we can minimize that risk.  Cryptographically secure hashes tend to be 256 bits or larger.

Now we want to ensure that the block we are creating has been created immediately AFTER the previous block.  We will thus hash the previous block's hash value as part of our data string to prove that it comes right after it.  Therefore, any change would be detected by the hash function.

However, this does not prove that much work has been done!  Calculating a hash value, even a cryptographically useful one (such as SHA256, the hash function used in Bitcoin - see http://www.xorbin.com/tools/sha256-hash-calculator), takes a minuscule fraction of a second on a modern computer.  However, trying to come up with a specific hash is very difficult and will require many attempts!

If this were an actual cryptocurrency, this is where the "nonce" value would come in.  This is a value added to the block, and hashed with it (along with the data and previous hash) to try and make a hash value with specific properties.  However, for this deliverable, we will ignore the nonce (nobody is mining Billcoin for profit, anyway).  We will just randomly give one user the "reward" (aka the "coinbase") for a block.  All

Let's look at a sample Billcoin blockchain (this is a copy of the actual file `sample.txt` in this directory):

```
0|0|SYSTEM>James(100)|1518838270.539070000|fb6c
1|fb6c|James>Anne(15):James>Edward(5):James>Kublai(16):Anne>Sheba(2):Sheba>Anne(1):James>Tang(3):Kublai>Mzila(4):Mzila>Amina(1):Anne>Kublai(3):Anne>Kaya(1):Edward>Rana(1):Amina>Yaa(1):Sheba>Anne(1):Edward>Rana(1):Anne>Anne(1):Yaa>Louis(1):SYSTEM>Edward(100)|1518838270.542891000|df20
2|df20|SYSTEM>Henry(100)|1518838270.569701000|f463
3|f463|Kublai>Anne(3):Mzila>Mary(1):Henry>Anne(20):Kublai>Amina(1):Henry>Kaya(13):James>Anne(1):Rana>Anne(1):Henry>Sheba(7):Louis>Tang(1):Kublai>Pakal(1):Mzila>Amina(1):SYSTEM>Xerxes(100)|1518838270.573507000|9a
4|9a|Anne>Cyrus(6):Mzila>Yaa(1):Yaa>Pakal(1):Kaya>Kublai(2):Henry>Tang(3):SYSTEM>Rana(100)|1518838270.595221000|eced
5|eced|SYSTEM>Rana(100)|1518838270.605237000|792c
6|792c|Amina>Tang(1):James>Tang(4):SYSTEM>James(100)|1518838270.608756000|2b7d
7|2b7d|Amina>Henry(1):Henry>Edward(5):Mary>Mzila(1):James>Tang(12):Tang>Pakal(2):Pakal>Cyrus(1):Tang>George(2):Cyrus>Kublai(2):SYSTEM>Louis(100)|1518838270.616774000|d007
8|d007|George>Sheba(1):Tang>Pakal(1):SYSTEM>Amina(100)|1518838270.635223000|9777
9|9777|Louis>Gaozu(17):SYSTEM>Louis(100)|1518838270.641042000|2da7
```

Each line consists of one block.  A block consists of the following elements, separated by pipes (`|` characters):

1. The block number (increments each block)
2. The hash of the previous block (note that this is 0 for the first, or "genesis", block)
3. A sequence of transactions, separated by colons (`:` characters).  Each transaction is of the form FROM_ADDR>TO_ADDR(NUM_BILLCOINS_SENT).  FROM_ADDR and TO_ADDR are addresses, which consist of six or fewer alphabetic characters (`A-Za-z`, case-sensitive).  The value in parentheses, NUM_BILLCOINS_SENT, is the number of billcoins sent from FROM_ADDR to TO_ADDR.  For example, `Mzila>Sheba(6)` indicates that the address "Mzila" sent 6 billcoins to address "Sheba".
  * Note that the last transaction is from the SYSTEM itself.  This is the reward for creating a block and in our case is given to a random user.  This is the only way billcoins are "minted".  The last transaction of a block should ALWAYS be from SYSTEM.  Every block should thus always have AT LEAST one transaction.
5. A timestamp, consisting of seconds since the epoch, then a period, and the number of nanoseconds in that current second when the block was created.  This number should always increase from the previous block's timestamp.  It should never be the same or move "backwards in time".
6. A hash of the first five elements of the string, using the algorithm:
  * Unpack each character via U* (`string_to_hash.unpack('U*'), converting to a value
  * For each value in the string, x, perform the following calculation (x ** 2000) * ((x + 2) ** 21) - ((x + 5) ** 3) and store that value
  * Sum up all of those values
  * Determine that value modulo 65536
  * Print out the resulting value in base-16 (hexadecimal)

There are many reasons that a blockchain will fail to be verified.  I expect you to test for these as well as think of any additional ways that an invalid blockchain may be detected.  Examples include:

1. Hash or previous hash is not correct
2. Timestamp does not increase monotonically
3. An address, at any point, has a negative balance
4. An invalid address (> 6 alphabetic characters)
5. An invalid character was found on a line

Upon discovering an error in verification, your program shall indicate which line contains the error and what the error is (e.g., invalid character, invalid address, timestamp did not increase, etc.)

Otherwise, if the blockchain is entirely valid, your program should print out all addresses and their associated number of billcoins.

Note that this project is a very, very simple implementation of a blockchain, missing many important concepts (e.g. distributing transactions, creating a decent hash function, finding peers, dealing with forks in the chain, persistence, etc.).  If you are interested in a deeper understanding, I recommend the following resources:

1. "Bitcoin: A Peer-to-Peer Electronic Cash System" by Satoshi Nakomoto (alias) - (the original theory behind Bitcoin) - https://bitcoin.org/bitcoin.pdf
2. The Ethereum Whitepaper (the original theory behind Ethereum) - https://github.com/ethereum/wiki/wiki/White-Paper
3. The Ethereum Yellowpaper (the implementation of Ethereum) - https://github.com/ethereum/yellowpaper
4. "Mastering Bitcoin" by Andreas Antonopoulos (book on the technical details of Bitcoin)
5. "Introducing Ethereum and Solidity" by Chris Dannen (book introducing Ethereum)


Note that the initial "previous hash" is zero in the first transaction.


