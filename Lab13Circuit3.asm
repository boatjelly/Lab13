;
; This code will turn on an LED if a pushbutton is pressed
; (alternatively, it will turn the LED off if the button is not pressed)
; 
; WRITTEN: 5/6/2025
; AUTHOR : 
;
; I/O pins
; D2: a on 7 segment display
; D3: b on 7 segment display
; D4: c on 7 segment display
; D5: d on 7 segment display
; D6: e on 7 segment display
; D7: f on 7 segment display
; D8: g on 7 segment display
; Uses external resistors
; Uses the configuration from Activity 4

; any non-repeating tasks should occur outside of the loop
; configure D8 as an output pin
LDI r16, 0x01
OUT DDRB, r16
; configure D2-D7 as output pins
LDI r16, 0x0FC
OUT DDRD, r16
; assign a value of 1111 1100 (FC) to a r1 (0)
LDI r1, 0xFC


; loop subroutine starts here
loop:
	; start by clearing the output pins
	CBI PORTD 2 ;a
	CBI PORTD 3 ;b
	CBI PORTD 4 ;c
	CBI PORTD 5 ;d
	CBI PORTD 6 ;e
	CBI PORTD 7 ;f
	CBI PORTB 0 ;g

	; show numbers 0-9 on the seven-segment display
	SBI PORTD, 

	; delay of 50ms
	; Assembly code auto-generated
	; by utility from Bret Mulvey
	; Delay 800 000 cycles
	; 50ms at 16.0 MHz
	ldi  r18, 5
    	ldi  r19, 15
    	ldi  r20, 242

; delay function
L1: dec  r20
    brne L1
    dec  r19
    brne L1
    dec  r18
    brne L1







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
