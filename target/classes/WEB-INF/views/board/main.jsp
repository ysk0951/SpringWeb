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
<script src="http://code.jquery.com/jquery.min.js" ></script>
<script type="text/javascript">
	
	$(function() {
		var link = $('#navbar a.dot');
		link.on('click', function(e) {
			//href 속성을 통해, section id 타겟을 잡음
			var target = $($(this).attr('href'));
			//target section의 좌표를 통해 꼭대기로 이동
			$('html, body').animate({
				scrollTop : target.offset().top
			}, 600);
			//active 클래스 부여
			$(this).addClass('active');
			//앵커를 통해 이동할때, URL에 #id가 붙지 않도록 함.
			e.preventDefault();
		});
		$(window).on('scroll', function() {
			findPosition();
		});
		function findPosition() {
			$('section').each(function() {
				if (($(this).offset().top - $(window).scrollTop()) < 20) {
					link.removeClass('active');	
					$('#navbar').find('[data-scroll="'+ $(this).attr('id')+ '"]').addClass('active');
				}
			});
		}
		findPosition();
	});
</script>
<!--BootStrap/Font externalbyURL-->
<title>Main</title>
</head>
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
	display:table;
	border: 1px solid #999;
	height: 100vh;
	overflow: hidden;
	margin :0 auto;
    text-align: 0;
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
	width: 100vw;
    height: 100vh; 
	display: table-cell;
	padding : 10px;
	border: 1px solid black;
	vertical-align: middle;
	margin: 0 auto;
	text-align: center;
} 
.contact{
	height: 100vh;
	width: 100vw;
	display: table-cell;
	border: 1px solid black;
	text-align: center;
	vertical-align: middle;	
}

/* nevigator */
.navbar {
    position: fixed;
    z-index: 999;
    top: 50%;
    right: 50px;
    transform: translateY(-50%);
}

.navbar .nav-menu {
    margin: 0;
    padding: 0;
    list-style-type: none;
}

.navbar .nav-menu li {
    position: relative;
    min-width: 200px;
    text-align: right;
}

.navbar .nav-menu li .dot {
    display: block;
    color: #fff;
    padding: 5px 0;
}

.navbar .nav-menu li .dot::before,
.navbar .nav-menu li .dot::after {
    display: block;
    position: absolute;
    content: '';
    border-radius: 50%;
    top: 50%;
    transition: all .3s ease;
}

.navbar .nav-menu li .dot::before {
    width: 5px;
    height: 5px;
    right: 0;
    border: 2px solid #181818;
    transform: translateY(-50%);
}

.navbar .nav-menu li .dot::after {
    width: 15px;
    height: 15px;
    border: 2px solid #f44336;
    right: -5px;
    transform: translateY(-50%) scale(0);
}

.navbar .nav-menu li .dot.active::before,
.navbar .nav-menu li:hover .dot::before {
    background: #f44336;
    border-color: #f44336;
}

.navbar .nav-menu li .dot.active::after,
.navbar .nav-menu li:hover .dot::after {
    transform: translateY(-50%) scale(1);
}

.navbar .nav-menu li .dot span {
    display: inline-block;
    opacity: 0;
    font-weight: 700;
    letter-spacing: .5px;
    text-transform: capitalize;
    background-color: #f44336;
    padding: 10px 20px;
    border-radius: 3px;
    margin-right: 30px;
    transform: translateX(20px);
    transition: all .3s ease;
}

.navbar .nav-menu li .dot span::before {
    display: block;
    position: absolute;
    content: '';
    border-left: 7px solid #f44336;
    border-top: 7px solid transparent;
    border-bottom: 7px solid transparent;
    top: 50%;
    transform: translate(7px, -50%);
    right: 0;
    transition: all .3s ease;
}

.navbar .nav-menu li .dot.active span,
.navbar .nav-menu li:hover .dot span {
    transform: translateX(0px);
    opacity: 1;
}
/* End Nav Styles */

footer{
    width:100%;
    height: 300px;
    background-color: #181818;
    color: white;
    font-size: 50px;
    text-align: center;
    line-height: 300px;
}
</style>
<%-------------------------------------------------[ToDo List]----------------------------------------------------%>
<%---------------------------------[MappingChange >> JS/CSS import Check]--------------------------------------------%>
<%----------------------------------------------------------------------------------------------------------------%>
<body>
	<!--ScrollSPY구현
	https://kutar37.tistory.com/entry/%EC%8A%A4%ED%81%AC%EB%A1%A4%EC%8A%A4%ED%8C%8C%EC%9D%B4scrollspy-%EA%B5%AC%ED%98%84 
	-->
	<nav id="navbar" class="navbar">
		<ul class="nav-menu">
			<li><a data-scroll="home" href="#home" class="dot active"> <span>Home</span></a></li>
			<li><a data-scroll="one" href="#one" class="dot"> <span>Skills</span></a></li>
			<li><a data-scroll="two" href="#two" class="dot"> <span>Project</span></a></li>
			<li><a data-scroll="three" href="#three" class="dot"> <span>contect</span></a></li>
		</ul>
	</nav>
	<%-- -------------------------------[Remote]------------------------------------------ --%>
	<div class="container_fluid" >
		<div class="row align-items-center" id="home"><!--수정  style="height: 100%;" -->
			<img src="/resources/img/homeIndex.jpg" class="img-fluid"
				style="height: 100vh; width: 100vw" />
		</div> 
		<div class="align-items-center" id="one" >
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
		<div class="row" align="center" id="two" >
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
			<div class="tableView" >
			<!-- 가로를 줄이면 깨짐 수정필요 -->
			<table border="1px solid #333333;" style="height: 90%; width: 90%; ; text-align: center; margin-left: auto; margin-right: auto;">
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
					
					<%-- noData cover --%> 
					<c:if test="${beginTd ==0 and endTd < 0 }">
						<c:set var="endTd" value="0"/>
					</c:if>
					
						<%--TD zone --%>
						<c:forEach begin="${beginTd}" end="${endTd}" var="index" items="${list}" varStatus="status">
						<tr>
						
							<td><a href="/main/detail?num=${index.num}" onclick="window.open(this.href,'DETAIL','width=1000 ,height=1000'); return false;"><c:out value="${index.num}"/></a></td>
							<td><a href="/main/detail?num=${index.num}" onclick="window.open(this.href,'DETAIL','width=1000 ,height=1000'); return false;"><c:out value="${index.projectName}" /></a></td>
							<td><a href="/main/detail?num=${index.num}" onclick="window.open(this.href,'DETAIL','width=1000 ,height=1000'); return false;"><c:out value="${index.content}"/></a></td>
							<td><a href="/main/detail?num=${index.num}" onclick="window.open(this.href,'DETAIL','width=1000 ,height=1000'); return false;"><fmt:formatDate value="${index.regdate}" pattern="yyyy-MM-dd"/></a></td>
							<td><a href="/main/detail?num=${index.num}" onclick="window.open(this.href,'DETAIL','width=1000 ,height=1000'); return false;"><c:out value="${index.viewcnt}"/></a></td>
						</tr> 
						<c:if test="${status.last and (status.count<7)}">
							<c:forEach begin="${status.count+1}" end="7">
							<tr>
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
		<div class="row" align="center" id="three" >
			<div class="contact">CONTACT</div>
		</div>
	</div>
</body>
</html>