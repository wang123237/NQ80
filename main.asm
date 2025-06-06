;********************************************************************************
; PROJECT	: Calendar(MC830B)							*
; AUTHOR	: WBN										*
; REVISION	: 13/9/2024  V1.0	First issue				*
; High OSC CLK  : Internal RC 4.4MHz	Fcpu = Fosc/2				*
; Function	: 								*
;********************************************************************************
	.CHIP	W65C02S      ;cpu的选型
	;.INCLIST	ON       ;宏定义和文件
	.MACLIST	ON
;***************************************
CODE_BEG	EQU		F000H ;C000H(4K*4次)        ;起始地址
;***************************************

PROG	SECTION	OFFSET	CODE_BEG                ;定义代码段的偏移量从CODE_BEG开始，用于组织程序代码。

;***************************************
;*	header include                               ;头文件
;***************************************
	.include	50P016.h
	.INCLUDE	RAM.INC	
	.include	50P016.mac
	.INCLUDE	MACRO.MAC
;***************************************
STACK_BOT		EQU		FFH                     ;堆栈底部
;***************************************
	.PROG										;程序开始
V_RESET:
	NOP
	NOP
	NOP
	LDX		#STACK_BOT  
	TXS	      ;使用这个值初始化堆栈指针，这通常是为了设置堆栈的底部地址，确保程序运行中堆栈的正确使用。
	LDA		#$B7	;#$07    
	STA		SYSCLK	;设置系统时钟
	LDA		FUSE
	STA		MF	;精准主频3.64M
;***************************************	
	ClrAllRam	;清空ram
	WDTC_CLR	
	;CHECK_LCD   ;初始化LCD
;***************************************定时器初始化，特殊功能寄存器初始化
	LDA		#0
	STA		PADF1  ;定时器0的时钟源选择
	STA		TMR0   ;128HZ
	STA		TMR1   ;512
	STA		TMR2	;定时器的开始数
	STA		DIVC    ;分频控制器，定时器与DICV异步   2048
	STA		IER     ;不允许中断
	STA		IFR     ;中断请求标志
	STA		AUD0    ;pwm输出值设置
	STA		AUDCR   ;
	STA		PB
;***************************************LCD初始化
	LCD_C_TYPE
	LCD_ENCH_EN
	;LCD_4COM
	LCD_DRIVE_4
	RMB2	LCDCTRL
	SMB3	LCDCTRL
	RMB0	P_LCD_COM
	SMB1	P_LCD_COM;设置为5com
	RMB5	P_LCD_COM;设置LCD中断频率为32Hz
;***************************************端口配置（等待图纸）
	JSR		L_Scankey_INIT
	PB2_PB2_NOMS
	PB3_PB3_NOMS
	PC03_SEG
	PC45_SEG
	PC67_SEG
	PD03_SEG
	PD47_SEG;
	JSR		L_Init_SystemRam_Prog   ;初始化系统RAM并禁用所有断电保留的RAM
	JSR		L_Dis_All_DisRam_Prog	;初始化系统RAM并禁用所有断电保留的RAM
;***************************************开启中断	
	; SMB0	DIVC
	; SMB1	DIVC
	; RMB2	DIVC
	TMR1_CLK_512Hz;初始化定时器1为256hz,定时器2为512hz
	LDA		#174
	STA		TMR2
	LCD_ON
	TMR1_ON;半秒计时
	EN_TMR1_IRQ              ;定时器和LCD使能
	EN_PA_IRQ;下降沿触发
	LDA		#$07		;#$07    系统时钟和中断使能
	STA		SYSCLK		;Strong

	CLI
;***********************************************************************
;***********************************************************************
MainLoop:	




	JSR		L_LCD_IRQ_WorkProg
	JSR		L_Half_Second_Prog

	JSR		L_Clr_Alarm_Prog_set
	JSR		L_Control_Positive_Timer_Prog
	LDA		R_Reset_Time
	ORA		R_Voice_Unit
	BNE		MainLoop

	SMB4	SYSCLK;280k
	STA		P_HALT	
	RMB4	SYSCLK;560k
	BRA		MainLoop		

