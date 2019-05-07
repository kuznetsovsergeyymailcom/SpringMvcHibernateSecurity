<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>login page</title>
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#message').delay(1000).fadeOut();
            // $('#message').innerText.toString().indexOf('Error')!=-1
        });
    </script>
</head>
<body>
<form method="post" action="/admin/show">
    <table>
        <thead border="2">
        <tr>
            <th>Login</th>
            <th>Password</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td><input type="text" name="login" value="${user.login}"></td>
            <td><input type="password" name="password" value="${user.password}"></td>
        </tr>
        </tbody>
    </table>

    <br/>
    <input type="submit" value="Send">
    <br/>

</form>

<br/>

</body>
</html>
