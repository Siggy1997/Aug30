<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" href="../css/admin.css">
<title>admin</title>
</head>
<body>
<%@ include file="menu.jsp" %>
<div class="container">

	<div class="main">
		<div class="article">
		<div class="boxs">
		<h1 >${sessionScope.mname}님 환영합니다</h1>
			<div class="box" style="background-color: #F4511E;" onclick="location.href='./multiboard'">
			보드관리<div id="comment">보드를 추가 삭제합니다.</div>
			</div>
			<div class="box" style="background-color: #61BFFC;" onclick="location.href='./post'">
			게시글관리<div id="comment">게시글을 관리합니다</div>
			</div>
			<div class="box" style="background-color: #ADC900;" onclick="location.href='./member'">
			회원관리<div id="comment">회원을 관리합니다</div>
			</div>
			<div class="box" style="background-color: #2dB400;" onclick="location.href='./comment'">
			댓글관리<div id="comment">댓글을 관리합니다</div>
			</div>
			<div class="box" style="background-color: #DD3343;" onclick="location.href='./message'">
			공지사항<div id="comment">공지사항을 관리합니다</div>
			</div>
			<div class="box"  style="background-color: #FEBC00;" onclick="location.href='./mail'">
			메시지관리<div id="comment">회원간 주고받은 메시지를 관리합니다</div>
			</div>
			<div class="box"  style="background-color: blue;" onclick="location.href='./notice'">
			공지관리<div id="comment">공지를 쓰고 관리 합니다</div>
			</div>
		</div>
		</div>
	</div>
</div>
</body>
</html>