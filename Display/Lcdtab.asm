;--------COM------------
c0	.equ	0
c1	.equ	1
c2	.equ	2
c3	.equ	3
c4	.equ	4
c5	.equ	5
c6	.equ	6
;;--------SEG------------
; s47	.equ	47
; s46	.equ	46
; s45	.equ	45
; s44	.equ	44
; s43	.equ	43
; s42	.equ	42
s41	.equ	41
s40	.equ	40
; s39	.equ	39
; s38	.equ	38
; s37	.equ	37
; s36	.equ	36
; s35	.equ	35
; s34	.equ	34
; s33	.equ	33
; s32	.equ	32
; s31	.equ	31
; s30	.equ	30
; s29	.equ	29
; s28	.equ	28
; s27	.equ	27
; s26	.equ	26
; s25	.equ	25
; s24	.equ	24
; s23	.equ	23
; s22	.equ	22
; s21	.equ	21
; s20	.equ	20
; s19	.equ	19
; s18	.equ	18
; s17	.equ	17
; s16	.equ	16
s15	.equ	15
s14	.equ	14
s13	.equ	13
s12	.equ	12
s11	.equ	11
s10	.equ	10
s9	.equ	9
s8	.equ	8
s7	.equ	7
s6	.equ	6
s5	.equ	5
s4	.equ	4
s3	.equ	3
s2	.equ	2
s1	.equ	1
s0	.equ	0


.MACRO  db_c_s	com,seg
          .BYTE com*6+seg/8
.ENDMACRO

.MACRO  db_c_y	com,seg
	      .BYTE 1.shl.(seg-seg/8*8)
.ENDMACRO

Lcd_byte:	;段码
lcd_table1:
lcd_d1 .equ	lcd_table1-lcd_table1
	db_c_s	c1,s41	;;1A
	db_c_s	c1,s40	;;1B
	db_c_s	c0,s40	;;1C
	db_c_s	c0,s11	;;1D
	db_c_s	c0,s41	;;1E
	db_c_s	c1,s41	;;1F
	db_c_s	c0,s41	;;1G

lcd_d2	.equ lcd_d1+7
	db_c_s	c1,s14	;;2A
	db_c_s	c1,s13	;;2B
	db_c_s	c0,s13	;;2C
	db_c_s	c0,s12	;;2D
	db_c_s	c0,s15	;;2E
	db_c_s	c1,s15	;;2F
	db_c_s	c0,s14	;;2G
	
lcd_d3	.equ lcd_d2+7
	
	db_c_s	c3,s10	;;3A
	db_c_s	c2,s10	;;3B
	db_c_s	c1,s10	;;3C
	db_c_s	c0,s10	;;3D
	db_c_s	c1,s11	;;3E
	db_c_s	c3,s11	;;3F
	db_c_s	c2,s11	;;3G

lcd_d4	.equ lcd_d3+7

	db_c_s	c3,s8	;;4A
	db_c_s	c2,s8	;;4B
	db_c_s	c1,s8	;;4C
	db_c_s	c0,s8	;;4D
	db_c_s	c1,s9	;;4E
	db_c_s	c3,s9	;;4F
	db_c_s	c2,s9	;;4G
lcd_d5	.equ lcd_d4+7

	db_c_s	c3,s8	;;4A
	db_c_s	c2,s8	;;4B
	db_c_s	c1,s8	;;4C
	db_c_s	c0,s8	;;4D
	db_c_s	c1,s9	;;4E
	db_c_s	c3,s9	;;4F
	db_c_s	c2,s9	;;4G
lcd_d6	.equ lcd_d5+7

	db_c_s	c3,s8	;;4A
	db_c_s	c2,s8	;;4B
	db_c_s	c1,s8	;;4C
	db_c_s	c0,s8	;;4D
	db_c_s	c1,s9	;;4E
	db_c_s	c3,s9	;;4F
	db_c_s	c2,s9	;;4G
lcd_d7	.equ lcd_d6+7

	db_c_s	c3,s8	;;4A
	db_c_s	c2,s8	;;4B
	db_c_s	c1,s8	;;4C
	db_c_s	c0,s8	;;4D
	db_c_s	c1,s9	;;4E
	db_c_s	c3,s9	;;4F
	db_c_s	c2,s9	;;4G
