package com.ezen.spring.service;

import java.util.List;

import com.ezen.spring.domain.BoardDTO;
import com.ezen.spring.domain.BoardVO;
import com.ezen.spring.domain.PagingVO;

public interface BoardService {

//	int insert(BoardVO bvo);
	int insert(BoardDTO bdto);

//	List<BoardVO> getList();  
	// Paging 추가
	List<BoardVO> getList(PagingVO pgvo);

	int getTotal(PagingVO pgvo);
	
//	BoardVO getDetail(int bno);
	BoardDTO getDetail(int bno);

//	int modify(BoardVO bvo);
	int modify(BoardDTO boardDTO);

	int delete(int bno);

	void readCountUp(int bno);

	int removeFile(String uuid);


}
