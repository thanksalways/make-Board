package com.cameldev.mypage.persistence;

import java.util.List;

public interface ArticleFileDAO {
	// 게시글 첨부파일 추가
	public void addAttach(String fullName, Integer article_no) throws Exception;

	// 게시글 첨부파일 조회
	public List<String> getAttach(Integer article_no) throws Exception;

	// 게시글 첨부파일 수정
	public void replaceAttach(String fullName, Integer article_no) throws Exception;

	// 게시글 첨부파일 삭제
	public void deleteAttach(String fullName) throws Exception;

	// 게시글 첨부파일 일괄 삭제
	public void deleteAllAttach(Integer article_no) throws Exception;

	// 특정 게시글의 첨부파일 갯수 갱신
	public void updateAttachCnt(Integer article_no) throws Exception;
}
