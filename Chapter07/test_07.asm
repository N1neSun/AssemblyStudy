.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
.data
array DWORD 10000h,20000h,30000h,40000h,50000h
thisSum DWORD ?
.code
main PROC
	mov esi,OFFSET array
	mov ecx,LENGTHOF array
	call ArraySum
	mov thisSum,eax

	INVOKE ExitProcess, 0
main ENDP
ArraySum PROC
	push esi
	push ecx
	mov  eax,0

L1: add eax, [esi]
	add esi,TYPE DWORD

	loop L1

	pop ecx
	pop esi
	ret
ArraySum ENDP
END main