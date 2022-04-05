<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

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
<html lang="en">
<%@ include file="../include/head.jsp"%>
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

								<c:forEach items="${articles}" var="article">
									<tr>
										<td>${article.article_no}</td>
										<td><a
											href="${path}/article/read?article_no=${article.article_no}">${article.title}</a>
										</td>
										<td>${article.writer}</td>
										<%-- <td><a
											href="${path}/article/paging/search/read${pageMaker.makeSearch(pageMaker.criteria.page)}&article_no=${article.article_no}">
												${article.title} </a> <span class="badge bg-teal"><i
												class="fas fa-comment"></i> + ${article.replyCnt}</span>
										</td> --%>
										<td><fmt:formatDate value="${article.regDate}"
												pattern="yyyy-MM-dd a HH:mm" /></td>
										<td><span class="badge bg-red">${article.viewCnt}</span></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
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
	<script src="${path}/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="${path}/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="${path}/dist/js/adminlte.min.js"></script>
</body>

</html>

