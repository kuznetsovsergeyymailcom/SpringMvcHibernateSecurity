<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Update user</title>
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript">
        $(document).ready( function() {
            $('#message').delay(1000).fadeOut();
        });
    </script>
</head>
<body>
<form action="/admin/update" method="post">
    <table border="1">
        <thead>
        <tr>
            <th>Id</th>
            <th>Login</th>
            <th>Password</th>
            <th>Role(s)</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <input type="hidden" name="id" value="${editUser.id}">
            <td><input type="text" value="${editUser.id}" readonly></td>
            <td><input type="text" value="${editUser.login}" name="login"></td>
            <td><input type="text" value="${editUser.password}" name="password"></td>
            <td><select name="roles" multiple="multiple">
                <option value="user" selected>user</option>
                <option value="admin">admin</option></select>
            </td>
            <td><input type="submit" value="Send"></td>
        </tr>
        </tbody>
    </table>
</form>
<br/>

</body>
</html>
