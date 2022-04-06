<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
<%@ include file="../include/head.jsp"%>
<script>
$(document).ready(function () { 
	var formObj = $("form[role='form']"); 
	console.log(formObj); 
	$(".modBtn").on("click", function () { 
		formObj.submit(); 
		}); 
	$(".cancelBtn").on("click", function () { 
		//이전페이지로
		history.go(-1); }); 
	$(".listBtn").on("click", function () {
		self.location = "${path}/article/listPaging?page=${criteria.page}&perPageNum=${criteria.perPageNum}";
		});
	});

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
				<form role="form" id="writeForm" method="post"
					action="${path}/article/modify">
					<div class="card">
						<div class="card-header">
							<h3 class="card-title">게시글 작성</h3>
						</div>
						<div class="card-body">
							<input type="hidden" name="article_no"
								value="${article.article_no}">
							<div class="form-group">
								<label for="title">제목</label> <input class="form-control"
									id="title" name="title" placeholder="제목을 입력해주세요"
									value="${article.title}">
							</div>
							<div class="form-group">
								<label for="content">내용</label>
								<textarea class="form-control" id="content" name="content"
									rows="30" placeholder="내용을 입력해주세요" style="resize: none;">${article.content}</textarea>
							</div>
							<div class="form-group">
								<label for="writer">작성자</label> <input class="form-control"
									id="writer" name="writer" value="${article.writer}" readonly>
							</div>
						</div>
						<div class="card-footer">
							<button type="button" class="btn btn-primary listBtn">
								<i class="fa fa-list"></i> 목록
							</button>
							<div class="float-right">
								<button type="button" class="btn btn-warning cancelBtn">
									<i class="fa fa-trash"></i> 취소
								</button>
								<button type="submit" class="btn btn-success modBtn">
									<i class="fa fa-save"></i> 수정 저장
								</button>
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
	<%-- <%@ include file="include/plugin_js.jsp"%> --%>
	<!-- jQuery -->
	<script src="plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="dist/js/adminlte.min.js"></script>
</body>
</html>



