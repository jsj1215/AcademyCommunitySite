<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<!-- Bootstrap Core CSS -->
<link href="resources/css/bootstrap.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="resources/css/business-casual.css" rel="stylesheet">

<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic"
	rel="stylesheet" type="text/css">
<!-- jQuery -->
<script src="resources/js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="resources/js/bootstrap.min.js"></script>
<style>
h4 {
	text-align: center;
}
</style>
</head>
<body>
	<div class="brand" onclick="location.href='main'">KGItBank</div>
	<div class="address-bar" onclick="location.href='main'">KG 커뮤니티 카페</div>

	<nav class="navbar navbar-default" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>

				<a class="navbar-brand" href="main">KG 아이티뱅크</a>
			</div>


			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="main">HOME</a></li>
					<c:choose>
						<c:when test="${empty sclasses }">
							<li><a href="board_list">게시판</a></li>
							<li><a href="ImageBoard_main">갤러리</a></li>
							<li><a href="fileBoardList">자료실</a></li>
							<li><a href="main_login">로그인</a></li>
							<li><a href="main_join" style="color: red">회원가입</a></li>
						</c:when>
						<c:when test="${sclasses eq '관리자' }">
							<li><a href="user_member">회원정보</a></li>
							<li><a href="board_list">게시판</a></li>
							<li><a href="ImageBoard_main">갤러리</a></li>
							<li><a href="fileBoardList">자료실</a></li>
							<li><a href="user_mypage" style="color: red">마이페이지</a></li>
							<li><a href="user_logout">로그아웃</a></li>
						</c:when>
						<c:when test="${sclasses eq '강사' }">
							<li><a href="board_list">게시판</a></li>
							<li><a href="ImageBoard_main">갤러리</a></li>
							<li><a href="fileBoardList">자료실</a></li>
							<li><a href="user_mypage" style="color: red">마이페이지</a></li>
							<li><a href="user_logout">로그아웃</a></li>
						</c:when>
						<c:when test="${sclasses eq '학생' }">
							<li><a href="board_list">게시판</a></li>
							<li><a href="ImageBoard_main">갤러리</a></li>
							<li><a href="fileBoardList">자료실</a></li>
							<li><a href="user_mypage" style="color: red">마이페이지</a></li>
							<li><a href="user_logout">로그아웃</a></li>
						</c:when>
					</c:choose>
				</ul>
			</div>
		</div>
		<!-- /.container -->
	</nav>
	
</body>
</html>