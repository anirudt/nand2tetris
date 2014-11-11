// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.
//Using M gives value
// using A gives us the address
	
(START)
	@SCREEN
	D=A
	@i
	M=D //storing the address as data in 'i'
	
	@24575
	D=A
	@j
	M=D //storing the address as data in 'j'
	@KBD
	M=0
(DECISION)
	@KBD
	D=M
	@ENDWHITE
	D;JGT
	

//whitening the screen
(LOOPWHITE)
	@i
	D=M
	@j
	D=D-M
	@ENDWHITE
	D;JGE
	@i
	A=M
	M=0
	@i
	M=M+1

	
	(LOOPWHITE)
	0;JMP
(ENDWHITE)


	@SCREEN
	D=A
	@i
	M=D //storing the address as data in 'i'
	
	@24575
	D=A
	@j
	M=D //storing the address as data in 'j'

//blacking the screen
(LOOPFOR)
	@i
	D=M
	@j
	D=D-M
	@ENDFOR
	D;JGE
	@i
	A=M
	M=-1
	@i
	M=M+1
	(LOOPFOR)
	0;JMP
(ENDFOR)
	@DECISION
	1;JMP
