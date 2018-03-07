# Billcoin

You have probably heard of Bitcoin or another cryptocurrency such as Ethereum, Litecoin, or Monero.  For this deliverable, we will verify blockchains for the Billcoin protocol.

Blockchains consist of a "block" of data, which in our case will simply hold a list of transactions associated with that block.  Each block is verified to be internally consistent with the previous elements in the blockchain, e.g., block 1 comes after block 0, block 1 was created at a later time than block 0, there are no transactions where somebody gives away more coins than they own, etc.  Any user can then view the blockchain and verify that nobody is cheating.  Verifying a blockchain tends to be computationally intensive - the current Bitcoin blockchain is well over 150 gigabytes and takes at least a day or two to verify on even a powerful personal computer.  This is one of the reasons that we will do performance testing on our project to ensure that it goes as quickly as possible.

To understand how blockchains work, you must first understand hashing.  Hashing gives you a specific, finite value for an arbitrary sequence of values.  It will allow us to compare data without looking at every single character.  Let us imagine an extremely simple hash function, which only accepts capital letters, and returns a single value between 0 and 25 for that string.  The function accepts a string (which consists only of capital letters), and converts each letter to an equivalent value based on its alphabetical location (e.g A = 1, B = 2, C = 3, ... Z = 26).  We now add each value, and then take that final value, modulo 26.

Let's walk through an example using the phrase "AVOCADOS".  We start with a counter - call it n - at 0.  A is equal to 1, so we add 1 to the counter.  V is equal to 22, and so on.  This can also be expressed as 1 + 22 + 15 + 3 + 1 + 4 + 15 + 19, or 80.  Remember that we are mapping to a finite range of 0..25, though, so we take 80 % 26 = 2.  The "hash" of the string is thus 2.  Modifying any character would give a different hash.  We can thus "prove" that the hash goes along with the data, or compare data by comparing hashes.  Although in our case there is a 1 in 26 chance of a "hash collision" (different data leading to the same hash), by increasing the size of the hash value and using a better hashing algorithm, we can minimize that risk.  Cryptographically secure hashes tend to be 256 bits or larger, meaning that a chance of collision is much lower than 1 in 26 (it's 1 in 115792089237316195423570985008687907853269984665640564039457584007913129639936, or 0.00000000000000000000000000000000000000000000000000000000000000000000000000086% - similar odds to picking out the correct atom out of all the atoms in our solar system).

Now we want to ensure that the block we are creating has been created immediately AFTER the previous block.  We will thus hash the previous block's hash value as part of our data string to prove that it comes right after it.  Therefore, any change would be detected by the hash function.

For example, assume that block 1 has the hash value `98a3`.  When I create the hash value for block 2, I include the value `98a3` as part of the string I am hashing.  This proves that this block comes immediately afterward.  If I try to say that it came earlier, I would have had to change not just the block number but also the hash (and the hashes of any blocks afterward, since those will also depend on the hash value of this block).

