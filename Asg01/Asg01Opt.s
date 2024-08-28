	.file	"Asg01.cpp"
	.text
	.section	.text$_ZNKSt5ctypeIcE8do_widenEc,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNKSt5ctypeIcE8do_widenEc
	.def	_ZNKSt5ctypeIcE8do_widenEc;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNKSt5ctypeIcE8do_widenEc
_ZNKSt5ctypeIcE8do_widenEc:
.LFB1995:
	.seh_endprologue
	movl	%edx, %eax
	ret
	.seh_endproc
	.text
	.p2align 4
	.def	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0;	.scl	3;	.type	32;	.endef
	.seh_proc	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0:
.LFB2775:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movq	(%rcx), %rax
	movq	-24(%rax), %rax
	movq	240(%rcx,%rax), %rsi
	movq	%rcx, %rbx
	testq	%rsi, %rsi
	je	.L8
	cmpb	$0, 56(%rsi)
	je	.L5
	movsbl	67(%rsi), %edx
.L6:
	movq	%rbx, %rcx
	call	_ZNSo3putEc
	movq	%rax, %rcx
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	jmp	_ZNSo5flushEv
.L5:
	movq	%rsi, %rcx
	call	_ZNKSt5ctypeIcE13_M_widen_initEv
	movq	(%rsi), %rax
	movl	$10, %edx
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rcx
	movq	48(%rax), %rax
	cmpq	%rcx, %rax
	je	.L6
	movl	$10, %edx
	movq	%rsi, %rcx
	call	*%rax
	movsbl	%al, %edx
	jmp	.L6
.L8:
	call	_ZSt16__throw_bad_castv
	nop
	.seh_endproc
	.p2align 4
	.globl	_Z21FillWithRandomNumbersPii
	.def	_Z21FillWithRandomNumbersPii;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z21FillWithRandomNumbersPii
_Z21FillWithRandomNumbersPii:
.LFB2242:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movslq	%edx, %rbx
	movq	%rcx, %rsi
	xorl	%ecx, %ecx
	call	*__imp__time64(%rip)
	movl	%eax, %ecx
	call	srand
	testl	%ebx, %ebx
	jle	.L9
	leaq	(%rsi,%rbx,4), %rbx
	.p2align 4,,10
	.p2align 3
.L11:
	call	rand
	addq	$4, %rsi
	movslq	%eax, %rdx
	movl	%eax, %ecx
	imulq	$703680405, %rdx, %rdx
	sarl	$31, %ecx
	sarq	$46, %rdx
	subl	%ecx, %edx
	imull	$100001, %edx, %edx
	subl	%edx, %eax
	movl	%eax, -4(%rsi)
	cmpq	%rbx, %rsi
	jne	.L11
.L9:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.seh_endproc
	.p2align 4
	.globl	_Z12SortTheArrayPii
	.def	_Z12SortTheArrayPii;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z12SortTheArrayPii
_Z12SortTheArrayPii:
.LFB2243:
	.seh_endprologue
	cmpl	$1, %edx
	jle	.L13
	leaq	4(%rcx), %r11
	.p2align 4,,10
	.p2align 3
.L15:
	cmpl	$1, %edx
	jle	.L28
	leal	-2(%rdx), %r8d
	movq	%rcx, %rax
	leaq	(%r11,%r8,4), %r10
	.p2align 4,,10
	.p2align 3
.L17:
	movq	(%rax), %xmm0
	pshufd	$0xe5, %xmm0, %xmm1
	movd	%xmm0, %r8d
	movd	%xmm1, %r9d
	cmpl	%r8d, %r9d
	jge	.L16
	pshufd	$225, %xmm0, %xmm0
	movq	%xmm0, (%rax)
.L16:
	addq	$4, %rax
	cmpq	%r10, %rax
	jne	.L17
	subl	$1, %edx
	cmpl	$1, %edx
	jne	.L15
.L13:
	ret
	.p2align 4,,10
	.p2align 3
.L28:
	subl	$1, %edx
	jmp	.L15
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC0:
	.ascii "Unsorted Array: \0"
.LC1:
	.ascii " \0"
.LC2:
	.ascii "Sorted Array: \0"
	.section	.text.startup,"x"
	.p2align 4
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
.LFB2244:
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$88, %rsp
	.seh_stackalloc	88
	.seh_endprologue
	leaq	.LC1(%rip), %r12
	call	__main
	leaq	32(%rsp), %r13
	movl	$10, %edx
	leaq	72(%rsp), %rbp
	movq	%r13, %rcx
	movq	%r13, %rbx
	movq	%r13, %rsi
	call	_Z21FillWithRandomNumbersPii
	movq	.refptr._ZSt4cout(%rip), %rdi
	movl	$16, %r8d
	leaq	.LC0(%rip), %rdx
	movq	%rdi, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	.p2align 4,,10
	.p2align 3
.L30:
	movl	(%rsi), %edx
	movq	%rdi, %rcx
	addq	$4, %rsi
	call	_ZNSolsEi
	movl	$1, %r8d
	movq	%r12, %rdx
	movq	%rax, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	cmpq	%rsi, %rbp
	jne	.L30
	movq	%rdi, %rcx
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	movl	$10, %edx
	movq	%r13, %rcx
	call	_Z12SortTheArrayPii
	movl	$14, %r8d
	leaq	.LC2(%rip), %rdx
	movq	%rdi, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	.p2align 4,,10
	.p2align 3
.L31:
	movl	(%rbx), %edx
	movq	%rdi, %rcx
	addq	$4, %rbx
	call	_ZNSolsEi
	movl	$1, %r8d
	movq	%r12, %rdx
	movq	%rax, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	cmpq	%rbx, %rbp
	jne	.L31
	movq	%rdi, %rcx
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	xorl	%eax, %eax
	addq	$88, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.seh_endproc
	.ident	"GCC: (Rev3, Built by MSYS2 project) 13.2.0"
	.def	_ZNSo3putEc;	.scl	2;	.type	32;	.endef
	.def	_ZNSo5flushEv;	.scl	2;	.type	32;	.endef
	.def	_ZNKSt5ctypeIcE13_M_widen_initEv;	.scl	2;	.type	32;	.endef
	.def	_ZSt16__throw_bad_castv;	.scl	2;	.type	32;	.endef
	.def	srand;	.scl	2;	.type	32;	.endef
	.def	rand;	.scl	2;	.type	32;	.endef
	.def	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x;	.scl	2;	.type	32;	.endef
	.def	_ZNSolsEi;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr._ZSt4cout, "dr"
	.globl	.refptr._ZSt4cout
	.linkonce	discard
.refptr._ZSt4cout:
	.quad	_ZSt4cout
