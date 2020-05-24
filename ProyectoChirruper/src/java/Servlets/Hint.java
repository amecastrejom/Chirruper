/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author americacastrejon
 */
public class Hint extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
            try{
                /*
            HttpSession mySession =request.getSession();
            if(mySession.getAttribute("usuario")!=null && mySession.getAttribute("contrasena")!=null){
                
            }else{
                    response.sendRedirect("index.jsp");
                }
                */
                /*
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection con =DriverManager.getConnection("jdbc:derby://localhost:1527/Proyecto", "root","root"); 
            
            Statement query = con.createStatement();
            ResultSet rs = query.executeQuery("SELECT USARIO FROM USUARIOS");
            
                
                String input=request.getParameter("texto");
                String hint="";
                if (input.length()>1){
                    for (int i=1;i<=rs.getMetaData().getColumnCount();i++){
                        if(rs.getString(i).contains(input)){
                            hint=hint+rs.getString(i)+" ";
                        }
                    }
            }
                out.write(hint);
                */
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection con =DriverManager.getConnection("jdbc:derby://localhost:1527/Omega", "root","root"); 
            
            Statement query = con.createStatement();
            ResultSet rs = query.executeQuery("SELECT USUARIO FROM USUARIO");
            
                ArrayList<String> potentialHints=new ArrayList<String>();
            
                
                String input=request.getParameter("texto");
                input=""+input+"";
                String hint="";
                while(rs.next()) {
                   potentialHints.add("["+rs.getString("USUARIO")+"]");
            }
               String usuario; 
                if (input.length()>1){
                    
                    for (int i=0; i<potentialHints.size(); i++){
                        
                        if(potentialHints.get(i).toLowerCase().contains(input)){
                            usuario=potentialHints.get(i).replace("[", "");
                            usuario=usuario.replace("]", "");
                            out.println("<form  action = 'follow'>");
                            //hint=hint+potentialHints.get(i)+"<input type='submit' value='Seguir'name='boton'><br>";
                            out.println("<li>");
                            out.println("<a href='javascript:void(0)'>");
                            out.println("<span class='userimage profile-picture min-profile-picture'><img src='storage/user_image/avatar_default.png' alt='Deven' class='avatar-image is-loaded bg-theme' width='100%'></span>");
                            out.println("<span class='count'></span><br>");
                            out.println(potentialHints.get(i).substring(1, potentialHints.get(i).length()-1));
                            out.println("<input type='hidden' name='usuario' value='"+usuario+"'/>"); 
                            out.println("<input type='submit' value='Seguir'name='boton'><br>");
                            out.println("<small class='preview'><span class='Offline'>Offline</span></small>");
                                                    out.println("</span>");
                                                    out.println("</a>");
                                            out.println("</li>");
                                            out.println("<br>");
                            out.println("</form>");
                            /*
                            String nextJSP = "/follow?usuario='"+potentialHints.get(i)+"'"; 
                            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
                            dispatcher.include(request, response);
                            */
                        }
                        
                    }
                  
            }
                 
                //out.write(hint);
            }finally{
                out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Hint.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Hint.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Hint.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Hint.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
