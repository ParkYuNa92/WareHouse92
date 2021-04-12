package com.green.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.green.vo.BoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardMapperTests {
	@Setter(onMethod_=@Autowired)
	private BoardMapper mapper;
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(board-> log.info(board));
	}
	@Test
	public void testInsert() {
		BoardVO board = new BoardVO();
		board.setTitle("새로 작성하는 글");
		board.setContent("새로 작성하는 내용");
		board.setWriter("newbie");
		
		mapper.insert(board);
		log.info(board);
	}
	@Test
	public void testInsertSelectKey() {
		BoardVO board = new BoardVO();
		board.setTitle("새로 작성하는 글 select key");
		board.setContent("새로 작성하는 내용 select key");
		board.setWriter("newbie");
		
		mapper.insertSelectKey(board);
		log.info(board);
	}
	@Test
	public void testRead() {
		BoardVO a = mapper.read(4L);	//데이터 읽어올 때는 객체를 생성하지 않아도 됨
		log.info(a);
	}
	@Test
	public void testDelete() {
		mapper.delete(4L);
		
	}
	@Test
	public void testUpdate() {
		BoardVO board = new BoardVO();
		board.setBno(1L);	//실행하기 전에 존재하는지 확인
		board.setTitle("수정한 제목이 홍말자");
		board.setContent("수정한 작성하는 내용 오늘은 행복한 월요일");
		board.setWriter("수정한 사람은 강아지");
		mapper.update(board);
	}
}
