(START)
// Check if a key has been pressed
@KBD
D=M
@KEY_PRESSED
D;JNE
@NO_KEY_PRESSED
0;JMP
(KEY_PRESSED)
@0
D=A-1	// @ command can only store 15 bit values (MSB is 0) so we have to produce the 16bit value 0xFFFF a bit differently
@filler
M=D	// filler = 65535 = 0xFFFF
(SCREEN_FILL_LOOP_START)
@8192	// number of words for the screen I/O map (32*256)
D=A
@remainingWords
M=D	// remainingWords = 8192
@SCREEN
D=A
@position
M=D	// position = SCREEN (base address)
(SCREEN_FILL_LOOP)
// begin of loop condition
@remainingWords
D=M
@START
D;JLE // if remainingWords <= 0 goto START
// end of loop condition
// begin setting the current screen word
@filler
D=M
@position
A=M
M=D
// end setting the current screen word
// begin decrease remainingWords / increase position
@remainingWords
M=M-1	// remainingWords = remainingWords - 1
@position
M=M+1	// position = position + 1
// end decrease remainingWords / increase position
@SCREEN_FILL_LOOP
0;JMP // jump to beginning of the loop
(NO_KEY_PRESSED)
@0
D=A
@filler
M=D	// filler = 0 = 0x0000
@SCREEN_FILL_LOOP_START
0;JMP // jump to the start of the filling procedure