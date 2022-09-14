EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "ADX HF TRX Band Module "
Date ""
Rev "V1.00"
Comp "WB2CBA"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L pspice:CAP C6
U 1 1 5F070FF0
P 3400 3600
F 0 "C6" H 3578 3646 50  0000 L CNN
F 1 " " H 3578 3555 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 3400 3600 50  0001 C CNN
F 3 "~" H 3400 3600 50  0001 C CNN
	1    3400 3600
	1    0    0    -1  
$EndComp
$Comp
L pspice:CAP C5
U 1 1 5F070FF6
P 3850 2750
F 0 "C5" H 4028 2796 50  0000 L CNN
F 1 " " H 4028 2705 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 3850 2750 50  0001 C CNN
F 3 "~" H 3850 2750 50  0001 C CNN
	1    3850 2750
	0    -1   -1   0   
$EndComp
$Comp
L pspice:CAP C2
U 1 1 5F070FFC
P 5100 3000
F 0 "C2" H 5278 3046 50  0000 L CNN
F 1 " " H 5278 2955 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 5100 3000 50  0001 C CNN
F 3 "~" H 5100 3000 50  0001 C CNN
	1    5100 3000
	0    -1   -1   0   
$EndComp
$Comp
L Device:L_Core_Ferrite L2
U 1 1 5F07100E
P 3850 3300
F 0 "L2" V 4075 3300 50  0000 C CNN
F 1 " " V 3984 3300 50  0000 C CNN
F 2 "Inductor_THT:L_Toroid_Vertical_L10.0mm_W5.0mm_P5.08mm" H 3850 3300 50  0001 C CNN
F 3 "~" H 3850 3300 50  0001 C CNN
	1    3850 3300
	0    -1   -1   0   
$EndComp
$Comp
L Device:L_Core_Ferrite L1
U 1 1 5F071014
P 5800 3250
F 0 "L1" V 6025 3250 50  0000 C CNN
F 1 " " V 5934 3250 50  0000 C CNN
F 2 "Inductor_THT:L_Toroid_Vertical_L10.0mm_W5.0mm_P5.08mm" H 5800 3250 50  0001 C CNN
F 3 "~" H 5800 3250 50  0001 C CNN
	1    5800 3250
	0    -1   -1   0   
$EndComp
$Comp
L power:GNDPWR #PWR0101
U 1 1 5F071024
P 3400 3850
F 0 "#PWR0101" H 3400 3650 50  0001 C CNN
F 1 "GNDPWR" H 3404 3696 50  0001 C CNN
F 2 "" H 3400 3800 50  0001 C CNN
F 3 "" H 3400 3800 50  0001 C CNN
	1    3400 3850
	1    0    0    -1  
$EndComp
$Comp
L power:GNDPWR #PWR0102
U 1 1 5F07102A
P 6350 3750
F 0 "#PWR0102" H 6350 3550 50  0001 C CNN
F 1 "GNDPWR" H 6354 3596 50  0001 C CNN
F 2 "" H 6350 3700 50  0001 C CNN
F 3 "" H 6350 3700 50  0001 C CNN
	1    6350 3750
	1    0    0    -1  
$EndComp
$Comp
L power:GNDPWR #PWR0104
U 1 1 5F071036
P 4500 3800
F 0 "#PWR0104" H 4500 3600 50  0001 C CNN
F 1 "GNDPWR" H 4504 3646 50  0001 C CNN
F 2 "" H 4500 3750 50  0001 C CNN
F 3 "" H 4500 3750 50  0001 C CNN
	1    4500 3800
	1    0    0    -1  
