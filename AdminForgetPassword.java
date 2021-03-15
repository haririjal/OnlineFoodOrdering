/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package backend.controller;

import Exp.NewClass2;
import com.dao.AdminSignupDao;
import com.model.AdminSignup;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mailservice.Mailer;

/**
 *
 * @author User
 */
public class AdminForgetPassword extends HttpServlet {
    AdminSignupDao adao=new AdminSignupDao();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        AdminSignup as= new AdminSignup();
        AdminSignup forpass = adao.forgotpassword(email);
        if (forpass!=null) {
            String use=forpass.getName();
            String msg = "Password was sent to your email check your email.";
            request.setAttribute("msg", msg);
            NewClass2 p= new NewClass2();
             String tx="Forgot Password Recovery for Eat Together Cafe and Bar Login";
             char [] a=p.Password();
             String pass=new String(a);
            String emailmsg="Your new username and password for Eat Together Cafe and Bar are:"+" "+use+" , "+pass;  
            adao.updatepassword(email, pass);
            Mailer.send(email, tx, emailmsg);
            RequestDispatcher rd = request.getRequestDispatcher("admin/index.jsp");
            rd.forward(request, response);
        }
        else{
            String msg = "Email was not found please enter valid email address.";
            request.setAttribute("msg", msg);
            RequestDispatcher rd = request.getRequestDispatcher("admin/index.jsp");
            rd.forward(request, response);
        }
        
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}
