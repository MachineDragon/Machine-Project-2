
	.global printbin
	.text
printbin:
	pushl %ebp			    
	movl %esp, %ebp
    movb 8(%ebp), %al		
	movl $string, %edx		
	call donibble			
	movb $' ', (%edx)		
	incl %edx			   
	call donibble			
	movl $string, %eax		
    movl %ebp, %esp			
	popl %ebp
	ret				        

donibble:
	movl $4, %ecx			
myLoop:
	shlb $1, %al			
	jc myLoop1			    
	movb $'0', (%edx)		
	jmp myLoop2
myLoop1:
	movb $'1', (%edx)		
myLoop2:
	incl %edx			    
	loop myLoop			    
	ret				        
    .data
string:	                    
	.asciz "xxxx xxxx\n"    
