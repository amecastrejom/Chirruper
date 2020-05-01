<%-- 
    Document   : buscar
    Created on : 30-abr-2020, 12:44:41
    Author     : americacastrejon
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
        <%
            Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection con =
            DriverManager.getConnection(
            "jdbc:derby://localhost:1527/Proyecto",
            "root",
            "root"); 
            /* TODO output your page here. You may use following sample code. */
            Statement query = con.createStatement();
            
            ResultSet rs = query.executeQuery("FROM USUARIOS SELECT SUBSTR(USUARIO,2)");
            
            
            while(rs.next()) {
                out.println(" USUARIO: "+ rs.getString("USUARIO"));
            }
            //con.commit();
            con.close();
            
        %>
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <div class="wrap">
   <div class="search">
      <input type="text" class="searchTerm" placeholder="What are you looking for?">
      <button type="submit" class="searchButton">
        <i class="fa fa-search"></i>
     </button>
   </div>
</div>
    </body>
</html>
