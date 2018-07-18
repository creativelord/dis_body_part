#对于参数传递问题：原则：1 函数提供需要传入什么参数，包括是寄存器还是堆栈传递， 方法内部不需要保护寄存器，这个是规范，寄存器和堆栈 外面去维护
#目的：动态计算字符长度
#输入参数：eax 字符串首地址
#输出参数: ebx 字符串长度


.section .data
.equ NULL,0

.section .text
    .type strlength @function #声明为方法函数
    .globl strlength  # public or static (private) 设定访问权限

strlength:
  #函数标准开始
    pushl %ebp
    movl %esp,%ebp
    pushl %esi
################################################
    # str_ptr 字符串
    .equ VAR_STR_PTR,-4  # char * str_ptr;
    # len 字符串长度
    .equ VAR_LEN,-8 # 宏 所以不用加$访问 int len =0
    #初始化
    movl $0,(%ebp,VAR_LEN)
    movl %eax,(%ebp,VAR_STR_PTR)
    movl $0,%esi

whilecheck:
    movl %ebp(VAR_STR_PTR,%edi,1),%eax
    cmpl %eax,NULL
    je break_while

    incl  (%ebp,VAR_LEN)
    incl %esi
    jmp whilecheck

    #处理结果返回
    movl (%ebp,VAR_LEN),%ebx 

################################################
    #标准函数结束
    popl %esi
    movl %ebp,%esp
    popl $ebp

    ret



onexit:
    movl $1,%eax
    movl $0,%ebx
    int $0x80

