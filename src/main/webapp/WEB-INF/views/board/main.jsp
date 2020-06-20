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
			<%--pageIndex 설정--%>
			<c:set value="${pageData.indexOfPage}" var="pageIndex" />
			<%--nowLevel 설정--%>
			<c:set var="nowLevel" value="0" />
			<%--이전/다음버튼관련 param값으로 nowLevel 재할당--%>
			<c:choose>
				<c:when test="${empty param.nowLevel}">
					<c:set var="nowLevel" value="0" />
				</c:when>
				<c:when test="${!empty param.nowLevel}">
					<c:set var="nowLevel" value="${param.nowLevel}" />
				</c:when>
			</c:choose>
			<%--End변수 설정--%>
			<c:choose>
				<c:when
					test="${((nowLevel+1)*pageData.pageCount)>pageData.lastPage}">
					<c:set var="end" value="${pageData.lastPage}" />
				</c:when>
				<c:when
					test="${((nowLevel+1)*pageData.pageCount)<pageData.lastPage}">
					<c:set var="end" value="${((nowLevel+1)*pageData.pageCount)}" />
				</c:when>
			</c:choose>
			<table class="table table-bordered"
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
					<%--첫메인값 예외처리 --%>
					<c:choose>
						<c:when test="${empty param.currentPage}">
							<c:set var="beginTd" value="0" />
							<c:set var="endTd" value="${pageData.displayRow-1}" /> 
						</c:when>
						<c:when test="${!empty param.currentPage}">
							<c:set var="beginTd" value="${(param.currentPage-1)*pageData.displayRow}" />
							<c:set var="endTd" value="${(param.currentPage*pageData.displayRow)-1}" />
						</c:when>
					</c:choose>
					<c:if test="${endTd ge (pageData.rowCount-1)}">
						<c:set var="endTd" value="${pageData.rowCount-1}" />
					</c:if>
						<%--TD zone --%>
						<c:forEach begin="${beginTd}" end="${endTd}" var="index" items="${list}">
						<tr>
							<td><a href="main/detail?num=${index.num}">${index.num}</a></td>
							<td><a href="main/detail?num=${index.num}">${index.projectName}</a></td>
							<td><a href="main/detail?num=${index.num}">${index.content}</a></td>
							<td><a href="main/detail?num=${index.num}">${index.regdate}</a></td>
						</tr>	
						</c:forEach>
				</tbody>
			</table>
			<div style="margin: 0 auto;">
				<input type="text">&nbsp; <input type="button" value="검색">&nbsp;
				<Input type="button" value="새글">&nbsp; <Input type="button"
					value="삭제">&nbsp;</br>
				<div style="text-align: center; height: 10%;">
					<c:if test="${nowLevel>0}">
						<a href="/main?nowLevel=${nowLevel-1}&currentPage=${(nowLevel-1)*pageData.pageCount+1}">이전</a>
					</c:if>
					<%--페이지 시작~끝설정	 --%>
					<c:forEach begin="${(nowLevel*pageData.pageCount)+1}" end="${end}"
						var="i">
						<c:choose>
							<c:when test="${i eq param.currentPage}">
								<a href="main?currentPage=${i}&nowLevel=${nowLevel}"
									style="color: red;">${i}</a>
							</c:when>
							<c:when
								test="${i eq ((nowLevel*pageData.pageCount)+1) and empty param.currentPage}">
								<a href="main?currentPage=${i}&nowLevel=${nowLevel}"
									style="color: red;">${i}</a>
							</c:when>
							<c:otherwise>
								<a href="main?currentPage=${i}&nowLevel=${nowLevel}">${i}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${nowLevel<pageIndex}">
						<a href="/main?nowLevel=${nowLevel+1}&currentPage=${(nowLevel+1)*pageData.pageCount+1}">다음</a>
					</c:if>
				</div>
			</div>
		</div>
		</form>
		<div class="row" align="center">CONTACT</div>
	</div>
</body>
</html>