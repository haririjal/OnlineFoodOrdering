/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package backend.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author User
 */
public class LoginController extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String username = request.getParameter("username");
                String password = request.getParameter("password");
                HttpSession session=request.getSession(true);
            
                if(username.equals("sumanrijal1") && password.equals("nepal123")){
                    session.setAttribute("username",username);
                    session.setAttribute("password",password);
                    RequestDispatcher rd =  request.getRequestDispatcher("menudisplay");
                    rd.forward(request, response);
                }
                else{
                    String msg="Username password doesnt match";
                   request.setAttribute("msg", msg);
                   RequestDispatcher rd =  request.getRequestDispatcher("admin/index.jsp");
                   rd.forward(request, response);
               }
    }
@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }
}
