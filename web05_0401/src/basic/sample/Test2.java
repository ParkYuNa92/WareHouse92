package basic.sample;

import java.util.ArrayList;

import basic.vo.Member2;

public class Test2 {

	public static void main(String[] args) {
		Member2 a = new Member2();
		a.setEng(60);
		a.setMath(40);
		Member2 b = new Member2();
		b.setEng(58);
		b.setMath(82);
		
		ArrayList<Member2> mems = new ArrayList<Member2>();
		
		mems.add(a);
		mems.add(b);
		
		for(Member2 tt: mems) {
			System.out.println("영어 점수는 : "+ tt.getEng()+" 수학 점수는 : " +tt.getMath());
		}
		
		for(int i=0; i<mems.size(); i++) {
			System.out.println("영어 점수는 : "+ mems.get(i).getEng()+" 수학 점수는 : " +mems.get(i).getMath());
		}

	}

}
