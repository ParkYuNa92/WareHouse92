package com.green.service;

import static org.junit.Assert.assertNotNull;

import java.util.ArrayList;

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
public class BoardServiceTests {
	
	@Setter(onMethod_=@Autowired)
	private BoardService service;
	
	int cnt=1;
	@Test
	public void testExists() {
		
		service.getList().forEach(i->log.info("번호 : ("+ i.getBno()+") 저자 : ("+i.getWriter()+") 내용 : ("+i.getContent()+") 제목 : ("+i.getTitle()+")"));
			cnt++;
			
		assertNotNull(service);
	}
	@Test
	public void registerTest() {
		BoardVO board = new BoardVO();
		board.setTitle("서비스 테스트에서 새로 작성하는 글");
		board.setContent("서비스 테스트에서 새로 작성하는 내용");
		board.setWriter("서비스 테스트에서 고양이1");
		service.register(board);
		log.info("생성된 게시글의 번호: "+board.getBno());
	}
	//@Test
	public void testGetList() {
		service.getList().forEach(i->log.info(i));
	}
	@Test
	public void testGet() {
		log.info(service.get(1L));
	}
	//@Test
	public void testDelete() {
		log.info("서비스 테스트에서 삭제..."+ service.remove(2L));
	}
	@Test
	public void testUpdate() {
		BoardVO board = service.get(1L);
		if(board == null) {
			return;
		}
		board.setTitle("서비스 테스트에서 제목을 수정합니다.");
		log.info("서비스 테스트에서 수정 결과 "+ service.modify(board));
	}
}
