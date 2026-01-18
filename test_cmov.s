	.text
	.file	"test_cmov.cpp"
	.globl	_Z8test_inti                    # -- Begin function _Z8test_inti
	.p2align	4, 0x90
	.type	_Z8test_inti,@function
_Z8test_inti:                           # @_Z8test_inti
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %edx
	xorl	%eax, %eax
	movl	$1, %ecx
	cmpl	$0, %edx
	cmovnel	%ecx, %eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	_Z8test_inti, .Lfunc_end0-_Z8test_inti
	.cfi_endproc
                                        # -- End function
	.globl	_Z9test_chari                   # -- Begin function _Z9test_chari
	.p2align	4, 0x90
	.type	_Z9test_chari,@function
_Z9test_chari:                          # @_Z9test_chari
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %ecx
	movb	$83, %al
	movb	$66, %dl
	movb	%dl, -6(%rbp)                   # 1-byte Spill
	cmpl	$0, %ecx
	movb	%al, -5(%rbp)                   # 1-byte Spill
	jne	.LBB1_2
# %bb.1:
	movb	-6(%rbp), %al                   # 1-byte Reload
	movb	%al, -5(%rbp)                   # 1-byte Spill
.LBB1_2:
	movb	-5(%rbp), %al                   # 1-byte Reload
	movsbl	%al, %eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	_Z9test_chari, .Lfunc_end1-_Z9test_chari
	.cfi_endproc
                                        # -- End function
	.section	".linker-options","e",@llvm_linker_options
	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
