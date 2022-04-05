package com.cameldev.mypage.service;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cameldev.mypage.commons.paging.Criteria;
import com.cameldev.mypage.domain.ReplyVO;
import com.cameldev.mypage.persistence.ArticleDAO;
import com.cameldev.mypage.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {
	private final ReplyDAO replyDAO;

	private final ArticleDAO articleDAO;

	@Inject
	public ReplyServiceImpl(ReplyDAO replyDAO, ArticleDAO articleDAO) {
		this.replyDAO = replyDAO;
		this.articleDAO = articleDAO;
	}

	// 댓글 등록
	@Transactional
	// 트랜잭션 처리
	@Override
	public void addReply(ReplyVO replyVO) throws Exception {
		replyDAO.create(replyVO);
		// 댓글 등록
		articleDAO.updateReplyCnt(replyVO.getArticle_no(), 1);
		// 댓글 갯수 증가
	}

	// 댓글 삭제
	@Transactional
	// 트랜잭션 처리
	@Override
	public void removeReply(Integer reply_no) throws Exception {
		int article_no = replyDAO.getArticleNo(reply_no);
		// 댓글의 게시물 번호 조회
		replyDAO.delete(reply_no);
		// 댓글 삭제
		articleDAO.updateReplyCnt(article_no, -1);
		// 댓글 갯수 감소
	}

	@Override
	public List<ReplyVO> list(Integer article_no) throws Exception {
		return replyDAO.list(article_no);
	}

	@Override
	public void create(ReplyVO replyVO) throws Exception {
		replyDAO.create(replyVO);
	}

	@Override
	public void update(ReplyVO replyVO) throws Exception {
		replyDAO.update(replyVO);
	}

	@Override
	public void delete(Integer reply_no) throws Exception {
		replyDAO.delete(reply_no);
	}

	@Override
	public List<ReplyVO> getRepliesPaging(Integer article_no, Criteria criteria) throws Exception {
		return replyDAO.listPaging(article_no, criteria);
	}

	@Override
	public int countReplies(Integer article_no) throws Exception {
		return replyDAO.countReplies(article_no);
	}

}
