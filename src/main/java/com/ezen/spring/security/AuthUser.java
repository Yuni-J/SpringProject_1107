package com.ezen.spring.security;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.ezen.spring.domain.UserVO;

import lombok.Getter;

@Getter
public class AuthUser extends User {
	/**
	 * serialVersionUID : Java 직렬화에서 객체의 버전을 식별하는 고유한 ID
	 * Java에서는 객체를 파일이나 네트워크를 통해 직렬화(Serialization)하여 저장하거나 전송
	 */
	private static final long serialVersionUID = 1L;
	private UserVO uvo;
	
	
	public AuthUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
		// TODO Auto-generated constructor stub
	}
	
	
	public AuthUser(UserVO uvo) {
		super(uvo.getEmail(), uvo.getPwd(), 
				uvo.getAuthList().stream()
				.map(authVO -> new SimpleGrantedAuthority(authVO.getAuth()))
				.collect(Collectors.toList())
				);
		
		this.uvo = uvo;
		
	}

}
