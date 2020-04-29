package org.zerock.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTests {
	@Setter(onMethod_ = {@Autowired} )
	private BoardService service;
	
	@Test
	public void testExist() {
		log.error("이상한데");
		log.info(service);
		assertNotNull(service);
		
	}
	
	@Test
	public void testGetList() {
		service.getList(new Criteria(2, 10)).forEach(board -> log.info(board));
		
	}
	
	@Test
	public void testGet() {
		service.get(3);
	}
	
	@Test
	public void testResister() {
		BoardVO board = new BoardVO();
		board.setTitle("새로 작성하는 제목");
		board.setContent("새로 작성하는 내용");
		board.setWriter("관리자");
		
		service.register(board);
		log.info("게시물 번호 : " + board.getBno());
		
	}

}
