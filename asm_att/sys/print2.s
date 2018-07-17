
#目的：通过中断来调用系统系统提供的功能
#要 调用系统函数，首先要知道中断号，请求号0x80 还有具体的参数 第一参数 第二参数  第三个参数 ......
#.bss .data
#

.section .data

msg: .ascii "123  sfasfsafsafo world gasdfagsdg sgs dgsdgfsdgdffg \n"
  .equ len, .-msg

arr:
    .long 12,2,3,45,6,4
    arrlen=.-arr

.section .text

.globl _start

_start:

movl $4,%eax
movl $1,%ebx
movl $msg,%ecx
movl $len,%edx
int $0x80

movl $1,%eax
movl $0,%ebx
int $0x80







