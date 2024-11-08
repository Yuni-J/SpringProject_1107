package com.ezen.spring.handler;

import java.util.List;

import com.ezen.spring.domain.CommentVO;
import com.ezen.spring.domain.PagingVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PagingHandler {
	
//	private int qty;		//한 페이지에 나오는 페이지네이션 개수 : 10개
	private int startPage;	//한 페이지에 나오는 페이지네이션 시작번호 : 1 11 21 ... 181
	private int endPage;	//한 페이지에 나오는 페이지네이션 끝번호 : 10 20 30 ... 181
	private boolean prev;
	private boolean next;
	
	// 매개변수로 받아오는 값
	private int totalCount;	//전체 페이지수 : DB에서 조회해 와야 하는 값
	private PagingVO pgvo;	//현재 페이지 번호
	
	private int realEndPage;
	
	private List<CommentVO> cmtList;
	
	public PagingHandler(int totalCount, PagingVO pgvo) {
		this.pgvo = pgvo;
		this.totalCount = totalCount;
		
		// 1/10개	=>	0.1결과를 올림(ceil) => 1*10 => 10
		// 11/10개	=>	1.1결과를 올림(ceil) => 2*10 => 20
		this.endPage = (int)Math.ceil(pgvo.getPageNo() / (double)10) * 10;
		this.startPage = endPage - 9;
		
		// 실제 마지막 페이지 => 전체 글수 / 한페이지에 표시되는 게시글 수 
		// 11/10 => 1.1(올림) => 2페이지 
		this.realEndPage = (int)Math.ceil(totalCount / (double)pgvo.getQty());
		
		// 이전, 다음 여부
		this.prev = this.startPage > 1;
		this.next = this.endPage < this.realEndPage;
		
		if(endPage > realEndPage) {
			this.endPage = realEndPage;
		}
	
	}
	
	//댓글용 생성자
	public PagingHandler(int totalCount, PagingVO pgvo, List<CommentVO> cmtList) {
		this(totalCount, pgvo);
		this.cmtList = cmtList;
	}

}
