/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package backend.controller;

import com.dao.AdminSignupDao;
import com.model.AdminSignup;
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
public class AdminSignupController extends HttpServlet {
    AdminSignupDao adao = new AdminSignupDao();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String act = request.getParameter("act");
        if(act.equalsIgnoreCase("signup")){
        String name=request.getParameter("name");
        String username=request.getParameter("username");
        String password = request.getParameter("password");
        String email= request.getParameter("email");
        String phone = request.getParameter("phone");
        AdminSignup newuser=adao.signupValidate(username, email);
        AdminSignup emailcheck=adao.forgotpassword(email);
        if(newuser==null&&emailcheck==null){
        AdminSignup adminsignup = new AdminSignup(0, username, name, email, password, phone);
        adao.insert(adminsignup);
            String msg = "Signup successfully";
            request.setAttribute("msg", msg);
            RequestDispatcher rd = request.getRequestDispatcher("admin/adminsignin.jsp");
            rd.forward(request, response);
        }
        else{
         String msg = "username or email already exist";
            request.setAttribute("msg", msg);
            RequestDispatcher rd = request.getRequestDispatcher("admin/adminsignin.jsp");
            rd.forward(request, response);
        }
    }
         if(act.equalsIgnoreCase("login")){
              String username = request.getParameter("username");
                String password = request.getParameter("password");
                HttpSession session=request.getSession(true);
            AdminSignup signin=adao.loginvalidate(username, password);
        if(signin!=null){
                
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
    }
}
