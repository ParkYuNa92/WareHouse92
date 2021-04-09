package com.green.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;


public class CharacterEncodingFilter implements Filter {
	FilterConfig config;	//멤버변수
	
	public void destroy() {	//필터 종료되면 호출되는 메서드
		// TODO Auto-generated method stub
		System.out.println("필터 destroy 함수 호출");
	}

	//필터 실행
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain next) throws IOException, ServletException {
		request.setCharacterEncoding(config.getInitParameter("encoding"));
		next.doFilter(request, response); //다음 필터로 전달
	}
	//필터 실행되면 호출되는 초기화 메서드
	public void init(FilterConfig fConfig) throws ServletException {
		this.config = fConfig;	//추가 (파라미터로 넘어온 fConfig를 이용하여 멤버변수 값 설정)
		System.out.println("필터 init 함수 호출");
	}

}
