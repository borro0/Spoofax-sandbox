; This demonstrates how you can use Jasmin to create an applet.

; The code below is like the Java code:
;
;	class Lab09 {
; 	public static void main(String[] args) {
;   	System.out.println(42);
; 	}
;	}

.source "MethodVarsParams.j"
.class public MethodVarsParams
.super java/lang/Object

; standard intitializer
.method public <init>()V
	aload 0
  invokenonvirtual java/lang/Object/<init>()V
  return
.end method

.method public i(II)I
  .limit stack 100
  .limit locals 100
  
	ldc 3
	istore 3
	iconst_1
	istore 4
	
	iload 1
	iload 2
	imul
	iload 3
	iadd
  
  ireturn
    
.end method