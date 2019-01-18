; This demonstrates how you can use Jasmin to create an applet.

; The code below is like the Java code:
;
;	class Lab09 {
; 	public static void main(String[] args) {
;   	System.out.println(42);
; 	}
;	}

.source "NewArrayLength.j"
.class public NewArrayLength
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
   
   ldc 1 ; array of length 1
   newarray int ; new array of type int
   arraylength ; get length of array
   
	 ; execute printfunction
   invokevirtual java/io/PrintStream/println(I)V
   
   ; terminate main
   return

.end method
