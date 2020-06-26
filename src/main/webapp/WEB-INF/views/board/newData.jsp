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
	text-align: left;
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
	<form action="/submitNewData" name="submitNewData" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
		<table border="1" style="text-align: center;">
			<thead>
				<td class="leftCell">NO</td> 
				<td class="leftCell">프로젝트제목</td>
				<td class="leftCell">기간</td> 
				<td class="leftCell">첨부파일</td>
			</thead> 
			<tbody>
				<tr>
					<td>&nbsp;</td>
					<td><input type="text" name ="prjectName"></td>
					<td>&nbsp;</td>
					<td> <input type="file" name="file"></td>
				</tr>
				<tr> 
					<td colspan="4" width="500" height="500">
						<textarea rows="50" cols="100" name = "content">TEXTAREA</textarea>
					</td>
				<tr>
				<tr>
					<td colspan="4">
					<c:if test="${empty param.update}">
						<input type="submit" value="등록">
						<input type="reset" value="다시쓰기">
					</c:if>
					<c:if test="${!empty param.update}">
						<input type="submit" value="수정">
						<input type="reset" value="다시쓰기">
					</c:if>
					</td>
				</tr>
			</tbody> 
		</table>
	</form>
</body>
</html>