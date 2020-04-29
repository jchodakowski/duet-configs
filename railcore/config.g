; General
M111 S0                             	; Debug off
M550 PRailCore							; Machine name and Netbios name (can be anything you like)

; Networking
;M551 Pletmein                        	; Machine password (used for HTTP/FTP)
M540 P0xBE:0xEF:0xDE:0xAD:0xFE:0x03 	; MAC Address
M552 S1									; Enable WiFi
M586 P0 S1 								; Enable HTTP
M586 P1 S0 								; Disable FTP
M586 P2 S0 								; Disable Telnet
M555 P2                           		; Set output to look like Marlin
M575 P1 B57600 S1						; Comms parameters for PanelDue

; Basics
G21                                 	; Work in millimeters
G90                                		; Send absolute coordinates...
M83                                 	; ...but relative extruder moves

; Axis and motor direction configuration
M667 S1									; CoreXY mode
M584 X0 Y1 Z5:6:7 E3:4:8:9 				; Map Z to drivers 5, 6, 7. Define unused drivers 3,4,8 and 9 as extruders
M569 P0 S0                          	; Drive 0 - X stepper (Rear)
M569 P1 S1                          	; Drive 1 - Y Stepper (Front)
M569 P2 S1                          	; Drive 2 - Unused
M569 P3 S0                          	; Drive 3 - Extruder
M569 P4 S1                          	; Drive 4 - Extruder (unused)
M569 P5 S0								; Drive 5 - Front Left Z
M569 P6 S0								; Drive 6 - Rear Left Z
M569 P7 S0								; Drive 7 - Right Z

; Motor tuning
M671 X-10:-10:333  Y22.5:277.5:150 S7.5 ; Leadscrew locations: Front left, Rear Left, Right  S7.5 is the max correction
M350 X16 Y16 Z16 E16 I1	    			; set 16x microstepping for axes& extruder, with interpolation
M574 X1 Y1 Z0 S1		    			; set homing switch configuration (x,y at min, z at max)
M906 X1000 Y1000 Z1000 E1330 I60	   	; Set motor currents (mA)
M201 X3000 Y3000 Z500 E1000          	; Accelerations (mm/s^2)
M203 X24000 Y24000 Z900 E3600	      	; Maximum speeds (mm/min)
;M204 P1000 T4000 						; Printing and travel accelerations
M566 X1000 Y1000 Z500 E500            	; Maximum jerk speeds mm/minute
M208 X290 Y290 Z250	                	; set axis maxima and high homing switch positions
M208 X0 Y0 Z-0.5 S1                 	; set axis minima and low homing switch positions
;M92 X200 Y200 Z1600 E398		    	; steps/mm, X/Y may be more around 201.5 for accuracy
; old m92 for e: 398
M92 X200 Y200 Z1600 E409				;
M84 S30									; Set idle timeout
M572 D0 S0.001							; Pressure advance
M207 S0.75 R-0.000 F3200 T3200 Z0.0	; Firmware Retraction

; Thermistors
M305 P0 S"Bed" T100000 B3950 R4700 H0 L0	; Put your own H and/or L values here to set the bed thermistor ADC correction
; https://e3d-online.dozuki.com/Guide/05+-+Hemera+Rep+Rap+Firmware+Modification/132
M305 P1 S"Hotend" T100000 B4725 R4700 H0 L0 C7.06e-8
M305 P107 X3 T100000 B3950 R4700 S"Keenovo"

; Heaters
M307 H0 A240.3 C608.7 D8.2 S1.00 V24.1 B0 	; Bed Heater
M143 H0 S125								; Bed heater max 125C
M307 H1 A270.7 C90.4 D6.7 B0 S1.0			; Hemera/hotend E3D (Heater 1) model
M143 H1 S285								; Hot end heater max 285C
M570 S360									; Hot end may be a little slow to heat up so allow it 180 seconds
M307 H3 A-1 C-1 D-1							; Set process parameters for the heaters

; Fans
M106 P0 H-1 C"Part fan"						; disable thermostatic mode for fan 0
M106 P1 T45 H1 L100 C"Hemera fan"			; enabled thermostatic fan mode for fan 1, JGC
;M106 P1 H-1									; disable thermostatic mode for fan 1
M106 P2 H-1									; unused
M106 P0 S0 									; turn off fan0
M106 P1 S0									; turn off fan1
M106 P2 S0									; turn off fan2

; Tool definitions
M563 P0 D0 H1                       		; Define tool 0
G10 P0 S0 R0                        		; Set tool 0 operating and standby temperatures

; Z-Probe
M558 P9 C"^zprobe.in" H5 F180 T6000 A3 S0.02		; Set up BL-Touch
; Tip: A larger trigger height in G31 moves you CLOSER to the bed
G31 X45 Y-40 Z2.09 P25						; X & Y values for MRW Hemera mount/rear bl-touch
M557 X10:295 Y10:295 S57:57					; Set up bed mesh to dodge MRW magnets

; Travel Min/Max
M208 S1 Z-0.2								; set minimum Z
M208 X285 Y275 Z320							; set X/Y/Z maximums
;M564 H0										; allow moves without homing

; Misc
T0											; select first hot end
M501										; load the overrides
