/******************************************************************************
* file: Lab Assingment-2.s                                                    *
* Author: Jethin Sekhar R (CS18M523)                                          *
* Assembly code for Maximum and Minimum in Given Set of Numbers               *
******************************************************************************/

@BSS SECTION
.bss
	MaxValue: .word 0                  @ Result1 : Max Value
	MinValue: .word 0                  @ Result2 : Min Value

@ DATA SECTION
.data
	@ Delaring all variables and terminating with Zero
	data_items: .word 87,122,82,136,124,134,147,23,116,152,96,123,78,25,102,49,0
	term_char: .word 0

@ TEXT section
  .text

.global _main

_main:
    LDR R0, = data_items
    LDR R1, = term_char
    LDR R1, [R1]
    LDR R2, [R0]                    @ Initialize Min with first element
    MOV R3, R2                      @ Initialize Max with first element
    MOV R4, R2                      @ Initialize loop variable with first element
	
loop:
	LDR R4, [R0], #4

	CMP R1, R4                      @Check for termination
	BEQ exit

	CMP R4, R2                      @Check for Min
	BLT update_min

	CMP R4, R3                      @Check for Max
	BGT update_max

	B loop

update_min:                         @Update Min Value Locally
	MOV R2, R4
	B loop

update_max:                         @Update Max Value Locally
	MOV R3, R4
	B loop

exit:                               @Store Results
	LDR R0, =MaxValue
	STR R2, [R0]
	LDR R0, =MinValue
	STR R2, [R0]
	.end