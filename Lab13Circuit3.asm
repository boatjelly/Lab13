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
;LDI r27, 0xFC


; loop subroutine starts here
loop:
	call clear_reg

	; This block shows 0
	; bring in the PORTD!
	IN r29, PORTD
	; set bits on PORTD to show 0 on the 7 segment display
	ORI r29, 0xFC
	; load it back!
	OUT PORTD, r29
	; bring in the PORTB!
	IN r28, PORTB
	; set bits on PORTB to show 0 on the 7 segment display
	ORI r28, 0x00
	; load it back!
	OUT PORTB, r28

	call clear_reg

	; This block shows 1
	; bring in the PORTD!
	IN r29, PORTD
	; set bits on PORTD to show 0 on the 7 segment display
	ORI r29, 0x18
	; load it back!
	OUT PORTD, r29
	; bring in the PORTB!
	IN r28, PORTB
	; set bits on PORTB to show 0 on the 7 segment display
	ORI r28, 0x00
	; load it back!
	OUT PORTB, r28

	call clear_reg

	; This block shows 2
	; bring in the PORTD!
	IN r29, PORTD
	; set bits on PORTD to show 0 on the 7 segment display
	ORI r29, 0x6C
	; load it back!
	OUT PORTD, r29
	; bring in the PORTB!
	IN r28, PORTB
	; set bits on PORTB to show 0 on the 7 segment display
	ORI r28, 0x01
	; load it back!
	OUT PORTB, r28

	call clear_reg

	; This block shows 3
	; bring in the PORTD!
	IN r29, PORTD
	; set bits on PORTD to show 0 on the 7 segment display
	ORI r29, 0x3C
	; load it back!
	OUT PORTD, r29
	; bring in the PORTB!
	IN r28, PORTB
	; set bits on PORTB to show 0 on the 7 segment display
	ORI r28, 0x01
	; load it back!
	OUT PORTB, r28

	call clear_reg

	; This block shows 4
	; bring in the PORTD!
	IN r29, PORTD
	; set bits on PORTD to show 0 on the 7 segment display
	ORI r29, 0x98
	; load it back!
	OUT PORTD, r29
	; bring in the PORTB!
	IN r28, PORTB
	; set bits on PORTB to show 0 on the 7 segment display
	ORI r28, 0x01
	; load it back!
	OUT PORTB, r28

	call clear_reg

	; This block shows 5
	; bring in the PORTD!
	IN r29, PORTD
	; set bits on PORTD to show 0 on the 7 segment display
	ORI r29, 0xB4
	; load it back!
	OUT PORTD, r29
	; bring in the PORTB!
	IN r28, PORTB
	; set bits on PORTB to show 0 on the 7 segment display
	ORI r28, 0x01
	; load it back!
	OUT PORTB, r28

	call clear_reg

	; This block shows 6
	; bring in the PORTD!
	IN r29, PORTD
	; set bits on PORTD to show 0 on the 7 segment display
	ORI r29, 0xF4
	; load it back!
	OUT PORTD, r29
	; bring in the PORTB!
	IN r28, PORTB
	; set bits on PORTB to show 0 on the 7 segment display
	ORI r28, 0x01
	; load it back!
	OUT PORTB, r28

	call clear_reg

	; This block shows 7
	; bring in the PORTD!
	IN r29, PORTD
	; set bits on PORTD to show 0 on the 7 segment display
	ORI r29, 0x9C
	; load it back!
	OUT PORTD, r29
	; bring in the PORTB!
	IN r28, PORTB
	; set bits on PORTB to show 0 on the 7 segment display
	ORI r28, 0x00
	; load it back!
	OUT PORTB, r28

	call clear_reg

	; This block shows 8
	; bring in the PORTD!
	IN r29, PORTD
	; set bits on PORTD to show 0 on the 7 segment display
	ORI r29, 0xFC
	; load it back!
	OUT PORTD, r29
	; bring in the PORTB!
	IN r28, PORTB
	; set bits on PORTB to show 0 on the 7 segment display
	ORI r28, 0x01
	; load it back!
	OUT PORTB, r28

	call clear_reg

	; This block shows 9
	; bring in the PORTD!
	IN r29, PORTD
	; set bits on PORTD to show 0 on the 7 segment display
	ORI r29, 0xBC
	; load it back!
	OUT PORTD, r29
	; bring in the PORTB!
	IN r28, PORTB
	; set bits on PORTB to show 0 on the 7 segment display
	ORI r28, 0x01
	; load it back!
	OUT PORTB, r28

	call clear_reg

	JMP loop

; This subroutine clears the registers
clear_reg:
    ldi  r18, 41
    ldi  r19, 150
    ldi  r20, 128
	; bring in the PORTD!
	IN r31, PORTD
	; clear the first 6 bits
	ANDI r31, 0xFC
	; load it back!
	OUT PORTD, r31
	; bring in the PORTB!
	IN r30, PORTB
	; clear just bit 0 on PORTB
	ANDI r30, 0x01
	; load it back!
	OUT PORTB, r30
	ldi  r18, 41
    ldi  r19, 150
    ldi  r20, 128
	ret ; Return from subroutine 


; Everything from HERE

; Assembly code auto-generated
; by utility from Bret Mulvey
; Delay 8 000 000 cycles
; 500ms at 16.0 MHz

L1: dec  r20
    brne L1
	dec  r19
    brne L1
    dec  r18
    brne L1

; to HERE is copy-pasted and NECESSARY
