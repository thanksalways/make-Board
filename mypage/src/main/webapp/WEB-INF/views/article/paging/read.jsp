<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
<%@ include file="../../include/head.jsp"%>
<!-- jQuery -->
<!-- <script src="/resources/plugins/jquery/jquery.min.js"></script> -->
<script src="${path}/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${path}/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="${path}/dist/js/adminlte.min.js"></script>
<!-- HandleBars JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.min.js"></script>

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
					<div class="card-footer">
						<form role="form" method="post">
							<input type="hidden" name="article_no"
								value="${article.article_no}"> <input type="hidden"
								name="page" value="${criteria.page}"> <input
								type="hidden" name="perPageNum" value="${criteria.perPageNum}">
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
					</div>
				</div>				
				<!-- <div class="card-body">
                                    <form class="form-horizontal">
                                        <div class="row">
                                            <div class="form-group col-sm-8">
                                                <input class="form-control input-sm" id="newReplyText" type="text"
                                                    placeholder="댓글 입력...">
                                            </div>
                                            <div class="form-group col-sm-2">
                                                <input class="form-control input-sm" id="newReplyWriter" type="text"
                                                    placeholder="작성자">
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
								role="button"> <i class="fa fa-edit"></i> 로그인 한 사용자만 댓글 등록이 가능합니다.
							</a>
						</c:if>
					</div>
				</div>


				<div class="card card-primary card-outline">
					<%--댓글 유무 / 댓글 갯수 / 댓글 펼치기, 접기--%>
					<div class="card-header">
						<a href="" class="link-black text-lg"> <i
							class="fas fa-comments margin-r-5 replyCount"></i></a>
						<div class="card-tools">
							<button type="button" class="btn primary" data-widget="collapse">
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
<script>
    $(document).ready(function () {
        var formObj = $("form[role='form']");
        console.log(formObj);
        $(".modBtn").on("click", function () {
            formObj.attr("action", "${path}/article/modifyPaging");
            formObj.attr("method", "get");
            formObj.submit();
        });
        $(".delBtn").on("click", function () {
            formObj.attr("action", "${path}/article/removePaging");
            formObj.submit();
        });
        $(".listBtn").on("click", function () {
            formObj.attr("method", "get");
            formObj.attr("action", "${path}/article/listPaging");
            formObj.submit();
        });
    });

    $(document).ready(function () {
        var formObj = $("form[role='form']");
        console.log(formObj);
        $(".modBtn").on("click", function () {
            formObj.attr("action", "${path}/article/modify");
            formObj.attr("method", "get");
            formObj.submit();
        });
        $(".delBtn").on("click", function () {
            formObj.attr("action", "${path}/article/remove");
            formObj.submit();
        });
        $(".listBtn").on("click", function () {
            self.location = "${path}/article/list"
        });
    });
