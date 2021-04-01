package basic.sample;

import java.util.ArrayList;

import basic.vo.Member3;

public class Test4 {

	public static void main(String[] args) {
		ArrayList<Member3> mm = new ArrayList();
		mm.add(new Member3().setEng(40).setMath(60));
		mm.add(new Member3().setEng(50).setMath(70));
		mm.add(new Member3().setEng(70).setMath(67));
		
		for(Member3 i : mm) {
			System.out.println("영어 : "+i.getEng()+" 수학  : "+i.getMath());
		}
		
		Member3[] arr = new Member3[2];
		
		arr[0]=(new Member3().setEng(54).setMath(60));
		arr[1]=(new Member3().setEng(64).setMath(93));
		
		for(int i=0; i<arr.length; i++) {
			
			System.out.println("영어 점수 : "+arr[i].getEng());
			System.out.println("수학 점수 : "+arr[i].getMath());
		}
	}

}
