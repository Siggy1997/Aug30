<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div class="header">
		
		<div class="menu">
			<!-- <div class="logo">logo</div> -->
			<div class="menu-item" onclick="url('main')"><i class="xi-home-o xi-2x"></i> 홈</div>
			<div class="menu-item" onclick="url('multiboard')"><i class="xi-home-o xi-2x"></i> 홈</div>
			<div class="menu-item" onclick="url('post')"><i class="xi-layout-o xi-2x"></i> 보드 관리</div>
			<div class="menu-item" onclick="url('member')"><i class="xi-paper-o xi-2x"></i> 게시글 관리</div>
			<div class="menu-item" onclick="url('comment')"><i class="xi-user-o xi-2x"></i> 회원 관리</div>
			<div class="menu-item" onclick="url('message')"><i class="xi-forum xi-2x"></i> 댓글 관리</div>
			<div class="menu-item" onclick="url('mail')"><i class="xi-message-o xi-2x"></i> 메시지 관리</div>
			<div class="menu-item" onclick="url('notice')"><i class="xi-info-o xi-2x"></i> 공지사항 관리</div>
			<c:if test="true"><div class="menu-item" onclick="url('logout')"><i class="xi-log-out  xi-2x"></i> ${sessionScope.id}님 로그아웃</div></c:if>
			<div class="menu-item" onclick="url('system')" style="position: absolute; bottom: 0;"><i class="xi-info-o xi-2x"></i> 시스템 정보</div>
		</div>
<script>function url(link){location.href='./'+link;}</script>
	</div>