#
#目的： 从一个数组中求出最大的值
#思路:通过一个循环遍历  max = first ; if element> max  then max=element
#
#变量有： max 数组data_items



.section .data

data_items:  #数组的起始地址
.long 3,234,66,78,54,32,12,56,78,0

.section .text

.globl _start

_start:
    movl $0,%edi  # 数组索引
    movl data_items(,%edi,4),%eax  # 内存的移动操作都是以字节为单位   4字节就是32位
    movl %eax,%ebx

start_loop:
    cmpl $0,%eax
    je end_loop

cmpl %eax,%ebx
    jle  ifthen_assignvalue
end_ifassign:
    incl %edi
    movl data_items(,%edi,4),%eax 
    jmp start_loop 
    

end_loop:


_endstart:
    jmp exit


ifthen_assignvalue:  # 赋值
    movl %eax ,%ebx
    jmp end_ifassign

exit:
    movl $1,%eax
    int  $0x80
