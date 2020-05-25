package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.Connection;

public final class publicarMandar_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        \n");
      out.write("        ");

            // Se recupera el atributo sesión
             HttpSession mySession =request.getSession();
            if(mySession.getAttribute("username")!=null && mySession.getAttribute("password")!=null){
               
            }else{
                    response.sendRedirect("index.jsp");
                }
            

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
                
                
                
                
                con.commit();
                con.close();
                } catch(Exception ex){
                ex.printStackTrace();   
                }
                
                

            
            
       
        
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <form action=\"menu.jsp\">\n");
      out.write("            <input type=\"hidden\" name=\"usuario\" value=\"");
      out.print(mySession.getAttribute("username"));
      out.write("\" />\n");
      out.write("            <input type=\"hidden\" name=\"contrasena\" value=\"");
      out.print(mySession.getAttribute("password"));
      out.write("\" />\n");
      out.write("            <input type=\"submit\" value=\"Menú\" />\n");
      out.write("        </form>\n");
      out.write("            \n");
      out.write("            <script>\n");
      out.write("            function SendMessage(msj, username) {\n");
      out.write("                var ajaxRequest;\n");
      out.write("                if (window.XMLHttpRequest){\n");
      out.write("                    ajaxRequest=new XMLHttpRequest();\n");
      out.write("                } else {\n");
      out.write("                    ajaxRequest=new ActiveXObject(\"Microsoft.XMLHTTP\");\n");
      out.write("                }\n");
      out.write("                ajaxRequest.onreadystatechange = function(){\n");
      out.write("                    if (ajaxRequest.readyState==4 && ajaxRequest.status==200){\n");
      out.write("                        document.getElementById(\"confirmacion\").innerHTML=\"Chirruper enviado\";\n");
      out.write("                    }\n");
      out.write("                }\n");
      out.write("                ajaxRequest.open(\"GET\", \"MessageSender?mensaje=\" + msj + \"&usuario=\"+ username, true /*async*/);\n");
      out.write("                ajaxRequest.send();\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("       ");
      out.write("\n");
      out.write("            <textarea id=\"mensaje\" name=\"mensaje\"></textarea>\n");
      out.write("            <input type=\"submit\" value=\"Chirrup\" onclick=\"SendMessage(mensaje.value, 'harry')\"/>\n");
      out.write("            <div id = confirmacion></div>\n");
      out.write("            <input type=\"submit\" value=\"Chirrup\" onclick=\"SendMessage(mensaje.value, 'harry')\"/>\n");
      out.write("            \n");
      out.write("         <script>\n");
      out.write("            function Recibir() {\n");
      out.write("                \n");
      out.write("                    for (index = 0; index < len2; index = index + 1) {\n");
      out.write("                        var nombreUsuario = idArray[index];\n");
      out.write("                        var ajaxRequest;\n");
      out.write("                        if (window.XMLHttpRequest) {\n");
      out.write("                            ajaxRequest = new XMLHttpRequest();\n");
      out.write("                        } else {\n");
      out.write("                            ajaxRequest = new ActiveXObject(\"Microsoft.XMLHTTP\");\n");
      out.write("                        }\n");
      out.write("                        ajaxRequest.onreadystatechange = function () {\n");
      out.write("                            if (ajaxRequest.readyState == 4 && ajaxRequest.status == 200) {\n");
      out.write("                                document.getElementById(nombreUsuario).innerHTML = ajaxRequest.responseText;\n");
      out.write("                                console.log(ajaxRequest.responseText);\n");
      out.write("                            }\n");
      out.write("                        }\n");
      out.write("                        ajaxRequest.open(\"GET\", \"MessageReceiver1?parametro=\" + nombreUsuario, true);\n");
      out.write("                        ajaxRequest.send();\n");
      out.write("                    }\n");
      out.write("                \n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("        \n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