</script>
<script id="replyTemplate" type="text/x-handlebars-template">
    {{#each.}} 
    <div class="post replyDiv" data-reply_no={{reply_no}}> 
        <div class="user-block"> 
            <img class="img-circle img-bordered-sm" src="${path}/dist/img/user1-128x128.jpg" alt="user image"> 
            <span class="username"> 
                <a href="#">{{reply_writer}}</a> 
                {{#eqReplyWriter reply_writer}} 
                <a href="#" class="float-right btn-box-tool replyDelBtn" data-toggle="modal" data-target="#delModal"> 
                    <i class="fa fa-times"> 삭제</i> </a> 
                    <a href="#" class="float-right btn-box-tool replyModBtn" data-toggle="modal" data-target="#modModal"> 
                        <i class="fa fa-edit"> 수정</i> 
                    </a> {{/eqReplyWriter}} 
                </span> 
                <span class="description">{{prettifyDate reg_date}}</span> 
            </div> 
            <div class="oldReplyText">
                    {{reply_text}}
                </div> 
                <br/> 
            </div> 
    {{/each}} 
</script>


<script>
    $(document)
        .ready(
            function () {
                var formObj = $("form[role='form']");
                console.log(formObj);

                $(".modBtn").on("click",function () {
                            //선택한 요소에 속성을 추가합니다. https://www.codingfactory.net/10208
                            formObj
                                .attr("action",
                                    "${path}/article/paging/search/modify");
                            formObj.attr("method", "get");
                            formObj.submit();
                        });

                $(".delBtn").on("click",function () {
                            formObj
                                .attr("action",
                                    "${path}/article/paging/search/remove");
                            formObj.submit();
                        });

                $(".listBtn").on("click",function () {
                            formObj
                                .attr("action",
                                    "${path}/article/paging/search/list");
                            formObj.attr("method", "get");
                            formObj.submit();
                        });
                var article_no = "${article.article_no}";
                // 현재 게시글 번호 
                var replyPageNum = 1;
                // 댓글 페이지 번호 초기화 
                // 댓글 내용 : 줄바꿈/공백처리 
                Handlebars.registerHelper("escape", function (reply_text) {
                    var text = Handlebars.Utils
                        .escapeExpression(reply_text);
                    text = text.replace(/(\r\n|\n|\r)/gm, "<br/>");
                    text = text.replace(/( )/gm, "&nbsp;");
                    return new Handlebars.SafeString(text);
                });
                // 댓글 등록일자 : 날짜/시간 2자리로 맞추기 
                Handlebars.registerHelper("prettifyDate", function (timeValue) {
                    var dateObj = new Date(timeValue);
                    var year = dateObj.getFullYear();
                    var month = dateObj.getMonth() + 1;
                    var date = dateObj.getDate();
                    var hours = dateObj.getHours();
                    var minutes = dateObj.getMinutes();

                    // 2자리 숫자로 변환 
                    month < 10 ? month = '0' + month : month;
                    date < 10 ? date = '0' + date : date;
                    hours < 10 ? hours = '0' + hours : hours;
                    minutes < 10 ? minutes = '0' + minutes : minutes;
                    return year + "-" + month + "-" + date;
                });
                Handlebars.registerHelper("eqReplyWriter", function (reply_writer, block) {
                    var accum = "";
                    if (reply_writer === "${login.userId}") {
                        accum += block.fn();
                    }
                    return accum;
                });

                // 댓글 목록 함수 호출 
                getReplies("${path}/replies/" + article_no + "/" + replyPageNum);
                // 댓글 목록 함수 
                function getReplies(repliesUri) {
                    $.getJSON(repliesUri, function (data) {
                        printReplyCount(data.pageMaker.totalCount);
                        printReplies(data.replies,
                            $(".repliesDiv"),
                            $("#replyTemplate"));

                        printReplyPaging(data.pageMaker,
                            $(".pagination"));
                    });
                }
                // 댓글 갯수 출력 함수 
                function printReplyCount(totalCount) {
                    var replyCount = $(".replyCount");
                    var collapsedBox = $(".collapsed-box");

                    // 댓글이 없으면 
                    if (totalCount === 0) {
                        replyCount.html(" 댓글이 없습니다. 의견을 남겨주세요");
                        collapsedBox.find(".btn-box-tool").remove();
                        return;
                    }

                    // 댓글이 존재하면 
                    replyCount.html(" 댓글목록 (" + totalCount + ")"); //HTML 태그를 포함하여 선택한 요소 안의 내용을 가져옵니다.

                    //이거 어디에 쓰인는거지??
                    collapsedBox.find(".box-tools").html(
                        "<button type='button' class='btn btn-box-tool' data-widget='collapse'>"
                        + "<i class='fa fa-plus'></i>"
                        + "</button>");
                }

                // 댓글 목록 출력 함수 
                function printReplies(replyArr, targetArea,
                    templateObj) {
                    var replyTemplate = Handlebars
                        .compile(templateObj.html());
                    var html = replyTemplate(replyArr);
                    $(".replyDiv").remove();
                    targetArea.html(html);
                }
                // 댓글 페이징 출력 함수 
                function printReplyPaging(pageMaker, targetArea) {
                    var str = "";
                    // 이전 버튼 활성화 
                    if (pageMaker.prev) {
                        str += "<li class=\"page-item\"><a class=\"page-link\" href='"
                            + (pageMaker.startPage - 1)
                            + "'>이전</a></li>";
                    }
                    // 페이지 번호 
                    for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
                        var strCalss = pageMaker.criteria.page == i ? 'class=active'
                            : '';
                        str += "<li class=\"page-item\" " + strCalss + "><a class=\"page-link\" href='" + i + "'>"
                            + i + "</a></li>";
                    }
                    // 다음 버튼 활성화 
                    if (pageMaker.next) {
                        str += "<li class=\"page-item\"><a class=\"page-link\" href='"
                            + (pageMaker.endPage + 1)
                            + "'>다음</a></li>";
                    }
                    targetArea.html(str);
                }
                // 댓글 페이지 번호 클릭 이벤트 
                $(".pagination").on(
                    "click",
                    "li a",
                    function (event) {
                        event.preventDefault();
                        replyPageNum = $(this).attr("href");
                        getReplies("${path}/replies/"
                            + article_no + "/"
                            + replyPageNum);
                    });

                $(".pagination").on("click", "li a",
                    function (event) {
                        event.preventDefault();
                    })

                // 댓글 저장 버튼 클릭 이벤트 
                $(".replyAddBtn").on("click",function () {
                            // 입력 form 선택자 
                            var reply_writerObj = $("#newReplyWriter");
                            var reply_textObj = $("#newReplyText");
                            var reply_writer = reply_writerObj
                                .val();
                            var reply_text = reply_textObj
                                .val();

                            //ajax https://tysoso.tistory.com/40
                            // 댓글 입력처리 수행 
                            $
                                .ajax({
                                    type: "post",
                                    url: "${path}/replies/",
                                    //해더 값을 키/값 형태로 설정(변경)할 수 있다.
                                    headers: {
                                        "Content-Type": "application/json",
                                        "X-HTTP-Method-Override": "POST"
                                    },
                                    //받아올 데이터타입(생략가능) html, json, xml 등
                                    dataType: "text",
                                    // JSON.stringify( )는 
                                    // 자바스크립트의 값을 JSON 문자열로 변환한다.
                                    data: JSON
                                        .stringify({
                                            article_no: article_no,
                                            reply_writer: reply_writer,
                                            reply_text: reply_text
                                        }),
                                    success: function (
                                        result) {
                                        console
                                            .log("result : "
                                                + result);
                                        // ===는 a === b 라고 할때, 
                                        // 값과 값의 종류(Data Type)가 모두 같은지를 비교해서, 같으면 true, 다르면 false라고 한다. 
                                        if (result === "regSuccess") {
                                            alert("댓글이 등록되었습니다.");
                                            replyPageNum = 1;
                                            // 페이지 1로 초기화 
                                            getReplies("${path}/replies/"
                                                + article_no
                                                + "/"
                                                + replyPageNum);
                                            // 댓글 목록 호출 
                                            reply_textObj
                                                .val("");
                                            // 댓글 입력창 공백처리 
                                            reply_writerObj
                                                .val("");
                                            // 댓글 입력창 공백처리 
                                        }
                                    }
                                });
                        });
                // 댓글 수정을 위해 modal창에 선택한 댓글의 값들을 세팅 
                $(".repliesDiv").on(
                    "click",
                    ".replyDiv",
                    function (event) {
                        var reply = $(this);
                        $(".reply_no").val(
                            reply.attr("data-reply_no"));
                        $("#reply_text").val(
                            reply.find(".oldReplyText")
                                .text());
                    });
                // modal 창의 댓글 수정버튼 클릭 이벤트
                $(".modalModBtn").on("click",function () {
                            var reply_no = $(".reply_no")
                                .val();
                            var reply_text = $(
                                "#reply_text").val();
                            $
                                .ajax({
                                    type: "put",
                                    url: "${path}/replies/"
                                        + reply_no,
                                    headers: {
                                        "Content-Type": "application/json",
                                        "X-HTTP-Method-Override": "PUT"
                                    },
                                    dataType: "text",
                                    data: JSON
                                        .stringify({
                                            reply_text: reply_text
                                        }),
                                    success: function (
                                        result) {
                                        console
                                            .log("result : "
                                                + result);
                                        if (result === "modSuccess") {
                                            alert("댓글이 수정되었습니다.");
                                            getReplies("${path}/replies/"
                                                + article_no
                                                + "/"
                                                + replyPageNum);
                                            // 댓글 목록 호출 
                                            $(
                                                "#modModal")
                                                .modal(
                                                    "hide");
                                            // modal 창 닫기 
                                        }
                                    }
                                })
                        });

                // modal 창의 댓글 삭제버튼 클릭 이벤트 
                $(".modalDelBtn").on("click",function () {
                            var reply_no = $(".reply_no")
                                .val();
                            $
                                .ajax({
                                    type: "delete",
                                    url: "${path}/replies/"
                                        + reply_no,
                                    headers: {
                                        "Content-Type": "application/json",
                                        "X-HTTP-Method-Override": "DELETE"
                                    },
                                    dataType: "text",
                                    success: function (
                                        result) {
                                        console
                                            .log("result : "
                                                + result);
                                        if (result === "delSuccess") {
                                            alert("댓글이 삭제되었습니다.");
                                            getReplies("${path}/replies/"
                                                + article_no
                                                + "/"
                                                + replyPageNum);
                                            // 댓글 목록 호출
                                            $(
                                                "#delModal")
                                                .modal(
                                                    "hide");
                                            // modal 창 닫기 
                                        }
                                    }
                                });
                        });
            });
</script>
</body>

</html>