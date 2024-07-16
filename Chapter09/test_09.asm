.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO,dwExitCode:DWORD
Include Irvine32.inc

TAB = 9 ; Tab的ASCII码
.code
main PROC
    call Randomize  ; 初始化随机生成器
    call Rand1
    call Rand2
    exit
main ENDP

Rand1 PROC
    mov ecx, 10 ; 循环10次
L1:
    call Random32 ; 生成随机整数
    call WriteDec ; 用无符号十进制形式输出
    mov al,TAB
    call WriteChar ; 输出制表符
    loop L1
    call Crlf
    ret
Rand1 ENDP
Rand2 PROC
    mov ecx,10
L1:
    mov eax,100 ; 生成范围0-99
    call RandomRange ; 生成随机整数
    sub eax,50 ; 数值范围-50到+49
    call WriteInt ; 用有符号十进制形式输出
    mov al,TAB ; 水平制表符
    call WriteChar ; 输出制表符
    loop L1
    call Crlf
    ret
Rand2 ENDP
END main