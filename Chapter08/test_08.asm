.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO,dwExitCode:DWORD
Include Irvine32.inc

.data
COUNT = 4
BlueTextOnGray = blue + (lightGray * 16)
DefaultColor = lightGray + (black * 16)
arrayD SDWORD 12345678h,1A4B2000h,3434h,7AB9h
prompt BYTE "Enter a 32-bit signed integer:", 0
.code
main PROC
; ѡ��ǳ�ұ�����ɫ�ı�
    mov eax,BlueTextOnGray
    call SetTextColor
    call CLrscr
    mov esi,OFFSET arrayD
    mov ebx,TYPE arrayD
    mov ecx,LENGTHOF arrayD
    call DumpMem
    call Crlf ;��ʾһ���¿հ���
    mov ecx, COUNT
L1:
    mov edx,OFFSET prompt
    call WriteString  
    call ReadInt      ; �������ݴ���EAX
    call Crlf
    call WriteInt     ; ��ʾΪʮ������
    call Crlf
    call WriteBin     ; ��ʾΪ������
    call Crlf
    call Crlf
    Loop L1
    ;���ؿ���̨���ڵ�Ĭ����ɫ
    call WaitMsg      ; "Press any key"
    mov eax,DefaultColor
    call SetTextColor
    call Clrscr
    exit
main ENDP
END main