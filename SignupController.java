/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.dao.AdminSignupDao;
import com.dao.SignupDao;
import com.model.AdminSignup;
import com.model.Signup;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
public class SignupController extends HttpServlet {
    SignupDao sdao = new SignupDao();
    AdminSignupDao ado = new AdminSignupDao();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        List<Signup> signup=sdao.getList();
//        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
//        request.setAttribute("singup", signup);
//        rd.forward(request, response);
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
        Signup newuser=sdao.signupValidate(username, email);
        Signup emailcheck=sdao.forgotpassword(email);
        if(newuser==null&&emailcheck==null){
        Signup signup = new Signup(0,name, username, password, email, phone);
        sdao.Insert(signup);
            String msg = "Signup successfully";
            request.setAttribute("msg", msg);
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        }
        else{
         String msg = "username,email already exist";
            request.setAttribute("msg", msg);
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        }
        }
        
        if(act.equalsIgnoreCase("login")){
            String username=request.getParameter("username");
            String password=request.getParameter("password");
        Signup signin=sdao.loginvalidate(username, password);
        if(signin!=null){
            HttpSession session = request.getSession();
            session.setAttribute("user", username);
            session.setAttribute("pass", password);
//            String msg = "Login successfully";
//            request.setAttribute("msg", msg);
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            request.setAttribute("sign", signin);
            rd.forward(request, response);
        }
        else{
            String msg = "username and password doesnot match";
            request.setAttribute("msg", msg);
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        }
    }
        if(act.equalsIgnoreCase("users")){
                    List<Signup> customerlist=sdao.getList();
                    List<AdminSignup> adminlist=ado.getList();
                    RequestDispatcher rd = request.getRequestDispatcher("admin/users.jsp");
                    request.setAttribute("clist", customerlist);
                    request.setAttribute("alist", adminlist);
                    rd.forward(request, response);
        }
    }}
