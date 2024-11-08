package com.ezen.spring.service;

import java.util.List;

import com.ezen.spring.domain.BoardVO;
import com.ezen.spring.domain.PagingVO;

public interface BoardService {

	int insert(BoardVO bvo);

//	List<BoardVO> getList();  
	// Paging 추가
	List<BoardVO> getList(PagingVO pgvo);

	int getTotal(PagingVO pgvo);
	
	BoardVO getDetail(int bno);

	int update(BoardVO bvo);

	int delete(int bno);



}
