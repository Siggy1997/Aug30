<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />

<script src="./js/jquery-3.7.0.min.js"></script>

<style type="text/css">

.title {
	text-align: left;
}
</style>

<script type="text/javascript">
$(function(){
	$(".detail").click(function(){
		let first = $(this).children("td").eq(0);
		alert(first.text());
		
	});
	
	
	
})


</script>

</head>
<body>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="./"><img
				src="assets/img/navbar-logo.svg" alt="..." /></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu <i class="fas fa-bars ms-1"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
					<li class="nav-item"><a class="nav-link" href="./board">board</a></li>
					<li class="nav-item"><a class="nav-link" href="#portfolio">Portfolio</a></li>
					<li class="nav-item"><a class="nav-link" href="#about">About</a></li>
					<li class="nav-item"><a class="nav-link" href="#team">Team</a></li>
					<li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Masthead-->
	<header class="masthead">
		<div class="container">
			<h1>BOARD</h1>
			<table class="table table-dark table-hover table-sm table-striped">
				<thead>
					<tr class="row1">
						<th class="col-1">번호</th>
						<th class="col-5">제목</th>
						<th class="col-3">날짜</th>
						<th class="col-2">글쓴이</th>
						<th class="col-1">읽음</th>
					</tr>
				</thead>
				<c:forEach items="${list }" var="row">
					<tr class="detail">
						<td>${row.bno }</td>
						<td class="title">${row.btitle }
							<c:if test="${row.commentcount ne 0}">
						 	&nbsp; &nbsp;   
						 	<span class="badge bg-secondary">${row.commentcount }</span>
						</c:if>
						</td>
						<td>${row.bdate }</td>
						<td>${row.m_name }</td>
						<td>${row.blike }</td>
					</tr>
				</c:forEach>
			</table>
			<button type="button" class="btn btn-secondary">버튼 눌러주세요</button>
			<button type="button" id="modal1" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal">MODAL</button>
		</div>
	</header>

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">...</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>




	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<!-- * *                               SB Forms JS                               * *-->
	<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>