; AddTwo.asm
.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
.data
sum DWORD 0
test1 BYTE 4 DUP("stack")

.code
main PROC
    mov eax,5
    add eax,6
    mov sum,eax

    INVOKE ExitProcess,0
main ENDP
END main