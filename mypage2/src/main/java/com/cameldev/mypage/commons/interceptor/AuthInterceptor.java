package com.cameldev.mypage.commons.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

// preHandle()메서드는 현재 사용자의 로그인 여부를 확인하고, 
// 컨트롤러를 호출할 것인지 아닌지를 결정합니다. 
// 그리고 만약 로그인하지 않은 사용자라면 로그인 페이지로 리다이렉트하게 처리했습니다. 

/*
 * 이제 비로그인 상태에서 글 쓰기를 시도하거나 게시글 수정 및 삭제를 시도할 경우 로그인 페이지로 이동하는 것을 확인할 수 있습니다.
 * 하지만 한가지 아쉬운 점은 사용자가 윈하던 페이지로 바로 이동할 수 있게 하지 않았다는 점입니다.
 * 이를 해결하가 위해 AuthInterceptor에서 사용자가 원하던 페이지가 무엇이었는지 보관했다가,
 * 로그인 성공 후 해당 페이지로 이동시켜주도록 하겠습니다.
 * 우선 AuthInterceptor 클래스를 수정해주어야하고,
 * 이를 위해 saveDestination 이라는 메소드를 생성하겠습니다.
 * 이 메소드는 말 그대로 목적지의 페이지 정보를 저장해두는 함수입니다. 
*/

public class AuthInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);

	// 페이지 요청 정보 저장
	private void saveDestination(HttpServletRequest request) {
		String uri = request.getRequestURI();
		String query = request.getQueryString();
		if (query == null || query.equals("null")) {
			query = "";
		} else {
			query = "?" + query;
		}
		if (request.getMethod().equals("GET")) {
			logger.info("destination : " + (uri + query));
			request.getSession().setAttribute("destination", uri + query);
		}
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession httpSession = request.getSession();
		if (httpSession.getAttribute("login") == null) {
			logger.info("current user is not logged");
			response.sendRedirect("/mypage/user/login");
			return false;
		}
		return true;
	}
}
