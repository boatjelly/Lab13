;
; This code will turn on an LED if a pushbutton is pressed
; (alternatively, it will turn the LED off if the button is not pressed)
; 
; WRITTEN: 5/6/2025
; AUTHOR : 
;
; I/O pins
; D10: (BLUE)	LED
; D9:  (GREEN)	LED
; D8:  (RED)	LED
; D7:  Blue PB	 (external pull-down)
; D6:  Green PB	 (external pull-down)
; D5:  Red PB	 (external pull-down)
; !! BLUE IS THE LONELY LEG

; any non-repeating tasks should occur outside of the loop
; configure D8, D9, D10 as an output pin
LDI r16, 0x07
OUT DDRB, r16

; loop subroutine starts here
loop:
	; start by turning the LED off
	CBI PORTB, 0
	CBI PORTB, 1
	CBI PORTB, 2

	; input data from the PIND register
	IN r16, PIND
	; mask data from the PIND register
	ANDI r16, 0xE0

	; compare to 0x80 (if it is equal to 0x80, then the pushbutton is pressed)
	CPI r16, 0x80
	; if r16 = 0x80, turn on the LED
	BREQ turn_on_rled	; if r16 = 0x80, the code will branch to the turn_on_rled address location

	; compare to 0x40 (if it is equal to 0x40, then the pushbutton is pressed)
	CPI r16, 0x40
	; if r16 = 0x40, turn on the LED
	BREQ turn_on_gled	; if r16 = 0x40, the code will branch to the turn_on_gled address location

	; compare to 0x20 (if it is equal to 0x20, then the pushbutton is pressed)
	CPI r16, 0x20
	; if r16 = 0x20, turn on the LED
	BREQ turn_on_bled	; if r16 = 0x20, the code will branch to the turn_on_bled address location

	; otherwise, we can jump back to the start of the loop
	JMP loop

turn_on_rled:
	SBI PORTB, 0

	; now that the LED is on, go back to the start of the loop
	JMP loop

turn_on_gled:
	SBI PORTB, 1

	; now that the LED is on, go back to the start of the loop
	JMP loop

turn_on_bled:
	SBI PORTB, 2

	; now that the LED is on, go back to the start of the loop
	JMP loop
