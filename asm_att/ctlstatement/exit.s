#目的： 退出并从linux 内核返回 一个状态码程序
#输入：无
#输出： 返回一个linux内核的状态码  通过 控制台  echo $? ，查询

#变量
#      %eax 保存系统调用 函数的号
#      %ebx 保存状态码   系统调用函数对应的参数
#


.section .data

.section .text

.globl _start

_start:

movl $1,%eax
movl $1,%ebx

int $0x80


