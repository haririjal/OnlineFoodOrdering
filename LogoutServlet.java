/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author User
 */
public class LogoutServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {   
            PrintWriter out=response.getWriter();  
            HttpSession session=request.getSession();  
              String act =request.getParameter("act");
              if(act.equalsIgnoreCase("backend")){
            
            session.invalidate();  
            request.getRequestDispatcher("admin/index.jsp").include(request, response);  
            out.close();  
              }
              if(act.equalsIgnoreCase("frontend")){
            session.invalidate();  
              
           request.getRequestDispatcher("login.jsp").include(request, response);  
              
            out.close();  
              }
    }  

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }
}
