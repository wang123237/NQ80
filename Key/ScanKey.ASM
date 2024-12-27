;==================================================
L_LCD_IRQ_WorkProg:;
	BBR0	Sys_Flag_A,L_END_LCD_IRQ_WorkProg;32hz扫键
	RMB0	Sys_Flag_A
	JSR		L_control_Beep_prog
	LDA		R_Reset_Time
	BNE		L_END_LCD_IRQ_WorkProg
	JSR		L_Scankey_Prog
L_END_LCD_IRQ_WorkProg:
    RTS	
; ==============================================
L_ScanKey_Null_Prog:;如果编码器没有开启退出并且扫描到空键，停止按键扫描	
	LDA		R_Voice_Unit
	BNE		L_END_LCD_IRQ_WorkProg
	DIS_LCD_IRQ
	EN_PA_IRQ
	RTS
L_Scankey_Prog_Ineffective:
	LDA		#11101001B
	AND		Sys_Flag_A
	STA		Sys_Flag_A
	JSR		L_Scankey_usually_Prog
	LDA		P_Scankey_value_Temporary
	BNE		L_END_LCD_IRQ_WorkProg;如果为0则执行空键程序
	JSR		L_PA257_Input_Low
	RMB5	Sys_Flag_A;清空无效标志位
	RTS

;====================================================
L_Scankey_Prog:
	BBS1	Sys_Flag_A,L_Scankey_Prog_First;首次扫描判断
	BBS4	Sys_Flag_A,L_Scankey_Prog_Fast_Plus_TO;快加情况
	BBS5	Sys_Flag_A,L_Scankey_Prog_Ineffective
	BBR2	Sys_Flag_A,L_ScanKey_Null_Prog;没有按键扫描标志
	JSR		L_Scankey_usually_Prog
	LDA		P_Scankey_value_Temporary
	CMP		P_Scankey_value
	BNE		L_Scankey_Prog_Short_Press_TO
	
	LDA		R_Scankey_Time
	CMP		#D_Rscankey_TWO_Sec
	BCS		L_Scankey_Prog_Long_Press_TO
	INC		R_Scankey_Time
	RTS
L_Scankey_Prog_Long_Press_TO:
	JMP		L_Scankey_Prog_Long_Press
L_Scankey_Prog_Short_Press_TO:
	JMP		L_Scankey_Prog_Short_Press
L_Scankey_Prog_Fast_Plus_TO:
	JMP		L_Scankey_Prog_Fast_Plus	
L_Scankey_Prog_First:
	LDA		#11001001B
	AND		Sys_Flag_A
	STA		Sys_Flag_A;清空无效标志位

	JSR		L_Scankey_usually_Prog
	LDA		P_Scankey_value_Temporary
	BEQ		L_ScanKey_Null_Prog
	STA		P_Scankey_value


	LDA		#0
	STA		R_Close_Beep_Time
	STA		R_Voice_Unit
	STA		R_Set_Mode_Exit_Time
	STA		R_Alarm_Clock_Open_Beep_Time
	STA		R_Scankey_Time


	; BBS4	Sys_Flag_D,L_Scankey_Short_ST_SP_Press_Prog_Alarm_TO
	; BBS4	Sys_Flag_C,L_Scankey_Short_ST_SP_Press_Prog_Alarm_TO;闹铃判断
	SMB2	Sys_Flag_A

	LDA		P_Scankey_value
	CMP		#D_Light_Press
	; BEQ		L_ScanKey_Light_Press_Prog_TO
;=======================
;-----按键无效键和按下触发的事件判定
	BBS3	Sys_Flag_A,L_Scankey_Set_Mode_First_Press_Prog_TO
	LDA		P_Scankey_value
	CMP		#D_Mode_Press
	BEQ		L_Scankey_Mode_Press_Prog_TO
	LDA		R_Mode
	BEQ		L_Clock_First_Press_Prog_TO
	CMP		#1
	BEQ		L_Alarm_First_Press_Prog_TO
	CMP		#2
	BEQ		L_Positive_Timer_First_Press_Prog_TO
	CMP		#3
	BEQ		L_Clock_Twice_First_Press_Prog_TO
	CMP		#4
	BEQ		L_Desitive_Timer_First_Press_Prog_TO
	LDA		#0
	STA		R_Mode
	JSR		L_Clr_All_DisRam_Prog
	JSR		L_Display_Prog
	SMB5	Sys_Flag_A
L_Scankey_Prog_First_OUT:
	RTS
;==============================================
L_Scankey_Set_Mode_First_Press_Prog_TO:
	JMP		L_Scankey_Set_Mode_First_Press_Prog
L_Scankey_Mode_Press_Prog_TO:
	JMP		L_Scankey_Mode_Press_Prog
L_Clock_First_Press_Prog_TO:
	JMP		L_Clock_First_Press_Prog
L_Alarm_First_Press_Prog_TO:
	JMP		L_Alarm_First_Press_Prog
L_Positive_Timer_First_Press_Prog_TO:
	JMP		L_Positive_Timer_First_Press_Prog
L_Clock_Twice_First_Press_Prog_TO:
	JMP		L_Clock_Twice_First_Press_Prog
L_Desitive_Timer_First_Press_Prog_TO:
	JMP		L_Desitive_Timer_First_Press_Prog
L_Scankey_Set_Mode_Mode_First_Press_Prog_TO
	JMP		L_Scankey_Set_Mode_Mode_First_Press_Prog
L_Scankey_Set_Mode_Reset_First_Press_Prog_TO:
	JMP		L_Scankey_Set_Mode_Reset_First_Press_Prog
L_Scankey_Set_Mode_ST_SP_First_Press_Prog_TO:
	JMP		L_Scankey_Plus_Prog
;============================================
L_Scankey_Set_Mode_First_Press_Prog:
	LDA		P_Scankey_value
	CMP		#D_Mode_Press
	BEQ		L_Scankey_Set_Mode_Mode_First_Press_Prog_TO
	CMP		#D_Reset_Press
	BEQ		L_Scankey_Set_Mode_Reset_First_Press_Prog_TO
	LDA		#D_ST_SP_Press
	BEQ		L_Scankey_Set_Mode_ST_SP_First_Press_Prog_TO
	SMB5	Sys_Flag_A
	RTS