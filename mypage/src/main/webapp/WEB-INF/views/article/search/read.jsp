<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
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
						var formObj = $("form[role='form']");
						console.log(formObj);
						$(".modBtn").on("click", function() {
							formObj.submit();
						});
						$(".cancelBtn").on("click", function() {
							history.go(-1);
						});
						$(".listBtn")
								.on(
										"click",
										function() {
											self.location = "${path}/article/paging/search/list?page=${searchCriteria.page}"
													+ "&perPageNum=${searchCriteria.perPageNum}"
													+ "&searchType=${searchCriteria.searchType}"
													+ "&keyword=${searchCriteria.keyword}";
										});
					});
</script>

<script>
	$(document).ready(function() {
		var formObj = $("form[role='form']");
		console.log(formObj);
		$(".modBtn").on("click", function() {
			formObj.attr("action", "${path}/article/modify");
			formObj.attr("method", "get");
			formObj.submit();
		});
		$(".delBtn").on("click", function() {
			formObj.attr("action", "${path}/article/remove");
			formObj.submit();
		});
		$(".listBtn").on("click", function() {
			self.location = "${path}/article/list"
		});
	});

	$(document).ready(function() {
		var formObj = $("form[role='form']");
		console.log(formObj);
		$(".modBtn").on("click", function() {
			formObj.submit();
		});
		$(".cancelBtn").on("click", function() {
			history.go(-1);
		});
		$(".listBtn").on("click", function() {
			self.location = "${path}/article/list"
		});
	});

	$(document).ready(function() {
		var formObj = $("form[role='form']");
		console.log(formObj);
		$(".modBtn").on("click", function() {
			formObj.attr("action", "${path}/article/modifyPaging");
			formObj.attr("method", "get");
			formObj.submit();
		});
		$(".delBtn").on("click", function() {
			formObj.attr("action", "${path}/article/removePaging");
			formObj.submit();
		});
		$(".listBtn").on("click", function() {
			formObj.attr("method", "get");
			formObj.attr("action", "${path}/article/listPaging");
			formObj.submit();
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
								<h3 class="card-title">글제목 : ${article.title}</h3>
							</div>
							<div class="card-body" style="height: 700px">${article.content}
							</div>
							<div class="card-footer">
								<div class="user-block">
									<img class="img-circle img-bordered-sm"
										src="${path}/dist/img/user1-128x128.jpg" alt="user image">
									<span class="username"> <a href="#">${article.writer}</a>
									</span> <span class="description"> <fmt:formatDate
											pattern="yyyy-MM-dd" value="${article.regDate}" />
									</span>
								</div>
							</div>
							<%-- <div class="card-footer">
								<form role="form" method="post">
									<input type="hidden" name="article_no"
										value="${article.article_no}"> <input type="hidden"
										name="page" value="${searchCriteria.page}"> <input
										type="hidden" name="perPageNum"
										value="${searchCriteria.perPageNum}"> <input
										type="hidden" name="searchType"
										value="${searchCriteria.searchType}"> <input
										type="hidden" name="keyword" value="${searchCriteria.keyword}">
								</form>
								<button type="submit" class="btn btn-primary listBtn">
									<i class="fa fa-list"></i> 목록
								</button>
								<div class="pull-right">
									<button type="submit" class="btn btn-warning modBtn">
										<i class="fa fa-edit"></i> 수정
									</button>
									<button type="submit" class="btn btn-danger delBtn">
										<i class="fa fa-trash"></i> 삭제
									</button>
								</div>
							</div> --%>
							<div class="box-footer">
								<form role="form" method="post">
									<input type="hidden" name="article_no"
										value="${article.article_no}"> <input type="hidden"
										name="page" value="${searchCriteria.page}"> <input
										type="hidden" name="perPageNum"
										value="${searchCriteria.perPageNum}"> <input
										type="hidden" name="searchType"
										value="${searchCriteria.searchType}"> <input
										type="hidden" name="keyword" value="${searchCriteria.keyword}">
								</form>
								<button type="submit" class="btn btn-primary listBtn">
									<i class="fa fa-list"></i> 목록
								</button>
								<c:if test="${login.userId == article.writer}">
									<div class="pull-right">
										<button type="submit" class="btn btn-warning modBtn">
											<i class="fa fa-edit"></i> 수정
										</button>
										<button type="submit" class="btn btn-danger delBtn">
											<i class="fa fa-trash"></i> 삭제
										</button>
									</div>
								</c:if>
							</div>

							<!-- <div class="card-body">
								<form class="form-horizontal">
									<div class="row">
										<div class="form-group col-sm-8">
											<input class="form-control input-sm" id="newReplyText"
												type="text" placeholder="댓글 입력...">
										</div>
										<div class="form-group col-sm-2">
											<input class="form-control input-sm" id="newReplyWriter"
												type="text" placeholder="작성자">
										</div>
										<div class="form-group col-sm-2">
											<button type="button"
												class="btn btn-primary btn-sm btn-block replyAddBtn">
												<i class="fa fa-save"></i> 저장
											</button>
										</div>
									</div>
								</form>
							</div> -->
							<div class="card">
								<div class="card-body">
									<c:if test="${not empty login}">
										<form class="form-horizontal">
											<div class="row">
												<div class="form-group col-sm-8">
													<input class="form-control input-sm" id="newReplyText"
														type="text" placeholder="댓글 입력...">
												</div>
												<div class="form-group col-sm-2" hidden>
													<input class="form-control input-sm" id="newReplyWriter"
														type="text" value="${login.userId}" readonly>
												</div>
												<div class="form-group col-sm-2">
													<button type="button"
														class="btn btn-primary btn-sm btn-block replyAddBtn">
														<i class="fa fa-save"></i> 저장
													</button>
												</div>
											</div>
										</form>
									</c:if>
									<c:if test="${empty login}">
										<a href="${path}/user/login" class="btn btn-default btn-block"
											role="button"> <i class="fa fa-edit"></i> 로그인 한 사용자만 댓글
											등록이 가능합니다.
										</a>
									</c:if>
								</div>
							</div>


						</div>
						<div class="card card-primary card-outline">
							<%--댓글 유무 / 댓글 갯수 / 댓글 펼치기, 접기--%>
							<div class="card-header">
								<a href="" class="link-black text-lg"><i
									class="fas fa-comments margin-r-5 replyCount"></i></a>
								<div class="card-tools">
									<button type="button" class="btn primary"
										data-widget="collapse">
										<i class="fa fa-plus"></i>
									</button>
								</div>
							</div>
							<%--댓글 목록--%>
							<div class="card-body repliesDiv"></div>
							<%--댓글 페이징--%>
							<div class="card-footer">
								<nav aria-label="Contacts Page Navigation">
									<ul
										class="pagination pagination-sm no-margin justify-content-center m-0">
									</ul>
								</nav>
							</div>
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
	<%-- <%@ INCLUDE FILE="INCLUDE/PLUGIN_JS.JSP" %> --%>

</body>

</html>

