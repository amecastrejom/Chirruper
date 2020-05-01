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

<!-- Preloader -->
<!--
<div class="preloader">
    <div class="cssload-speeding-wheel"></div>
</div>
-->


<div id="wchat">
    <div class="wchat-wrapper wchat-wrapper-web wchat-wrapper-main">
        <div tabindex="-1" class="wchat two">
            <div class="drawer-manager">
                <span class="pane wchat-one"></span>
                <span class="pane wchat-two">
                    <div id="get-error">

                    </div>
                    <div id="showErrorModal" data-toggle="modal" data-target=".bs-example-modal-sm"></div>
                    <div class="pane pane-intro" id="pane-intro" style="visibility: visible">
                        <div class="intro-body">
                            <div class="intro-image" style="opacity: 1; transform: scale(1);"></div>
                            <div class="intro-text-container" style="opacity: 1; transform: translateY(0px);">
                                <h1 class="intro-title">Bienvenido a Chirruper</h1>
                            </div>
                        </div>
                    </div>
                    <div id="uploader" style="display: none">
                        <p>Your browser doesn't have Flash, Silverlight or HTML5 support.</p>
                    </div>

                </span>
                <span class="pane wchat-three" style="transition: all 0.3s ease;">
                    <span class="flow-drawer-container" style="transform: translateX(0px);border: 1px solid rgba(0, 0, 0, .08);display:block;">
                        <div class="drawer drawer-info">
                            <header class="wchat-header">
                                <div class="header-close">
                                    <button><span class="icon icon-x  ti-close"></span></button>
                                </div>
                                <div class="header-body">
                                    <div class="header-main">
                                        <div class="header-title">Profile info</div>
                                    </div>
                                </div>
                            </header>
                            <div class="drawer-body" id="userProfile" data-list-scroll-container="true">
                                <!--Here Profile comes dynamically-->
                            </div>
                        </div>
                    </span>
                </span>
            </div>

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
                            <div class="search-container">
                                <form action="/action_page.php">
                                    <input type="text" placeholder="Search.." name="search">
                                        <button type="submit"><i class="fa fa-search"></i></button>
                                </form>
                            </div> 
                        </div>
                        <div class="contact-drawer">
                            <ul class="chatonline drawer-body contact-list" id="display" data-list-scroll-container="true" style="display: block;">
                                <% 
                                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                                        Connection con
                                                = DriverManager.getConnection(
                                                        "jdbc:derby://localhost:1527/Proyecto",
                                                        "root",
                                                        "root");
                                        /* TODO output your page here. You may use following sample code. */
                                        Statement query = con.createStatement();
                                
                                        ResultSet rs = query.executeQuery("SELECT * FROM USUARIOS");
                                        while (rs.next()) {
                                            out.println("<form  action = 'follow'>");
                                            out.println("<li class='person chatboxhead active' id='chatbox1_Kristina' data-chat='person_1' href='javascript:void(0)' onclick='javascript:chatWith('Kristina','3','avatar_default.png','Offline')'");
                                                out.println("<a href='javascript:void(0)'>");
                                                    out.println("<span class='userimage profile-picture min-profile-picture'><img src='storage/user_image/avatar_default.png' alt='Deven' class='avatar-image is-loaded bg-theme' width='100%'></span>");
                                                    out.println("<span>");
                                                    out.println("<span name='nombre' class='bname personName'>"+rs.getString("USUARIO")+"</span>");
                                                    out.println("<input type='hidden' name='usuario' value='"+rs.getString("USUARIO")+"'/>"); 
                                                    out.println("<span class='count'></span><br>");
                                                    out.println("<small class='preview'><span class='Offline'>Offline</span></small>");
                                                    out.println("<input type='submit' value='Seguir'name='boton'>");
                                                    out.println("</span>");
                                                out.println("</a>");
                                            out.println("</li>");
                                            out.println("<br>");
                                            out.println("</form>");
                                            
                                            
                                        }
                                        //con.commit();
                                        con.close();
                                %>
       
                                <li class="person chatboxhead active" id="chatbox1_Kristina" data-chat="person_3" href="javascript:void(0)" onclick="javascript:chatWith('Kristina','3','avatar_default.png','Offline')">
                                    <a href="javascript:void(0)">
                                        <span class="userimage profile-picture min-profile-picture"><img src="storage/user_image/avatar_default.png" alt="Deven" class="avatar-image is-loaded bg-theme" width="100%"></span>
                                        <span>
                                            <span class="bname personName">Kristina</span>
                                            <span class="personStatus"><span class="time Offline"><i class="fa fa-circle" aria-hidden="true"></i></span></span>
                                            <span class="count"></span><br>
                                            <small class="preview"><span class="Offline">Offline</span></small>
                                        </span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- .chat-left-panel -->
            <!-- .chat-right-panel -->

            <div tabindex="-1" id="main right" class="pane wchat-chat wchat-two chat-right-aside right" style="visibility: hidden;">


                <div class="wchat-chat-tile"></div>

                <header class="wchat-header wchat-chat-header top" data-user="">
                    <button class="icon m-r-5 hidden-sm hidden-md hidden-lg open-panel" href="#"><span class="font-19"><i class="icon ti-arrow-left"></i></span></button>
                    <div class="chat-avatar" id="launchProfile">
                        <div class="avatar icon-user-default" style="height: 40px; width: 40px;">
                            <div class="avatar-body userimage profile-picture">&nbsp;</div>
                        </div>
                    </div>
                    <div class="chat-body">
                        <div class="chat-main"><h2 class="chat-title" dir="auto"><span class="wchatellips personName">&nbsp;</span></h2></div>
                        <div class="chat-status wchatellips" id="typing_on">
                            <!--last seen today at 8:52 PM-->
                        </div>
                    </div>
                </header>

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
                            </div>
                        </div>
                    </div>
                </div>

                <div class="wchat-filler" style="height: 0px;"></div>
                <footer tabindex="-1" class="wchat-footer wchat-chat-footer">
                    <div id="chatFrom">
                        <!--TextArea Dinamic -->
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

