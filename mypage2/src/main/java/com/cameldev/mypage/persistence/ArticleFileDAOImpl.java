package com.cameldev.mypage.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class ArticleFileDAOImpl implements ArticleFileDAO {
	private static final String NAMESPACE = "com.cameldev.mypage.mappers.upload.ArticleFileMapper";
	@Inject
	private SqlSession sqlSession;

	// 게시글 첨부파일 추가
	@Override
	public void addAttach(String fullName, Integer article_no) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("fullName", fullName);
		paramMap.put("article_no", article_no);
		sqlSession.insert(NAMESPACE + ".addAttach", paramMap);
	}

	// 게시글 첨부파일 조회
	@Override
	public List<String> getAttach(Integer article_no) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getAttach", article_no);
	}

	// 게시글 첨부파일 수정
	@Override
	public void replaceAttach(String fullName, Integer article_no) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("fullName", fullName);
		paramMap.put("article_no", article_no);
		sqlSession.insert(NAMESPACE + ".replaceAttach", paramMap);
	}

	// 게시글 첨부파일 삭제
	@Override
	public void deleteAttach(String fullName) throws Exception {
		sqlSession.delete(NAMESPACE + ".deleteAttach", fullName);
	}

	// 게시글 첨부파일 일괄 삭제
	@Override
	public void deleteAllAttach(Integer article_no) throws Exception {
		sqlSession.delete(NAMESPACE + ".deleteAllAttach", article_no);
	}

	// 특정 게시글의 첨부파일 갯수 갱신
	@Override
	public void updateAttachCnt(Integer article_no) throws Exception {
		sqlSession.update(NAMESPACE + ".updateAttachCnt", article_no);
	}
}
