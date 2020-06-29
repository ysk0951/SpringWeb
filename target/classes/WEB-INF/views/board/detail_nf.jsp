<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
table>tbody>tr>td {
	padding: 4px;
	padding-left: 10px;
}

table, th, td {
	border-collapse: collapse;
	text-align: center;
}

table {
	margin: 0 auto;
}

.leftCell {
	background-color: antiquewhite;
}
</style>
</head> 
<body>
	<form>
		<table border="1">
			<thead>
				<td class="leftCell">NO</td>
				<td class="leftCell">프로젝트제목</td>
				<td class="leftCell">기간</td>
				<td class="leftCell">첨부파일</td>
			</thead>
			<tbody>
				<tr>
					<td>${num}</td>
					<td>${vo.projectName}</td>
					<td>${vo.regdate}</td> 
					<td>
					</td>
				</tr> 
				<tr> 
					<td colspan="4" width="500" height="500" style="text-align: left;">${vo.content}</td>
				<tr> 
				<tr>
					<td colspan="4" align="center">
							
					</td>
				</tr>
			</tbody> 
			
		</table>
	</form>
		<form action="/main" method="post">
			<input type="hidden" name="num" value="${num}"> <input
				type="submit" value="수정페이지로(관리자B)" />
		</form>
</body>
</html>