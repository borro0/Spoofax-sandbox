public class ArrayField 
{
	private int [] array_field;

	public static void main(String[] args) 
	{
		System.out.println(new SimpleField().i());
	}

	public int i ()
	{
		array_field = new int [10];
		
		array_field[0] = 5;
		array_field[1] = 7;
		
		return array_field[0] + array_field[1];
	}
}