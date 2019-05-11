
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Title</title>

    <script type="text/javascript">
        function validateForm() {
            var a = document.forms["addUser"]["name"].value;
            var c = document.forms["addUser"]["username"].value;
            var b = document.forms["addUser"]["password"].value;
            if (a == null || a == "", b == null || b == "", c == null || c == "") {
                alert("Please Fill All Required Field");
                return false;
            }
        }
    </script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
    <script defer src="https://use.fontawesome.com/releases/v5.8.2/js/all.js" integrity="sha384-DJ25uNYET2XCl5ZF++U8eNxPWqcKohUUBUpKGlNLMchM7q4Wjg2CUpjHLaL8yYPH" crossorigin="anonymous"></script>


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
            <td><input type="text" name="username"></td>
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


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>
</html>