lcd_d8	.equ lcd_d7+7

	db_c_s	c3,s8	;;4A
	db_c_s	c2,s8	;;4B
	db_c_s	c1,s8	;;4C
	db_c_s	c0,s8	;;4D
	db_c_s	c1,s9	;;4E
	db_c_s	c3,s9	;;4F
	db_c_s	c2,s9	;;4G
lcd_d9	.equ lcd_d8+7

	db_c_s	c3,s8	;;4A
	db_c_s	c2,s8	;;4B
	db_c_s	c1,s8	;;4C
	db_c_s	c0,s8	;;4D
	db_c_s	c1,s9	;;4E
	db_c_s	c3,s9	;;4F
	db_c_s	c2,s9	;;4G
lcd_d10	.equ lcd_d9+7

	db_c_s	c3,s8	;;4A
	db_c_s	c2,s8	;;4B
	db_c_s	c1,s8	;;4C
	db_c_s	c0,s8	;;4D
	db_c_s	c1,s9	;;4E
	db_c_s	c3,s9	;;4F
	db_c_s	c2,s9	;;4G
lcd_d11	.equ lcd_d10+7

	db_c_s	c3,s8	;;4A
	db_c_s	c2,s8	;;4B
	db_c_s	c1,s8	;;4C
	db_c_s	c0,s8	;;4D
	db_c_s	c1,s9	;;4E
	db_c_s	c3,s9	;;4F
	db_c_s	c2,s9	;;4G
lcd_d12	.equ lcd_d11+7

	db_c_s	c3,s8	;;4A
	db_c_s	c2,s8	;;4B
	db_c_s	c1,s8	;;4C
	db_c_s	c0,s8	;;4D
	db_c_s	c1,s9	;;4E
	db_c_s	c3,s9	;;4F
	db_c_s	c2,s9	;;4G
lcd_d13	.equ lcd_d12+7

	db_c_s	c3,s8	;;4A
	db_c_s	c2,s8	;;4B
	db_c_s	c1,s8	;;4C
	db_c_s	c0,s8	;;4D
	db_c_s	c1,s9	;;4E
	db_c_s	c3,s9	;;4F
	db_c_s	c2,s9	;;4G



Lcd_dot:
lcd_col .equ Lcd_dot-lcd_table1
	db_c_s	c1,s12	;;COL
	db_c_s	c1,s12	;;D2
	db_c_s	c1,s12	;;11I
	db_c_s	c1,s12	;;11H
	db_c_s	c1,s12	;;12H
	db_c_s	c1,s12	;;13I
	db_c_s	c1,s12	;;13H
	db_c_s	c1,s12	;;13J
	db_c_s	c1,s12	;;ALM
	db_c_s	c1,s12	;;SNZ
	db_c_s	c1,s12	;;SIG
	db_c_s	c1,s12	;;24小时
	db_c_s	c1,s12	;;PM
	db_c_s	c1,s12	;;正计时

lcd_D2					.EQU	lcd_col+1	
lcd_11I					.EQU	lcd_col+2
lcd_11H					.EQU	lcd_col+3
lcd_12H					.EQU	lcd_col+4
lcd_13I					.EQU	lcd_col+5
lcd_13H					.EQU	lcd_col+6
lcd_13J					.EQU	lcd_col+7
lcd_Alm					.EQU	lcd_col+8
lcd_Snz					.EQU	lcd_col+9
lcd_Sig					.EQU	lcd_col+10
lcd_24					.EQU	lcd_col+11					
lcd_PM					.EQU	lcd_col+12					
lcd_Timer_Zheng			.EQU	lcd_col+13		


