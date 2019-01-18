.source "While.j"
.class public While
.super java/lang/Object

; ================================
; default constructor
; ================================
.method public <init>()V
   aload 0
   invokenonvirtual java/lang/Object/<init>()V
   return
.end method

; ================================
; main function
; ================================
.method public static main([Ljava/lang/String;)V

   .limit stack 4
   .limit locals 2
   
   ldc 4
   invokestatic While/fact(I)I
   istore 0
   
   ; print result
   getstatic java/lang/System/out Ljava/io/PrintStream;
   iload 0
   invokevirtual java/io/PrintStream/println(I)V
   
   ; terminate main
   return

.end method

; ================================
; absolute value
; ================================
.method public static abs(J)J

   .limit stack 4
   .limit locals 2

   lload 0
   lconst_0
   lcmp
   ifle else
   lload 0
   lreturn
else:
   lload 0
   lconst_1
   lmul
   lreturn
.end method



; ================================
; factorial
; ================================
.method public static fact(I)I
   .limit stack 3
   .limit locals 2
   
   ldc 1    ; push 1
   istore 1 ; local[1] = 1   
   
while:

   ; if local[0] <= 0 goto done
   iload 0
   ifle done
   
   
   ; local[1] = local[0] * local[1]
   iload 0
   iload 1 
   imul  
   istore 1
   
   ; local[0] = local[0] - 1
   iload 0 
   ldc 1
   isub
   istore 0
   
   goto while
   
done:
   
   iload 1
   ireturn
   
.end method

