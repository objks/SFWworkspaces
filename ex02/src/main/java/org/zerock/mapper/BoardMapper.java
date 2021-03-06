package org.zerock.mapper;
// 2
import java.util.List;

import org.zerock.domain.Between;
//import org.apache.ibatis.annotations.Select;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

public interface BoardMapper {
	
	//@Select("select * from tbl_board where bno>0")
	public List<BoardVO> getList();

	public List<BoardVO> getListWithPaging(Criteria cri);
	
	public void insert(BoardVO board);

	public void insertSelectKey(BoardVO board);
	
	public BoardVO read(long bno);
	
	public int delete(long bno);

	public int update(BoardVO board);
	
	public List<BoardVO> quiz(long num);
	
	public int count();
	
	public long user();
	
	// 1
	public long search(String writer);	

	public long bet(Between between);	
	
	
}