;***********************************************************************
;***********************************************************************
V_IRQ:
	PHA
	LDA		P_IER
	AND		P_IFR
	STA		R_Int_Backup	

	BBS6	R_Int_Backup,L_LcdIrq	
	BBS3	R_Int_Backup,L_Timer2Irq
	BBS4	R_Int_Backup,L_PaIrp
	BBS0	R_Int_Backup,L_DivIrq	
	BBS2	R_Int_Backup,L_Timer1Irq
	BBS1	R_Int_Backup,L_Timer0Irq
	BRA		L_EndIrq

L_DivIrq:
	CLR_DIV_IRQ_FLAG
	BRA		L_EndIrq

L_Timer2Irq:
	CLR_TMR2_IRQ_FLAG
	WDTC_CLR	
	BBR0	Sys_Flag_D,L_Timer2Irq_1
	INC		R_Timer_Ms
L_Timer2Irq_1:
	BBR4	Sys_Flag_C,L_EndIrq
	INC		R_Alarm_Ms
	BRA		L_EndIrq
	
L_Timer0Irq:
	CLR_TMR0_IRQ_FLAG 
	BRA		L_EndIrq

L_Timer1Irq:
	CLR_TMR1_IRQ_FLAG
	WDTC_CLR		
	SMB0	Sys_Flag_B	;设置Half Second Flag
	BRA		L_EndIrq
	
L_PaIrp:
	CLR_KEY_IRQ_FLAG
	EN_LCD_IRQ	
	DIS_PA_IRQ
	SMB1	Sys_Flag_A
	BRA		L_EndIrq
L_LcdIrq:
	CLR_LCD_IRQ_FLAG 
	SMB0	Sys_Flag_A	;设置LCD中断标志，32Hz扫描
L_EndIrq:
;	BBS3	IFR,L_Timer2Irq
	PLA
	RTI
;***********************************************************************
.INCLUDE	Init.asm

.INCLUDE	Key\ScanKey.ASM
.INCLUDE	Key\Scankey_First_Press.asm
.INCLUDE	Key\Scankey_First_Set_Mode.asm
.INCLUDE	Key\Plus.asm
.INCLUDE	Key\Scankey_Normal.asm

.INCLUDE	Display\Disp.asm
.INCLUDE	Display\Lcdtab.asm
.INCLUDE	Display\Display.asm
.INCLUDE	Display\Display_Time.asm
.INCLUDE	Display\Display_Alarm.asm
.INCLUDE	Display\Display_Timer.asm
.INCLUDE	Display\Display_Symbol.asm
.INCLUDE	Display\Display_Normal.asm
.INCLUDE	Display\Tool.asm




.INCLUDE	Half_s\Half.asm
.INCLUDE	Half_s\Clock.asm
.INCLUDE	Half_s\Alarm_Clock.asm
.INCLUDE	Half_s\Timer.asm
.INCLUDE	Half_s\Common.asm
.INCLUDE	Half_s\Flash.asm

.INCLUDE	Sound\Beep.asm

.INCLUDE	Delay.asm

;--------------------------------------------------------	
;***********************************************************************
	.BLKB	$FFFF-$,$FF
	
	.ORG	0FFF8H
	
	DB		11110111B	;
; bit0 	=0
; bit1	=0
; bit2 	=0当PA7做复位时，只能写1低电平有效，高电平有效烧录会报错
; bit3	=0PA口做输入下拉和输入上拉，1PA口做输入下拉和三态
; bit4 	=0
; bit5 	=0
; bit6	=0VDD=1.5V,1 VDD=3V
; bit7	=0做复位，1做PA7口
	DB		11111111B	;

;***********************************************************************
	.ORG	0FFFCH
	DW		V_RESET
	DW		V_IRQ
	
	.ENDS
	.END
	