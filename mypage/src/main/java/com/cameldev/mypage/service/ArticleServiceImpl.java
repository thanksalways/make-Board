package com.cameldev.mypage.service;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.cameldev.mypage.commons.paging.Criteria;
import com.cameldev.mypage.commons.paging.SearchCriteria;
import com.cameldev.mypage.domain.ArticleVO;
import com.cameldev.mypage.persistence.ArticleDAO;

@Service
public class ArticleServiceImpl implements ArticleService {
	private final ArticleDAO articleDAO;

	@Inject
	public ArticleServiceImpl(ArticleDAO articleDAO) {
		this.articleDAO = articleDAO;
	}

	@Override
	public void create(ArticleVO articleVO) throws Exception {
		articleDAO.create(articleVO);
	}

	/*
	 * @Override public ArticleVO read(Integer article_no) throws Exception { return
	 * articleDAO.read(article_no); }
	 */
	/*
	 * 위와 같이 두가지 방법의 트랜잭션 처리 방법이 있지만 Spring에서는 주로 선언적 트랜잭션 처리를 애용합니다. 그 대표적인
	 * 예로 @Transactional 애노테이션이 있습니다. 이 애노테이션은 쿼리문을 처리하는 과정에서 오류 및 에러가 발생할 경우 자동으로
	 * Rollback 처리를 수행합니다. 일반적으로 Spring에서는 Service계층(비즈니스 계층)에 @Transactional 애노테이션을
	 * 추가하는 방식을 사용합니다.
	 */ 	

	/*
	 * READ_COMMITTED (level 1) dirty read 방지 : 트랜잭션이 커밋되어 확정된 데이터만을 읽는 것을 허용 어떠한
	 * 사용자가 A라는 데이터를 B라는 데이터로 변경하는 동안 다른 사용자는 해당 데이터에 접근할 수 없다.
	 */
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public ArticleVO read(Integer article_no) throws Exception {
		articleDAO.updateViewCnt(article_no);
		return articleDAO.read(article_no);
	}

	@Override
	public void update(ArticleVO articleVO) throws Exception {
		articleDAO.update(articleVO);
	}

	@Override
	public void delete(Integer article_no) throws Exception {
		articleDAO.delete(article_no);
	}

	@Override
	public List<ArticleVO> listAll() throws Exception {
		return articleDAO.listAll();
	}

	@Override
	public List<ArticleVO> listCriteria(Criteria criteria) throws Exception {
		return articleDAO.listCriteria(criteria);
	}

	@Override
	public int countArticles(Criteria criteria) throws Exception {
		return articleDAO.countArticles(criteria);
	}

	@Override
	public List<ArticleVO> listSearch(SearchCriteria searchCriteria) throws Exception {
		return articleDAO.listSearch(searchCriteria);
	}

	@Override
	public int countSearchedArticles(SearchCriteria searchCriteria) throws Exception {
		return articleDAO.countSearchedArticles(searchCriteria);
	}

	/*
	 * @Override public int countArticles(Criteria criteria) throws Exception {
	 * return sqlSession.selectOne(NAMESPACE + ".countArticles", criteria); }
	 */

}
