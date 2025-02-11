L_Display_lcd_Prog_Normal_Timer:;显示秒数的lcd_3，lcd4
    JSR		L_A_HexToHexD
	PHA
	AND		#$0F
    LDX     #lcd_d5
    JSR		L_Dis_8Bit_DigitDot_Prog
	LDX		#lcd_d6
	BRA		L_Display_lcd_Prog_Normal_1
;====================================
L_Display_lcd_Prog_Normal_Sec:;显示秒数的lcd_1，lcd2
    JSR		L_A_HexToHexD
	PHA
	AND		#$0F
    LDX     #lcd_d1
    JSR		L_Dis_8Bit_DigitDot_Prog
	LDX		#lcd_d2
L_Display_lcd_Prog_Normal:
	PLA
	JSR		L_ROR_4Bit_Prog
	JMP		L_Dis_8Bit_DigitDot_Prog	
;=======================================
L_Display_lcd_Prog_Normal_Min:;显示秒数的lcd_3，lcd4
    JSR		L_A_HexToHexD
	PHA
	AND		#$0F
    LDX     #lcd_d3
    JSR		L_Dis_8Bit_DigitDot_Prog
	LDX		#lcd_d4
	BRA		L_Display_lcd_Prog_Normal
;=================================
L_Display_lcd_Prog_Normal_Hr:;显示秒数的lcd_5，lcd6
    JSR		L_12_24_Prog
    JSR		L_A_HexToHexD
	PHA
	AND		#$0F
    LDX     #lcd_d5
    JSR		L_Dis_8Bit_DigitDot_Prog
	LDX		#lcd_d6
L_Display_lcd_Prog_Normal_1:
	PLA
	JSR		L_ROR_4Bit_Prog
	BEQ		L_Display_lcd_Prog_Normal_Hr_1
	JMP		L_Dis_8Bit_DigitDot_Prog	
    

L_Display_lcd_Prog_Normal_Hr_1:
	LDA		#10
	JMP		L_Dis_8Bit_DigitDot_Prog
;=======================================
L_Display_lcd_Prog_Normal_Day:;显示秒数的lcd_3，lcd4
    JSR		L_A_HexToHexD
	PHA
	AND		#$0F
    LDX     #lcd_d7
    JSR		L_Dis_8Bit_DigitDot_Prog
	LDX		#lcd_d8
	BRA		L_Display_lcd_Prog_Normal_1
L_Display_lcd_Prog_Normal_ms:;显示秒数的lcd_3，lcd4
    JSR		L_A_HexToHexD
	PHA
	AND		#$0F
    LDX     #lcd_d7
    JSR		L_Dis_8Bit_DigitDot_Prog
	LDX		#lcd_d8
	BRA		L_Display_lcd_Prog_Normal
;=================================
L_Display_lcd_Prog_Normal_Month:;显示秒数的lcd_5，lcd6
    JSR		L_A_HexToHexD
	PHA
	AND		#$0F
    LDX     #lcd_d9
    JSR		L_Dis_8Bit_DigitDot_Prog
	LDX		#lcd_d10
    PLA
    JSR		L_ROR_4Bit_Prog
	BEQ		L_Display_lcd_Prog_Normal_Hr_1
	JSR     F_DispSymbol
    RTS	
    

;=================================
L_Display_lcd_d13_Prog_Normal:
	LDX		#lcd_d13
	JMP		L_Dis_8Bit_DigitDot_Prog
L_Display_lcd_d11_Prog_Normal:
	LDX		#lcd_d11
	JMP		L_Dis_8Bit_DigitDot_Prog
L_Display_lcd_d12_Prog_Normal:
	LDX		#lcd_d12
	JMP		L_Dis_8Bit_DigitDot_Prog
;==================================
L_Clr_Time_Week_Prog:
	LDA		#10
	JSR		L_Display_lcd_d12_Prog_Normal
	LDA		#10
	JSR		L_Display_lcd_d13_Prog_Normal
	JSR		L_Clr_lcd_12H_Prog
	JSR		L_Clr_lcd_13H_Prog
	JSR		L_Clr_lcd_13I_Prog
	JSR		L_Clr_lcd_13J_Prog
L_Clr_lcd_d11_Prog:
    LDA		#10
	JSR		L_Display_lcd_d11_Prog_Normal
    JSR		L_Clr_lcd_11I_Prog
	JSR		L_Clr_lcd_11H_Prog
    RTS
;===============================
L_Clr_lcd_Prog:
    JSR     L_Clr_Day_Prog
    JSR     L_Clr_Month_Prog
    JMP     L_Clr_lcd_D2_Prog
;==================================
L_Clr_Sec_Prog:
    LDX     #lcd_d1
    STX     P_Temp+4
    LDX     #lcd_d2
    STX     P_Temp+5
    BRA     L_Clr_usually_Prog
L_Clr_Min_Prog:
    LDX     #lcd_d3
    STX     P_Temp+4
    LDX     #lcd_d4
    STX     P_Temp+5
    BRA     L_Clr_usually_Prog
L_Clr_Hr_Prog:
    LDX     #lcd_d5
    STX     P_Temp+4
    LDX     #lcd_d6
    STX     P_Temp+5
    BRA     L_Clr_usually_Prog
L_Clr_Day_Prog:
    LDX     #lcd_d7
    STX     P_Temp+4
    LDX     #lcd_d8
    STX     P_Temp+5
    BRA     L_Clr_usually_Prog
L_Clr_Month_Prog:
    LDX     #lcd_d9
    STX     P_Temp+4
    LDX     #lcd_d10
    STX     P_Temp+5
    BRA     L_Clr_usually_Prog

L_Clr_usually_Prog:
    LDA     #10
    LDX     P_Temp+4
    JSR     L_Dis_8Bit_DigitDot_Prog
    LDA     #10
    LDX     P_Temp+5
    JMP     L_Dis_8Bit_DigitDot_Prog
L_Clr_Year_Prog:
    LDX     #lcd_d3
    STX     P_Temp+4
    LDX     #lcd_d4
    STX     P_Temp+5
    JSR     L_Clr_usually_Prog
    LDX     #lcd_d5
    STX     P_Temp+4
    LDX     #lcd_d6
    STX     P_Temp+5
    BRA     L_Clr_usually_Prog