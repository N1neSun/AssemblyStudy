.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO,dwExitCode:DWORD
Include Irvine32.inc

TAB = 9 ; Tab��ASCII��
.code
main PROC
    call Randomize  ; ��ʼ�����������
    call Rand1
    call Rand2
    exit
main ENDP

Rand1 PROC
    mov ecx, 10 ; ѭ��10��
L1:
    call Random32 ; �����������
    call WriteDec ; ���޷���ʮ������ʽ���
    mov al,TAB
    call WriteChar ; ����Ʊ��
    loop L1
    call Crlf
    ret
Rand1 ENDP
Rand2 PROC
    mov ecx,10
L1:
    mov eax,100 ; ���ɷ�Χ0-99
    call RandomRange ; �����������
    sub eax,50 ; ��ֵ��Χ-50��+49
    call WriteInt ; ���з���ʮ������ʽ���
    mov al,TAB ; ˮƽ�Ʊ��
    call WriteChar ; ����Ʊ��
    loop L1
    call Crlf
    ret
Rand2 ENDP
END main