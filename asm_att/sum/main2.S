

.section .text


sum:
   pushl %ebp
   movl  %esp,%ebp    //set up init

   movl 12(%ebp),%eax   //function
   addl 8(%ebp) ,%eax
   addl 4(%ebp) ,%eax

   popl %ebp 
   ret




.section .data

.n 


main:   


 