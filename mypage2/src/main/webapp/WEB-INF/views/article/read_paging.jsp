<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->



<html lang="en">
<%@ include file="../include/head.jsp"%>
<script>
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
		<%@ include file="../include/main_header.jsp"%>
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
						<h3 class="card-title">글제목 : ${article.title}</h3>
					</div>
					<div class="card-body" style="height: 700px">${article.content}
					</div>
					<div class="card-footer">
						<div class="user-block">
							<img class="img-circle img-bordered-sm"
								src="${path}/dist/img/user1-128x128.jpg" alt="user image">
							<span class="username"> 
							<a href="#">${article.writer}</a>
							</span> <span class="description"> <fmt:formatDate
									pattern="yyyy-MM-dd" value="${article.regDate}" />
							</span>
						</div>
					</div>
					<div class="card-footer">
						<form role="form" method="get">
							<input type="hidden" name="article_no" value="${article.article_no}">
							<input type="hidden"name="page" value="${criteria.page}">
							<input type="hidden" name="perPageNum" value="${criteria.perPageNum}">
						</form>
						<button type="submit" class="btn btn-primary listBtn"><i class="fa fa-list"></i> 목록</button>
						<div class="pull-right">
							<button type="submit" class="btn btn-warning modBtn"><i class="fa fa-edit"></i> 수정</button>
							<button type="submit" class="btn btn-danger delBtn"><i class="fa fa-trash"></i> 삭제</button>
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

