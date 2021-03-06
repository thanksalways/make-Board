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
				<div class="container-fluid"></div>
			</div>

			<div class="col-lg-12">
				<form role="form" id="writeForm" method="post"
					action="${path}/article/modify">
					<div class="card">
						<div class="card-header">
							<h3 class="card-title">????????? ??????</h3>
						</div>
						<div class="card-body">
							<input type="hidden" name="article_no"
								value="${article.article_no}"> <input type="hidden"
								name="page" value="${searchCriteria.page}"> <input
								type="hidden" name="perPageNum"
								value="${searchCriteria.perPageNum}"> <input
								type="hidden" name="searchType"
								value="${searchCriteria.searchType}"> <input
								type="hidden" name="keyword" value="${searchCriteria.keyword}">
							<div class="form-group">
								<label for="title">??????</label> <input class="form-control"
									id="title" name="title" placeholder="????????? ??????????????????"
									value="${article.title}">
							</div>
							<div class="form-group">
								<label for="content">??????</label>
								<textarea class="form-control" id="content" name="content"
									rows="30" placeholder="????????? ??????????????????" style="resize: none;">${article.content}</textarea>
							</div>
							<div class="form-group">
								<label for="writer">?????????</label> <input class="form-control"
									id="writer" name="writer" value="${article.writer}" readonly>
							</div>
						</div>

						<div class="card-footer">
							<button type="button" class="btn btn-primary">
								<i class="fa fa-list"></i> ??????
							</button>
							<div class="float-right">
								<button type="button" class="btn btn-warning cancelBtn">
									<i class="fa fa-trash"></i> ??????
								</button>
								<button type="submit" class="btn btn-success modBtn">
									<i class="fa fa-save"></i> ?????? ??????
								</button>
							</div>
						</div>

						<!-- 5-2 -->
						<div class="box-body">
							<input type="hidden" name="article_no"
								value="${article.article_no}"> <input type="hidden"
								name="page" value="${criteria.page}"> <input
								type="hidden" name="perPageNum" value="${criteria.perPageNum}">
							<div class="form-group">
								<label for="title">??????</label> <input class="form-control"
									id="title" name="title" placeholder="????????? ??????????????????"
									value="${article.title}">
							</div>
							<div class="form-group">
								<label for="content">??????</label>
								<textarea class="form-control" id="content" name="content"
									rows="30" placeholder="????????? ??????????????????" style="resize: none;">${article.content}</textarea>
							</div>
							<div class="form-group">
								<label for="writer">?????????</label> <input class="form-control"
									id="writer" name="writer" value="${article.writer}" readonly>
							</div>
						</div>

					</div>
				</form>
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
	<!-- jQuery -->
	<script src="plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="dist/js/adminlte.min.js"></script>
</body>

</html>