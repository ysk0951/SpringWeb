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
				<td class="leftCell">������Ʈ����</td>
				<td class="leftCell">�Ⱓ</td>
			</thead>
			<tbody>
				<tr>
					<td>${num}</td>
					<td>${vo.projectName}</td>
					<td>${vo.regdate}</td>
				</tr>
				<tr>
					<td colspan="3" width="500" height="500">${vo.content}</td>
				<tr>
			</tbody> 
		</table>
	</form>
</body>
</html>