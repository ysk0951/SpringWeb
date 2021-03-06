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
	font-size:calc(5px + 1.3vw);
} 
.hostingThFont >th{
	padding: 0px;
	font-size:calc(10px + 1.5vw);
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
				<!-- 508 601  -->
			<div style="display: flex; align-items: center; vertical-align: middle; height: 100vh; width: 100vw;
			background: linear-gradient(#0c0d16 50%,#1a1c2b 50%); ">
				<img src="/resources/img/homeIndex.jpg" class="img-fluid"
					style="width: 100vw" />
			</div>
		</div>
		<div style="height: 100vh; display: flex; align-items: center; background-color: #1a1c2b; flex-direction: column;" id="skillForNavigator">
			<div style="height: 80%;">
				<div class="skillHeader">Skills</div>
				<div class="skillItems">Launage</div>
				<!-- 508 601 -->
				<div class="skillItemsButton">
					<img src="/resources/img/java.png" class="imgButton">&nbsp;&nbsp;&nbsp;
					<img src="/resources/img/javascript.png" class="imgButton">&nbsp;&nbsp;&nbsp;
					<img src="/resources/img/python.png" class="imgButton">
				</div>
				<div class="skillItems">Web-Skill</div>
				<div class="skillItemsButton">
					<img src="/resources/img/css.png" class="imgButton">&nbsp;&nbsp;&nbsp;
					<img src="/resources/img/html.png" class="imgButton">&nbsp;&nbsp;&nbsp;
					<img src="/resources/img/javascript.png" class="imgButton">&nbsp;&nbsp;&nbsp;
					<img src="/resources/img/boot.png" class="imgButton">&nbsp;&nbsp;&nbsp;
					<img src="/resources/img/react.png" class="imgButton">&nbsp;&nbsp;&nbsp;
				</div>
				<div class="skillItems">FrameWork</div>
				<div class="skillItemsButton">
					<img src="/resources/img/spring.png" class="imgButton">&nbsp;&nbsp;&nbsp;
					<img src="/resources/img/express.png" class="imgButton">&nbsp;&nbsp;&nbsp;
					<img src="/resources/img/node.png" class="imgButton">&nbsp;&nbsp;&nbsp;
				</div>
				<div class="skillItems">DataBase</div>
				<div class="skillItemsButton">
					<img src="/resources/img/oracle.png" class="imgButton">&nbsp;&nbsp;&nbsp;
					<img src="/resources/img/mongo.png" class="imgButton">&nbsp;&nbsp;&nbsp;
				</div>
				<div class="skillItems">ETC</div>
				<div class="skillItemsButton">
					<img src="/resources/img/git.png" class="imgButton">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
		</div>
		<div class="row" align="center" >
				<div class="tableView" id="projectForNavigator">
					<!-- 가로를 줄이면 깨짐 수정필요 -->
					<table  
					style=" border:3px solid #559AFC;
					width: 90vw; 
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
							<%--TD zone FOR HOSTING--%> 
								<tr class="hostingTableFont">
									<td><a href="https://ysk0951.github.io/SpringMVC/">4</a></td>
									<td><a href="https://ysk0951.github.io/SpringMVC/">마시는녀석들</a></td>
									<td><a href="https://ysk0951.github.io/SpringMVC/">Mybatis,Oauth2.0,AOP,tiles,Mobile</a></td>
									<td><a href="https://ysk0951.github.io/SpringMVC/">2020.10</a></td>
								</tr>
								<tr class="hostingTableFont">
									<td><a href="https://ysk0951.github.io/SpringWeb">3</a></td>
									<td><a href="https://ysk0951.github.io/SpringWeb/">Spring PROJECT CONTAINER</a></td>
									<td><a href="https://ysk0951.github.io/SpringWeb/">SpringMVC2,Mybatis</a></td>
									<td><a href="https://ysk0951.github.io/SpringWeb/">2020.07</a></td>
								</tr>
								<tr class="hostingTableFont">
									<td><a href="https://ysk0951.github.io/BeginVegan/">2</a></td>
									<td><a href="https://ysk0951.github.io/BeginVegan/">BeginVegan</a></td>
									<td><a href="https://ysk0951.github.io/BeginVegan/">JSP MODEL1 Project</a></td>
									<td><a href="https://ysk0951.github.io/BeginVegan/">2020.07</a></td>
								</tr>
								<tr class="hostingTableFont">
									<td><a href="https://ysk0951.github.io/NcsStudy/">1</a></td>
									<td><a href="https://ysk0951.github.io/NcsStudy/">NCS STUDY</a></td>
									<td><a href="https://ysk0951.github.io/NcsStudy/">NCS국가직무교육 교육소스</a></td>
									<td><a href="https://ysk0951.github.io/NcsStudy/">2020.05</a></td>
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
