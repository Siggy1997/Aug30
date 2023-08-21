<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" href="../css/admin.css">
<style type="text/css">
.notice-write-form{
   width: 95%;
   height: auto;
   margin: 10px;
   padding: 20px;
   box-sizing: border-box;
}

.notice-write-form input{
   height: 30px;
   width: 100%;
}

.notice-write-form textarea{
   width: 100%;
   height: 300px;
   margin: 5px 0px;
}

.notice-write-form button{
   width: 100px;
   height: 50px;
}

</style>



<title>admin</title>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<div class="container">

		<div class="main">
			<div class="article">
				<header class="masthead">
					<div class="container">
						<h1>게시판</h1>
						<table>
							<thead>
								<tr class="row">
									<th class="col-1">번호</th>
									<th class="col-4">제목</th>
									<th class="col-2">게시일</th>
									<th class="col-2">글쓴이</th>
									<th class="col-2">삭제여부</th>
									<th class="col-1">파일유무</th>
								</tr>
							</thead>
							<tbody >
								<c:forEach items="${list }" var="row">
									<tr class="row detail">
										<td>${row.nno}</td>
										<td>${row.ntitle}</td>
										<td>${row.ndate}</td>
										<td>${row.m_no}</td>
										<td>
										<c:choose>
											<c:when test="${row.ndel eq 1}"><i class="xi-eye"></i></c:when>
											<c:otherwise><i class="xi-eye-off"></i></c:otherwise>
										</c:choose>
										</td>
										<td>
										<c:choose>
											<c:when test="${row.norifile ne null}"><i class="xi-file-add"></i></c:when>
										</c:choose>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<br>
						<br>
						<br>
						<br>
						<div= class="notice-write-form">
							<form action="./noticeWrite" method="post" enctype="multipart/form-data">
							<input type="text" name="title" >
							<textarea name="content"></textarea>
							<input type="file" name="upFile">
						
						<button >글쓰기</button>
							</form>
						</div>
					</div>
				</header>

			</div>
		</div>
	</div>
</body>
</html>