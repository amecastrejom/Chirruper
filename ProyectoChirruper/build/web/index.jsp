<%-- 
    Document   : login
    Created on : 8/05/2020, 09:20:48 PM
    Author     : Ivana
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="styleLogin.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
        
    </head>
    <body>
        
       
        <form action=menu.jsp>
        <div class="body"></div>
		<div class="grad"></div>
		<div class="header">
			<div>Chirrup<span>er</span></div>
		</div>
		<br>
		<div class="login">
				<input type="text" placeholder="username" name="username" value="harry"><br>
				<input type="password" placeholder="password" name="password" value="123"><br>
				<input type="submit" value="Login" name="enviar"><br>
                                <a href="singin.jsp">Sing In</a>
		</div>
        </form>
    </body>
</html>
