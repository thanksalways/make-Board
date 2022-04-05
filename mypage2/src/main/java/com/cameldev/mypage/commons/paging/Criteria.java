package com.cameldev.mypage.commons.paging;

/*
지금까지의 페이징을 위한 과정을 통해 발생하는 문제점이 있습니다.
첫번째로는 한 페이지에 보여지는 데이터가 10 개가 아니라면 
LIMIT 구문의 마지막에 입력된 10 이라는 수를 변경해야한다는 점이며,
두번째로는 ArticleDAOImpl 클래스에서는 매번 원하는 페이지를 처리할 때마다 계산이 필요하다는 점입니다.
이러한 문제점들을 해결하기 위해서 페이징 처리를 도와줄 Criteria 클래스를 작성하도록 하겠습니다.
Criteria 클래스를 작성함으로써 
우리는 페이징 처리의 기준이 되는 변수들을 <하나의 객체로 처리>하게되면서 보다 편하게 개발할 수 있게됩니다.
*/
public class Criteria {
	private int page;
	private int perPageNum;

	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
	}

	public void setPage(int page) {
		if (page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}

	public int getPage() {
		return page;
	}

	public void setPerPageNum(int perPageNum) {
		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}

	public int getPerPageNum() {
		return this.perPageNum;
	}

	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
}