However, this does not prove that much work has been done!  Calculating a hash value, even a cryptographically useful one (such as SHA256, the hash function used in Bitcoin - see http://www.xorbin.com/tools/sha256-hash-calculator), takes a minuscule fraction of a second on a modern computer.  However, trying to calculate a specific hash is very difficult and will require many attempts!  This is just like how it is easy to generate a password with certain parameters (say, at least one special character - I can very quickly come up with `llama&llama` or `a*isborn`), but selecting the _correct_ password to an account, even knowing its generating parameters, is very difficult.

If this were an actual cryptocurrency, this is where the "nonce" value would come in.  This is a value added to the block, and hashed with it (along with the data and previous hash) to try and make a hash value with specific properties.  However, for this deliverable, we will ignore the nonce (nobody is mining Billcoin for profit, anyway).  We will just randomly give one user the "reward" (aka the "coinbase") for a block.  All blocks will have a reward as the LAST transaction in them.

Let's look at a sample Billcoin blockchain (this is a copy of the actual file `sample.txt` in this directory):

```
0|0|SYSTEM>Henry(100)|1518892051.737141000|1c12
1|1c12|SYSTEM>George(100)|1518892051.740967000|abb2
2|abb2|George>Amina(16):Henry>James(4):Henry>Cyrus(17):Henry>Kublai(4):George>Rana(1):SYSTEM>Wu(100)|1518892051.753197000|c72d
3|c72d|SYSTEM>Henry(100)|1518892051.764563000|7419
4|7419|Kublai>Pakal(1):Henry>Peter(10):Cyrus>Amina(3):Peter>Sheba(1):Cyrus>Louis(1):Pakal>Kaya(1):Amina>Tang(4):Kaya>Xerxes(1):SYSTEM>Amina(100)|1518892051.768449000|97df
5|97df|Henry>Edward(23):Rana>Alfred(1):James>Rana(1):SYSTEM>George(100)|1518892051.783448000|d072
6|d072|Wu>Edward(16):SYSTEM>Amina(100)|1518892051.793695000|949
7|949|Louis>Louis(1):George>Edward(15):Sheba>Wu(1):Henry>James(12):Amina>Pakal(22):SYSTEM>Kublai(100)|1518892051.799497000|32aa
8|32aa|SYSTEM>Tang(100)|1518892051.812065000|775a
9|775a|Henry>Pakal(10):SYSTEM>Amina(100)|1518892051.815834000|2d7f
```

Each line consists of one block.  A block consists of the following elements, separated by pipes (`|` characters):

1. The block number (always starts at 0 and always increments by one each block)
2. The hash of the previous block (note that this is 0 for the first, or "genesis", block)
3. A sequence of transactions, separated by colons (`:` characters).  Each transaction is of the form FROM_ADDR>TO_ADDR(NUM_BILLCOINS_SENT).  FROM_ADDR and TO_ADDR are addresses, which consist of six or fewer alphabetic characters (`A-Za-z`, case-sensitive).  The value in parentheses, NUM_BILLCOINS_SENT, is the number of billcoins sent from FROM_ADDR to TO_ADDR.  For example, `Mzila>Sheba(6)` indicates that the address "Mzila" sent 6 billcoins to address "Sheba".  
  * Note that the last transaction is from the SYSTEM itself.  This is the reward for creating a block and in our case is given to a random user.  This is the only way billcoins are "minted".  The last transaction of a block should ALWAYS be from SYSTEM.  Every block should thus always have AT LEAST one transaction.  Block 0 should only have one transaction, the reward block, because at the beginning of the blockchain, nobody has any billcoins.
4. A timestamp, consisting of seconds since the epoch, then a period, and the number of nanoseconds in that current second when the block was created.  This number should always increase from the previous block's timestamp.  It should never be the same or move "backwards in time".
  * Note that the timestamp is NOT a floating-point value.  It is two numbers - one indicating the seconds since the epoch and another indicating the number of nanoseconds since that second.  So 100.8 is 100 seconds plus 8 nanoseconds, and 100.1000 is 100 seconds plus 1000 nanoseconds.  Thus, 100.1000 is later in time than 100.8.
5. A hash of the first four elements (where each element is the value "between the pipes" of the string - in other words, the string to hash can be generated by interpolating the following string - "#{block_number}|#{previous_hash}|#{transaction_string}|#{timestamp_string}"), using the algorithm:
  * Unpack each character via U* (`string_to_hash.unpack('U*')`), converting to its UTF-8 value
  * For each value in the string, x, perform the following calculation (x ** 2000) * ((x + 2) ** 21) - ((x + 5) ** 3) and store that value
  * Sum up all of those values
  * Determine that value modulo 65536
  * Return the resulting value as a string version of the number in base-16 (hexadecimal)

Transactions must be valid on a per-block basis.  This means that there may be a point mid-way through the block that an address has a negative balance, but every address should have a nonnegative balance (>= 0) by the end of the block.

For example, assume Joe has 5 billcoins in his account and Sam has 0, and you receive this block.

```
8|e01d|Sam>John(3):Joe>Sam(4):SYSTEM>Rana(100)|1518839370.605237540|c87b
```

Your first thought might be that this is invalid, since Sam gave John 3 billcoins "before" Joe gave Sam 4 billcoins, and thus Sam has 0.  However, blocks are considered to be "instantaneous" as they collect information from a finite amount of time and from a distributed network, so the ordering is not fixed.  At the end of the block, Sam has 1 billcoin, John has 3 billcoins, and Joe has 1 billcoin, all of which are valid.

There are many reasons that a blockchain will fail to be verified.  I expect you to test for these as well as think of any additional ways that an invalid blockchain may be detected.  Examples include:

1. Hash or previous hash is not correct
2. Timestamp does not increase monotonically
3. An address, at the end of any block, has a negative balance
4. An invalid address (> 6 alphabetic characters)
5. An invalid character was found on a line

Upon discovering an error in verification, your program shall indicate which line contains the error and what the error is (e.g., invalid character, invalid address, timestamp did not increase, etc.)  If possible, it should indicate what it _expected_ the value to be.  This will not be possible for things like "unable to parse line" errors, but is for things such as bad previous hash.

Otherwise, if the blockchain is entirely valid, your program should print out all addresses and their associated number of billcoins.  There is no specific order that you need to print out the addresses and their associated number of billcoins.

See the `sample_output.txt` file in this directory for the correct output for a variety of different errors.

I recommend that you first work with `sample.txt` (a very short blockchain) and get the correct values printed out for the number of billcoins.  Then work on various edge cases and failure modes, using the other "error" files in this directory to double-check your verification.  You may also make copies of the files and modify them to express other failure modes.  You should be writing unit tests during these steps.

After this is done, double-check that your program properly verifies `long.txt` - if your program can properly verify a 10,000-block chain, there is a good chance your core functionality is working well.  Once you have everything working and tested, you can then start doing some performance analysis.

For your final timing and performance analysis, you should use `long.txt` as the input file.  You may use `100.txt` and `1000.txt` for practice runs, as they should take much less time than `long.txt` to verify.  If not, you have discovered an O(1) way to verify blockchains and we can write a paper together, as long as you promise to share the Turing Prize.

NOTE: You may use the `sample.txt` blockchain for your flamegraph.  This should still give you a good idea of where the hot spots are in your application but it is less likely to cause an error when rendering in your browser.

Note that this project is a very, very simple implementation of a blockchain, missing many important concepts (e.g. distributing transactions, creating a decent hash function, finding peers, dealing with forks in the chain, persistence, etc.).  If you are interested in a deeper understanding, I recommend the following resources:

1. "Bitcoin: A Peer-to-Peer Electronic Cash System" by Satoshi Nakomoto (alias) - (the original theory behind Bitcoin) - https://bitcoin.org/bitcoin.pdf
2. The Ethereum Whitepaper (the original theory behind Ethereum) - https://github.com/ethereum/wiki/wiki/White-Paper
3. The Ethereum Yellowpaper (the implementation of Ethereum) - https://github.com/ethereum/yellowpaper
4. "Mastering Bitcoin" by Andreas Antonopoulos (book on the technical details of Bitcoin)
5. "Bitcoin for the Befuddled" by Chris Wilmer (a professor at Pitt) and Conrad Barski
6. "Introducing Ethereum and Solidity" by Chris Dannen (book introducing Ethereum)

