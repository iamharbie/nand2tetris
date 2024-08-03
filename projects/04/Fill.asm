// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.


// Fill all screen with black
// start = 8191
// while start:
//     SCREEN + start = -1
//     start--





// //set i = 8191
// @8191
// D = A
// @i
// M = D




(LOOP)
    //set i = 8191
    @8191
    D = A
    @i 
    M = D


    // read keyboard value
    @KBD 
    D = M
    @CLEAR
    D;JEQ // goto clear if 0 (no input)
    @FILL
    D;JGT



    //Clear
    (CLEAR)
    // set D to i
    @i
    D = M
    //if D < 0: goto LOOP
    @LOOP
    D;JLT


    //set SCREEN + start to 0
    @SCREEN
    A = A + D
    M = 0


    // i --
    @i 
    M = M - 1
    
    // goto clear
    @CLEAR
    0;JMP


    // Fill
    (FILL)
    // set D to i
    @i
    D = M
    //if D < 0: goto LOOP
    @LOOP
    D;JLT


    //set SCREEN + start to -1
    @SCREEN
    A = A + D
    M = -1


    // i --
    @i 
    M = M - 1
    
    // goto fill
    @FILL
    0;JMP



// (END)
//     @END
//     0;JMP