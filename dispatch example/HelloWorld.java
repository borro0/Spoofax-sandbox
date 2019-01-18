class A {}
class B extends A {}
class C extends B {}
class D {
	A m(A a) { System.out.println("D.m(A a)"); return a; }
	A m(B b) { System.out.println("D.m(B b)"); return b; }
}
class E extends D {
	A m(A a) { System.out.println("E.m(A a)"); return a; }
	B m(B b) { System.out.println("E.m(B b)"); return b; }
}

public class HelloWorld{

     public static void main(String []args){
        System.out.println("Hello World");
     

	    A a = new A(); B b = new B(); C c = new C(); D d = new D(); E e = new E();
	    A ab = b; A ac = c; D de = e;
	    
	    d.m(a); 		// D.m(A a)
	    d.m(b); 		// D.m(B b)
	    d.m(ab); 		// D.m(A a)
	    d.m(c); 		// D.m(B b)
	    d.m(ac);		// D.m(A a)
	    e.m(a); 		// E.m(A a)
	    e.m(b); 		// E.m(B b)
	    e.m(ab); 		// E.m(A a)
	    e.m(c); 		// E.m(B b)
	    e.m(ac);		// E.m(A a)
	    de.m(a); 		// E.m(A a)
	    de.m(b); 		// E.m(B b)
	    de.m(ab); 		// E.m(A a)
	    de.m(c); 		// E.m(B b)
	    de.m(ac);		// E.m(A a)

 	}
}
