The file create_bram.v contains working code for the search and transact operations on the block ram entries.
It has been tested using the test bench file - create_bram_tb.v

Update: The create_bram.v file now contains working code for insert operation on block ram.
It has been tested using the create_bram_tb.v - testbench file.

Some conditions:
No key can have value 0
Value stored must be non zero for any key

1. The incoming packet must have the format:

for refer:
command-code 1 byte
key 4 bytes
trailing zero 1 byte (00000000) used for detection purposes.

for transfer:
command-code 1 byte
key-debit 4 bytes
key-credit 4 bytes
transfer amnt
trailing zero 1 byte

for issue:
command-code 1 byte
key 4 bytes
amnt 4 bytes
trailing zero 1 byte

for create:
command-code
key
initial balance
trailing zero


IGNORE this important note below. No restrictions, it works.

Important note:

While sending multiple commands, the different commands must be such that previous command's zero byte must coincide with the reset signal.
i.e. as each byte requires #freq time for transmission along the communication channel, in this period only the reset must be done.
Such that the NEGEDGE of reset corresponds to the beginning of the next command.

command 1 ... zero byte--> 00000000
                                   |
                                   |
                       negedge reset
                                   |
                                   |
                                    next command
