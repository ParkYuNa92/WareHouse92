package basic.sample;

import java.util.ArrayList;
import java.util.Date;

import basic.vo.Member;


public class Test {

	public static void main(String[] args) {
		
		ArrayList<Member> original = new ArrayList();
		original.add(new Member().setNo(5).setEmail("a@a.nm").setName("홍길동")
				.setPassword("1234").setCreatedDate(new Date())
				.setModifiedDate(new Date()));
		original.add(new Member().setNo(15).setEmail("a@a.nm").setName("홍길동1")
				.setPassword("1234aa").setCreatedDate(new Date())
				.setModifiedDate(new Date()));
		original.add(new Member().setNo(25).setEmail("a@a.nm").setName("홍길동2")
				.setPassword("1234nn").setCreatedDate(new Date())
				.setModifiedDate(new Date()));
		original.add(new Member().setNo(35).setEmail("a@a.nm").setName("홍길동3")
				.setPassword("1234bb").setCreatedDate(new Date())
				.setModifiedDate(new Date()));
		original.add(new Member().setNo(45).setEmail("a@a.nm").setName("홍길동4")
				.setPassword("1234qq").setCreatedDate(new Date())
				.setModifiedDate(new Date()));
		for(Member i : original) {
			System.out.println("이름 : "+i.getName()+" 비밀번호 : "+i.getPassword());
			System.out.println("번호 : "+i.getNo()+" 생성일 : "+i.getCreatedDate());
			System.out.println("수정일 : "+i.getModifiedDate());
			
		}//이것이 DB에 들어있다고 가정함 ResultSet으로 가져올 수 있고 next 메서드 호출하면 다음 데이터를 가지고 올 수 있음
		int q =0;
		Member[] mems = new Member[5];
		while(q<5) {
				mems[q] = original.get(q);
				q++;
			}
		for(Member i : original) {
			System.out.println("2이름 : "+i.getName()+" 2비밀번호 : "+i.getPassword());
			System.out.println("2번호 : "+i.getNo()+" 2생성일 : "+i.getCreatedDate());
			System.out.println("2수정일 : "+i.getModifiedDate());
		}

	}

}
