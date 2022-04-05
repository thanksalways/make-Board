package com.cameldev.mypage.commons.exception;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class CommonExceptionAdvice {
	private static final Logger logger = LoggerFactory.getLogger(CommonExceptionAdvice.class);

	@ExceptionHandler(Exception.class)
	public ModelAndView commonException(Exception e) {
		logger.info(e.toString());
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("exception", e);
		modelAndView.setViewName("/commons/common_error");
		return modelAndView;
	}
}
/*
 * 여기서 한가지 주의할 점은 이 클래스는 일반 컨트롤러 클래스와는 다르게 
 * Model 타입을 파라미터로 사용하는 것은 허용하지 않기때문에
 * ModelAndView 타입을 사용한다는 점입니다. 
 * ModelAndView 타입은 하나의 객체로 Model 데이터와 View를 동시에
 * 처리가능한 객체입니다.
 */
