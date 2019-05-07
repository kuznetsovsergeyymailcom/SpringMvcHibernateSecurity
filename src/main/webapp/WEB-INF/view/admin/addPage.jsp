
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Title</title>

    <script type="text/javascript">
        function validateForm() {
            var a = document.forms["addUser"]["name"].value;
            var c = document.forms["addUser"]["login"].value;
            var b = document.forms["addUser"]["password"].value;
            if (a == null || a == "", b == null || b == "", c == null || c == "") {
                alert("Please Fill All Required Field");
                return false;
            }
        }
    </script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript">
        $(document).ready( function() {
            $('#message').delay(1000).fadeOut();
        });
    </script>

</head>
<body>
<form action="/admin/add" method="post" name="addUser" onsubmit="validateForm()">
    <table border="2">
        <thead>
        <tr>
            <th>Login</th>
            <th>Password</th>
            <th>Role</th>
        </tr>
        </thead>
        <tr>
            <td><input type="text" name="login"></td>
            <td><input type="text" name="password"></td>
            <td><select name="roles" multiple="multiple">
                <option value="user" selected>user</option>
                <option value="admin">admin</option></select>
            </td>
            <td><input type="submit" value="Send"></td>
        </tr>
    </table>
</form>
<br/>

<a href="/admin/show">Go to page with all users</a>

</body>
</html>
