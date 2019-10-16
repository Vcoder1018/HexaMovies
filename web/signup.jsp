<%--
  Created by IntelliJ IDEA.
  User: Vivek Dubey
  Date: 15-10-2019
  Time: 23:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>HexaMovies - SignUp</title>
</head>
<body>
    <h2>Already have an account with us >> </h2><a href="Login"><button>Login</button></a>
    <hr><h5>Or</h5><hr>

    <h4>Sign Up</h4>
    <form method="post" action="#">
        <input type="text" placeholder="Name" name="username">
        <input type="email" placeholder="Email" name="useremail">
        <input type="password" placeholder="Password" name="userpassword">
        <input type="submit" value="Sign Up">
    </form>
</body>
</html>
