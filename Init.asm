;------------------------------------------------------
L_Init_SystemRam_Prog:     ;初始化系统RAM的程序数据
	LDA		#0
	STA		R_Mode
	LDA		#4
	STA		R_Reset_Time
	RTS
;======================================================
L_Dis_All_DisRam_Prog:
	LDA		#$FF
	STA		P_Temp
L_All_DisRam:	
	LDX		#0	
L_Loop_DisplayRam:
	LDA		P_Temp
	STA		LCD_RamAddr,X
	INX	
	TXA
	CMP		#$23
	BCC		L_Loop_DisplayRam    ;C=0是跳转
	RTS
;----------------------------------------------------
L_Clr_All_DisRam_Prog:
	LDA		#0
	STA		P_Temp
	BRA		L_All_DisRam	

L_Scankey_INIT:
	LDA		#11110101B;pc0做拨键
	; LDA		#11110101B
	STA		P_PA_IO;PA0输出,其余输入   
	LDA		#11110101B	
	STA		P_PA	;其他全部下拉
	LDA		#10100100B
	STA		P_PA_WAKE;	将PA做唤醒	
	LDA		#0
	STA		P_PC_IO;配置PC0输出高，其余输入低
	LDA		#0B
	STA		P_PC
	SMB0	P_SYSCLK
	RTS
L_Beep_INIT:
	RMB7	P_DIVC
	RMB3	P_DIVC	
	RMB2	P_DIVC	 ; 设置声音频率源为Fsub/16
	LDA		#FFH
	STA		P_AUD
	RMB0	P_AUD_CTL
	RTS


L_PA257_Input_Low:
	LDA		#11110101B	
	STA		P_PA	;其他全部下拉
	RTS
L_PA257_Input_High:
	LDA		#01010001B
	STA		P_PA
	RTS