.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
.data
aName BYTE "Hello World!",0
nameSize = ($ - aName) - 1
.code
main PROC
	mov ecx, nameSize
	mov esi, 0
L1:
	movzx eax, aName[esi]
	push eax
	inc esi
	LOOP L1

	mov ecx, nameSize
	mov esi, 0

L2:
	pop eax
	mov aName[esi], al
	inc esi
	loop L2
	INVOKE ExitProcess, 0
main ENDP
END main