$EndComp
$Comp
L dk_Rectangular-Connectors-Headers-Male-Pins:0022232041 J2
U 1 1 5F065B8D
P 7850 3150
F 0 "J2" V 7500 3150 50  0000 R CNN
F 1 "input" V 7600 3200 50  0000 R CNN
F 2 "digikey-footprints:PinHeader_1x4_P2.54mm_Drill1.02mm" H 8050 3350 60  0001 L CNN
F 3 "https://www.molex.com/pdm_docs/sd/022232041_sd.pdf" H 8050 3450 60  0001 L CNN
F 4 "WM4202-ND" H 8050 3550 60  0001 L CNN "Digi-Key_PN"
F 5 "0022232041" H 8050 3650 60  0001 L CNN "MPN"
F 6 "Connectors, Interconnects" H 8050 3750 60  0001 L CNN "Category"
F 7 "Rectangular Connectors - Headers, Male Pins" H 8050 3850 60  0001 L CNN "Family"
F 8 "https://www.molex.com/pdm_docs/sd/022232041_sd.pdf" H 8050 3950 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/molex/0022232041/WM4202-ND/26671" H 8050 4050 60  0001 L CNN "DK_Detail_Page"
F 10 "CONN HEADER VERT 4POS 2.54MM" H 8050 4150 60  0001 L CNN "Description"
F 11 "Molex" H 8050 4250 60  0001 L CNN "Manufacturer"
F 12 "Active" H 8050 4350 60  0001 L CNN "Status"
	1    7850 3150
	0    -1   1    0   
$EndComp
$Comp
L dk_Rectangular-Connectors-Headers-Male-Pins:0022232041 J1
U 1 1 5F067370
P 2700 3300
F 0 "J1" V 2475 3308 50  0000 C CNN
F 1 "Antenna" V 2566 3308 50  0000 C CNN
F 2 "digikey-footprints:PinHeader_1x4_P2.54mm_Drill1.02mm" H 2900 3500 60  0001 L CNN
F 3 "https://www.molex.com/pdm_docs/sd/022232041_sd.pdf" H 2900 3600 60  0001 L CNN
F 4 "WM4202-ND" H 2900 3700 60  0001 L CNN "Digi-Key_PN"
F 5 "0022232041" H 2900 3800 60  0001 L CNN "MPN"
F 6 "Connectors, Interconnects" H 2900 3900 60  0001 L CNN "Category"
F 7 "Rectangular Connectors - Headers, Male Pins" H 2900 4000 60  0001 L CNN "Family"
F 8 "https://www.molex.com/pdm_docs/sd/022232041_sd.pdf" H 2900 4100 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/molex/0022232041/WM4202-ND/26671" H 2900 4200 60  0001 L CNN "DK_Detail_Page"
F 10 "CONN HEADER VERT 4POS 2.54MM" H 2900 4300 60  0001 L CNN "Description"
F 11 "Molex" H 2900 4400 60  0001 L CNN "Manufacturer"
F 12 "Active" H 2900 4500 60  0001 L CNN "Status"
	1    2700 3300
	0    1    1    0   
$EndComp
Wire Wire Line
	2800 3400 2800 3300
Wire Wire Line
	2800 3500 2800 3600
$Comp
L power:GNDPWR #PWR0105
U 1 1 5F06B5D1
P 2800 3800
F 0 "#PWR0105" H 2800 3600 50  0001 C CNN
F 1 "GNDPWR" H 2804 3646 50  0001 C CNN
F 2 "" H 2800 3750 50  0001 C CNN
F 3 "" H 2800 3750 50  0001 C CNN
	1    2800 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 3600 2800 3800
Connection ~ 2800 3600
$Comp
L power:GNDPWR #PWR0106
U 1 1 5F071044
P 7750 3650
F 0 "#PWR0106" H 7750 3450 50  0001 C CNN
F 1 "GNDPWR" H 7754 3496 50  0001 C CNN
F 2 "" H 7750 3600 50  0001 C CNN
F 3 "" H 7750 3600 50  0001 C CNN
	1    7750 3650
	1    0    0    -1  
$EndComp
$Comp
L pspice:CAP C1
U 1 1 5F0EF3C9
P 6350 3500
F 0 "C1" V 6035 3500 50  0000 C CNN
F 1 "  " V 6126 3500 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 6350 3500 50  0001 C CNN
F 3 "~" H 6350 3500 50  0001 C CNN
	1    6350 3500
	1    0    0    -1  
