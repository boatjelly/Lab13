; Lab 13 Circuit III
; Displays digits 0–9 with ~500 ms delay between each
; Common-anode, active low
; WRITTEN: 5/14/2025
; AUTHOR : 
;
; I/O pins
; D1: a on 7 segment display
; D2: b on 7 segment display
; D3: c on 7 segment display
; D4: d on 7 segment display
; D5: e on 7 segment display
; D6: f on 7 segment display
; D7: g on 7 segment display
; Uses external resistors
;
; to do: add clear before each number changes

    LDI r16, 0xFF
    OUT 0x3D, r16
    LDI r16, 0x08
    OUT 0x3E, r16

    LDI r16, 0xFE
    OUT 0x0A, r16

loop:
    ; Display 0
    LDI r16, 0x80
    OUT 0x0B, r16
    CALL delay

    ; Display 1
    LDI r16, 0xF2
    OUT 0x0B, r16
    CALL delay

    ; Display 2
    LDI r16, 0x48
    OUT 0x0B, r16
    CALL delay

    ; Display 3
    LDI r16, 0x60
    OUT 0x0B, r16
    CALL delay

    ; Display 4
    LDI r16, 0x32
    OUT 0x0B, r16
    CALL delay

    ; Display 5
    LDI r16, 0x24
    OUT 0x0B, r16
    CALL delay

    ; Display 6
    LDI r16, 0x04
    OUT 0x0B, r16
    CALL delay

    ; Display 7
    LDI r16, 0xF0
    OUT 0x0B, r16
    CALL delay

    ; Display 8
    LDI r16, 0x00
    OUT 0x0B, r16
    CALL delay

    ; Display 9
    LDI r16, 0x20
    OUT 0x0B, r16
    CALL delay

    RJMP loop

; Assembly code auto-generated
; by utility from Bret Mulvey
; Delay 8 000 000 cycles
; 500ms at 16.0 MHz
delay:
    LDI r18, 41
    LDI r19, 150
    LDI r20, 128
delay_loop:
    DEC r20
    BRNE delay_loop
    DEC r19
    BRNE delay_loop
    DEC r18
    BRNE delay_loop
    RET
