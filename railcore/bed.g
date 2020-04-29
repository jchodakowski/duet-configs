M561						; clear any existing bed transform
G1 Z5 S2					; Move Z into check distance

; Z-Probe details
; Adjusted for MRW Hemera mount using rear-side BL-Touch
G30 P0 X45 Y0 Z-99999		; point no.0 for X:Y facoring in MRW Hemera mount
G30 P1 X45 Y245 Z-99999		; point no.1 for X:Y from MRW Hemera mount
G30 P2 X235 Y245 Z-99999	; point no.2 for X:Y from MRW Hemera mount
G30 P3 X235 Y0 Z-99999 S3	; point no.3 for X:Y
G1 X0 Y0 F5000				; move the head to the corner (optional)

;old points
;G30 P0 X30 Y45 Z-99999       ; define 4 points in a clockwise direction around the bed, starting near (0,0)
;G30 P1 X30 Y215 Z-99999
;G30 P2 X225 Y215 Z-99999
;G30 P3 X225 Y45 Z-99999
;G30 P4 X125 Y125 Z-99999 S0  ; finally probe bed centre, and calculate compensation