$EndComp
$Comp
L pspice:CAP C7
U 1 1 5F0EF3CF
P 6850 2650
F 0 "C7" H 6672 2604 50  0000 R CNN
F 1 "100nF" H 6672 2695 50  0000 R CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 6850 2650 50  0001 C CNN
F 3 "~" H 6850 2650 50  0001 C CNN
	1    6850 2650
	-1   0    0    1   
$EndComp
$Comp
L power:GNDPWR #PWR0107
U 1 1 5F0EF3D6
P 6850 2900
F 0 "#PWR0107" H 6850 2700 50  0001 C CNN
F 1 "GNDPWR" H 6854 2746 50  0000 C CNN
F 2 "" H 6850 2850 50  0001 C CNN
F 3 "" H 6850 2850 50  0001 C CNN
	1    6850 2900
	1    0    0    -1  
$EndComp
$Comp
L Device:L_Core_Ferrite L3
U 1 1 5F0EF3F7
P 6350 2650
F 0 "L3" H 6200 2700 50  0000 L CNN
F 1 "FT37_43" H 6000 2600 50  0000 L CNN
F 2 "Inductor_THT:L_Toroid_Vertical_L10.0mm_W5.0mm_P5.08mm" H 6350 2650 50  0001 C CNN
F 3 "~" H 6350 2650 50  0001 C CNN
	1    6350 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 2500 6350 2400
Wire Wire Line
	6350 2400 6850 2400
Wire Wire Line
	7400 2400 7400 3150
Wire Wire Line
	7400 3150 7750 3150
Wire Wire Line
	7300 3350 7750 3350
Wire Wire Line
	7750 3450 7750 3650
Text Label 8000 3150 0    50   ~ 0
+12V
Text Label 8000 3250 0    50   ~ 0
BS170_Drain(TD)
Text Label 8000 3350 0    50   ~ 0
BS170_RX(RD)
Connection ~ 6850 2400
Wire Wire Line
	6850 2400 7400 2400
Wire Wire Line
	6350 3250 7300 3250
Wire Wire Line
	6350 2800 6350 3250
Connection ~ 6350 3250
Wire Wire Line
	5950 3250 6350 3250
$Comp
L pspice:CAP C3
U 1 1 5F7E3F2E
P 5100 3500
F 0 "C3" H 5278 3546 50  0000 L CNN
F 1 " " H 5278 3455 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 5100 3500 50  0001 C CNN
F 3 "~" H 5100 3500 50  0001 C CNN
	1    5100 3500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5350 3000 5350 3250
Wire Wire Line
	5350 3250 5650 3250
Connection ~ 5350 3250
Wire Wire Line
	5350 3250 5350 3500
Wire Wire Line
	4850 3000 4850 3300
$Comp
L pspice:CAP C4
U 1 1 5F071002
P 4500 3550
F 0 "C4" H 4678 3596 50  0000 L CNN
F 1 " " H 4678 3505 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 4500 3550 50  0001 C CNN
F 3 "~" H 4500 3550 50  0001 C CNN
	1    4500 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 3300 4850 3300
Connection ~ 4850 3300
Wire Wire Line
	4850 3300 4850 3500
Wire Wire Line
	3400 3350 3400 3300
Wire Wire Line
	3400 3300 3700 3300
Wire Wire Line
	4000 3300 4500 3300
Connection ~ 4500 3300
Wire Wire Line
	4100 2750 4500 2750
Wire Wire Line
	4500 2750 4500 3300
Wire Wire Line
	3600 2750 3400 2750
Wire Wire Line
	3400 2750 3400 3300
Connection ~ 3400 3300
Wire Wire Line
	3400 3300 2800 3300
Connection ~ 2800 3300
Wire Wire Line
	7300 3350 7300 3250
Connection ~ 7300 3250
Wire Wire Line
	7300 3250 7750 3250
Text Notes 6000 2800 0    50   ~ 0
20 turns
$EndSCHEMATC
