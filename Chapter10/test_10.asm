.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO,dwExitCode:DWORD
Include Irvine32.inc

.data
OUTER_LOOP_COUNT = 3
startTime DWORD ?
msg1 byte "Please wait...",0dh,0ah,0
msg2 byte "Elapsed milliseconds:",0
.code
main PROC
    mov edx,OFFSET msg1
    call WriteString
; ���濪ʼʱ��
    call GetMSeconds
    mov startTime,eax
; ��ʼ���ѭ��
    mov ecx,OUTER_LOOP_COUNT
L1:
    call innerLoop
    loop L1
; ����ִ��ʱ��
    call GetMSeconds
    sub eax,startTime
; ��ʾִ��ʱ��
    mov edx,OFFSET msg2
    call WriteString
    call WriteDec ; ���������
    call Crlf
    exit
main ENDP
innerLoop PROC
    push ecx ; ���浱ǰECX��ֵ
    mov ecx,0FFFFFFFh
L1:
    mul eax ; ʹ����һЩ����
    mul eax
    mul eax
    loop L1 ; �ظ���ѭ��
    pop ecx ; �ָ�ECX�������ֵ
    ret
innerLoop ENDP
END main