<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8" %>
<%@page import="com.crud.BoardDAO, com.crud.BoardVO,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <script>
        function delete_ok(id){
            const a = confirm("정말로 삭제하겠습니까?");
            if(a) location.href='delete_ok/'+id;
        }
    </script>
</head>
<body>
<table>
    <h1>자유게시판</h1>


    <table border="1" id = "list2" width="90%">

            <th>Id</th>
            <th>Title</th>
            <th>Writer</th>
            <th>Content</th>
            <th>Regdate</th>
            <th>Edit</th>
            <th>Delete</th>
        <c:forEach items="${list}" var="u">
            <tr align="center">
                <td>${u.getSeq()}</td>
                <td>${u.getTitle()}</td>
                <td>${u.getWriter()}</td>
                <td>${u.getContent()}</td>
                <td>${u.getRegdate()}</td>
                <td><a href="editform/${u.getSeq()}">Edit</a></td>
                <td><a href="javascript:delete_ok('${u.getSeq()}')">Delete</a></td>
            </tr>
        </c:forEach>
    </table>


</table>

<br/><a href="add">Add New Post</a>

</body>
</html>
