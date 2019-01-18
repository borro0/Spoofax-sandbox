class Call {
  public static void main(String[] args) {
    System.out.println(new D().i());
  }
}

class D{
  public int i() {
    {
    	System.out.println(1);
    }
    return 42;
  }
}
