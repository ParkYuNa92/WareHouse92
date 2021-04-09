package com.green.vo;

import lombok.Getter;

@Getter
public class Score {

	private int sno;
	private String sname;
	private String spassword;
	private int korea;
	private int math;
	private int eng;
	private int total;
	private float avg; 
	
	public Score setSno(int sno) {this.sno=sno;return this;}
	public Score setSname(String sname) {this.sname=sname;return this;}
	public Score setSpassword(String spassword) {this.spassword=spassword;return this;}
	public Score setKorea(int korea) {this.korea=korea;return this;}
	public Score setMath(int math) {this.math=math;return this;}
	public Score setEng(int eng) {this.eng=eng;return this;}
	public Score setTotal(int total) {this.total=total;return this;}
	public Score setAvg(float avg) {this.avg=avg;return this;}
	
}
