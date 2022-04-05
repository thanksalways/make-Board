package com.cameldev.mypage.commons.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
/*
	 * 이전에 만든 로그인 페이지를 확인해보면 로그인 유지 기능을 구현하기 위해 checkbox가 있는 것을 확인할 수 있습니다. 로그인 유지
	 * 기능을 구현하기 위해서는 Cookie를 사용하겠으며, 사용자가 로그인한 후 Cookie를 생성하고 브라우저에게 전송하며, 다시 서버에
	 * 접속할 때 Cookie가 전달 되는지 확인해 보겠습니다.
	 */
public class LoginInterceptor extends HandlerInterceptorAdapter {
	private static final String LOGIN = "login";
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		/*
		 * 인수 default가 true(getSession()에 들어가는 인수) requst의 getSession()메서드의 피라미터로
		 * false를 전달하면 이미 생성된 세션이 있을 때 그 세션을 반환하고 없으면 null을 반환한다.
		 */		
		HttpSession httpSession = request.getSession();
		/*
		 * Model, ModelMap Vs ModelAndView 차이점 데이터만 저장한다 vs 데이터와 이동하고자 하는 View Page를 같이
		 * 저장한다 https://javaoop.tistory.com/56
		 */
		/*
		 * Model, ModelMap은 둘다 addAttribute만 사용함
		 * 그리고 이렇게 데이터를 저장만한 후
		 * View에서 사용하게 됨
		 */
		ModelMap modelMap = modelAndView.getModelMap();
		/* 
		 * V get(Object key) 
		 * */
		Object userVO = modelMap.get("user");
		if (userVO != null) {
			logger.info("new login success");
			// setAttribute는 name,value 쌍으로 객체 Object를 저장하는 메서드다.
			// session.setAttribute(이름, 값)
			httpSession.setAttribute(LOGIN, userVO);

			// response.sendRedirect("/");
			if (request.getParameter("useCookie") != null) {
				logger.info("remember me...");
				// 쿠키 생성
				// Cookie(String name, String value)
				Cookie loginCookie = new Cookie("loginCookie", httpSession.getId());
				loginCookie.setPath("/mypage");
				loginCookie.setMaxAge(60 * 60 * 24 * 7); // 전송 response.addCookie(loginCookie); }
			}

			// response.sendRedirect 코드는 /mypage로 단순히 페이지만 넘어가겠다는 의미
			// https://charming-jung.tistory.com/14
			Object destination = httpSession.getAttribute("destination");
			response.sendRedirect(destination != null ? (String) destination : "/mypage");
		}
	}

	// Object 클래스는 필드가 없고 메소드로 구성되어 있다.
	// 이 메소드들은 모든 클래스들이 Object 클래스를 상속하므로, 모든 클래스에서 이용할 수 있다.
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession httpSession = request.getSession();

		// 기존의 로그인 정보 제거
		if (httpSession.getAttribute(LOGIN) != null) {
			logger.info("clear login data before");
			httpSession.removeAttribute(LOGIN);
		}
		return true;
	}
}
