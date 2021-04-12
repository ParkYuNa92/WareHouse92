package com.green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.mapper.BoardMapper;
import com.green.vo.BoardVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service

public class BoardServiceImpl implements BoardService {
	
	@Setter(onMethod_=@Autowired)
	private BoardMapper mapper;
	@Override
	public List<BoardVO> getList() {
		System.out.println("서비스에서 전체 목록 조회 ");
		return mapper.getList();
	}

	@Override
	public void register(BoardVO board) {
		log.info("서비스에서 데이터 추가 "+ board);
		mapper.insert(board);
		
	}

	@Override
	public BoardVO get(Long bno) {
		System.out.println("서비스에서 데이터 하나 조회 "+ bno);
		return mapper.read(bno);
	}

	@Override
	public boolean remove(Long bno) {
		System.out.println("서비스에서 데이터 삭제 번호는 "+ bno);
		return mapper.delete(bno)==1;
	}

	@Override
	public boolean modify(BoardVO board) {
		log.info("서비스에서 데이터 수정 "+ board);
		return mapper.update(board)==1;
	}
	

}
