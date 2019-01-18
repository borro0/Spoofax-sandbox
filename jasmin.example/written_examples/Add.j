; This demonstrates how you can use Jasmin to create an applet.

; The code below is like the Java code:
;
;	class Lab09 {
; 	public static void main(String[] args) {
;   	System.out.println(42);
; 	}
;	}

.source "Add.j"
.class public Add
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
   
   ldc 10
   ldc 14
   iadd

	 ; execute printfunction
   invokevirtual java/io/PrintStream/println(I)V
   
   ; terminate main
   return

.end method
