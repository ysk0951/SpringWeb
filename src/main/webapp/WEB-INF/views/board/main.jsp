<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link
	href="https://fonts.googleapis.com/css2?family=Lobster&display=swap"
	rel="stylesheet">
<!--BootStrap/Font externalbyURL-->
<title>Main</title>
</head>
<script type="text/javascript">
	function slide_home() {
		window.scrollTo({
			"top" : 0,
			"behavior" : "smooth"
		});
	}
	function slide_skills() {
		window.scrollTo({
			"behavior" : "smooth",
			"left" : 0,
			"top" : window.innerHeight * 1
		});
	}
	function slide_project() {
		window.scrollTo({
			"behavior" : "smooth",
			"left" : 0,
			"top" : window.innerHeight * 2
		});
	}
	function slide_contact() {
		window.scrollTo({
			"behavior" : "smooth",
			"left" : 0,
			"top" : window.innerHeight * 3
		});
	}
</script>
<style>
html {
	margin: 0;
	height: 100%;
}

body {
	margin: 0;
	height: 100%;
	overflow: auto;
}

.col-sm-12 {
	border: 1px solid #999;
	margin: auto;
	margin-left: auto;
	margin-right: auto;
	flex: 0, 1, 90%;
}

.row {
	border: 1px solid #999;
	height: 100%;
	overflow: hidden;
}

.table>tbody>tr>td {
	vertical-align: middle;
}

.table>thead>tr>th {
	vertical-align: middle;
}

a:link {
	text-decoration: none;
	color: black;
}

a:visited {
	text-decoration: none;
	color: black;
}

a:active {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: underline;
	color: blue;
}
</style>
<%-------------------------------------------------[ToDo List]----------------------------------------------------%>
<%---------------------------------[MappingChange >> JS/CSS import Check]--------------------------------------------%>
<%---------------------------------[nav-item/link >> sr-only Option Test]--------------------------------------------%>
<%-----------------------------------------------------------------------------------------------------------------------------%>
<body>
	<nav class="navbar fixed-top navbar-expand">
		<ul class="navbar-nav ml-auto"
			style="background-color: rgba(255, 255, 255, 0.7); border-radius: 40px;">
			<li class="nav-item">
				<div class="nav-link" onclick="slide_home()">
					Home <span class="sr-only">(current)</span></a>
			</li>
			<li class="nav-item">
				<div class="nav-link" onclick="slide_skills()">
					Skills <span class="sr-only">(current)</span></a>
			</li>
			<li class="nav-item">
				<div class="nav-link" onclick="slide_project()">
					Project <span class="sr-only">(current)</span></a>
			</li>
			<li class="nav-item">
				<div class="nav-link" onclick="slide_contact()">
					Contact <span class="sr-only">(current)</span></a>
			</li>
		</ul>
	</nav>
	<%-- -------------------------------[Remote]------------------------------------------ --%>
	<div class="container_fluid" style="height: 100%;">
		<div class="row align-items-center">
			<img src="/resources/img/homeIndex.jpg" class="img-fluid"
				style="max-height: 100%; min-width: 100%" />
		</div>
		<!--  row overflow Container-->
		<div class="row" align="center">
			<div class="col-sm-12"
				style="font-family: 'Lobster', cursive; font-size: xx-large;">Skills</div>
			<div class="col-sm-12"
				style="font-family: 'Lobster', cursive; font-size: medium;">Launage</div>
			<div class="col-sm-12">ImageContainerWillbehere</div>
			<div class="col-sm-12"
				style="font-family: 'Lobster', cursive; font-size: medium;">Web-Skill</div>
			<div class="col-sm-12">ImageContainerWillbehere</div>
			<div class="col-sm-12"
				style="font-family: 'Lobster', cursive; font-size: medium;">FrameWork</div>
			<div class="col-sm-12">ImageContainerWillbehere</div>
			<div class="col-sm-12"
				style="font-family: 'Lobster', cursive; font-size: medium;">DataBase</div>
			<div class="col-sm-12">ImageContainerWillbehere</div>
			<div class="col-sm-12"
				style="font-family: 'Lobster', cursive; font-size: medium;">ETC</div>
			<div class="col-sm-12">ImageContainerWillbehere</div>
		</div>
		<div class="row" align="center">
			<%-- <table class="table table-bordered"
				style="text-align: center; margin: 15px; height: 90%;">
				<thead>
					<tr>
						<th>NO</th>
						<th>프로젝트 이름</th>
						<th>컨텐트</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="index"  items="${list}">
						<tr>
							<td><a href="main/detail?num=${index.num}">${index.num}</a></td>
							<td><a href="main/detail?num=${index.num}">${index.projectName}</a></td>
							<td><a href="main/detail?num=${index.num}">${index.content}</a></td>
							<td><a href="main/detail?num=${index.num}">${index.regdate}</a></td>
						<tr>
					</c:forEach>
				</tbody>
			</table> --%>
				<div style="margin: 0 auto;">
					<input type="text">&nbsp; 
					<input type="button" value="검색">&nbsp;
					<Input type="button" value="새글">&nbsp; 
					<Input type="button" value="삭제">&nbsp;</br>
				
				<div style="text-align: center; height: 10%;">
					
					<%-- 이전버튼 누를시 기능 구현 --%>
					<Input type="button" value="이전">
						<%--
							currentPage(17/7) : ${pageData.currentPage}</br>
							startPage(시작) : ${pageData.startPage}</br>
							pageCount(한번에나타낼페이저) : ${pageData.pageCount}</br>
							displayRow(한페이저당 게시물수) : ${pageData.displayRow}</br>
							endPage(마지막 페이지 11~15면 15): ${pageData.endPage}</br>
							lastPage(완전마지막페이지) : ${pageData.lastPage}</br>
							rowCount(게시물총갯수) : ${pageData.rowCount}</br>
							offset(현재게시물시작위치-1) : ${pageData.offset}</br>
						--%>
						<c:set value="${pageData.indexOfPage}" var="ii" />${ii}
						<c:forEach begin="${pageData.startPage}" end="${pageData.endPage}" var="i">
							<c:choose>
								<c:when test="${i eq param.currentPage}">
									<a href="main?currentPage=${i}" style="color: red;">${i}</a>
								</c:when>
								<c:when test="${i eq pageData.startPage and empty param.currentPage}">
									<a href="main?currentPage=${i}" style="color: red;">${i}</a>
								</c:when>
								<c:otherwise>
									<a href="main?currentPage=${i}">${i}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					<Input type="button" value="다음">
				</div>
				</div>
				</div>
				</form>
				<div class="row" align="center">CONTACT</div>
				</div>
</body>
</html>