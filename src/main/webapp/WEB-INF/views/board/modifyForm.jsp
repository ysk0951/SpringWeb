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
	<form action="/modifyPro" name="submitNewData" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
		<table border="1">
			<thead>
				<td class="leftCell">NO</td>
				<td class="leftCell">프로젝트제목</td>
				<td class="leftCell">등록일</td>
				<td class="leftCell">첨부파일</td>
			</thead> 
			<tbody>
				<tr>
					<td>${num}</td>
					<td><input type="text" value="${vo.projectName}" name="projectName"></td>
					<td>${vo.regdate}</td> 
					<td>
						<c:if test="${!empty files}">
							<form name="downloadForm" value ="DOWN..." action="#" method="post">
							<c:forEach var="files" items="${files}">
								<a href="#" onclick="fn_fileDown('${files.FILE_NO}'); return false;">${files.ORG_FILE_NAME}</a>
								(${files.FILE_SIZE}kb)
								<c:set var="FILE_NO" value="${files.FILE_NO}" />
								<input type="checkbox" name = "delete" value="${files.FILE_NO}">삭제</br>
							</c:forEach>
								<input type="hidden" id="FILE_NO" name="FILE_NO" value="HIDDENTAG FILE NO">
							</form>
						 </c:if>
						 <input multiple="multiple" type="file" name="file" />
					</td>
				</tr>  
				<tr> 
					<td colspan="4" width="500" height="500" style="text-align: left;">
					<textarea rows="30" cols="78" name = "content" style="resize: none;">${vo.content}</textarea>
					</td>
				<tr> 
				<tr>
					<td colspan="4" align="center">
							<input type ="hidden"  name ="num" value="${num}">
							<input type ="hidden"  name ="projectName" value="${vo.projectName}">
							<input type ="hidden"  name ="forFileUpdate" value="${FILE_NO}" />
							<input type ="button" value="수정취소" onclick="window.location='main/detail?num=${num}'"/>
							<input type ="submit" value="수정(관리자A)" />
					</td> 
				</tr>
			</tbody> 
		</table>
	</form>
</body>
</html>