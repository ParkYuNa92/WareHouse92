package com.green.vo;

import lombok.Getter;
import lombok.Setter;


@Getter
public class Migum {
	int mno;
	String name;
	int total;
	
	public Migum setMno(int mno) {
		this.mno = mno;
		return this;
	}
	public Migum setName(String name) {
		this.name = name;
		return this;
	}
	public Migum setTotal(int total) {
		this.total = total;
		return this;
	}
	
}
