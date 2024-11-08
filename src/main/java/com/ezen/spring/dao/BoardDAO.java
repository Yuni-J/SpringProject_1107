package com.ezen.spring.dao;

import java.util.List;

import com.ezen.spring.domain.BoardVO;
import com.ezen.spring.domain.PagingVO;

public interface BoardDAO {

	int insert(BoardVO bvo);

//	List<BoardVO> getList();
	List<BoardVO> getList(PagingVO pgvo);
	
	int getTotal(PagingVO pgvo);

	BoardVO getDetail(int bno);

	int update(BoardVO bvo);

	int delete(int bno);


}
