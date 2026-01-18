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
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	$0, -4(%rbp)
	movl	$0, -8(%rbp)
	movl	-8(%rbp), %esi
	movq	_ZSt4cout@GOTPCREL(%rip), %rdi
	callq	_ZNSolsEi@PLT
	movl	-8(%rbp), %edi
	callq	_Z7to_char9OrderType
	movq	_ZSt4cout@GOTPCREL(%rip), %rdi
	movsbl	%al, %esi
	callq	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c@PLT
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.section	.text._Z7to_char9OrderType,"axG",@progbits,_Z7to_char9OrderType,comdat
	.weak	_Z7to_char9OrderType            # -- Begin function _Z7to_char9OrderType
	.p2align	4, 0x90
	.type	_Z7to_char9OrderType,@function
_Z7to_char9OrderType:                   # @_Z7to_char9OrderType
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %ecx
	movb	$66, %al
	movb	$83, %dl
	movb	%dl, -6(%rbp)                   # 1-byte Spill
	cmpl	$0, %ecx
	movb	%al, -5(%rbp)                   # 1-byte Spill
	je	.LBB1_2
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
	.size	_Z7to_char9OrderType, .Lfunc_end1-_Z7to_char9OrderType
	.cfi_endproc
                                        # -- End function
	.section	".linker-options","e",@llvm_linker_options
	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym _ZNSolsEi
	.addrsig_sym _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c
	.addrsig_sym _Z7to_char9OrderType
	.addrsig_sym _ZSt4cout
