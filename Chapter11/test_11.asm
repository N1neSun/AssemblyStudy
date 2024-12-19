.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO,dwExitCode:DWORD
Include Irvine32.inc
KEY = 239 ; 1-255之间的任意值
BUFMAX = 128 ; 缓冲区的最大容量

.data
sPrompt BYTE "Enter the plain text:",0
sEncrypt BYTE "Cipher text:",0
sDecrypt BYTE "Decrypted:",0
buffer BYTE BUFMAX+1 DUP(0)
bufSize DWORD ?
.code
main PROC
    call InputTheString
    call TranslateBuffer
    mov edx,OFFSET sEncrypt
    call DisplayMessage
    call TranslateBuffer
    mov edx,OFFSET sDecrypt
    call DisplayMessage
    exit
main ENDP
InputTheString PROC
    pushad ; 保存32位寄存器
    mov edx,OFFSET sPrompt
    call WriteString
    mov ecx,BUFMAX
    mov edx,OFFSET buffer
    call ReadString
    mov bufSize,eax
    call Crlf
    popad
    ret
InputTheString ENDP
DisplayMessage PROC
    pushad
    call WriteString
    mov edx,OFFSET buffer
    call WriteString
    call Crlf
    call Crlf
    popad
    ret
DisplayMessage ENDP
TranslateBuffer PROC
    pushad
    mov ecx,bufSize
    mov esi,0
L1:
    xor buffer[esi],KEY
    inc esi
    loop L1
    popad
    ret
TranslateBuffer ENDP
END main