<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>ListOfUsers</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
    <script defer src="https://use.fontawesome.com/releases/v5.8.2/js/all.js" integrity="sha384-DJ25uNYET2XCl5ZF++U8eNxPWqcKohUUBUpKGlNLMchM7q4Wjg2CUpjHLaL8yYPH" crossorigin="anonymous"></script>

    <script type="text/javascript">

        function fillModalAndStart(e){
            console.log("button pressed");
            var tr = e.parentNode.parentElement.childNodes;
            var user_id = tr.item(0).nextElementSibling.innerHTML;
            var user_name = tr.item(2).nextElementSibling.innerHTML;
            var user_password = tr.item(4).nextElementSibling.innerHTML;

            console.log(user_id);
            console.log(user_name);
            console.log(user_password);

            $("#modal_id").val(user_id);
            $("#modal_name").val(user_name);
            $("#modal_password").val(user_password);

            $('#userEdit').modal('show');
        };

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
            <div class="text-dark">
                <h2 class="mt-2">Admin panel</h2>
                <div class="container">

                <!--Table of oll users-->

                    <ul class="nav nav-tabs py-5">
                        <li class="nav-item flex-column active"><a data-toggle="tab" href="#users">Users table</a></li>
                        <li class="nav-item"><a data-toggle="tab" href="#newUser" class="px-2">New user</a></li>
                    </ul>

                    <div class="tab-content">
                        <div id="users" class="tab-pane active">
                            <div class="tab-pane px-2 py-2" id="usersTable">

                                <tr class="items-align-center">
                                    <table class="table table-bordered table-striped ml-auto active" id="tableUsers">
                                        <section class="text-dark ">All users</section>
                                        <thead class="thead-light">
                                        <tr>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Password</th>
                                            <th>Role</th>
                                            <th>Edit</th>
                                            <th>Remove</th>
                                        </tr>
                                        </thead>
                                        <tbody class="text-align-center">
                                        <c:forEach items="${users}" var="user">
                                            <tr>
                                                <td id="user_id">${user.id}</td>

                                                <td id="user_name">${user.username}</td>
                                                <td id="user_password">${user.password}</td>
                                                <td id="user_roles">${user.roles}</td>
                                                <td>
                                                    <button id="editModalShow" class="btn btn-primary" value="Edit"
                                                            onclick="fillModalAndStart(this)">Update</button>
                                                </td>

                                                <td><a href="/admin/remove?id=${user.id}">
                                                    <div class="btn btn-primary">Remove</div>
                                                </a>
                                                </td>

                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                            </div>
                        </div>

                        <!--End of table of all users-->
                        <!--New user-->
                        <div id="newUser" class="tab-pane fade">

                            <form class="form-horizontal" role="form" method="POST" action="/admin/add">
                                <div class="row">
                                    <div class="col-md-3"></div>
                                    <div class="col-md-6">
                                        <h2>Register New User</h2>
                                        <hr/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3 field-label-responsive">
                                        <label for="name">Login</label>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                                                <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-user"></i></div>
                                                <input type="text" name="username" class="form-control" id="name"
                                                       placeholder="Your login" required="true" autofocus="true"/>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                                <div class="row">
                                    <div class="col-md-3 field-label-responsive">
                                        <label for="password">Password</label>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group has-danger">
                                            <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                                                <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-key"></i></div>
                                                <input type="password" name="password" class="form-control" id="password"
                                                       placeholder="Password" required="true"/>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div class="row">
                                    <div class="col-md-3 field-label-responsive">
                                        <label for="userRole">Role:</label>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group has-danger">
                                            <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                                                <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-key"></i></div>

                                                <select class="form-control" name="roles" id="userRole">
                                                    <option value="user">user</option>
                                                    <option value="admin">admin</option>
                                                    <option value="admin,user">admin, user</option>
                                                </select>

                                            </div>
                                        </div>
                                    </div>

                                </div>

                                <div class="row">
                                    <div class="col-md-3"></div>
                                    <div class="col-md-6">
                                        <button type="submit" class="btn btn-primary"><i class="fa fa-user-plus"></i> Add new user</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!--End of new user-->
                        <div class="fade modal" id="userEdit">
                            <div class="modal-dialog">
                                <div class="modal-content">

                                    <div class="modal-body">
                                        <div class="col-md-12">
                                            <span class="anchor" id="formUpdate"></span>
                                            <hr class="mb-5"/>

                                            <!-- form card register -->
                                            <div class="card card-outline-secondary w-100">
                                                <div class="card-header">
                                                    <h3 class="mb-0">Edit user</h3>
                                                </div>
                                                <div class="card-body">
                                                    <form class="form" role="form" autocomplete="off" action="/admin/update" method="post">
                                                        <div class="form-group">
                                                            <label for="modal_id">ID</label>
                                                            <input type="text" class="form-control"
                                                                   id="modal_id" name="id" readonly="true"/>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="modal_name">Name</label>
                                                            <input type="text" class="form-control"
                                                                   id="modal_name" name="username" required="true"/>
                                                        </div>

                                                        <div class="form-group">
                                                            <label for="modal_password">Password</label>
                                                            <input type="password" class="form-control"
                                                                   id="modal_password" name="password" required="true"/>
                                                        </div>

                                                        <div class="form-group">

                                                            <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                                                                <label for="modal_password">Role</label>
                                                                <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-key"></i></div>

                                                                <select class="form-control" name="roles">
                                                                    <option value="user">user</option>
                                                                    <option value="admin">admin</option>
                                                                    <option value="admin,user">admin,user</option>
                                                                </select>

                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <button type="submit" class="btn btn-success btn-lg float-right">Update</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>

                                        </div>

                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

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
