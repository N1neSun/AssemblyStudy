.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
.data
intarray DWORD 10000h,20000h,30000h,40000h
.code
main PROC
	mov edi,OFFSET intarray ; 1: EDI=intarray��ַ
	mov ecx,LENGTHOF intarray ; 2: ѭ����������ʼ��
	mov eax,0 ; 3: sum=0
L1:
	add eax,[edi] ; 5: ��һ������
	add edi,TYPE intarray ; 6: ָ����һ��Ԫ��
	loop L1 ; 7: �ظ���ֱ��ECX=0

	invoke ExitProcess,0
main ENDP
END main