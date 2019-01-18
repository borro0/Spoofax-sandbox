; This demonstrates how you can use Jasmin to create an applet.

; The code below is like the Java code:
;
;	class Lab09 {
; 	public static void main(String[] args) {
;   	System.out.println(42);
; 	}
;	}

.source "SimpleField.j"
.class public SimpleField
.super java/lang/Object

.field private field1 I
.field private field2 I

; standard intitializer
.method public <init>()V
	aload 0
  invokenonvirtual java/lang/Object/<init>()V
  return
.end method

.method public i()I
  .limit stack 2
  
  aload_0
  ldc 10
  putfield SimpleField/field1 I
  aload_0
	ldc 8
  putfield SimpleField/field2 I
  aload_0
  getfield SimpleField/field1 I
  aload_0
  getfield SimpleField/field2 I
  iadd
  
  ireturn
    
.end method