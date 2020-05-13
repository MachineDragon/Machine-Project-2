.text
	.globl  mystrncpy
mystrncpy:
	pushl	%ebp			# This will setup stack frame
	movl	%esp, %ebp
	movl	8(%ebp), %ecx		# This will get argument s
	movl	12(%ebp), %edx		# This will get argument ct
	movl    16(%ebp), %edi	        # This will get argument n
loop:
	movb	(%edx), %al             # This will move a byte from source
	movb	%al, (%ecx)	        # This will move via al to destination
	incl	%ecx		        # This will increment to pointer
	incl	%edx	                # This will increment from pointer
	decl    %edi                    # This will decrement number of bytes moved to n
	cmpb    $0, %al		        # This will check for null terminator
	jz      exit		        # This will jump if the byte moved was the null term
	cmpl    $0, %edi            	# This will check if nis 0
	jnz     loop                	# This will jump out of the loop # of byte moved is not equal to 0

exit:
	movl	8(%ebp), %eax		# This will return address of s in %eax
	movl	%ebp, %esp		# This will remove stack frame
	popl	%ebp
	ret
	.end
