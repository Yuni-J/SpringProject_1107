package com.ezen.spring.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Getter
@Setter
@Component
public class LoginFailureHandler implements AuthenticationFailureHandler {
	
	private String authEmail;
	private String errorMessage;
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// 로그인 시도 이메일을 세팅
		setAuthEmail(request.getParameter("email"));

		// exception 발생시 메시지를 저장
		if(exception instanceof BadCredentialsException) {
			//setErrorMessage(exception.getMessage().toString());
			setErrorMessage("비밀번호가 잘못되었습니다.");
		}else if(exception instanceof InternalAuthenticationServiceException) {
			setErrorMessage("아이디가 잘못되었습니다.");
		}else {
			setErrorMessage("관리자에게 문의해주세요.");
		}
		
		log.info(">> errMsg > {}", getErrorMessage());
		
		// 요청 속성에 이메일과 에러 메시지 추가
		request.setAttribute("email", getAuthEmail());
		request.setAttribute("errMsg", getErrorMessage());
		
		// 로그인 페이지로 포워딩, URL 쿼리 파라미터에 에러 정보를 추가하지 않음
		request.getRequestDispatcher("/user/login?error").forward(request, response);
		
		
	}



}
