package basic.sample;

import basic.vo.Member2;

public class Test3 {

	public static void main(String[] args) {
		Member2 a = new Member2();
		a.setEng(60);
		a.setMath(40);
		Member2 b = new Member2();
		b.setEng(58);
		b.setMath(82);
		
		Member2[] arr = new Member2[2];
		
		arr[0]=a;
		arr[1]=b;
		
		for(Member2 i : arr) {
			System.out.println("영어"+i.getEng()+"수학"+i.getMath());
		}
		for(int i=0; i<arr.length; i++) {
			System.out.println("국어 점수는 :" + arr[i].getEng());
			System.out.println("수학 점수는 :" + arr[i].getMath());
		}
		

		
		

	}

}
