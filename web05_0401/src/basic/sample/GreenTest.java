package basic.sample;

public class GreenTest {

	public static void main(String[] args) {
		Greenable a = new GreenImpl();	//부모(인터페이스)가 자식 객체를 가진다(다형성)
		//추상메서드, 인터페이스는 객체(Object) 생성 불가
		a.drive();
		a.toss();

	}

}
