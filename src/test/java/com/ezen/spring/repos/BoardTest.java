package com.ezen.spring.repos;



import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ezen.spring.dao.BoardDAO;
import com.ezen.spring.domain.BoardVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes ={com.ezen.spring.config.RootConfig.class} )
public class BoardTest {
	
	@Autowired
	private BoardDAO bdao;
	
	@Test
	public void insertBoardDummise() {
		for(int i=0; i<100; i++) {
			BoardVO bvo = new BoardVO();
			bvo.setTitle("Test Title " + i);
			bvo.setWriter("tester"+ ((int)(Math.random()*10)+1));
			bvo.setContent("Test Content "+i);
			
			bdao.insert(bvo);
		}
	}

}
