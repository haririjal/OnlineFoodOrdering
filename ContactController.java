/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.dao.ContactDao;
import com.model.Contact;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
public class ContactController extends HttpServlet {
ContactDao cdao=new ContactDao();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String act=request.getParameter("act");
       if(act.equalsIgnoreCase("delete")){
            int id=Integer.parseInt(request.getParameter("id"));
            Contact contact=cdao.delete(id);
            RequestDispatcher rd=request.getRequestDispatcher("contactdisplay");
            request.setAttribute("contact", contact);
            rd.forward(request, response);
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String act=request.getParameter("act");
        if(act.equalsIgnoreCase("add")){
        String name=request.getParameter("name");
        String email=request.getParameter("email");
        String phone=request.getParameter("phone");
        String message=request.getParameter("message");
        Contact c=new Contact(0, name, email, phone, message);
        cdao.insert(c);
        response.sendRedirect("contactus.jsp?msg=contact added");
        
        }
       
        
    }

   

}
