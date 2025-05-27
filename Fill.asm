// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

//// Replace this comment with your code.
// Initialize screen address
// Initialize screen address
@SCREEN
D=A
@addr
M=D

(LOOP)
    // Check if a key is pressed
    @KBD
    D=M
    @WHITE
    D;JEQ    // If D == 0, no key is pressed → go clear screen

// Fill screen with black (-1)
@SCREEN
D=A
@addr
M=D

(BLACK_LOOP)
    @addr
    A=M
    M=-1        // Set pixel to black (all 1s)

    @addr
    M=M+1       // addr++

    @KBD
    D=A
    @addr
    D=D-M
    @LOOP
    D;JEQ       // If addr == KBD (end of screen), go check input again

    @BLACK_LOOP
    0;JMP


// Fill screen with white (0)
(WHITE)
    @SCREEN
    D=A
    @addr
    M=D

(WHITE_LOOP)
    @addr
    A=M
    M=0         // Set pixel to white (all 0s)

    @addr
    M=M+1       // addr++

    @KBD
    D=A
    @addr
    D=D-M
    @LOOP
    D;JEQ       // If addr == KBD, go check input again

    @WHITE_LOOP
    0;JMP

