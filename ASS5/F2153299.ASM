EXTRN	DISPBX: FAR		; �����ⲿ����DISPBX; �˺������ڱ�ģ���б�����
MYDATA SEGMENT
DATA DW 1234H,5678H,9D4CH,0D7H,0,-1,7D2AH,8A0EH,10F5H,645DH,8000H,8004H,1,7FFFH,8201H,9023H,2345H
N EQU ($-DATA)/2
Msg DB  " is minimum even number",0DH,0AH,"$"
MIN DW ?
MYDATA ENDS
CODE    SEGMENT
        ASSUME  CS:CODE,DS:MYDATA
START:  MOV     AX,MYDATA
        MOV     DS,AX
        MOV     CX,N-1
        MOV     BX,OFFSET DATA
        MOV     AX,[BX]
AGAIN:  INC     BX
        INC     BX
        MOV     SI,[BX]
        TEST    SI,01H;��֤�Ƿ�Ϊż��
        JNZ     NEXT
        CMP     AX,[BX];��֤�Ƿ��С
        JLE     NEXT
        MOV     AX,[BX]
NEXT:   LOOP    AGAIN
        MOV     MIN,AX
        MOV     BX,MIN
        CALL    DISPBX;�����ⲿ����DISPBX����BX���ݲ���
        MOV     AH,2
        MOV     DL,48H;���'H'
        INT     21H
        MOV 	AH, 9
	    MOV     DX,OFFSET Msg
	    INT 	21H
        MOV     AH,4CH
        INT     21H
CODE    ENDS
       	END	START
