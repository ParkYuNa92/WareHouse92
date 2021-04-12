package com.green.service;

import java.util.List;

import com.green.vo.BoardVO;

public interface BoardService {
	public List<BoardVO> getList();
	public void register(BoardVO board);
	public BoardVO get(Long bno);
	public boolean remove(Long bno);
	public boolean modify(BoardVO board);
}
