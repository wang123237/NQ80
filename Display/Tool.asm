L_A_HexToHexD:
	STA		P_Temp								; 将十进制输入保存到 P_Temp
	LDA		#0									; 初始化高位寄存器
	STA		P_Temp+1							; 高位清零
	STA		P_Temp+2							; 低位清零

L_DecToHex_Loop:
	LDA		P_Temp								; 读取当前十进制值
	CMP		#10
	BCC		L_DecToHex_End						; 如果小于16，则跳到结束

	SEC											; 启用借位
	SBC		#10									; 减去16
	STA		P_Temp								; 更新十进制值
	INC		P_Temp+1							; 高位+1，累加十六进制的十位

	BRA		L_DecToHex_Loop						; 重复循环

L_DecToHex_End:
	LDA		P_Temp								; 最后剩余的值是低位
	STA		P_Temp+2							; 存入低位

	LDA		P_Temp+1							; 将高位放入A寄存器准备结果组合
	CLC
	ROL
	ROL
	ROL
	ROL											; 左移4次，完成乘16
	CLC
	ADC		P_Temp+2							; 加上低位值

	RTS
;===========================================

L_12_24_Prog:;12小时和24小时切换
	STA		R_Time_Hr_am_pm	
	BBS2	Sys_Flag_B,L_12_24_Prog_5;判断是24小时制跳转退出
	LDA		R_Time_Hr_am_pm
	BEQ		L_12_24_Prog_1;为0是跳转
	CMP		#11
	BEQ		L_12_24_Prog_4
	BCS		L_12_24_Prog_3;比12大时跳转
L_12_24_Prog_4:
	JSR		L_Clr_lcd_24_Prog
	JSR		L_Clr_lcd_PM_Prog
	LDA		R_Time_Hr_am_pm
L_12_24_Prog_OUT:
	RTS
L_12_24_Prog_1:;0点
	JSR		L_Clr_lcd_24_Prog
	JSR		L_Clr_lcd_PM_Prog
	LDA		#12
	RTS
L_12_24_Prog_3:
	JSR		L_Clr_lcd_24_Prog
	JSR		L_Dis_lcd_PM_Prog
	LDA		R_Time_Hr_am_pm
	CMP		#12
	BEQ		L_12_24_Prog_OUT
	SEC
	SBC		#12
	RTS
L_12_24_Prog_5:
	JSR		L_Dis_lcd_24_Prog
	JSR		L_Clr_lcd_PM_Prog
	LDA		R_Time_Hr_am_pm
	RTS