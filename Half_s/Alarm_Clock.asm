L_Alarm_Prog:;闹钟判断的时间是贪睡闹钟时间，而正常闹钟时间作为显示闹钟时间
	LDA		R_Alarm_Mode
	BEQ		L_Alarm_Prog_OUT
	
	LDA		R_Time_Sec
	BNE		L_Alarm_Prog_OUT
	LDA		R_Time_Min
	CMP		R_Alarm_Clock_Hr
	BNE		L_Alarm_Prog_OUT
	LDA		R_Time_Min
	CMP		R_Alarm_Clock_Min
	BNE		L_Alarm_Prog_OUT

	CLD
	LDA		R_Alarm_Clock_Mode
	CLC
	ROL
	TAX	
	LDA		R_Alarm_Clock_Mode





L_Alarm_Once_Month_Prog:;一个月的闹钟	,定月闹钟
	LDA		R_Time_Month
	CMP		R_Alarm_Clock_Month
	BNE		L_Alarm_Prog_OUT
	BRA		L_Alarm_Control_Prog
L_Alarm_Every_Month_Prog;月次闹钟
	LDA		R_Time_Day
	CMP		R_Alarm_Clock_Day
	BNE		L_Alarm_Prog_OUT
	BRA		L_Alarm_Control_Prog

L_Alarm_Once_Month_Day_Prog:;定日闹钟
	LDA		R_Time_Month
	CMP		R_Alarm_Clock_Month
	BNE		L_Alarm_Prog_OUT
	LDA		R_Time_Day
	CMP		R_Alarm_Clock_Day
	BNE		L_Alarm_Prog_OUT
	BRA		L_Alarm_Control_Prog






L_Alarm_Control_Prog:	
	LDA		R_Alarm_Mode
	CMP		#2
	BNE		L_Alarm_Control_Prog_2
	SMB7	Sys_Flag_C
	LDA		#D_Snz_Frequency
	STA		R_Snz_Frequency
	LDA		#D_Snz_Time
	STA		R_Snz_Time
L_Alarm_Control_Prog_2:
	BBR4	Sys_Flag_D,L_Alarm_Prog_1
	; JSR		L_Scankey_Close_Timer_Beep
	
	
L_Alarm_Prog_1:
	SMB4	Sys_Flag_C
	LDA		#D_Beep_Open_Last_Time_Alarm
	STA		R_Close_Beep_Time

	
L_Alarm_Prog_OUT:
	RTS
		
Table_2:
	DW		L_Alarm_Control_Prog-1
	DW		L_Alarm_Once_Month_Day_Prog-1
	DW		L_Alarm_Once_Month_Prog-1
	DW		L_Alarm_Every_Month_Prog-1
;=========================================================================================================
L_Update_Alarm_Clock_Min_Prog:;时间分钟更新加
	LDX		#(R_Alarm_Clock_Min-Time_Str_Addr)
	JMP		L_Inc_To_60_Prog
;---------------------------
L_Update_Alarm_Clock_Hr_Prog:;时间小时更新加
	LDX		#(R_Alarm_Clock_Hr-Time_Str_Addr)
	LDA		#23
	JMP		L_Inc_To_Any_Count_Prog
;----------------------------------
L_Update_Alarm_Clock_Day_Prog:;时间天数更新加
	LDA		#31
	LDX		#(R_Alarm_Clock_Day-Time_Str_Addr)
	JMP		L_Inc_To_Any_Count_Prog_To_1
;-------------------------------------
L_Update_Alarm_Clock_Month_Prog:;时间月更新加
	LDX		#(R_Alarm_Clock_Month-Time_Str_Addr)
	LDA		#12
	JMP		L_Inc_To_Any_Count_Prog_To_1
