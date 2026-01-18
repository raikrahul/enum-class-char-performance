	.file	"combined.cpp"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"B"
.LC1:
	.string	"S"
	.text
	.p2align 4
	.globl	_ZN2N111side_to_strENS_4SideE
	.type	_ZN2N111side_to_strENS_4SideE, @function
_ZN2N111side_to_strENS_4SideE:
	endbr64
	testl	%edi, %edi
	leaq	.LC0(%rip), %rdx
	leaq	.LC1(%rip), %rax
	cmove	%rdx, %rax
	ret
	.size	_ZN2N111side_to_strENS_4SideE, .-_ZN2N111side_to_strENS_4SideE
	.p2align 4
	.globl	_ZN2N111print_sidesEv
	.type	_ZN2N111print_sidesEv, @function
_ZN2N111print_sidesEv:
	endbr64
	pushq	%rbx
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L9:
	testb	$1, %bl
	je	.L6
	movl	$83, %edi
	addl	$1, %ebx
	call	putchar@PLT
	cmpl	$100, %ebx
	jne	.L9
	popq	%rbx
	ret
	.p2align 4,,10
	.p2align 3
.L6:
	movl	$66, %edi
	addl	$1, %ebx
	call	putchar@PLT
	cmpl	$100, %ebx
	jne	.L9
	popq	%rbx
	ret
	.size	_ZN2N111print_sidesEv, .-_ZN2N111print_sidesEv
	.p2align 4
	.globl	_ZN2N211print_sidesEv
	.type	_ZN2N211print_sidesEv, @function
_ZN2N211print_sidesEv:
	endbr64
	pushq	%rbx
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L15:
	movl	%ebx, %edi
	addl	$1, %ebx
	andl	$1, %edi
	call	putchar@PLT
	cmpl	$100, %ebx
	jne	.L15
	popq	%rbx
	ret
	.size	_ZN2N211print_sidesEv, .-_ZN2N211print_sidesEv
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
