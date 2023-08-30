<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin || post</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"
	integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="../css/admin.css">
<link href="../css/post.css" rel="stylesheet" />


<style type="text/css">


</style>

<script type="text/javascript">
	$(function() {
		$(".title")
				.click(
						function() {
							let mbno = $(this).siblings(".mb_no").text();

							$
									.ajax({
										url : "./postA",
										type : "get",
										data : {
											mbno : mbno
										},
										dataType : "json",
										success : function(data) {
											$("." + mbno).html('<div class="ab">'+ "내용 : " + data.content+'</div>' + ' <br><button type="button" class="btn">닫기</button> ');
											$("." + mbno)
													.css(
															{
																"display" : "flex",
																"width" : "70%",
																"box-sizing" : "border-box",
																"padding" : "8px",
																"justify-content" :"center",
																"background-color" : "#B3E5FC"
															});

										},
										error : function(data) {
											alert("!");
										}
									})
						});

		$(document).on("click", ".btn", function() {
			let commentDIV = $(this).parent();
			commentDIV.hide();
		});

	});
</script>


</head>
<body>
	<div class="container">
		<%@ include file="menu.jsp"%>
		<div class="main">
			<div class="article">
				<h1>게시글 관리 ${list[0].count }글있음</h1>
				<div class="boardlist">

					<button onclick="location.href='./post?cate=0'">전체보기</button>
					<c:forEach items="${boardList}" var="b">
						<button onclick="location.href='./post?cate=${b.mb_cate }'">${b.b_catename }
						</button>
					</c:forEach>

					<form action="./post" method="get">
						<select name="searchN">
							<option value="title" >제목</option>
							<option value="content">내용</option>
							<option value="nick">글쓴이</option>
							<option value="id">ID</option>
						</select> <input type="text" name="searchV"> <input type="hidden"
							name="cate" value="${param.cate }">
						<button>검색</button>


					</form>

				</div>

				<div class="div-table">
					<div class="div-row table-head">
						<div class="div-cell table-head">번호</div>
						<div class="div-cell table-head">카테고리</div>
						<div class="div-cell table-head">제목</div>
						<div class="div-cell table-head">글쓴이</div>
						<div class="div-cell table-head">날짜</div>
						<div class="div-cell table-head">읽음수</div>
						<div class="div-cell table-head">삭제</div>

					</div>
					<c:forEach items="${list }" var="row">
						<div class="div-row <c:if test="${row.mb_del eq 0 }"> gray</c:if>">
							<div class="div-cell mb_no">${row.mb_no }</div>
							<div class="div-cell">${row.b_catename }</div>
							<div class="div-cell title">${row.mb_title }</div>
							<div class="div-cell">${row.m_name }</div>
							<div class="div-cell">${row.mb_date }</div>
							<div class="div-cell">${row.mb_read }</div>
							<div class="div-cell">${row.mb_del }</div>
						</div>
						<div class="${row.mb_no } commentDIV"></div>
					</c:forEach>
				</div>

			</div>
		</div>
	</div>
</body>
</html>