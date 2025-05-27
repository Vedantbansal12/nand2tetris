// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

// Multiplies R0 and R1 and stores the result in R2.

@0
D = M          // D = R0
@n
M = D          // n = R0

@1
D = M          // D = R1
@c
M = D          // c = R1

@i
M = 0          // i = 0
@sum
M = 0          // sum = 0

(LOOP)
@i
D = M
@n
D = D - M      // D = i - n
@STOP
D;JEQ          // if i == n, goto STOP

@c
D = M
@sum
M = M + D      // sum += c

@i
M = M + 1      // i++

@LOOP
0;JMP

(STOP)
@sum
D = M
@2
M = D          // R2 = sum

(END)
@END
0;JMP

