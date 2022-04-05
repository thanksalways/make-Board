package com.cameldev.mypage.persistence;

import java.util.List;

import com.cameldev.mypage.commons.paging.Criteria;
import com.cameldev.mypage.commons.paging.SearchCriteria;
import com.cameldev.mypage.domain.ArticleVO;

public interface ArticleDAO {
//	생성
	void create(ArticleVO articleVO) throws Exception;		
//	읽기
	ArticleVO read(Integer article_no) throws Exception;	
//	갱신
	void update(ArticleVO articleVO) throws Exception;	
//	삭제
	void delete(Integer article_no) throws Exception;	
//	전체선택
	List<ArticleVO> listAll() throws Exception;	
//	리스트페이징
	List<ArticleVO> listPaging(int page) throws Exception;
//	리스트 기준
	List<ArticleVO> listCriteria(Criteria criteria) throws Exception;
//	
		
}



/*
 * void create(ArticleVO articleVO) throws Exception;
 * 
 * ArticleVO read(Integer article_no) throws Exception;
 * 
 * void update(ArticleVO articleVO) throws Exception;
 * 
 * void delete(Integer article_no) throws Exception;
 * 
 * List<ArticleVO> listAll() throws Exception;
 * 
 * List<ArticleVO> listPaging(int page) throws Exception;
 * 
 * List<ArticleVO> listCriteria(Criteria criteria) throws Exception;
 * 
 * int countArticles(Criteria criteria) throws Exception;
 * 
 * List<ArticleVO> listSearch(SearchCriteria searchCriteria) throws Exception;
 * 
 * int countSearchedArticles(SearchCriteria searchCriteria) throws Exception;
 * 
 * void updateReplyCnt(Integer article_no, int amount) throws Exception;
 * 
 * void updateViewCnt(Integer article_no) throws Exception;
 */