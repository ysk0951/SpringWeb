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
	height: 100%;
	overflow: hidden;
}

table>tbody>tr>td {
	vertical-align: middle; 
	text-align: center;
}

.table>thead>tr>th {
	vertical-align: middle;
	text-align: center;
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
	height: 100vh;
	width: 100vw;
	display: flex;
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
	<div class="container_fluid" >
		<div class="row align-items-center" ><!--수정  style="height: 100%;" -->
			<img src="/resources/img/homeIndex.jpg" class="img-fluid"
				style="max-height: 100%; min-width: 100%" />
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
		<div class="row" align="center" ><!--수정 -->
			<div class="tableView">
				<div style="height:90%; width: 100%; display: block; border: 1px solid black;">
				<table border="1px solid #333333;" >
					<thead>
						<tr>
							<th>NO</th>
							<th>프로젝트 이름</th>
							<th>컨텐트</th>
							<th>등록일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>2</td>
							<td>3</td>
							<td>4</td>
						</tr>
					</tbody>
				</table>
				</div>
				<div style="height:10%; width: 100%; display: block; border: 1px solid black;" >
					<input type="text">&nbsp;
					<input type="button" value="검색">&nbsp;
					<Input type="button" value="새글">&nbsp;
					<Input type="button" value="삭제">&nbsp;</br>
				</div>
			</div>
		</div>
		<div class="row" align="center">CONTACT</div>
	</div>
</body>
</html>