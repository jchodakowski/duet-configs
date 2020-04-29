;M116 P0 ; wait for tool 0 only to reach operating temperature
;G1 E150 F6000		; Extrude 145mm @ 100mm/s
;G1 E5   F1500		; Extrude   5mm @  25mm/s
;G91			; Relative
;G1 Z-2  F6000		; Raise bed
;G90			; Absolute
