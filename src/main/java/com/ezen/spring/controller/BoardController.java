package com.ezen.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ezen.spring.domain.BoardDTO;
import com.ezen.spring.domain.BoardVO;
import com.ezen.spring.domain.FileVO;
import com.ezen.spring.domain.PagingVO;
import com.ezen.spring.handler.FileHandler;
import com.ezen.spring.handler.PagingHandler;
import com.ezen.spring.service.BoardService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/board/*")
@Controller
public class BoardController {
	//  생성자 주입시 객체는 final로 생성
	private final BoardService bsv;
	private final FileHandler fh;
	
	@GetMapping("/register")
	public void register() {}
	
	@PostMapping("/insert")
	public String insert(BoardVO bvo, MultipartFile[] files) {
		log.info(">> insert bvo > {}", bvo);
		List<FileVO> flist = null;
		
		if(files[0].getSize() > 0) {
			//파일의 내용이 있다면
			flist = fh.uploadFiles(files);
			log.info(">> flist > {}", flist);
		}
		
		//files 정보를 이용하여 => List<FileVO> 변환을 하는 핸들러
		//fileHandler => return  List<FileVO>  +  파일 저장
		BoardDTO bdto = new BoardDTO(bvo, flist);
		int isOk = bsv.insert(bdto);
		log.info(">>>> insert > {}", isOk>0? "OK": "Fail");
		
		return "redirect:/";
	}
	
	@GetMapping("/list")
	public String list(Model m, PagingVO pgvo) {
		//Model 객체가 해당 일을 대신해 줌.
		List<BoardVO> list = bsv.getList(pgvo);
		log.info(">> list > {}", list);
		m.addAttribute("list", list);
		
		// totalCount를 구해서 PagingHadler에 매개변수로 전달
		int totalCount = bsv.getTotal(pgvo);
		PagingHandler ph = new PagingHandler(totalCount, pgvo);
		log.info(">> totalCount > {}", totalCount);
		m.addAttribute("ph", ph);
		
		return "/board/list";
	}
	
	@GetMapping({"/detail", "/modify"})
	public void detail(int bno, Model m, HttpServletRequest request) {
		// bno에 해당하는 BoardVO 객체를 DB에서 가져와서 모델로 전달
		
		String path = request.getServletPath();
		log.info(">>>>> Path > {}", path);
		if(path.equals("/board/detail")) {
			bsv.readCountUp(bno);
		}
		
//		BoardVO bvo = bsv.getDetail(bno);
//		m.addAttribute("bvo", bvo);	
		// 파일 첨부 후
		BoardDTO bdto = bsv.getDetail(bno);
		m.addAttribute("bdto", bdto);
	}
	
	@PostMapping("/update")
	public String update(BoardVO bvo,
			@RequestParam(name="files", required=false)MultipartFile[] files) {
		List<FileVO> flist = null;
		
		if(files[0].getSize() > 0) {
			flist = fh.uploadFiles(files);
		}
//		int isOk = bsv.modify(bvo);
		int isOk = bsv.modify(new BoardDTO(bvo, flist));
		log.info(">> board Update > {}", isOk>0?"OK":"FAIL");
		
		return "redirect:/board/detail?bno="+bvo.getBno(); 
	}
	
	@GetMapping("/delete")
	public String delete(int bno) {
		int isOk = bsv.delete(bno);
		log.info(">> board Delete > {}", isOk>0?"OK":"FAIL");
		
		return "redirect:/board/list";
	}
	
	@ResponseBody
	@DeleteMapping("/file/{uuid}")
	public String fileDelete(@PathVariable("uuid") String uuid) {
		int isOk = bsv.removeFile(uuid);
		return isOk > 0 ? "1":"0";
	}

	
	
	
}
