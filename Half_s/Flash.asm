L_SysFlash_Prog:
	JSR		L_SysFlash_Prog_1
	; JSR		L_SysFlash_Prog_2
	; ; JSR		L_SysFlash_Prog_Beep_1;蜂鸣器标志
	; BBS3	Sys_Flag_A,L_SysFlash_Prog_OUT;设置模式闪烁
	; LDA		R_Mode
	; BNE		L_SysFlash_Prog_OUT
	; LDX		#lcd_col
	; JSR		F_ClrpSymbol
L_SysFlash_Prog_OUT:
	RTS
;===============================================
L_SysFlash_Prog_1:;设置模式时闪烁，快加不闪烁
	; BBR3	Sys_Flag_A,L_SysFlash_Prog_OUT;设置模式闪烁
	; CLD
	; LDA		R_Mode_Set
	; CLC
	; ROL
	; TAX
	; LDA		Table_Dis_4+1,X
	; PHA
	; LDA		Table_Dis_4,X
	RTS
