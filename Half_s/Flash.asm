L_SysFlash_Prog:
	JSR		L_SysFlash_Prog_1
	LDA		R_Mode
	CMP		#2
	BNE		L_SysFlash_Prog_OUT
	BBR0	Sys_Flag_D,L_SysFlash_Prog_OUT
	LDX		#lcd_col
	JSR		F_ClrpSymbol
L_SysFlash_Prog_OUT:
	RTS
;===============================================
L_SysFlash_Prog_1:;设置模式时闪烁，快加不闪烁
	BBR3	Sys_Flag_A,L_SysFlash_Prog_OUT
	BBS4	Sys_Flag_A,L_SysFlash_Prog_OUT
	CLD
	LDA		R_Mode
	CLC
	ROL
	TAX
	LDA		Table_Clr_1+1,X	
	PHA
	LDA		Table_Clr_1,X
	PHA
	RTS






L_Clr_Time_Normal_Prog:
	LDA		R_Mode_Set
	CLD
	CLC
	ROL
	TAX
	LDA		Table_Clr_2+1,X
	PHA
	LDA		Table_Clr_2,X
	PHA
	RTS

L_Clr_Alarm_Normal_Prog:
	LDA		R_Mode_Set
	CLD
	CLC
	ROL
	TAX
	LDA		Table_Clr_3+1,X
	PHA
	LDA		Table_Clr_3,X
	PHA
	RTS

L_Clr_Positive_Timer_Normal_Prog:
	RTS

L_Clr_Another_Time_Normal_Prog:
	LDA		R_Mode_Set
	CLD
	CLC
	ROL
	TAX
	LDA		Table_Clr_4+1,X
	PHA
	LDA		Table_Clr_4,X
	PHA
	RTS

L_Clr_Destive_Timer_Normal_Prog:
	LDA		R_Mode_Set
	CLD
	CLC
	ROL
	TAX
	LDA		Table_Clr_5+1,X
	PHA
	LDA		Table_Clr_5,X
	PHA
	RTS

Table_Clr_1:
	DW		L_Clr_Time_Normal_Prog-1
	DW		L_Clr_Alarm_Normal_Prog-1
	DW		L_Clr_Positive_Timer_Normal_Prog-1
	DW		L_Clr_Another_Time_Normal_Prog-1
	DW		L_Clr_Destive_Timer_Normal_Prog-1

Table_Clr_2:
	DW		L_Clr_Sec_Prog-1
	DW		L_Clr_Hr_Prog-1
	DW		L_Clr_Min_Prog-1
	DW		L_Clr_Year_Prog-1
	DW		L_Clr_Month_Prog-1
	DW		L_Clr_Day_Prog-1
	

Table_Clr_3:
	DW		L_Clr_Hr_Prog-1
	DW		L_Clr_Min_Prog-1
	DW		L_Clr_Month_Prog-1
	DW		L_Clr_Day_Prog-1

Table_Clr_4:
	DW		L_Clr_Hr_Prog-1
	DW		L_Clr_Min_Prog-1
	

Table_Clr_5:
	DW		L_Clr_Hr_Prog-1
	DW		L_Clr_Min_Prog-1
	