package com.cameldev.mypage.service;

import java.util.List;

import com.cameldev.mypage.commons.paging.Criteria;
import com.cameldev.mypage.domain.ArticleVO;

public interface ArticleService {
//생성
	void create(ArticleVO articleVO) throws Exception;

//읽기
	ArticleVO read(Integer article_no) throws Exception;

//업데이트
	void update(ArticleVO articleVO) throws Exception;

//삭제
	void delete(Integer article_no) throws Exception;

//전부조회
	List<ArticleVO> listAll() throws Exception;
	
//페이징처리
	List<ArticleVO> listCriteria(Criteria criteria) throws Exception;
}
