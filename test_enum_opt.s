	.text
	.file	"test_enum.cpp"
                                        # Start of file scope inline assembly
	.globl	_ZSt21ios_base_library_initv

                                        # End of file scope inline assembly
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movb	$66, 7(%rsp)
	movq	_ZSt4cout@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	movq	-24(%rcx), %rcx
	cmpq	$0, 16(%rax,%rcx)
	je	.LBB0_2
# %bb.1:
	movq	_ZSt4cout@GOTPCREL(%rip), %rdi
	leaq	7(%rsp), %rsi
	movl	$1, %edx
	callq	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	jmp	.LBB0_3
.LBB0_2:
	movq	_ZSt4cout@GOTPCREL(%rip), %rdi
	movl	$66, %esi
	callq	_ZNSo3putEc@PLT
.LBB0_3:
	xorl	%eax, %eax
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.section	".linker-options","e",@llvm_linker_options
	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym _ZSt4cout
