.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
.data
intarray DWORD 10000h,20000h,30000h,40000h
.code
main PROC
	mov edi,OFFSET intarray ; 1: EDI=intarray地址
	mov ecx,LENGTHOF intarray ; 2: 循环计数器初始化
	mov eax,0 ; 3: sum=0
L1:
	add eax,[edi] ; 5: 加一个整数
	add edi,TYPE intarray ; 6: 指向下一个元素
	loop L1 ; 7: 重复，直到ECX=0

	invoke ExitProcess,0
main ENDP
END main