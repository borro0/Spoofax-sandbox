; --- Copyright Jonathan Meyer 1996. All rights reserved. -----------------
; File:      jasmin/examples/HelloWeb.j
; Author:    Jonathan Meyer, 10 July 1996
; Purpose:   Demonstration of a Jasmin-created applet
; -------------------------------------------------------------------------
; HelloWeb.j

; This demonstrates how you can use Jasmin to create an applet.


; this class is in another file
;		class D {
;			
;   	public int i() {
;     	System.out.println(1);
;				return 42;
;     }
;   }


.class public D
.super java/lang/Object

; standard intitializer
.method public <init>()V
   aload 0
   invokenonvirtual java/lang/Object/<init>()V
   return
.end method


.method public i()I
    .limit stack 2

		; push print function to stack
		getstatic java/lang/System/out Ljava/io/PrintStream;
		; push 1 to stack
		ldc 1
		; execute printfunction
   	invokevirtual java/io/PrintStream/println(I)V

    ; done
    ldc 42
    ireturn
    
.end method
