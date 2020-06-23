<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
					<td>&nbsp;</td>
					<td><input type="text"></td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr> 
					<td colspan="4" width="500" height="500">
						<textarea rows="80" cols="100">
						
						</textarea>
					</td>
				<tr>
				<tr>
					<input type="submit" value="등록"><input type="reset" value="다시쓰기">
				</tr>
			</tbody> 
		</table>
	</form>
</body>
</html>