
#求出数组的最小数
# tmp=first   if min>tmp then min =tmp end
#
#使用的寄存器:
# ebx 来时作为 存放最小值的容器 ,eax作为 临时变量  edi 作为数组索引
#
#



.section  .data

format:
.ascii "my age is %d \n"

longarr:
.long 1231,2,3,4,5555,33,0 

.section .text

.globl _start

_start:
#初始化
    movl $0,%edi
    movl longarr(,%edi,4),%ebx
    movl %ebx,%eax


loop_start:
    incl %edi
    movl longarr(,%edi,4),%eax  #取值 

    cmpl $0,%eax       ##退出判断
    je loop_break  ##if eax ==0 break
    #比较挑选
    cmpl %eax, %ebx
    jle loop_start    # ebx<=eax
    movl %eax, %ebx

    jmp loop_start

loop_break:
   jmp _endstart


_endstart:
    movl $1,%eax
    int $0x80 
 



