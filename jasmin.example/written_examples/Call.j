; --- Copyright Jonathan Meyer 1996. All rights reserved. -----------------
; File:      jasmin/examples/HelloWeb.j
; Author:    Jonathan Meyer, 10 July 1996
; Purpose:   Demonstration of a Jasmin-created applet
; -------------------------------------------------------------------------
; HelloWeb.j

; This demonstrates how you can use Jasmin to create an applet.

; The code below is like the Java code:
;

;		class Call {
;			public static void main(String[] args) {
;				System.out.println(new D().i());
;		  }
;		}

; this class is in another file
;		class D {
;			
;   	public int i() {
;     	System.out.println(1);
;     }
;   }


.class public Call
.super java/lang/Object

; standard intitializer
.method public <init>()V
   aload 0
   invokenonvirtual java/lang/Object/<init>()V
   return
.end method

.method public static main([Ljava/lang/String;)V

   .limit stack 100
   
   ; push print function to stack
   getstatic java/lang/System/out Ljava/io/PrintStream;
   
   new MethodVarsParams
   dup
   invokenonvirtual MethodVarsParams/<init>()V
   ldc 1
   ldc 2   
   invokevirtual MethodVarsParams/i(II)I

	 ; execute printfunction
   invokevirtual java/io/PrintStream/println(I)V
   
   ; terminate main
   return

.end method
