package basic.vo;

public class Member3 {
	private int math;
	private int eng;
	private String name;	//사람이름
	
	
	public String getName() {
		return name;
	}
	public Member3 setName(String name) {
		this.name = name;
		return this;
	}
	public int getMath() {
		return math;
	}
	public Member3 setMath(int math) {
		this.math = math;
		return this;
	}
	public int getEng() {
		return eng;
	}
	public Member3 setEng(int eng) {
		this.eng = eng;
		return this;
	}
	
	
}
