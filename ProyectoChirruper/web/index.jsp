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
        <%
            
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/Omega","root","root");
            Statement query = con.createStatement();
            if(request.getParameter("enviar")!= null){
                ResultSet r = query.executeQuery("select CONTRASENA from USUARIO where USUARIO='"+ request.getParameter("username")+"'");
                if(r.next()){
                    if(r.getString("CONTRASENA").equals(request.getParameter("password"))){
                        HttpSession mySession = request.getSession();
                        String userName = request.getParameter("username");
			String password = request.getParameter("password");
                        mySession.setAttribute("username", userName);
			mySession.setAttribute("password", password);
                        response.sendRedirect("inicio.jsp");
                    }
                }
                
            }
            
            con.commit();
            con.close();
            
           
            
       
        %>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form>
        <div class="body"></div>
		<div class="grad"></div>
		<div class="header">
			<div>Chirrup<span>er</span></div>
		</div>
		<br>
		<div class="login">
				<input type="text" placeholder="username" name="username"><br>
				<input type="password" placeholder="password" name="password"><br>
				<input type="submit" value="Login" name="enviar"><br>
                                <a href="singin.jsp">Sing In</a>
		</div>
        </form>
    </body>
</html>
