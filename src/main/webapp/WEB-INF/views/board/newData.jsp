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
	<form action="/submitNewData" name="submitNewData" method="post" enctype="multipart/form-data">
		<table border="1" style="text-align: center;">
			<thead>
				<td class="leftCell">NO</td> 
				<td class="leftCell">������Ʈ����</td>
				<td class="leftCell">�Ⱓ</td> 
				<td class="leftCell">÷������</td>
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
						<textarea rows="50" cols="100" name = "content">
						
						</textarea> 
					</td>
				<tr>
				<tr>
					<td colspan="4">
					<input type="submit" value="���"><input type="reset" value="�ٽþ���">
					</td>
				</tr>
			</tbody> 
		</table>
	</form>
</body>
</html>