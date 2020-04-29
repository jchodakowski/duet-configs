;M117 "Freeing Extruder0"

;M83			; Make sure extruder is in relative mode (prob not needed anymore)
;G1 E-5.0 F3600		; Retract filament as soon as possible...
;G91			; Relative
;G1 Z2 F600		; ...Then lower the bed...
;G90			; Absolute
;G1 X10 Y150 F18000	; ...Then get the hell away from the print
;G4 S2			; Pause two seconds to cool the retracted filament
;G1 E4.9    F3600	; Pack the filament to eliminate the tail
;G1 E-155 F8000	        ; Yank the filament past the Y adapter and into its Bowden tube
