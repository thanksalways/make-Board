package com.cameldev.mypage.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cameldev.mypage.commons.paging.Criteria;
import com.cameldev.mypage.commons.paging.SearchCriteria;
import com.cameldev.mypage.domain.ArticleVO;

//영구 데이터를 빼내어 객체화 시키며, 영구 저장소에 데이터를 저장, 수정, 삭제하는 계층이다. 데이터베이스나 파일에 접근하여 데이터를 CRUD하는 계층이다

@Repository
public class ArticleDAOImpl implements ArticleDAO {

	static final String NAMESPACE = "com.cameldev.mypage.mappers.article.ArticleMapper";
	private final SqlSession sqlSession;

	@Inject
	public ArticleDAOImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void create(ArticleVO articleVO) throws Exception {
		sqlSession.insert(NAMESPACE + ".create", articleVO);
	}

	@Override
	public ArticleVO read(Integer article_no) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".read", article_no);
	}

	@Override
	public void update(ArticleVO articleVO) throws Exception {
		sqlSession.update(NAMESPACE + ".update", articleVO);
	}

	@Override
	public void delete(Integer article_no) throws Exception {
		sqlSession.delete(NAMESPACE + ".delete", article_no);
	}

	@Override
	public List<ArticleVO> listAll() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".listAll");
	}

	@Override
	public List<ArticleVO> listPaging(int page) throws Exception {
		if (page <= 0) {
			page = 1;
		}
		page = (page - 1) * 10;
		return sqlSession.selectList(NAMESPACE + ".listPaging", page);
	}

	@Override
	public List<ArticleVO> listCriteria(Criteria criteria) throws Exception {
		
		return sqlSession.selectList(NAMESPACE + ".listCriteria", criteria);
	}

}
/*
 * @Repository public class ArticleDAOImpl implements ArticleDAO { private
 * static final String NAMESPACE =
 * "com.cameldev.mypage.mappers.article.ArticleMapper"; private final SqlSession
 * sqlSession;
 * 
 * @Inject public ArticleDAOImpl(SqlSession sqlSession) { this.sqlSession =
 * sqlSession; }
 *
 * 
 * // T selectOne(query_id, '조건') // id에 대한 select문을 실행하면서 조건(쿼리문에서 사용할 인자)를
 * 전달합니다.
 * 
 * 
 * @Override public void delete(Integer article_no) throws Exception {
 * sqlSession.delete(NAMESPACE + ".delete", article_no); }
 * 
 * @Override public List<ArticleVO> listAll() throws Exception { return
 * sqlSession.selectList(NAMESPACE + ".listAll"); }
 * 
 * @Override public List<ArticleVO> listPaging(int page) throws Exception { if
 * (page <= 0) { page = 1; } page = (page - 1) * 10; return
 * sqlSession.selectList(NAMESPACE + ".listPaging", page); }
 * 
 * @Override public List<ArticleVO> listCriteria(Criteria criteria) throws
 * Exception { return sqlSession.selectList(NAMESPACE + ".listCriteria",
 * criteria); }
 * 
 * @Override public int countArticles(Criteria criteria) throws Exception {
 * return sqlSession.selectOne(NAMESPACE + ".countArticles", criteria); }
 * 
 * @Override public List<ArticleVO> listSearch(SearchCriteria searchCriteria)
 * throws Exception { return sqlSession.selectList(NAMESPACE + ".listSearch",
 * searchCriteria); }
 * 
 * @Override public int countSearchedArticles(SearchCriteria searchCriteria)
 * throws Exception { return sqlSession.selectOne(NAMESPACE +
 * ".countSearchedArticles", searchCriteria); }
 * 
 * @Override public void updateReplyCnt(Integer article_no, int amount) throws
 * Exception { Map<String, Object> paramMap = new HashMap<String, Object>();
 * paramMap.put("article_no", article_no); paramMap.put("amount", amount);
 * sqlSession.update(NAMESPACE + ".updateReplyCnt", paramMap); }
 * 
 * @Override public void updateViewCnt(Integer article_no) throws Exception {
 * sqlSession.update(NAMESPACE + ".updateViewCnt", article_no); }
 * 
 * }
 */
