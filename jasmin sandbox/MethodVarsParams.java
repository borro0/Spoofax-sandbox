public class MethodVarsParams 
{
  public static void main(String[] args) 
  {
    System.out.println(new B().i(1, 2, new int [2]));
  }
}

class A
{
	public int i ()
	{
		return 42;
	}
}

class B
{
	public int i (int param1, int param2, int [] param3)
	{
		int var1;
		A a;

		var1 = 5;
		param3[0] = 1;
		param3[1] = 2;
		a = new A();

		return a.i() + param3[0] + param3[1] + var1; // 42 + 1 + 2 + 5 = 50
	}
}