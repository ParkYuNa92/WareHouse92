package basic.sample;

public class GreenImpl implements Greenable{

	@Override
	public void drive() {
		System.out.println("운전중이에요");
		
	}

	@Override
	public void toss() {
		System.out.println("토스를 하고 있어요");
		
	}

}

