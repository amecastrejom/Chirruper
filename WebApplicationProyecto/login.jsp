<%-- 
    Document   : login
    Created on : 30/04/2020, 12:40:53 AM
    Author     : Ivana
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="styleLogin.css" rel="stylesheet" type="text/css"/>
        <title>Proyecto Omega</title>
    </head>
    <body>
         <%
             Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection con= DriverManager.getConnection(
                                "jdbc:derby://localhost:1527/Proyecto",
                                "root",
                                "root");
                Statement query = con.createStatement();
                                if(request.getParameter("log")!= null){
                                    ResultSet r = query.executeQuery("SELECT FROM USUARIOS CONTRASEÑA WHERE USUARIO='"+request.getParameter("username")+"'");
                                    if(r.next() && r.getString("CONTRASEÑA").equals(request.getParameter("password"))){
                                        HttpSession mySession = request.getSession();
                                        String userName = request.getParameter("username");
                                        mySession.setAttribute("username", userName);
                                    } else{
                                        response.sendRedirect("singin.jsp");
                                    }
                                }
                                con.close();
                
                                %>
        <form action="inicio.jsp" method="POST">
        <div class="bodylogin"></div>
		<div class="gradlogin"></div>
		<div class="headerlogin">
			<div>Chirrup<span>er</span></div>
		</div>
		<br>
		<div class="login" >
				<input type="text" placeholder="username" name="username"><br>
				<input type="password" placeholder="password" name="password"><br>
				<input type="submit" value="Login" name="log"><br>
                                <a href="singin.jsp">Sing In</a>
                               
		</div>        
        </form>
        
    </body>
</html>

