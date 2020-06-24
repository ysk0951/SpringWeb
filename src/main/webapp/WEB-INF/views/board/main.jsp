<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	/*	스크립트 수정 필요 좌표를 직접구해서 움직이는걸로 변경필요 */
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
html, body {
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
	height: 100vh;
	overflow: hidden;
}
.table>tbody>tr>td {
	vertical-align: middle;
	height: 10%;
}
.table>thead>tr>th {
	vertical-align: middle;
	height: 10%;
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
.skillHeader {
	display: flex;
	align-items: center;
	justify-content: center;
	font-family: 'Lobster', cursive;
	font-size: xx-large;
	height: 20%;
	border: 1px solid black;
}
.skillItems {
	display: flex;
	align-items: center;
	justify-content: center;
	font-family: 'Lobster', cursive;
	font-size: medium;
	height: 8%;
	border: 1px solid black;
}
.tableView{
	width : 100%;
	height : 100%;
	display: flex;
	align-items: center;
	justify-content: center;
	padding : 10px;
	border: 1px solid black;
}
.contact{
	height: 100vh;
	width: 100vw;
	display: flex;
	flex-wrap:wrap;
	align-items: center;
	justify-content: center;
	margin: 0 auto;
	border: 1px solid black;	
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
			<li class="nav-item"><div class="nav-link" onclick="slide_home()">Home</li>
			<li class="nav-item"><div class="nav-link" onclick="slide_skills()">Skills</li>
			<li class="nav-item"><div class="nav-link" onclick="slide_project()">Project</li>
			<li class="nav-item"><div class="nav-link" onclick="slide_contact()">Contact</li>
		</ul>
	</nav>
	<%-- -------------------------------[Remote]------------------------------------------ --%>
	<div class="container_fluid" >
		<div class="row align-items-center" ><!--수정  style="height: 100%;" -->
			<img src="/resources/img/homeIndex.jpg" class="img-fluid"
				style="height: 100%; width: 100%" />
		</div>
		<div class="align-items-center" >
			<div  style="height: 100vh">
				<div class="skillHeader">Skills</div>
				<div class="skillItems">Launage</div>
				<div class="skillItems">ImageContainerWillbehere</div>
				<div class="skillItems">Web-Skill</div>
				<div class="skillItems">ImageContainerWillbehere</div>
				<div class="skillItems">FrameWork</div>
				<div class="skillItems">ImageContainerWillbehere</div>
				<div class="skillItems">DataBase</div>
				<div class="skillItems">ImageContainerWillbehere</div>
				<div class="skillItems">ETC</div>
				<div class="skillItems">ImageContainerWillbehere</div>
			</div>
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
			<div class="tableView">
			<!-- 가로를 줄이면 깨짐 수정필요 -->
			<table border="1px solid #333333;" style="height:100%; width: 90%; text-align: center;">
				<thead>
					<tr>
						<th >NO</th>
						<th >프로젝트 이름</th>  
						<th >프로젝트 구현 내용</th>
						<th >등록일</th>
						<th>조회수</th>
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
						<c:forEach begin="${beginTd}" end="${endTd}" var="index" items="${list}" varStatus="status">
						<tr>
							<td><a href="main/detail?num=${index.num}"><c:out value="${index.num}"/></a></td>
							<td><a href="main/detail?num=${index.num}"><c:out value="${index.projectName}" /></a></td>
							<td><a href="main/detail?num=${index.num}"><c:out value="${index.content}"/></a></td>
							<td><a href="main/detail?num=${index.num}"><fmt:formatDate value="${index.regdate}" pattern="yyyy-MM-dd"/></a></td>
							<td><a href="main/detail?num=${index.num}"><c:out value="${index.viewcnt}"/></a></td>
						</tr>
							<c:if test="${status.last and (status.count<7)}">
								<c:forEach begin="${status.count+1}" end="7">
								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								<tr>
								</c:forEach>
							</c:if>
						</c:forEach>
						<tr>
							<td colspan="5" align="center" >
								<form>
									<input type="text" >&nbsp;
									<input type="button" value="검색" onclick="window.location.href='main'">&nbsp;
									<!-- onclick="window.open('../signup/signupForm.jsp') -->
									<Input type="button" value="관리자 모드(쿠키/세션/SpringSecurity)" >&nbsp;
									<Input type="button" value="새글" onclick="window.open('newData')">&nbsp;
									<Input type="button" value="삭제" >&nbsp;
								</form>
							</td> 
						</tr> 
						<tr>
							<td colspan="5" align="center" >		
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
							</td>
						</tr>	
				</tbody>
			</table>
			</div>
		</div> 
		<div class="row" align="center">
			<div class="contact">CONTACT</div>
		</div>
	</div>
</body>
</html>