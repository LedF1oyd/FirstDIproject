<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: mink
  Date: 2022-11-30
  Time: 오후 9:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8" %>

<html>
<head>
	<title>Title</title>
</head>
<body>

<form:form modelAttribute="u" action="../editok" method="post">
	<form:hidden path="seq"/>
	<input type="hidden" name="seq" />
	<table id ="edit">
		<tr><td>제목</td><td><input type ="text" name ="title" value=${u.getTitle()} ></td></tr>
		<tr><td>글쓴이</td><td><input type ="text" name ="writer" value=${u.getWriter()}></td></tr>
		<tr><td>내용</td><td><textarea cols = "50" rows ="5" name = "content" >${u.getContent()}</textarea></td></tr>
	</table>
	<input type = "submit" value = "수정하기"/>
	<input type="button" value="취소하기" onclick="history.back()"/>


</form:form>

</body>
</html>
