; AddSubTest.asm
.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
.data
Rval SDWORD ?
Xval SDWORD 26
Yval SDWORD 30
Zval SDWORD 40

.code
main PROC
; INC 和 DEC
    mov ax, 1000h
    inc ax ; 10001h
    dec ax ; 1000h
; 表达式：Rval=-Xval+(Yval-Zval)
    mov eax,Xval
    neg eax ; -26
    mov ebx,Yval
    sub ebx,Zval ; -10
    add eax,ebx
    mov Rval,eax ; -36
; 零标志位示例
    mov cx, 1
    sub cx, 1 ; ZF = 1
    mov ax,0FFFFh
    inc ax ; ZF = 1
; 符号标志位示例
    mov cx, 0
    sub cx, 1 ; SF = 1
    mov ax, 7FFFh
    add ax, 2 ; SF = 1
; 进位标志位示例
    mov al, 0FFh
    add al, 1 ; CF = 1, AL = 00
; 溢出标志位示例
    mov al, +127
    add al, 1 ; OF = 1
    mov al, -128
    sub al, 1 ; OF = 1

    INVOKE ExitProcess,0
main ENDP
END main