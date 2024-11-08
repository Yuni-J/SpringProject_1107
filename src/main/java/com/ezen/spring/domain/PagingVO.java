package com.ezen.spring.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
public class PagingVO {
	
	private int pageNo;		// 페이지네이션 번호
	private int qty;		// 한페이지에 표시되는 페이지 수
	private String type;
	private String keyword;
	
	// 첫 리스트 시 기본적으로 설정될 값
	public PagingVO() {
		this.pageNo = 1;
		this.qty = 10;
	}
	
	public PagingVO(int pageNo, int qty) {
		this.pageNo = pageNo;
		this.qty = qty;
	}
	
	// DB에서 사용될 시작번지 구하기  => limit 번지, 개수
	// 1page limit 0, 10 => 2page limit 10, 10 ... 규칙 찾기
	public int getPageStart() {		
		return (this.pageNo - 1) * this.qty;		//해당 페이지의 시작 인덱스 찾기
	}
	
	// type의 복합 타입을 각각 검색하기 위해 배열로 생성
	// ex) type == twc [t, w, c]
	public String[] getTypeToArray() {
		return this.type == null ? new String[] {} : this.type.split("");
	}

}
