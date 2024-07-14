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
; 选择浅灰背景蓝色文本
    mov eax,BlueTextOnGray
    call SetTextColor
    call CLrscr
    mov esi,OFFSET arrayD
    mov ebx,TYPE arrayD
    mov ecx,LENGTHOF arrayD
    call DumpMem
    call Crlf ;显示一个新空白行
    mov ecx, COUNT
L1:
    mov edx,OFFSET prompt
    call WriteString  
    call ReadInt      ; 输入数据存入EAX
    call Crlf
    call WriteInt     ; 显示为十六进制
    call Crlf
    call WriteBin     ; 显示为二进制
    call Crlf
    call Crlf
    Loop L1
    ;返回控制台窗口的默认颜色
    call WaitMsg      ; "Press any key"
    mov eax,DefaultColor
    call SetTextColor
    call Clrscr
    exit
main ENDP
END main