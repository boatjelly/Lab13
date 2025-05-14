;
; This code turns on a color LED if its corresponding button is pressed
; Uses SBIS (Skip if Bit in I/O Register is Set)
; 
; WRITTEN: 5/14/2025
; AUTHOR : 
;
; I/O pins
; D10: (BLUE)   LED
; D9:  (GREEN)  LED
; D8:  (RED)    LED
; D7:  Blue PB
; D6:  Green PB
; D5:  Red PB
; !! BLUE IS THE LONELY LEG

; Configure D8–D10 (PB0–PB2) as output
LDI r16, 0x07
OUT DDRB, r16

loop:
    ; Turn off all LEDs
    CBI PORTB, 0 ; RED LED OFF
    CBI PORTB, 1 ; GREEN LED OFF
    CBI PORTB, 2 ; BLUE LED OFF

    ; Check RED pushbutton
    SBIS PIND, 5 ; Skip next if PD5 is high (pressed)
    RJMP check_green ; If not pressed, skip LED logic
    SBI PORTB, 0 ; Turn on RED LED

check_green:
    ; Check GREEN pushbutton
    SBIS PIND, 6
    RJMP check_blue
    SBI PORTB, 1 ; Turn on GREEN LED

check_blue:
    ; Check BLUE pushbutton
    SBIS PIND, 7
    RJMP loop
    SBI PORTB, 2 ; Turn on BLUE LED

    RJMP loop
