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
; 保存开始时间
    call GetMSeconds
    mov startTime,eax
; 开始外层循环
    mov ecx,OUTER_LOOP_COUNT
L1:
    call innerLoop
    loop L1
; 计算执行时间
    call GetMSeconds
    sub eax,startTime
; 显示执行时间
    mov edx,OFFSET msg2
    call WriteString
    call WriteDec ; 输出毫秒数
    call Crlf
    exit
main ENDP
innerLoop PROC
    push ecx ; 保存当前ECX的值
    mov ecx,0FFFFFFFh
L1:
    mul eax ; 使用了一些周期
    mul eax
    mul eax
    loop L1 ; 重复内循环
    pop ecx ; 恢复ECX被保存的值
    ret
innerLoop ENDP
END main