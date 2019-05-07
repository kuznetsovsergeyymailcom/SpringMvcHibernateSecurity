<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>ListOfUsers</title>
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript">
        $(document).ready( function() {
            $('#message').delay(1000).fadeOut();
        });
    </script>
</head>

<body>
<c:if test="${pageContext.request.userPrincipal.name != null}">
    <h2>Welcome : ${pageContext.request.userPrincipal.name}
        | <a href="<c:url value="/logout" />" > Logout</a></h2>
</c:if>
<table border="2">
    <thead>
    <tr>
        <th>Id</th>
        <th>Login</th>
        <th>Password</th>
        <th>Role(s)</th>
        <th>Edit</th>
        <th>Remove</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${users}" var="user">
        <tr>
            <td>${user.id}</td>
            <td>${user.login}</td>
            <td>${user.password}</td>
            <td>${user.roles}</td>
            <td align="center"><a href="/admin/update?id=${user.id}">Update</a></td>
            <td align="center"><a href="/admin/remove?id=${user.id}">Remove</a></td>
        </tr>
    </c:forEach>

    </tbody>

</table>
<a href="/admin/add">Add</a>
<br/>
<a href="/user">User page</a>
<br/>
<a href="/logout">Logout</a>
<br/>

</body>
</html>
