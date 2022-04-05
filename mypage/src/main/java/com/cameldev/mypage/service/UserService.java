package com.cameldev.mypage.service;

import java.util.Date;

import com.cameldev.mypage.domain.LoginDTO;
import com.cameldev.mypage.domain.UserVO;

public interface UserService {
	// 회원 가입 처리
	void register(UserVO userVO) throws Exception;

	// 로그인 처리
	UserVO login(LoginDTO loginDTO) throws Exception;

	void keepLogin(String userId, String sessionId, Date next) throws Exception;

	UserVO checkLoginBefore(String value) throws Exception;

}