;==========================================================
;==========================================================
Lcd_bit:
	
	db_c_y	c1,s41	;;1A
	db_c_y	c1,s40	;;1B
	db_c_y	c0,s40	;;1C
	db_c_y	c0,s11	;;1D
	db_c_y	c0,s41	;;1E
	db_c_y	c1,s41	;;1F
	db_c_y	c0,s41	;;1G


	db_c_y	c1,s14	;;2A
	db_c_y	c1,s13	;;2B
	db_c_y	c0,s13	;;2C
	db_c_y	c0,s12	;;2D
	db_c_y	c0,s15	;;2E
	db_c_y	c1,s15	;;2F
	db_c_y	c0,s14	;;2G
	

	
	db_c_y	c3,s10	;;3A
	db_c_y	c2,s10	;;3B
	db_c_y	c1,s10	;;3C
	db_c_y	c0,s10	;;3D
	db_c_y	c1,s11	;;3E
	db_c_y	c3,s11	;;3F
	db_c_y	c2,s11	;;3G



	db_c_y	c3,s8	;;4A
	db_c_y	c2,s8	;;4B
	db_c_y	c1,s8	;;4C
	db_c_y	c0,s8	;;4D
	db_c_y	c1,s9	;;4E
	db_c_y	c3,s9	;;4F
	db_c_y	c2,s9	;;4G


	db_c_y	c3,s8	;;4A
	db_c_y	c2,s8	;;4B
	db_c_y	c1,s8	;;4C
	db_c_y	c0,s8	;;4D
	db_c_y	c1,s9	;;4E
	db_c_y	c3,s9	;;4F
	db_c_y	c2,s9	;;4G


	db_c_y	c3,s8	;;4A
	db_c_y	c2,s8	;;4B
	db_c_y	c1,s8	;;4C
	db_c_y	c0,s8	;;4D
	db_c_y	c1,s9	;;4E
	db_c_y	c3,s9	;;4F
	db_c_y	c2,s9	;;4G


	db_c_y	c3,s8	;;4A
	db_c_y	c2,s8	;;4B
	db_c_y	c1,s8	;;4C
	db_c_y	c0,s8	;;4D
	db_c_y	c1,s9	;;4E
	db_c_y	c3,s9	;;4F
	db_c_y	c2,s9	;;4G


	db_c_y	c3,s8	;;4A
	db_c_y	c2,s8	;;4B
	db_c_y	c1,s8	;;4C
	db_c_y	c0,s8	;;4D
	db_c_y	c1,s9	;;4E
	db_c_y	c3,s9	;;4F
	db_c_y	c2,s9	;;4G


	db_c_y	c3,s8	;;4A
	db_c_y	c2,s8	;;4B
	db_c_y	c1,s8	;;4C
	db_c_y	c0,s8	;;4D
	db_c_y	c1,s9	;;4E
	db_c_y	c3,s9	;;4F
	db_c_y	c2,s9	;;4G


	db_c_y	c3,s8	;;4A
	db_c_y	c2,s8	;;4B
	db_c_y	c1,s8	;;4C
	db_c_y	c0,s8	;;4D
	db_c_y	c1,s9	;;4E
	db_c_y	c3,s9	;;4F
	db_c_y	c2,s9	;;4G


	db_c_y	c3,s8	;;4A
	db_c_y	c2,s8	;;4B
	db_c_y	c1,s8	;;4C
	db_c_y	c0,s8	;;4D
	db_c_y	c1,s9	;;4E
	db_c_y	c3,s9	;;4F
	db_c_y	c2,s9	;;4G


	db_c_y	c3,s8	;;4A
	db_c_y	c2,s8	;;4B
	db_c_y	c1,s8	;;4C
	db_c_y	c0,s8	;;4D
	db_c_y	c1,s9	;;4E
	db_c_y	c3,s9	;;4F
	db_c_y	c2,s9	;;4G


	db_c_y	c3,s8	;;4A
	db_c_y	c2,s8	;;4B
	db_c_y	c1,s8	;;4C
	db_c_y	c0,s8	;;4D
	db_c_y	c1,s9	;;4E
	db_c_y	c3,s9	;;4F
	db_c_y	c2,s9	;;4G




	db_c_y	c1,s12	;;COL
	db_c_y	c1,s12	;;D2
	db_c_y	c1,s12	;;11I
	db_c_y	c1,s12	;;11H
	db_c_y	c1,s12	;;12H
	db_c_y	c1,s12	;;13I
	db_c_y	c1,s12	;;13H
	db_c_y	c1,s12	;;13J
	db_c_y	c1,s12	;;ALM
	db_c_y	c1,s12	;;SNZ
	db_c_y	c1,s12	;;SIG
	db_c_y	c1,s12	;;24小时
	db_c_y	c1,s12	;;PM
	db_c_y	c1,s12	;;正计时

;=========================================