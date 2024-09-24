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


// while true:
    // if keyboard_value:
    //      Fill all screen with black
    //      start = 8191 (256 rows * 32 consecutive 16-bit words for column - 1 (zero index))
    //      while start:
    //          SCREEN + start = -1 // flip all 16 bit
    //          start--
    // else:
    //      clear

// while true:
//    fill_black = 0
//    if keyboard_value:
//        fill_value = -1
//    
//    while not start < 0:
//           SCREEN + start = fill_value         
//       start--

(LOOP)
    // fill_black = 0
    @fill_black
    M=0

    //update fill_black if keyboard_value > 0
    @KBD
    D=M
    @UPDATE_FILL_BLACK
    D;JGT
    @START_FILL    
    1;JMP

    (UPDATE_FILL_BLACK)
        @fill_black
        M=-1
        @START_FILL    
        1;JMP


    (START_FILL)
    // set start to 8191
        @8191
        D=A
        @start
        M=D

    (FILL)
        // Break loop if start < 0; goto LOOP
        @start
        D=M
        @LOOP
        D;JLT

        // @temp contains screen + start
        @SCREEN
        D=A
        @start
        D=D+M
        @temp
        M=D

        @fill_black
        D=M

        @temp
        A=M
        M=D        
        
        @start
        M=M-1
        @FILL
        1;JMP


    @LOOP
    1;JMP // Go to LOOP
        
// (END)
//     @END
//     0;JMP
