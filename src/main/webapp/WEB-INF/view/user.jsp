<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>User page</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
    <script defer src="https://use.fontawesome.com/releases/v5.8.2/js/all.js" integrity="sha384-DJ25uNYET2XCl5ZF++U8eNxPWqcKohUUBUpKGlNLMchM7q4Wjg2CUpjHLaL8yYPH" crossorigin="anonymous"></script>

    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript">
        $(document).ready( function() {
            $('#message').delay(1000).fadeOut();
        });
    </script>
    <style>
        .main_body{
            min-height: 100vh;
        }
    </style>
</head>

<body>

<nav class="navbar navbar-dark bg-dark py-2">
    <a class="navbar-brand text-white" href="#">Project</a>
    <span class="text-white align-text-right">
       <c:if test="${pageContext.request.userPrincipal.name != null}">
           <h4>Welcome : ${pageContext.request.userPrincipal.name}
        | <a href="<c:url value="/logout" />" > Logout</a></h4>
       </c:if>
    </span>
</nav>
<div class="container-fluid">
    <div class="row">
        <div class="col-2 main_body">
            <div class="text-dark py-2">
                <a href="/admin/show">Admin page</a>
            </div>

            <div class="text-dark">
                <a href="/user">User page</a>
            </div>

        </div>
        <div class="col-10 bg-light  main_body">
            <div class="container-fluid">
                <p><h2>User Panel</h2></p>
                <h2>Hello: ${pageContext.request.userPrincipal.name}</h2>
            </div>

        </div>
    </div>

</div>


<a href="/admin/add">Add</a>
<br/>
<a href="/user">User page</a>
<br/>
<a href="/logout">Logout</a>
<br/>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>
</html>
