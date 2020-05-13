	.data
countChar:
	.long 0 		
	.text
	.globl count
count:
	pushl %ebp  		
	movl %esp, %ebp
	subl $8, %esp  		
	movl 8(%ebp), %eax  	
	movl 12(%ebp), %ecx 	
	movl %ecx, countChar 	
	movl $0, %edx  		
	jmp strLoop
strLoop:
	movb (%eax), %ecx    
	cmpl $0, %ecx        
	jz done             
	cmpl countChar, %ecx 
	je increment         	
	addl $1, %eax        
	jmp strLoop	     
increment:
	addl $1, %edx        
	addl $1, %eax        
	jmp strLoop	     


done:
	movl %edx, %eax     
	movl %ebp, %esp     
	popl %ebp           
	ret                 
	.end                
	
