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
							<tr>
								<th>NO</th>
								<th>프로젝트 이름</th>
								<th>프로젝트 구현 내용</th>
								<th>등록일</th> 
								<th>조회수</th>
								<th>삭제</th>
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
							<%--TD zone --%>
							<c:forEach begin="${beginTd}" end="${endTd}" var="index"
								items="${list}" varStatus="status">
								<tr>
									<td><a href="/main/detail?num=${index.num}"><c:out
												value="${index.num}" /></a></td>
									<td><a href="/main/detail?num=${index.num}"><c:out
												value="${index.projectName}" /></a></td>
									<td><a href="/main/detail?num=${index.num}"><c:out
												value="${index.content}" /></a></td>
									<td><a href="/main/detail?num=${index.num}"><fmt:formatDate
												value="${index.regdate}" pattern="yyyy-MM-dd" /></a></td>
									<td><a href="/main/detail?num=${index.num}"><c:out
												value="${index.viewcnt}" /></a></td>
									<td><input type="checkbox" value="${index.num}"
										name="delete" /></td>
								</tr>
								<c:if test="${status.last and (status.count<7)}">
									<c:forEach begin="${status.count+1}" end="7">
										<tr>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
										</tr>
									</c:forEach>
								</c:if>
							</c:forEach>
							<tr>
								<td colspan="6" align="center"><select name="select">
										<option value="projectname">프로젝트이름</option>
										<option value="content">프로젝트구현내용</option>
								</select> <input type="text" name="search">&nbsp; <input
									type="submit" value="검색">&nbsp; <input type="button"
									value="전체글" onclick="window.location='/main'">&nbsp; <!-- onclick="window.open('../signup/signupForm.jsp') -->
									<!-- <Input type="button" value="관리자 모드(쿠키/세션/SpringSecurity)" >&nbsp; -->
									<Input type="button" value="새글"
									onclick="window.location='newData'">&nbsp; <Input
									type="submit" value="삭제">&nbsp;</td>
							</tr>
							<tr>
								<td colspan="6" align="center"><c:if test="${nowLevel>0}">
										<a
											href="/main?nowLevel=${nowLevel-1}&currentPage=${(nowLevel-1)*pageData.pageCount+1}">이전</a>
									</c:if> <%--페이지 시작~끝설정	 --%> <c:forEach
										begin="${(nowLevel*pageData.pageCount)+1}" end="${end}"
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
									</c:forEach> <c:if test="${nowLevel<pageIndex}">
										<a
											href="/main?nowLevel=${nowLevel+1}&currentPage=${(nowLevel+1)*pageData.pageCount+1}">다음</a>
									</c:if></td>
							</tr>
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