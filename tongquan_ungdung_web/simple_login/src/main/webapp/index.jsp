<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<style `type`="text/css">
    body {
        box-sizing: border-box;
    }
.login {
height: 180px; width: 230px;
    margin: 0;
    padding: 10px;
    border: 1px #CCC solid;
    text-align: center;
    background-color: #CCCCCC;
}

.login input {
    padding: 5px; margin: 5px;
    text-align: center;
}
    .login input:hover {
        background-color: #55c2c2;
        color: #7070e7;
    }
</style>
<body>
<form action="/login" method="get">
    <div class="login">
        <h2>Login</h2>
        <input type="text" name="username" size="20"  placeholder="username" />
        <input type="password" name="password" size="20" placeholder="password" />
        <input type="submit" value="Sign in"/>
    </div>
</form>
</body>
</html>