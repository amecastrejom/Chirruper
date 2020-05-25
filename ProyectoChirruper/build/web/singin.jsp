<%-- 
    Document   : singin
    Created on : 8/05/2020, 09:26:48 PM
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
            
            try{
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/Omega","root","root");
            Statement query = con.createStatement();
            if(request.getParameter("enviar")!= null){
                ResultSet rs = query.executeQuery("SELECT * FROM USUARIO WHERE USUARIO = '" + request.getParameter("username") + "'");
                if(rs.next()) {
                    out.println("<script>alert('Este usuario ya se encuentra registrado');</script>");
                    
                }
                else{
                    query.executeUpdate("insert into USUARIO values ('" + request.getParameter("username") + "','"+ request.getParameter("password")+"')");                             
                    response.sendRedirect("index.jsp");
                }
                
                
                
            }
            
                
            
            
            con.commit();
            con.close();
            } catch(Exception ex){
            ex.printStackTrace();   
        }
            
       
        %>
    </head>
    <body>
        <form action="singin.jsp">
        <div class="body"></div>
		<div class="grad"></div>
		<div class="header">
			<div>Chirrup<span>er</span></div>
		</div>
		<br>
		<div class="login">
                                <input type="text" placeholder="Nombre completo" name="name"><br>
				<input type="text" placeholder="username" name="username"><br>
				<input type="password" placeholder="password" name="password"><br>
				<input type="submit" value="Sing In" name="enviar"><br>
                                
		</div>
              
                
        </form>
    </body>
</html>
