# 4-bit-alu
This is a 4 bit alu that performs instructions when both the rising edge of the clock and enable is high. The processor works by taking single instruction and computing results based on multiple sets of data. 

 _________________________________________________________________________
|  S1  |  S0  |   Cin=0                 |   Cin=1                 	      | 
|------|------|-------------------------|---------------------------------|        
|   0  |   0  |  F = A + B (add)        |  F = A + B' + 1 (subtract A-B)  | 
|   0  |   1  |  F = A' + B             |  F = A' + B + 1 (subtract B - A)|
|   1  |   0  |  F = A - 1 (decrement)  |  F = A + 1 (increment)          |
|   1  |   1  |  F = A' (1's Complement)|  F = A' + 1 (2's Complement)    |
|______|______|_________________________|_________________________________|

The Alu's operations are contorled by two select lines (S1 and S0) and Cin. The operations it can do can be found above in the table. 

