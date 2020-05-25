<%-- 
    Document   : paginaPrincipal
    Created on : 25/05/2020, 01:31:30 AM
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
             HttpSession mySession =request.getSession();
             
            if(mySession.getAttribute("username")!=null && mySession.getAttribute("password")!=null){
               
            }else{
                    response.sendRedirect("index.jsp");
                }
            
                String[] suscriptores={};
                // DESPLEGAR MENSAJES 
                try{
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/Omega","root","root");
                Statement query = con.createStatement();

                ResultSet res = query.executeQuery("select SIGUIENDO FROM SEGUIDORES WHERE SEGUIDOR='"+ mySession.getAttribute("username") +"'");
                String condition= "";
                String name = "";
                while(res.next()){
                      name = res.getString("SIGUIENDO");
                      if(res.next()){
                        condition = condition +"'"+ name + "' OR EMISOR='" + res.getString("SIGUIENDO") + "'" ;
                      } else {
                         condition = condition +"'"+ name + "'" ; 
                      }
                } 
                if(condition != ""){ condition = condition + " ORDER BY IDMSJ";}

                
                ResultSet r = query.executeQuery("select EMISOR, MENSAJE from MENSAJES WHERE EMISOR=" + condition);
                while(r.next()){

                    out.println("Posted by:"+r.getString("EMISOR")+ "<br><br>");
                    out.println(""+ r.getString("MENSAJE")+ "<br><br>");
                }
             
                // ESCUCHE A LOS USUARIOS A LOS QUE SIGUE
                
                    ResultSet rscont = query.executeQuery("SELECT COUNT(ID) AS SEGUIDOR FROM SEGUIDORES WHERE SIGUIENDO='"+ mySession.getAttribute("username")+"'");
                    if(rscont.next()){
                        int cont = rscont.getInt("SEGUIDOR");
                        ResultSet rsseguidores = query.executeQuery("select seguidor from seguidores where siguiendo='"+ mySession.getAttribute("username") +"'");
                        suscriptores = new String[cont];
                        int i =-1;
                        while(rsseguidores.next()){
                            i++;                  
                           suscriptores[i] = rsseguidores.getString("SEGUIDOR");
                           //System.out.println(suscriptores[i]);
                        }
                        
                    } 
                
                
                
                
                con.commit();
                con.close();
                } catch(Exception ex){
                ex.printStackTrace();   
                }  
       
        %>
        
        <script>
            function Escucha() {
                var suscripciones = <%=suscriptores.toString()%>;

                    for(int i =0; i < suscripciones.length; i++){
                        var ajaxRequest;
                        if (window.XMLHttpRequest) {
                            ajaxRequest = new XMLHttpRequest();
                        } else {
                            ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
                        }
                        ajaxRequest.onreadystatechange = function () {
                            if (ajaxRequest.readyState == 4 && ajaxRequest.status == 200) {
                                document.getElementById(mensajes).innerHTML = ajaxRequest.responseText;
                                console.log(ajaxRequest.responseText);
                            }
                        }
                        ajaxRequest.open("GET", "MessageReceiver1?topic=" + suscripciones[i].toString(); , true);
                        ajaxRequest.send();
                    }
                }
                
            }
        </script>
    </head>
    <body>
        <form action="menu.jsp">
            <input type="hidden" name="username" value="<%=mySession.getAttribute("username")%>" />
            <input type="hidden" name="password" value="<%=mySession.getAttribute("password")%>" />
            <input type="submit" value="Menú" />
        </form>
            
            <script>
            function SendMessage(msj, username) {
                
                var ajaxRequest;
                if (window.XMLHttpRequest){
                    ajaxRequest=new XMLHttpRequest();
                } else {
                    ajaxRequest=new ActiveXObject("Microsoft.XMLHTTP");
                }
                ajaxRequest.onreadystatechange = function(){
                    if (ajaxRequest.readyState==4 && ajaxRequest.status==200){
                        document.getElementById("confirmacion").innerHTML="Chirruper enviado";
                    }
                }
                ajaxRequest.open("GET", "MessageSender?mensaje=" + msj + "&usuario="+ username, true /*async*/);
                ajaxRequest.send();
            }
        </script>
       <%--  hay que arreglar esto no reconoce la session --%>
            <textarea id="mensaje" name="mensaje"></textarea>
            <input type="hidden" name="username" value="<%=mySession.getAttribute("username")%>" />
            <input type="hidden" name="password" value="<%=mySession.getAttribute("password")%>" />
            <input type="submit" value="Chirrup" onclick="SendMessage(mensaje.value, username.value)"/>
            <div id = confirmacion></div>
            <input type="hidden" name="username" value="<%=mySession.getAttribute("username")%>" />
            <input type="hidden" name="password" value="<%=mySession.getAttribute("password")%>" />
            <input type="submit" value="Escucha" onclick="Escucha()"/>
            <div id = mensajes></div>
            
         
        
    </body>
</html>
