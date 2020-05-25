<%-- 
    Document   : inicio.jsp
    Created on : 30-abr-2020, 13:37:17
    Author     : americacastrejon
--%>

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
            function Sugerencia(id, target) {
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
                ajaxRequest.open("GET","Hint?texto="+target, true);
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
                        <div class="form-material">
                            <input id="mitexto" type="text" name="sugerencia" value="" onkeyup="Sugerencia('hint',this.value)"/>
                        </div>
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
                                
                                        ResultSet rs = query.executeQuery("SELECT FOLLOWS FROM FOLLOWS where Usuario='"+mySession.getAttribute("username")+"'");
                                        while (rs.next()) {
                                            out.println("<form  action = 'unfollow'>");
                                            out.println("<li class='person chatboxhead active' id='chatbox1_Kristina' data-chat='person_1' href='javascript:void(0)' onclick='javascript:chatWith('Kristina','3','avatar_default.png','Offline')'");
                                                out.println("<a href='javascript:void(0)'>");
                                                    out.println("<span class='userimage profile-picture min-profile-picture'><img src='storage/user_image/avatar_default.png' alt='Deven' class='avatar-image is-loaded bg-theme' width='100%'></span>");
                                                    out.println("<span name='nombre' class='bname personName'>"+rs.getString("FOLLOWS")+"</span>");
                                                    out.println("<input type='hidden' name='usuarioE' value='"+rs.getString("FOLLOWS")+"'/>"); 
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
                                
                                <p>Descubrir:</p>
                                <p id="hint"></p>
       
                                
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- .chat-left-panel -->
            <!-- .chat-right-panel -->

            <div tabindex="-1" id="main right" class="pane wchat-chat wchat-two chat-right-aside right" >


                <div class="wchat-chat-tile"></div>

                

                <div class="wchat-body wchat-chat-tile-container" style="background-size: cover;">
                    <div>
                        <span>
                            <div class="scroll-down" style="transform: scaleX(1) scaleY(1); opacity: 1; visibility:hidden;">
                                <span class="ti-angle-down"></span>
                            </div>
                        </span>
                        <div class="wchat-chat-msgs wchat-chat-body lastTabIndex" tabindex="0">
                            <div class="wchat-chat-empty"></div>
                            <div class="message-list">
                                <div class="chat-list" id="resultchat">
                                    <!--Here content comes dynamically-->
                                    
                                    <div id="chatbox_Deven" class="chat chatboxcontent active-chat" data-chat="person_1" client="Deven">
                                        <div class="col-xs-12 p-b-10">
                                            <div class="chat-image  profile-picture max-profile-picture">
                                                <img alt="Deven" src="storage/user_image/Deven.jpg" class="bg-theme">
                                            </div>
                                            <div class="chat-body">
                                                <div class="chat-text">
                                                    <h4>Deven Patel</h4>
                                                    <p><a url="storage/user_files/image-chat.jpg" onclick="trigq(this)"><img src="storage/user_files/image-chat.jpg" class="userfiles"></a></p>
                                                    <b>23 days ago</b>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 p-b-10 odd">
                                            <div class="chat-image  profile-picture max-profile-picture">
                                                <img alt="Bylancer" src="storage/user_image/avatar_default.png">
                                            </div>
                                            <div class="chat-body">
                                                <div class="chat-text">
                                                    <h4>Bylancer</h4>
                                                    <p>Hi</p>
                                                    <b>Just Now</b>
                                                    <span class="msg-status msg-mega"><i class="fa fa-check"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="chatbox_Kristina" class="chat chatboxcontent active-chat" data-chat="person_3" client="Kristina">
                                        <div class="col-xs-12 p-b-10">
                                            <div class="chat-image  profile-picture max-profile-picture">
                                                <img alt="Kristina" src="storage/user_image/avatar_default.png" class="bg-theme">
                                            </div>
                                            <div class="chat-body">
                                                <div class="chat-text">
                                                    <h4>Kristina</h4>
                                                    <p><video class="userfiles" controls=""><source src="storage/user_files/video.mp4" type="video/mp4">Your browser does not support HTML5 video.</video></p>
                                                    <b>1 Hours ago</b>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 p-b-10 odd">
                                            <div class="chat-image  profile-picture max-profile-picture">
                                                <img alt="USUARIO" src="storage/user_image/avatar_default.png">
                                            </div>
                                            <div class="chat-body">
                                                <div class="chat-text">
                                                    <h4>America Castrejon</h4>
                                                    <p>Nice.</p>
                                                    <b>Just Now</b>
                                                    <span class="msg-status msg-mega"><i class="fa fa-check"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 p-b-10">
                                            <div class="chat-image  profile-picture max-profile-picture">
                                                <img alt="Kristina" src="storage/user_image/avatar_default.png" class="bg-theme">
                                            </div>
                                            <div class="chat-body">
                                                <div class="chat-text">
                                                    <h4>Kristina</h4>
                                                    <p>Thank you</p>
                                                    <b>1 Hours ago</b>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <footer tabindex="-1" class="wchat-footer wchat-chat-footer">
                    <div id="chatFrom"><div class="block-wchat" id="chatForm_Kristina"><div id="typing_on"></div><button class="icon ti-face-smile font-24 btn-emoji" onclick="javascript:chatemoji()" href="javascript:void(0)" id="toggle-emoji"></button><div tabindex="-1" class="input-container"><div tabindex="-1" class="input-emoji"><div class="input-placeholder" style="visibility: visible;display:none;">Type a message</div><textarea class="input chatboxtextarea" id="chatboxtextarea" name="chattxt" onkeydown="javascript:return checkChatBoxInputKey(event,this,'Kristina','3','avatar_default.png');" contenteditable="" spellcheck="true" style="resize:none;height:20px" placeholder="Type a message"></textarea></div></div><button onclick="javascript:return clickTosendMessage('Kristina','3','avatar_default.png');" class="btn-icon icon-send fa fa-paper-plane-o font-24 send-container"></button></div></div>
            </footer>
                            </div>
                        </div>
                    </div>
                </div>

                
            </div>
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

