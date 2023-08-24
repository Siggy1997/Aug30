<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <link href="../css/multiBoard.css" rel="stylesheet" />
</head>
<body>

	<h1>multiBoard</h1>

	<div class="divTable minimalistBlack">
		<div class="divTableHeading">
			<div class="divTableRow">
				<div class="divTableHead">no</div>
				<div class="divTableHead">cate</div>
				<div class="divTableHead">catename</div>
				<div class="divTableHead">url</div>
				<div class="divTableHead">comment</div>
			</div>
		</div>
		<c:forEach items="${list }" var="row">
			<div class="divTableBody">
				<div class="divTableRow">
					<div class="divTableCell">${row.b_no }</div>
					<div class="divTableCell">${row.mb_cate }</div>
					<div class="divTableCell">${row.b_catename }</div>
					<div class="divTableCell"><a href="${row.b_url }">클릭</a></div>
					<div class="divTableCell">${row.b_comment }</div>
				</div>
			</div>
		</c:forEach>
	</div>


</body>
</html>