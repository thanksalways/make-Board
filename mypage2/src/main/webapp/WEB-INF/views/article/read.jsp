<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html lang="en">
<%@ include file="../include/head.jsp"%>
<!-- <script src="/resources/plugins/jquery/jquery.min.js"></script> -->
	<script src="${path}/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="${path}/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="${path}/dist/js/adminlte.min.js"></script>
	
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

		<!-- 			
		출처 : https://atoz-develop.tistory.com/entry/JSP-EL-%ED%91%9C%ED%98%84%EC%8B%9D-%EB%AC%B8%EB%B2%95%EA%B3%BC-%EC%82%AC%EC%9A%A9-%EB%B0%A9%EB%B2%95
		
		${member.no} 또는 ${member["no"])
		
		위 EL 표현식의 자바 코드는 다음과 같다.
		
		Member obj = (Member) pageContext.findAttribute("member");
		int value = obj.getNo();
				
		PageContext의 findAttribute()는 
		서블릿 보관소를 순서대로 모두 뒤져서 객체를 찾는다.
		마지막 보관소에도 없다면 null을 반환한다.
		
		JspContext → ServletRequest → HttpSession → ServletContext 
		-->
			<!-- Main content -->
			<div class="col-lg-12">
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">글제목 : ${article.title}</h3>
					</div>
					<div class="card-body" style="height: 700px">${article.content}</div>
					<div class="card-footer">
						<div class="user-block">
							<img class="img-circle img-bordered-sm"
								src="${path}/dist/img/user1-128x128.jpg" alt="user image">
							<span class="username"> <a href="#">${article.writer}</a>
							</span> 
							<span class="description"> 
							<fmt:formatDate pattern="yyyy-MM-dd" value="${article.regDate}" />
							</span>
						</div>
					</div>
					<div class="card-footer">
						<form role="form" method="post">
							<input type="hidden" name="article_no"
								value="${article.article_no}">
						</form>
						<button type="submit" class="btn btn-primary listBtn">
							<i class="fa fa-list"></i> 목록
						</button>
						<div class="float-right">
							<button type="submit" class="btn btn-warning modBtn">
								<i class="fa fa-edit"></i> 수정
							</button>
							<button type="submit" class="btn btn-danger delBtn">
								<i class="fa fa-trash"></i> 삭제
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
</body>

</html>

