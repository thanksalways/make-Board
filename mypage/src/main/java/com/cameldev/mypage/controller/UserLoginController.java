package com.cameldev.mypage.controller;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;

import com.cameldev.mypage.domain.LoginDTO;
import com.cameldev.mypage.domain.UserVO;
import com.cameldev.mypage.service.UserService;

@Controller
@RequestMapping("/user")
public class UserLoginController {
	private final UserService userService;

	@Inject
	public UserLoginController(UserService userService) {
		this.userService = userService;
	}

// 로그인 페이지 
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGET(@ModelAttribute("loginDTO") LoginDTO loginDTO) {
		return "/user/login";
	}

// 로그인 처리 
	/*
	 * 이전 버전
	 * 
	 * @RequestMapping(value = "/loginPost", method = RequestMethod.POST) public
	 * void loginPOST(LoginDTO loginDTO, HttpSession httpSession, Model model)
	 * throws Exception { UserVO userVO = userService.login(loginDTO); if (userVO ==
	 * null || !BCrypt.checkpw(loginDTO.getUserPw(), userVO.getUserPw())) { return;
	 * } model.addAttribute("user", userVO); }
	 */

	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public void loginPOST(LoginDTO loginDTO, HttpSession httpSession, Model model) throws Exception {
		UserVO userVO = userService.login(loginDTO);
		if (userVO == null || !BCrypt.checkpw(loginDTO.getUserPw(), userVO.getUserPw())) {
			return;
		}
		model.addAttribute("user", userVO);
		// 로그인 유지를 선택할 경우
		if (loginDTO.isUseCookie()) {
			int amount = 60 * 60 * 24 * 7;
			// 7일
			Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));
			// 로그인 유지기간 설정
			userService.keepLogin(userVO.getUserId(), httpSession.getId(), sessionLimit);
		}
	}

	// 로그아웃 처리
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession)
			throws Exception {
		Object object = httpSession.getAttribute("login");
		if (object != null) {
			UserVO userVO = (UserVO) object;
			httpSession.removeAttribute("login");
			httpSession.invalidate();
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			if (loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				userService.keepLogin(userVO.getUserId(), "none", new Date());
			}
		}
		return "/user/logout";
	}

}
