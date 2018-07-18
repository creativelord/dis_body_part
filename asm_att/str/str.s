#include <stdio.h>
#传送指令 
#movsb  字节串 %esi+$1,%edi+$1
#movsw  字串   %esi+$2,%edi+$2         
#movsl  双字节串   %esi+$4,%edi+$4

# 取地址  等价
#flag:
#lea flag,%eax
#movl $flag,%eax

#.bss 不占用文件的内存，在程序启动后回占用内存
#.data在文件中就占用内存

.code32 # 指定为32位



.section .data
    str1: .ascii "Hello ,every body\n" 
    len=(.-str1)
    fmt: .ascii "the result is %s \n"
    .equ fmtlen2,(.-fmt)
.section .bss
    .lcomm str2,38

.section .text
.globl _start

_start:
#nop

#lea str1,%esi
#lea str2,%edi
#movsb

#调用函数



movl $str1,%ecx
movl $len,%edx
movl $4,%eax
movl $1,%ebx
int  $0x80

movl $fmt,%ecx
movl $fmtlen2,%edx
movl $4,%eax
movl $1,%ebx
int  $0x80



movl $1,%eax
movl $0,%ebx
int $0x80










