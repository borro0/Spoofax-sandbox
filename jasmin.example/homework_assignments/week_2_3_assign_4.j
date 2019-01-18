.class public week_2_3_assign_4
.super java/lang/Object

.method public <init>()V
   aload_0
   invokenonvirtual java/lang/Object/<init>()V
   return
.end method

.method public static main([Ljava/lang/String;)V
		.limit stack 100
		.limit locals 100

	
		bipush 21
  	ldc 5
  	iconst_4
  	dup
  	imul
  	iadd
  	isub

		getstatic java/lang/System/out Ljava/io/PrintStream;
		bipush 1
		invokevirtual java/io/PrintStream/println(I)V
  	
  	ifeq l1
  	
  	getstatic java/lang/System/out Ljava/io/PrintStream;
		bipush 2
		invokevirtual java/io/PrintStream/println(I)V
  	
l1: nop

		getstatic java/lang/System/out Ljava/io/PrintStream;
		bipush 3
		invokevirtual java/io/PrintStream/println(I)V
		
		return
		
.end method
