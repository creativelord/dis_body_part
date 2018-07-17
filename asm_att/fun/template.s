

#void foo()
#{
#    int a;
#    int *b;
#    a=60;
#    b=&a;
#    *b=44;
#}


.section .data

fmt:
    .ascii "a=%d\n"

.section .text


foo:
   #函数标准开头
    pushl %ebp
    movl  %esp,%ebp

    .eq VAR_A, -4  # 宏替换
    .eq VAR_B, -8
    
    movl 60,%ebp(VAR_A)
    movl %ebp,%ebp(VAR_B)
    addl VAR_A,%ebp(VAR_B)   #a的地址就是基址寻址

    movl $44,%ebp(VAR_B) 

    #函数标准结尾
    movl %ebp ,%esp
    popl %ebp
