/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package backend.controller;

import com.dao.SignupDao;
import com.model.Signup;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
public class ChangePassword extends HttpServlet {
    SignupDao sdao=new SignupDao();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       String username=request.getParameter("username");
       String oldpass = request.getParameter("oldpass");
       String newpass = request.getParameter("newpass");
       Signup changepass=sdao.loginvalidate(username, oldpass);
        if (changepass!=null) {
            sdao.changepassword(username, newpass);
            String msg = "Password changed successfully";
            request.setAttribute("msg", msg);
            RequestDispatcher rd = request.getRequestDispatcher("userprofile.jsp");
            rd.forward(request, response);
        }
        else{
        String msg = "Password doesnot match.";
            request.setAttribute("msg", msg);
            RequestDispatcher rd = request.getRequestDispatcher("userprofile.jsp");
            rd.forward(request, response);
        }
    }
}
