package com.ezen.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ezen.spring.dao.BoardDAO;
import com.ezen.spring.dao.FileDAO;
import com.ezen.spring.domain.BoardDTO;
import com.ezen.spring.domain.BoardVO;
import com.ezen.spring.domain.FileVO;
import com.ezen.spring.domain.PagingVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Slf4j
@Service
public class BoardServiceImpl implements BoardService {
	
	private final BoardDAO bdao;
	private final FileDAO fdao;

//	@Override
//	public int insert(BoardVO bvo) {
//		// TODO Auto-generated method stub
//		return bdao.insert(bvo);
//	}
	//파일 추가 후
	@Transactional
	@Override
	public int insert(BoardDTO bdto) {
		// bvo + file
		// bvo : insert -> bno : DB에서 빼오기 -> fvo : DB에 저장
		int isOk = bdao.insert(bdto.getBvo());
		// 1. 첨부파일 없는 경우
		if(bdto.getFlist() == null) {
			return isOk;
		}
		// 2. 첨부파일 있는 경우
		if(isOk > 0 && bdto.getFlist().size() > 0) {
			// bno setting
			long bno = bdao.getOneBno();	//가장 마지막에 등록된 bno
			for(FileVO fvo : bdto.getFlist()) {
				fvo.setBno(bno);
				isOk *= fdao.insertFile(fvo);
			}
		}
		bdao.hasFileUpdate(bdao.getOneBno(), bdto.getFlist().size());
		return isOk;
	}

//	@Override
//	public List<BoardVO> getList() {
//		// TODO Auto-generated method stub
//		return bdao.getList();
//	}
	// 페이징네이션 추가 후
	@Override
	public List<BoardVO> getList(PagingVO pgvo) {
		// TODO Auto-generated method stub
		return bdao.getList(pgvo);
	}
	
	@Override
	public int getTotal(PagingVO pgvo) {
		// TODO Auto-generated method stub
		return bdao.getTotal(pgvo);
	}
	
//	@Override
//	public BoardVO getDetail(int bno) {
//		// TODO Auto-generated method stub
//		return bdao.getDetail(bno);
//	}
	// 파일 첨부 추가 후
	@Transactional
	@Override
	public BoardDTO getDetail(int bno) {
		// bdao -> bvo   / fdao -> flist  묶어서 BoardDTO 로 리턴
		BoardVO bvo = bdao.getDetail(bno);
		List<FileVO> flist = fdao.getList(bno);
		
		BoardDTO bdto = new BoardDTO(bvo, flist);
		
		return bdto;
	}


//	@Override
//	public int modify(BoardVO bvo) {
//		// TODO Auto-generated method stub
//		return bdao.modify(bvo);
//	}
	// 파일 첨부 추가 후
	@Transactional
	@Override
	public int modify(BoardDTO boardDTO) {
		// TODO Auto-generated method stub
		int isOk = bdao.modify(boardDTO.getBvo());
		if(boardDTO.getFlist() == null) {
			return isOk;
		}
		
		if(isOk > 0 && boardDTO.getFlist().size() > 0) {
			for(FileVO fvo : boardDTO.getFlist()) {
				fvo.setBno(boardDTO.getBvo().getBno());
				isOk *= fdao.insertFile(fvo);
			}
		}
		bdao.hasFileUpdate(bdao.getOneBno(), boardDTO.getFlist().size());
		return isOk;
	}

	@Override
	public int delete(int bno) {
		// TODO Auto-generated method stub
		return bdao.delete(bno);
	}

	@Override
	public void readCountUp(int bno) {
		// TODO Auto-generated method stub
		bdao.readCountUp(bno);
	}

	@Override
	public int removeFile(String uuid) {
		long bno = fdao.getBnoToUuid(uuid);
		int isOk = fdao.removeFile(uuid);
		if(isOk > 0) {
			bdao.hasFileUpdate(bno, -1);
		}
		return isOk;
	}





}
