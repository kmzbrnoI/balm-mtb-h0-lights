EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Osvětlení vozů Balm MTB model - čelní deska"
Date "2022-01-13"
Rev "1.0"
Comp "Model Railroader Club Brno I – KMŽ Brno I – https://kmz-brno.cz/"
Comment1 "Jan Horáček"
Comment2 "https://github.com/kmzbrnoI/"
Comment3 "https://creativecommons.org/licenses/by-sa/4.0/"
Comment4 "Released under the Creative Commons Attribution-ShareAlike 4.0 License"
$EndDescr
$Comp
L Device:LED D2
U 1 1 61E05764
P 6600 3950
F 0 "D2" H 6593 4167 50  0000 C CNN
F 1 "RED" H 6593 4076 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6600 3950 50  0001 C CNN
F 3 "~" H 6600 3950 50  0001 C CNN
	1    6600 3950
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D1
U 1 1 61E058AC
P 5850 3950
F 0 "D1" H 5843 4167 50  0000 C CNN
F 1 "RED" H 5843 4076 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5850 3950 50  0001 C CNN
F 3 "~" H 5850 3950 50  0001 C CNN
	1    5850 3950
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J1
U 1 1 61E06448
P 4750 3950
F 0 "J1" H 4668 4167 50  0000 C CNN
F 1 "Conn_01x02" H 4668 4076 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 4750 3950 50  0001 C CNN
F 3 "~" H 4750 3950 50  0001 C CNN
	1    4750 3950
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6000 3950 6450 3950
Wire Wire Line
	4950 3950 5700 3950
Wire Wire Line
	4950 4050 5050 4050
Wire Wire Line
	5050 4050 5050 4200
Wire Wire Line
	5050 4200 6900 4200
Wire Wire Line
	6900 4200 6900 3950
Wire Wire Line
	6900 3950 6750 3950
$EndSCHEMATC
