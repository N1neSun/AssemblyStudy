; AddVariables.asm
.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
.data
firstval DWORD 20002000h
secondval DWORD 11111111h
thirdval DWORD 22222222h
sum DWORD 0
rowSize = 5
count TEXTEQU %(rowSize * 2)
move TEXTEQU <mov>
setupAL TEXTEQU <move al,count>
M1 WORD count

.code
main PROC
    mov eax,firstval
    add eax,secondval
    add eax,thirdval
    mov sum,eax
    setupAL

    INVOKE ExitProcess,0
main ENDP
END main