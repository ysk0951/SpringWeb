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
<script>
	function fn_fileDown(fileNo){
		alert("FILE DOWN....");
		var formObj = document.forms[0].FILE_NO;
		console.log(formObj);
		formObj.setAttribute("value",fileNo);
		console.log(formObj);
		document.forms[0].action = "/fileDown";
		document.forms[0].submit();
	}
</script>
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
						<c:if test="${!empty files}">
							<form name="downloadForm" value ="DOWN..." action="#" method="post">
							<c:forEach var="files" items="${files}">
								<a href="#" onclick="fn_fileDown('${files.FILE_NO}'); return false;">${files.ORG_FILE_NAME}</a>
								(${files.FILE_SIZE}kb)<br>
							</c:forEach>
							<input type="hidden" id="FILE_NO" name="FILE_NO" value="HIDDENTAG FILE NO">
							</form>
						</c:if>
					</td>
				</tr>
				<tr>
					<td colspan="4" width="500" height="500">${vo.content}</td>
				<tr>
			</tbody> 
		</table>
	</form>
</body>
</html>