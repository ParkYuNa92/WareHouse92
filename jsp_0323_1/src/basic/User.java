package basic;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor

public class User {
	private String name;
	private int num;
	
//	public User(){
//		
//	}
//	public User(String name, int num){
//		this.name=name;
//		this.num=num;
//	}
//	
//	public String getName() {
//		return this.name;
//	}
//	public int getNum() {
//		return this.num;
//	}
//	public void setName(String name) {
//		this.name=name;
//	}
//	public void setNum(int num) {
//		this.num=num;
//	}
}
