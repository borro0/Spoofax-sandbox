; This demonstrates how you can use Jasmin to create an applet.

.source "ArrayField.j"
.class public ArrayField
.super java/lang/Object

.field private array_field [I

; standard intitializer
.method public <init>()V
	aload 0
  invokenonvirtual java/lang/Object/<init>()V
  return
.end method

.method public i()I
  .limit stack 2
  
  ; array_field = new int [10];
  aload_0
  ldc 10
	newarray int
	putfield ArrayField/array_field [I
	
	; array_field[0] = 5;
	aload_0
	getfield ArrayField/array_field [I
	ldc 0 ; array index
	ldc 5 ; value to assign
	iastore
	
	aload_0
	getfield ArrayField/array_field [I
	ldc 1 ; array index
	ldc 7 ; value to assign
	iastore
	aload_0
	getfield ArrayField/array_field [I
	ldc 0
	iaload
	aload_0
	getfield ArrayField/array_field [I
	ldc 0
	iaload
  
  ireturn
    
.end method