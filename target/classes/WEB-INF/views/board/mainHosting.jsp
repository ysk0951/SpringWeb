<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link href="/resources/css/home.css"" rel="stylesheet" type="text/css">
<link href="/resources/css/homeNavigator.css"" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery.min.js"></script>
<!--BootStrap/Font externalbyURL-->
<title>Main</title>
<style>
.hostingTableFont >td>a{
	padding: 0px;
	font-size:calc(8px + 1.5vw);
} 
.hostingThFont >th{
	padding: 0px;
	font-size:calc(12px + 1.5vw);
}
</style>
</head>
<script type="text/javascript">

</script>
<%-------------------------------------------------[ToDo List]----------------------------------------------------%>
<body>
	<form action="deletePro" method="post">
			<nav>
				<div class="background">
					<a href="#homeForNavigator" >HOME</a>
					<a href="#skillForNavigator" >SKILLS</a>
					<a href="#projectForNavigator" >PROJECT</a>
					<a href="#contactForNavigator" >CONTACT</a>
			  	</div>
			</nav> 	
			<div class="row align-items-center" id="homeForNavigator">
				<!--수정  style="height: 100%;" -->
				<img src="/resources/img/homeIndex.jpg" class="img-fluid"
					style="height: 100vh; width: 100vw" />
			</div>
			<div style="height: 100vh; background-color: #1a1c2b" id="skillForNavigator">
				<div class="skillHeader">Skills</div>
				<div class="skillItems">Launage</div>
				<!-- 508 601 -->
				<div class="skillItemsButton">
					<img src="/resources/img/java.png" class="imgButton">&nbsp;&nbsp;&nbsp;
					<img src="/resources/img/javascript.png" class="imgButton">
				</div>
				<div class="skillItems">Web-Skill</div>
				<div class="skillItemsButton">
					<img src="/resources/img/css.png" class="imgButton">&nbsp;&nbsp;&nbsp;
					<img src="/resources/img/html.png" class="imgButton">&nbsp;&nbsp;&nbsp;
					<img src="/resources/img/javascript.png" class="imgButton">&nbsp;&nbsp;&nbsp;
					<img src="/resources/img/boot.png" class="imgButton">
				</div>
				<div class="skillItems">FrameWork</div>
				<div class="skillItemsButton">
					<img src="/resources/img/spring.png" class="imgButton">
				</div>
				<div class="skillItems">DataBase</div>
				<div class="skillItemsButton">
					<img src="/resources/img/oracle.png" class="imgButton">
					<img src="/resources/img/dbeaver.png" class="imgButton">
				</div>
				<div class="skillItems">ETC</div>
				<div class="skillItemsButton">
					<img src="/resources/img/git.png" class="imgButton">
				</div>
			</div>
			<div class="row" align="center" >
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
				<div class="tableView" id="projectForNavigator">
					<!-- 가로를 줄이면 깨짐 수정필요 -->
					<table  
					style=" border:3px solid #559AFC;
					height: 90%; width: 90%; 
					text-align: center; margin-left: auto;
					margin-right: auto;"> 
						<thead> 
							<tr class="hostingThFont">
								<th style="width: 10%">NO</th>
								<th style="width: 40%">프로젝트 이름</th>
								<th style="width: 40%">프로젝트 구현 내용</th>
								<th style="width: 10%">등록일</th> 
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
									<c:set var="beginTd"
										value="${(param.currentPage-1)*pageData.displayRow}" />
									<c:set var="endTd"
										value="${(param.currentPage*pageData.displayRow)-1}" />
								</c:when>
							</c:choose>
							
							<c:if test="${endTd ge (pageData.rowCount-1)}">
								<c:set var="endTd" value="${pageData.rowCount-1}" />
							</c:if>

							<%-- noData cover --%>
							<c:if test="${beginTd ==0 and endTd < 0 }">
								<c:set var="endTd" value="0" />
							</c:if>
							
							<%--TD zone FOR HOSTING--%> 
								<tr class="hostingTableFont">
									<td><a href="https://github.com/ysk0951/youtubeLectureContainer">4</a></td>
									<td><a href="https://github.com/ysk0951/youtubeLectureContainer">YOUTUBE LECTURE CONTAINER</a></td>
									<td><a href="https://github.com/ysk0951/youtubeLectureContainer">SpringMVC2,Mybatis,Google API(Oauth2.0,etc)</a></td>
									<td><a href="https://github.com/ysk0951/youtubeLectureContainer">2020.08</a></td>
								</tr>
								<tr class="hostingTableFont">
									<td><a href="https://github.com/ysk0951/SpringWeb">3</a></td>
									<td><a href="https://github.com/ysk0951/SpringWeb">Spring PROJECT CONTAINER</a></td>
									<td><a href="https://github.com/ysk0951/SpringWeb">SpringMVC2,Mybatis</a></td>
									<td><a href="https://github.com/ysk0951/SpringWeb">2020.07</a></td>
								</tr>
								<tr class="hostingTableFont">
									<td><a href="https://github.com/ysk0951/codinnnnng">2</a></td>
									<td><a href="https://github.com/ysk0951/codinnnnng">BeginVegan</a></td>
									<td><a href="https://github.com/ysk0951/codinnnnng">JSP MODEL1 Project</a></td>
									<td><a href="https://github.com/ysk0951/codinnnnng">2020.07</a></td>
								</tr>
								<tr class="hostingTableFont">
									<td><a href="https://github.com/ysk0951/NcsStudy">1</a></td>
									<td><a href="https://github.com/ysk0951/NcsStudy">NCS STUDY</a></td>
									<td><a href="https://github.com/ysk0951/NcsStudy">NCS국가직무교육 교육소스</a></td>
									<td><a href="https://github.com/ysk0951/NcsStudy">2020.05</a></td>
								</tr>
							<!--  -->
							
						</tbody>
					</table>
				</div>
			</div>
			<div class="row" align="center" >
				<div class="contactBlock" id="contactForNavigator"> 
					<div class="contect">[ Contact ]</div>
					<div class="contect">[ yskimweb@google.com ]</div>
				</div>  
			</div>
	</form>
</body>
</html>