<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../include/head.jsp"%>
<!-- jQuery -->
<script src="${path}/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${path}/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="${path}/dist/js/adminlte.min.js"></script>
<script>
	$(document)
			.ready(
					function() {
						var result = "${msg}";
						if (result == "regSuccess") {
							alert("게시글 등록이 완료되었습니다.");
						} else if (result == "modSuccess") {
							alert("게시글 수정이 완료되었습니다.");
						} else if (result == "delSuccess") {
							alert("게시글 삭제가 완료되었습니다.");
						}
						$("#searchBtn")
								.on(
										"click",
										function(event) {
											self.location = "${path}/article/paging/search/list${pageMaker.makeQuery(1)}"
													+ "&searchType="
													+ $(
															"select option:selected")
															.val()
													+ "&keyword="
													+ encodeURIComponent($(
															"#keywordInput")
															.val());
										});

					});
</script>
<body class="hold-transition sidebar-mini">
	<div class="wrapper">
		<!-- Navbar -->
		<%@ include file="../../include/head.jsp"%>
		<!-- /.navbar -->
		<!-- Main Sidebar Container -->
		<%@ include file="../../include/left_column.jsp"%>
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1 class="m-0">Starter Page</h1>
						</div>
						<!-- /.col -->
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active">Starter Page</li>
							</ol>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /.content-header -->

			<!-- Main content -->
			<div class="content">
				<div class="container-fluid">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-header">
								<h3 class="card-title">게시글 목록</h3>
							</div>
							<div class="card-body">
								<table class="table table-bordered">
									<tbody>
										<tr>
											<th style="width: 30px">#</th>
											<th>제목</th>
											<th style="width: 100px">작성자</th>
											<th style="width: 150px">작성시간</th>
											<th style="width: 60px">조회</th>
										</tr>
										<c:forEach items="${articles}" var="article">
											<tr>

												<td>${article.article_no}</td>
												<td><a
													href="${path}/article/paging/search/read${pageMaker.makeSearch(pageMaker.criteria.page)}&article_no=${article.article_no}">
														${article.title} 
														</a> 
														<span class="badge bg-teal"> <i
														class="fas fa-comment"></i> + ${article.replyCnt}
												</span>
												</td>
												<td>${article.writer}</td>
												<td><fmt:formatDate value="${article.regDate}"
														pattern="yyyy-MM-dd a HH:mm" /></td>
												<td><span class="badge bg-red">${article.viewCnt}</span>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div class="card-footer">
								<div class="row">
									<div class="form-group col-sm-2">
										<!-- 셀렉트 박스 -->
										<select class="form-control" name="searchType" id="searchType">
											<option value="n"
												<c:out
                                                            value="${searchCriteria.searchType == null ? 'selected' : ''}" />>::::::선택::::::</option>
											<option value="t"
												<c:out
                                                            value="${searchCriteria.searchType eq 't' ? 'selected' : ''}" />>제목</option>
											<option value="c"
												<c:out
                                                            value="${searchCriteria.searchType eq 'c' ? 'selected' : ''}" />>내용</option>
											<option value="w"
												<c:out
                                                            value="${searchCriteria.searchType eq 'w' ? 'selected' : ''}" />>작성자</option>
											<option value="tc"
												<c:out
                                                            value="${searchCriteria.searchType eq 'tc' ? 'selected' : ''}" />>제목+내용</option>
											<option value="cw"
												<c:out
                                                            value="${searchCriteria.searchType eq 'cw' ? 'selected' : ''}" />>내용+작성자</option>
											<option value="tcw"
												<c:out
                                                            value="${searchCriteria.searchType eq 'tcw' ? 'selected' : ''}" />>제목+내용+작성자</option>
										</select>
									</div>
									<div class="form-group col-sm-10">
										<div class="input-group">
											<input type="text" class="form-control" name="keyword"
												id="keywordInput" value="${searchCriteria.keyword}"
												placeholder="검색어"> <span class="input-group-btn">
												<button type="button" class="btn btn-primary btn-flat"
													id="searchBtn">
													<i class="fa fa-search"></i> 검색
												</button>
											</span>
										</div>
									</div>
									<div class="float-right">
										<button type="button" class="btn btn-success btn-flat"
											id="writeBtn">
											<i class="fa fa-pencil"></i> 글쓰기
										</button>
									</div>
								</div>
							</div>
						</div>
						<!-- 값을 확인하기위해 
					<input type="text" value=${pageMaker.prev}> -->

						<%-- <input type="text" value="${articles[0].title} " /> --%>

						<div class="card-footer">
							<!-- 						<div class="text-center"> -->
							<ul class="pagination justify-content-center m-0">
								<c:if test="${pageMaker.prev}">
									<li class="page-item"><a class="page-link"
										href="${path}/article/paging/search/list${pageMaker.makeSearch(pageMaker.startPage - 1)}">
											이전</a></li>
								</c:if>
								<c:forEach begin="${pageMaker.startPage}"
									end="${pageMaker.endPage}" var="idx">
									<li class="page-item"
										<c:out value="${pageMaker.criteria.page == idx ? 'class=active' : ''}" />>
										<a class="page-link"
										href="${path}/article/paging/search/list${pageMaker.makeSearch(idx)}">
											${idx}</a>
									</li>
								</c:forEach>
								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li class="page-item"><a class="page-link"
										href="${path}/article/paging/search/list?${pageMaker.makeSearch(pageMaker.endPage + 1)}">
											다음</a></li>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
			</div>

			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
			<div class="p-3">
				<h5>Title</h5>
				<p>Sidebar content</p>
			</div>
		</aside>
		<!-- /.control-sidebar -->

		<!-- Main Footer -->
		<%-- <%@ include=file="include/main_footer.jsp" %> --%>
	</div>
	<!-- ./wrapper -->

	<!-- REQUIRED SCRIPTS -->
	<%-- <%@ include file="include/plugin_js.jsp" %> --%>

</body>
</html>