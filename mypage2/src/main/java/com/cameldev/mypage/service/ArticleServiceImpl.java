package com.cameldev.mypage.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cameldev.mypage.commons.paging.Criteria;
import com.cameldev.mypage.domain.ArticleVO;
import com.cameldev.mypage.persistence.ArticleDAO;

@Service
public class ArticleServiceImpl implements ArticleService{

	private final ArticleDAO articleDAO;
	
	

	@Inject
	public ArticleServiceImpl(ArticleDAO articleDAO) {
		this.articleDAO = articleDAO;
	}

	// 생성
	@Override
	public void create(ArticleVO articleVO) throws Exception{
		articleDAO.create(articleVO);
	}

	// 읽기
	@Override
	public ArticleVO read(Integer article_no) throws Exception{
		return articleDAO.read(article_no);		
	}

	// 업데이트
	@Override
	public void update(ArticleVO articleVO) throws Exception{
		articleDAO.update(articleVO);
	}

	// 삭제
	@Override
	public void delete(Integer article_no) throws Exception{
		articleDAO.delete(article_no);		
	}

	// 전부조회
	@Override
	public List<ArticleVO> listAll() throws Exception{		
		return articleDAO.listAll();
	}

	@Override
	public List<ArticleVO> listCriteria(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return articleDAO.listCriteria(criteria);
	}

}
