<%-- 
    Document   : menu
    Created on : 25/05/2020, 04:05:10 AM
    Author     : Ivana
--%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
    </head>
    <body>
        <%
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/Omega", "root", "root");
            Statement query = con.createStatement();
           
            if (request.getParameter("password") != null && request.getParameter("username") != null) {
                ResultSet rs = query.executeQuery("SELECT * FROM USUARIO WHERE USUARIO = '" + request.getParameter("username") + "' AND CONTRASENA = '" + request.getParameter("password") + "'");
                if (rs.next()) {
                    
                    HttpSession mySession = request.getSession();
                    mySession.setAttribute("username", request.getParameter("username"));
                    mySession.setAttribute("password", request.getParameter("password"));
                    mySession.setMaxInactiveInterval(180000);
                    Cookie ck = new Cookie("username",request.getParameter("username"));
                    ck.setMaxAge(-1); // opcional, si no lo poneoms, se queda hasta que se cierra le navegador si le ponemos -1 la sesión no caduca
                    response.addCookie(ck);
                    out.println("<a href ='publicarMandar.jsp'>Escribe y lee nuevos chirrups</a><br>");
                    out.println("<a href = 'usuarios.jsp'>Seguidores </a><br>");
                    
                } else {
                    response.sendRedirect("index.jsp");
                }

                

            } else {
                response.sendRedirect("index.jsp");
            }
        %>
    </body>
</html>
