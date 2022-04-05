package com.cameldev.mypage.service;

import java.util.List;

import com.cameldev.mypage.commons.paging.Criteria;
import com.cameldev.mypage.domain.ReplyVO;

public interface ReplyService {
	List<ReplyVO> list(Integer article_no) throws Exception;

	void create(ReplyVO replyVO) throws Exception;

	void update(ReplyVO replyVO) throws Exception;

	void delete(Integer reply_no) throws Exception;

	List<ReplyVO> getRepliesPaging(Integer article_no, Criteria criteria) throws Exception;

	int countReplies(Integer article_no) throws Exception;

	void addReply(ReplyVO replyVO) throws Exception;

	void removeReply(Integer reply_no) throws Exception;

}
