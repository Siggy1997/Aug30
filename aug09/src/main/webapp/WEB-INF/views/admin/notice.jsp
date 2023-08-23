<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin || 공지사항</title>
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" href="../css/admin.css">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"
	integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
	crossorigin="anonymous"></script>

<style type="text/css">
.notice-write-form {
	width: 95%;
	height: auto;
	margin: 10px;
	padding: 20px;
	box-sizing: border-box;
}

.notice-write-form input {
	height: 30px;
	width: 100%;
}

.notice-write-form textarea {
	width: 100%;
	height: 300px;
	margin: 5px 0px;
}

.notice-write-form button {
	width: 100px;
	height: 50px;
	width: 100px;
}

table {
	width: 1000px;
	text-align: center;
	border-collapse: collapse;
	height: 400px;
	overflow: scroll;
}

.board {
	height: 400px;
	overflow: scroll;
	float: left;
}

tr {
	border-bottom: 1px solid silver;
}

tr:hover {
	background-color: silver;
}

.title {
	text-align: left;
	width: 40%;
}

.content-view {
	width: 700px;
	height: 400px;
	background-color: white;
	float: right;
	margin-right: 100px;
	text-align: center;
	border: 2px dotted;
	text-align: center
}
</style>

<script type="text/javascript">
	$(function() {
		//alert("!");
		$(".title").click(function() {
			//alert($(this).text());
			//alert($(this).siblings(".nno").text());
			let nno = $(this).siblings(".nno").text();

			$.ajax({
				url : "./noticeDetail", //나 어디로 갈거야
				type : "post",
				data : {
					nno : nno
				},
				dataType : "json",
				success : function(data) {
					$(".content-view").html(data.content);

				},
				error : function(data) {
					alert("오류가 발생했습니다. 다시 시도하지 마십시오 : " + data);
				}
			});
		});

		$(document).on("click", ".xi-eye, .xi-eye-off", function(){
	    	  let nno = $(this).parent().siblings(".nno").text();
			let ndel = $(this).siblings(".ndel").val();
	    	  let nnoTD = $(this).parent();
	    	  $.ajax({
	    		 url: "./noticeHide",
	         	 type: "post",
	         	 data: {nno: nno, ndel:ndel},
	         	 dataType: "json",
	         	 success:function(data){
	         		//변경되었다면 모양 바꾸기
	         		//alert(data.result);
	         		if(nnoTD.html().indexOf("-off") != -1){
	         			nnoTD.html('<i class="xi-eye"></i><input class="ndel" type="hidden" value="1"> ');
	         		} else {
	         			nnoTD.html('<i class="xi-eye-off"></i><input class="ndel" type="hidden" value="0"> ');
	         		}
	         	 },
	         	 error:function(data){
	         		 alert("오류가 발생했습니다. 다시 시도하지 마십시오 : " + data);
	         	 }
	    	  });
	      });//보여주기 -> 감추기로

	});
</script>

</head>
<body>
	<div class="container">
		<%@ include file="menu.jsp"%>
		<div class="main">
			<div class="article">
				<h1>공지사항</h1>
				<!-- 리스트가 없다면 해더도 안 나오게 해주세요  choose문 -->
				<div class="board">
					<table>
						<tr>
							<td>번호</td>
							<td>제목</td>
							<td>게시일</td>
							<td>글쓴이</td>
							<td>삭제여부</td>
							<td>파일유무</td>
						</tr>
						<c:forEach items="${list}" var="row">
							<tr>
								<td class="nno">${row.nno }</td>
								<td class="title">${row.ntitle }</td>
								<td>${row.ndate }</td>
								<td>${row.m_name }</td>
								<td>
								<input class="ndel" type="hidden" value="${row.ndel }">
									<c:choose>
										<c:when test="${row.ndel eq 1}">
											<i class="xi-eye"></i>
										</c:when>
										<c:otherwise>
											<i class="xi-eye-off"></i>
										</c:otherwise>
									</c:choose></td>
								<td><c:if test="${row.norifile ne null}">
										<i class="xi-file-add"></i>
									</c:if></td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div class="content-view"></div>

				<div class="notice-write-form">
					<form action="./noticeWrite" method="post"
						enctype="multipart/form-data">
						<input type="text" name="title">
						<textarea name="content"></textarea>
						<input type="file" name="upFile">
						<button type="submit">글쓰기</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>