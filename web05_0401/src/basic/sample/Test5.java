package basic.sample;

import java.util.ArrayList;

import basic.vo.Member3;

public class Test5 {

	public static void main(String[] args) {
		int[] math = {50,70};
		int[] eng = {150,170};

		ArrayList<Member3> mm = new ArrayList();
		for(int i=0; i<2; i++)
			mm.add(new Member3().setEng(40).setMath(60).setName("홍길동"));

		
		for(Member3 i : mm) {
			System.out.println("영어 : "+i.getEng()+" 수학  : "+i.getMath()+" 이름 : "+i.getName());
		}
		
		for(int i =0; i<2; i++) {
			System.out.println("영어 점수 : "+mm.get(i).getEng());
		}
		Member3[] arr = new Member3[2];
		
		arr[0]=(new Member3().setEng(54).setMath(60).setName("홍길동"));
		arr[1]=(new Member3().setEng(64).setMath(93).setName("홍말자"));
		
		for(int i=0; i<arr.length; i++) {
			
			System.out.println("영어 점수 : "+arr[i].getEng());
			System.out.println("수학 점수 : "+arr[i].getMath());
			System.out.println("이름 : "+arr[i].getName());
		}
	}

}
