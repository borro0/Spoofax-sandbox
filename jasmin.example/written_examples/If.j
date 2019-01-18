; This demonstrates how you can use Jasmin to create an applet.

; The code below is like the Java code:
;
;	class Lab09 {
; 	public static void main(String[] args) {
;   	System.out.println(42);
; 	}
;	}

.source "If.j"
.class public If
.super java/lang/Object

; standard intitializer
.method public <init>()V
   aload 0
   invokenonvirtual java/lang/Object/<init>()V
   return
.end method

.method public static main([Ljava/lang/String;)V

   .limit stack 100
   
   iconst_0
   ifeq false 
   
   ; push print function to stack
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ; push 1 to stack
	 ldc 1
	 ; execute printfunction
   invokevirtual java/io/PrintStream/println(I)V
   
   goto exit
   
false:

   ; push print function to stack
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ; push 1 to stack
	 ldc 0
	 ; execute printfunction
   invokevirtual java/io/PrintStream/println(I)V
	 
exit:
   
   ; terminate main
   return

.end method
