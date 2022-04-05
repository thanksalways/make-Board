package com.cameldev.mypage.persistence;

import java.util.Date;

import com.cameldev.mypage.domain.LoginDTO;
import com.cameldev.mypage.domain.UserVO;

public interface UserDAO {
	// 회원가입 처리
	void register(UserVO userVO) throws Exception;

	// 로그인 처리
	UserVO login(LoginDTO loginDTO) throws Exception;

	// 로그인 유지 처리
	void keepLogin(String userId, String sessionId, Date sessionLimit) throws Exception;

	// 세션키 검증
	UserVO checkUserWithSessionKey(String value) throws Exception;

}
