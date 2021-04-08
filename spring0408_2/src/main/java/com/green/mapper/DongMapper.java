package com.green.mapper;

import java.util.ArrayList;

import com.green.vo.DVo;

public interface DongMapper {
	public ArrayList<DVo> list();
	public void insertDong(DVo vo);
}
