public class ObjectField 
{
  public static void main(String[] args) 
  {
    System.out.println(new B().i());
  }
}

class A
{
	int [] array_field;

	public int i ()
	{
		return 42;
	}
}

class B
{
	A a;

	public int i ()
	{
		a = new A();
		return a.i();
	}
}