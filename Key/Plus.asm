L_Scankey_Plus_Time_Prog:
    JSR     L_Scankey_Plus_Time_Prog_1
    JSR		L_Auto_Counter_Week
    JMP     L_Display_Set_Mode_Prog
L_Scankey_Plus_Time_Prog_1:
    CLD
    LDA     R_Mode_Set
    CLC
    ROL
    TAX
    LDA     Table_Plus_1+1,X
    PHA
    LDA     Table_Plus_1,X
    PHA
    RTS

Table_Plus_1:
    DW      L_Scankey_Plus_Time_Sec_Prog-1
    DW      L_Update_Time_Hr_Prog-1
    DW      L_Update_Time_Min_Prog-1
    DW      L_Update_Time_Year_Prog-1
    DW      L_Update_Time_Month_Prog-1
    DW      L_Update_Time_Day_Prog-1
L_Scankey_Plus_Time_Sec_Prog:
    LDA     R_Time_Sec
    STA     P_Temp
    LDA     #0
    STA     R_Time_Sec
    LDA     P_Temp
    CMP     #31
    BCS     L_Scankey_Plus_Time_Sec_Prog_1
    RTS
L_Scankey_Plus_Time_Sec_Prog_1:
    JMP     L_Update_Time_Min_Prog
;==============================================
;第二时间的加法
;============================================
L_Scankey_Plus_Another_Time_Prog:
    LDA     R_Mode_Set
    BNE     L_Scankey_Plus_Another_Time_Prog_Min
    JSR     L_Update_Another_Time_Hr_Prog
    JMP     L_Display_Set_Mode_Prog
L_Scankey_Plus_Another_Time_Prog_Min:
    JSR     L_Update_Another_Time_Min_Prog
    JMP     L_Display_Set_Mode_Prog
;=====================================
L_Scankey_Plus_Positive_Prog:
    RTS
;=====================================
L_Scankey_Plus_Desitive_Prog:
    LDA     #0
    STA     R_Timer_Sec_Countdown
    STA     R_Timer_Sec_Backup
    LDA     R_Mode_Set
    BNE     L_Scankey_Plus_Desitive_Prog_Min
    JSR     L_Update_Timer_Hr_Prog_Desitive_INC
    LDA     R_Timer_Hr_Countdown
    STA     R_Timer_Hr_Backup
    JMP     L_Display_Set_Mode_Prog
    RTS
L_Scankey_Plus_Desitive_Prog_Min:
    JSR     L_Update_Timer_Min_Prog_Desitive_INC
    LDA     R_Timer_Min_Countdown
    STA     R_Timer_Min_Backup
    JMP     L_Display_Set_Mode_Prog

L_Scankey_Plus_Alarm_Clock_Prog:
    JSR     L_Scankey_Plus_Alarm_Clock_Prog_1
    JSR     L_Check_MaxDay_Prog_1
    JMP     L_Display_Set_Mode_Prog

L_Scankey_Plus_Alarm_Clock_Prog_1:
    CLD
    LDA     R_Mode_Set
    CLC
    ROL
    TAX
    LDA     Table_Plus_2+1,X
    PHA
    LDA     Table_Plus_2,X
    PHA
    RTS
Table_Plus_2:
    DW      L_Update_Alarm_Clock_Hr_Prog-1
    DW      L_Update_Alarm_Clock_Min_Prog-1
    DW      L_Update_Alarm_Clock_Month_Prog-1
    DW      L_Update_Alarm_Clock_Day_Prog-1

L_Check_MaxDay_Prog_1:
    LDA     R_Alarm_Clock_Month
    BEQ     L_Scankey_Plus_Positive_Prog
    TAX 
    JSR     L_Check_LeapYear_MaxDay_Prog
    STA     P_Temp+5
    CMP     R_Alarm_Clock_Day
    BCS     L_Scankey_Plus_Positive_Prog
    LDA     P_Temp+5
    STA     R_Alarm_Clock_Day
    RTS
    
    