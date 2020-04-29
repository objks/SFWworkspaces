<<<<<<< HEAD
package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.Between;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

/*
 * mpl ->  
 */

@AllArgsConstructor
@Log4j
@Service
public class BoardServiceImpl implements BoardService {
	
	
	private BoardMapper	mapper;

	@Override
	public List<BoardVO> getList(Criteria cri) {
		log.info("글목록 가져오기");
		return mapper.getListWithPaging(cri);
	}

	@Override
	public void register(BoardVO board) {
		log.info("글 등록 중" + board);
		mapper.insertSelectKey(board);
	}

	@Override
	public BoardVO get(long bno) {
		log.info("글 상세보기 하나의 글 가져오기");
		return mapper.read(bno);
	}

	@Override
	public boolean modify(BoardVO board) {
		log.info("글 수정");
//		int i = mapper.update(board);
//		if(i==1)	return false;
//		else return true;
		// 아래 한줄과 위의 세줄은 같다.
		return mapper.update(board)==1;
	}

	@Override
	public boolean remove(long bno) {
		log.info("글삭제 글번호 : " + bno);
		return mapper.delete(bno) == 1 ;
	}

	@Override
	public int scount() {
		return mapper.count();
	}

	@Override
	public long user() {
		return mapper.user();
	}

	@Override
	public long count(String writer) {
		return mapper.search(writer);
	}

	@Override
	public long bcount(Between between) {
		return mapper.bet(between);
	}
	
}
=======
package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.Between;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

/*
 * mpl ->  
 */

@AllArgsConstructor
@Log4j
@Service
public class BoardServiceImpl implements BoardService {
	
	
	private BoardMapper	mapper;

	@Override
	public List<BoardVO> getList(Criteria cri) {
		log.info("글목록 가져오기");
		return mapper.getListWithPaging(cri);
	}

	@Override
	public void register(BoardVO board) {
		log.info("글 등록 중" + board);
		mapper.insertSelectKey(board);
	}

	@Override
	public BoardVO get(long bno) {
		log.info("글 상세보기 하나의 글 가져오기");
		return mapper.read(bno);
	}

	@Override
	public boolean modify(BoardVO board) {
		log.info("글 수정");
//		int i = mapper.update(board);
//		if(i==1)	return false;
//		else return true;
		// 아래 한줄과 위의 세줄은 같다.
		return mapper.update(board)==1;
	}

	@Override
	public boolean remove(long bno) {
		log.info("글삭제 글번호 : " + bno);
		return mapper.delete(bno) == 1 ;
	}

	@Override
	public int scount() {
		return mapper.count();
	}

	@Override
	public long user() {
		return mapper.user();
	}

	@Override
	public long count(String writer) {
		return mapper.search(writer);
	}

	@Override
	public long bcount(Between between) {
		return mapper.bet(between);
	}
	
}
>>>>>>> 442f98c48e220c700b90ea66ff9090a6b01d9012
