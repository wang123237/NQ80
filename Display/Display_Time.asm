L_Display_Another_Time_Min_Prog:
	LDA		R_Time_Min_Another
	JMP		L_Display_lcd_Prog_Normal_Min
L_Display_Another_Time_Hr_Prog:
	LDA		R_Time_Hr_Another
	JMP		L_Display_lcd_Prog_Normal_Hr	
L_Display_Another_Time_DT_Symbol_Prog:
	LDA		#0
	JSR		L_Display_lcd_d13_Prog_Normal
	LDA		#15
	JSR		L_Display_lcd_d12_Prog_Normal
	JSR		L_Dis_lcd_13H_Prog
	JMP		L_Dis_lcd_12H_Prog
;===============================================

L_Display_Time_Sec_Prog:
	LDA		R_Time_Sec
	JMP		L_Display_lcd_Prog_Normal_Sec
;======================================
L_Display_Time_Min_Prog:
	LDA		R_Time_Min
	JMP		L_Display_lcd_Prog_Normal_Min
;=====================================
L_Display_Time_Hr_Prog:
	LDA		R_Time_Hr
	JMP		L_Display_lcd_Prog_Normal_Hr
;=====================================
L_Display_Time_Day_Prog:
	LDA		R_Time_Day
	JMP		L_Display_lcd_Prog_Normal_Day
;=====================================
L_Display_Time_Month_Prog:
	LDA		R_Time_Month
	JMP		L_Display_lcd_Prog_Normal_Month
;========================================
L_Display_Time_Year_Prog:
	LDA		#20
	JSR		L_Display_lcd_Prog_Normal_Timer
	LDA		R_Time_Year
	JMP		L_Display_lcd_Prog_Normal_Min

;============================================
L_Display_Time_Week_Prog:
	CLD
    LDA     R_Time_Week
    CLC
    ROL
    TAX
    LDA     Table_Dis_Week+1,X
    PHA
    LDA     Table_Dis_Week,X
    PHA
    RTS
Table_Dis_Week:
	DW		L_Display_Time_Sunday_Prog-1
	DW		L_Display_Time_Monday_Prog-1
	DW		L_Display_Time_Tuesday_Prog-1
	DW		L_Display_Time_WednesDay_Prog-1
	DW		L_Display_Time_Thursday_Prog-1
	DW		L_Display_Time_Friday_Prog-1
	DW		L_Display_Time_Saturday_Prog-1



L_Display_Time_Monday_Prog:
	LDA		#14
	JSR		L_Display_lcd_d11_Prog_Normal
	LDA		#0
	JSR		L_Display_lcd_d12_Prog_Normal
	LDA		#14
	JSR		L_Display_lcd_d13_Prog_Normal
	JSR		L_Dis_lcd_13J_Prog
	JSR		L_Dis_lcd_13H_Prog
	JSR		L_Dis_lcd_11H_Prog
	RTS
L_Display_Time_Tuesday_Prog:
	LDA		#17
	JSR		L_Display_lcd_d11_Prog_Normal
	LDA		#16
	JSR		L_Display_lcd_d12_Prog_Normal
	LDA		#15
	JSR		L_Display_lcd_d13_Prog_Normal
	JSR		L_Dis_lcd_13H_Prog
	RTS
L_Display_Time_WednesDay_Prog:
	LDA		#0
	JSR		L_Display_lcd_d11_Prog_Normal
	LDA		#17
	JSR		L_Display_lcd_d12_Prog_Normal
	LDA		#16
	JSR		L_Display_lcd_d13_Prog_Normal
	JSR		L_Dis_lcd_13I_Prog
	JSR		L_Dis_lcd_13J_Prog
	JSR		L_Dis_lcd_11H_Prog
	JSR		L_Dis_lcd_11I_Prog
	RTS
L_Display_Time_Thursday_Prog:
	LDA		#16
	JSR		L_Display_lcd_d11_Prog_Normal
	LDA		#12
	JSR		L_Display_lcd_d12_Prog_Normal
	LDA		#15
	JSR		L_Display_lcd_d13_Prog_Normal
	JSR		L_Dis_lcd_13H_Prog
	RTS
L_Display_Time_Friday_Prog:
	LDA		#1
	JSR		L_Display_lcd_d11_Prog_Normal
	LDA		#18
	JSR		L_Display_lcd_d12_Prog_Normal
	LDA		#19
	JSR		L_Display_lcd_d13_Prog_Normal
	JSR		L_Dis_lcd_12H_Prog
	RTS
L_Display_Time_Saturday_Prog:
	LDA		#15
	JSR		L_Display_lcd_d11_Prog_Normal
	LDA		#18
	JSR		L_Display_lcd_d12_Prog_Normal
	LDA		#5
	JSR		L_Display_lcd_d13_Prog_Normal
	JSR		L_Dis_lcd_11H_Prog
	RTS			
L_Display_Time_Sunday_Prog:
	LDA		#14
	JSR		L_Display_lcd_d11_Prog_Normal
	LDA		#16
	JSR		L_Display_lcd_d12_Prog_Normal
	LDA		#5
	JSR		L_Display_lcd_d13_Prog_Normal
	JSR		L_Dis_lcd_11H_Prog
	RTS


	


	

