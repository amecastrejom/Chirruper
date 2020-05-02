<%-- 
    Document   : singin
    Created on : 30/04/2020, 12:13:47 AM
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
        <title>Registro</title>
    </head>
    <body>
        <%
            try{
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/Proyecto","root","root");
            Statement query = con.createStatement();
            if(request.getParameter("singin")!=null){
                query.executeUpdate("INSERT INTO USUARIOS VALUE('"+request.getParameter("username")+"','"+request.getParameter("password")+"')");
                response.sendRedirect("inicio.jsp");
                HttpSession mySession = request.getSession();
                                        String userName = request.getParameter("username");
                                        mySession.setAttribute("username", userName);
            }
            con.commit();         
            con.close();
        } catch(Exception ex){
            ex.printStackTrace();
            
        }
        %>
        <form action="singin.jsp">
        <div class="bodylogin"></div>
		<div class="gradlogin"></div>
		<div class="headerlogin">
			<div>Chirrup<span>er</span></div>
		</div>
		<br>
		<div class="login">
                                <input type="text" placeholder="Nombre completo" name="name"><br>
				<input type="text" placeholder="username" name="username"><br>
				<input type="password" placeholder="password" name="password"><br>
				<input type="submit" value="Sing In" name="singin"><br>
                                
		</div>
              
                
    </form>
    </body>
</html>
