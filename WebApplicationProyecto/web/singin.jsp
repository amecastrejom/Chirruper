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
        
        <title>JSP Page</title>
        
        <%
            // Se recupera el atributo sesión
            //HttpSession mySession = request.getSession();
            //if (mySession.getAttribute("username")!=null) {                        
            //} else {
             //  response.sendRedirect("login.jsp");
            //}
            try{
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/Omega","root","root");
            Statement query = con.createStatement();
            if(request.getParameter("enviar")!= null){
                query.executeUpdate("insert into USUARIO values ('" + request.getParameter("username") + "','"+ request.getParameter("password")+"')");
                response.sendRedirect("inicio.jsp");
            }
            //ResultSet r = query.executeQuery("select * from USUARIO");
            //while(r.next()){
                
                //out.println("Name: "+ r.getString("USUARIO")+ "<br><br>");
                //out.println("Contraseña: "+ r.getString("CONTRASENA")+ "<br><br>");
                
            
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
