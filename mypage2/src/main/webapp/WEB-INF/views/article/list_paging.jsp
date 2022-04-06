<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
<%@ include file="../include/head.jsp"%>
<script>
	var result = "${msg}";
	if (result == "regSuccess") {
		alert("게시글 등록이 완료되었습니다.");
	} else if (result == "modSuccess") {
		alert("게시글 수정이 완료되었습니다.");
	} else if (result == "delSuccess") {
		alert("게시글 삭제가 완료되었습니다.");
	}
</script>
<body class="hold-transition sidebar-mini">
	<div class="wrapper">

		<!-- Navbar -->
		<%-- <%@ include file="../include/main_header.jsp"%> --%>
		<!-- /.navbar -->

		<!-- Main Sidebar Container -->
		<%@ include file="../include/left_column.jsp"%>

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
								<!-- Controller에서 "articles" model에 담겨진 채로 넘겨지게 됨 -->
								<c:forEach items="${articles}" var="article">
								<tr>
								<td><a href="${path}/article/read?article_no=${article.article_no}">${article.title}</a></td>
								<td>${article.writter}</td>
								<!-- (fmt태그)formatDate : 날자 정보를 가진 객체(Date)를 특정 형식으로 변호나하여 출력 -->
								<td><fmt:formatDate value="${article.regDate}" pattern="yyyy-MM-dd a HH:mm"/></td>
								<td><span class="badge bg-red"${article.viewCnt}></span></td>
								</tr>								
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="card-footer">
						<nav aria-label="Contacts Page Navigation">
							<ul class="pagination justify-content-center m-0">
								<c:if test="${pageMaker.prev}">
									<li class="page-item"><a class="page-link"
										href="${path}/article/listPaging?page=${pageMaker.startPage - 1}">이전</a></li>
								</c:if>
								<c:forEach begin="${pageMaker.startPage}"
									end="${pageMaker.endPage}" var="idx">
									<li class="page-item"
										<c:out value="${pageMaker.criteria.page == idx ? 'class=active' : ''}"/>>
										<a class="page-link" href="${path}/article/listPaging?page=${idx}">${idx}</a>
									</li>
								</c:forEach>
								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li class="page-item"><a class="page-link" 
									href="${path}/article/listPaging?page=${pageMaker.endPage + 1}">다음</a></li>
								</c:if>
							</ul>
						</nav>
					</div>

					<%-- <div class="card-footer">
						<nav aria-label="Contacts Page Navigation">
							<ul class="pagination justify-content-center m-0">
								<c:if test="${pageMaker.prev}">
									<li class="page-item"><a class="page-link"
										href="${path}/article/paging/list${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
								</c:if>
								<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
									<li class="page-item"
										<c:out value="${pageMaker.criteria.page == idx ? 'class=active' : ''}"/>>
										<a class="page-link"
										href="${path}/article/paging/read${pageMaker.makeQuery(idx)}">${idx}</a>
									</li>
								</c:forEach>
								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li class="page-item"><a class="page-link"
										href="${path}/article/paging/read${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
								</c:if>
							</ul>
						</nav>
					</div> --%>
					<div class="card-footer">
						<div class="float-right">
							<button type="button" class="btn btn-success btn-flat"
								id="writeBtn">
								<i class="fa fa-pencil"></i> 글쓰기
							</button>
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
	<%-- <%@ include file="include/plugin_js.jsp"%> --%>
	<!-- jQuery -->
	<script src="plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="dist/js/adminlte.min.js"></script>
</body>

</html>

