; This demonstrates how you can use Jasmin to create an applet.

; The code below is like the Java code:
;
;	class Lab09 {
; 	public static void main(String[] args) {
;   	System.out.println(42);
; 	}
;	}

.source "ObjectField.j"
.class public ObjectField
.super java/lang/Object

.field private a LSimpleField;

; standard intitializer
.method public <init>()V
	aload 0
  invokenonvirtual java/lang/Object/<init>()V
  return
.end method

.method public i()I
	.limit stack 100
  
	aload_0
	new SimpleField
	dup 
	invokenonvirtual SimpleField/<init>()V
	putfield ObjectField/a LSimpleField;
	aload_0
	getfield ObjectField/a LSimpleField;
	invokevirtual SimpleField/i()I
  
  ireturn
    
.end method