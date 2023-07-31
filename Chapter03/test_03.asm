; AddVariables.asm
.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
.data
val1 WORD 1000h
val2 WORD 2000h
arrayB BYTE 10h,20h,30h,40h,50h
arrayW WORD 100h,200h,300h
arrayD DWORD 10000h,20000h

.code
main PROC
; MOVZX
    mov bx, 0A69Bh
    movzx eax, bx ; EAX = 0000A69Bh
    movzx edx, bl ; EDX = 0000009Bh
    movzx cx, bl ; CX = 009Bh
; MOVSX
    mov bx, 0A69Bh
    movsx eax, bx ; EAX = FFFFA69Bh
    movsx edx, bl ; EDX = FFFFFF9Bh
    mov bl, 7Bh ; CX = 007Bh
    movsx cx, bl
; memory-exchange
    mov ax, val1 ; AX = 1000h
    xchg ax, val2 ; AX = 2000h, val2=1000h
    mov val1, ax ; val1 = 2000h
; byte Array
    mov al, arrayB ; AL = 10h
    mov al, [arrayB+1] ; AL = 20h
; word Array
    mov ax, arrayW ; AL = 100h
    mov ax, [arrayW+2] ; AL = 200h
; dword Array
    mov eax, arrayD ; AL = 10000h
    mov eax, [arrayD+4] ; AL = 20000h

    INVOKE ExitProcess,0
main ENDP
END main