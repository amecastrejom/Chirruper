<%-- 
    Document   : inicio.jsp
    Created on : 30-abr-2020, 13:37:17
    Author     : americacastrejon
--%>
<%@page import="Servlets.MessageReceiver1"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    

    <!-- Favicon icon -->
    <title>Chirruper</title>
    <!-- Bootstrap Core CSS -->
    <link href="assets/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Animation CSS -->
    <link href="assets/css/animate.css" rel="stylesheet">
    <link href="assets/css/custom.css" rel="stylesheet" id="style">
    <!-- Theme light dark version CSS -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-light.css"  id="maintheme" rel="stylesheet">
    <link href="assets/css/colors/default.css" id="theme"  rel="stylesheet">


    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->


</head>
<body>
<% 
            
            HttpSession mySession =request.getSession();
            if(mySession.getAttribute("username")!=null && mySession.getAttribute("password")!=null){
               
            }else{
                    response.sendRedirect("index.jsp");
                }
            
        %>
        <script>
            function Sugerencia(id, target, username) {
                //HttpSession mySession =request.getSession();
                
                var ajaxRequest;
                if (window.XMLHttpRequest){
                    ajaxRequest=new XMLHttpRequest(); // IE7+, Firefox, Chrome, Opera, Safari
                } else {
                    ajaxRequest=new ActiveXObject("Microsoft.XMLHTTP"); // IE6, IE5
                }
                ajaxRequest.onreadystatechange = function(){
                    if (ajaxRequest.readyState == 4 && ajaxRequest.status == 200) {
                        document.getElementById(id).innerHTML = ajaxRequest.responseText;
                    }
                }
                
                ajaxRequest.open("GET","Hint?texto="+target+"&session="+username, true);
                //ajaxRequest.open("GET","Hint?texto="+target, true);
                ajaxRequest.send();
            }
        </script>
<!-- Preloader -->
<!--
<div class="preloader">
    <div class="cssload-speeding-wheel"></div>
</div>
-->


<div id="wchat">
    <div class="wchat-wrapper wchat-wrapper-web wchat-wrapper-main">
        <div tabindex="-1" class="wchat two">
            

            <!-- .chat-left-panel -->
            <div id="side" class="wchat-list wchat-one chat-left-aside left">
                <div class="open-panel"><i class="ti-angle-right"></i></div>
                <div class="chat-left-inner">
                    <div id="my-profile" style="display: none;">
                    </div>
                    <div id="contact-list">
                        <header class="wchat-header wchat-chat-header top">
                            <div class="chat-avatar">
                                <div class="avatar icon-user-default" style="height: 40px; width: 40px;">
                                    <div class="avatar-body userimage"><img src="storage/user_image/logo.jpg" class="avatar-image is-loaded" width="100%"></div>
                                </div>

                            </div>
                            <div class="chat-body">
                                <div class="chat-main"><h2 class="chat-title" dir="auto"><span class="wchatellips personName">Chirruper</span></h2></div>
                            </div>
                        </header>
                        <form action="menu.jsp">
                                    
                                    <%HttpSession mySession1 =request.getSession();%>
                                    <input type="hidden" name="username" value="<%=mySession1.getAttribute("username")%>" />
                                    <input type="hidden" name="password" value="<%=mySession1.getAttribute("password")%>" />
                                    <input type="submit" value="Volver" />
                        </form>
                        <div class="form-material">
                            <input type="hidden" name="usernamesession" value="<%=mySession.getAttribute("username")%>" />
                            <input id="mitexto" type="text" name="sugerencia" value="" onkeyup="Sugerencia('hint',this.value,usernamesession.value)"/>
                            
                        </div>
                        <!-- SE DESPLIEGAN LOS SEGUIDORES -->
                        
                        <div class="contact-drawer">
                            <ul class="chatonline drawer-body contact-list" id="display" data-list-scroll-container="true" style="display: block;">
                                <p>Siguiendo:</p>
                                <% 
                                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                                        Connection con
                                                = DriverManager.getConnection(
                                                        "jdbc:derby://localhost:1527/Omega",
                                                        "root",
                                                        "root");
                                        /* TODO output your page here. You may use following sample code. */
                                        Statement query = con.createStatement();
                                
                                        ResultSet rs = query.executeQuery("SELECT SIGUIENDO FROM SEGUIDORES where SEGUIDOR='"+mySession.getAttribute("username")+"'");
                                        while (rs.next()) {
                                            out.println("<form  action = 'unfollow'>");
                                            out.println("<li class='person chatboxhead active' id='chatbox1_Kristina' data-chat='person_1' href='javascript:void(0)' onclick='javascript:chatWith('Kristina','3','avatar_default.png','Offline')'");
                                                out.println("<a href='javascript:void(0)'>");
                                                    out.println("<span class='userimage profile-picture min-profile-picture'><img src='storage/user_image/avatar_default.png' alt='Deven' class='avatar-image is-loaded bg-theme' width='100%'></span>");
                                                    out.println("<span name='nombre' class='bname personName'>"+rs.getString("SIGUIENDO")+"</span>");
                                                    out.println("<input type='hidden' name='usuarioE' value='"+rs.getString("SIGUIENDO")+"'/>");
                                                    out.println("<input type='hidden' name='session' value='"+mySession.getAttribute("username")+"'/>");
                                                    out.println("<span class='count'></span><br>");
                                                    out.println("<small class='preview'><span class='Offline'>Offline</span></small>");
                                                    out.println("<input type='submit' value='Eliminar' name='boton'>");
                                                    out.println("</span>");
                                                out.println("</a>");
                                            out.println("</li>");
                                            out.println("<br>");
                                            out.println("</form>");
                                            
                                            
                                            
                                        }
                                        
                                        
                                        
                                        //con.commit();
                                        con.close();
                                %>
                        <!-- SUGERENCIA DE OTROS USUARIOS A QUIENES SEGUIR FUNCTION SUGERENCIA -->        
                                <p>Descubrir:</p>
                                <p id="hint"></p>
                                
                                
       
                                
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- .chat-left-panel -->
            <!-- .chat-right-panel -->

            
            <!-- .chat-right-panel -->
        </div>
    </div>
</div>

<!--This div for modal light box chat box image-->

<!-- jQuery -->
<script src="plugins/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="assets/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- Custom Theme JavaScript -->
<script src="assets/js/custom.js"></script>
<!--ChatJs -->
<script type="text/javascript" src="chatjs/lightbox.js"></script>
<script type="text/javascript" src="chatjs/inbox.js"></script>
<script type="text/javascript" src="chatjs/custom.js"></script>
<!--ChatJs-->
</body>
</html>

