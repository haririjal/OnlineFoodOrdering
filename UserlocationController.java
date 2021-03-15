/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.dao.OrderListBackDao;
import com.dao.OrderlistDao;
import com.dao.UserLocationDao;
import com.model.OrderListBack;
import com.model.UserLocation;
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
public class UserlocationController extends HttpServlet {
    UserLocationDao uldao = new UserLocationDao();
    OrderlistDao oda= new OrderlistDao();
    OrderListBackDao olbdao=new OrderListBackDao();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        HttpSession session = request.getSession(true);
               
        
        
        
        String lat = "20";
        String lon="20";
        String username=request.getParameter("username");
        String address=request.getParameter("address");
        String time=request.getParameter("time");
        String date=request.getParameter("date");
        String phone=request.getParameter("phone");
        String optionalphone=request.getParameter("optionalphone");
        String addressdetail=request.getParameter("addressdetail");
        UserLocation ul= new UserLocation(0, lat, lon, username, address, time, date, phone, optionalphone, addressdetail);
        UserLocation display=uldao.displaylocation(username);
        if(display==null){
            olbdao.insert(username);
            oda.deleteall(username);
            uldao.insert(ul);
            String msg="Your order will be delivered soon and pay cash on delivery......";
            request.setAttribute("msg", msg);
            RequestDispatcher rd = request.getRequestDispatcher("orderlist?act=list");
            rd.forward(request, response);
        }
        else{
            olbdao.insert(username);
            oda.deleteall(username);
        uldao.updatelocation(ul);
        String msg="Your order will be delivered soon and pay cash on delivery";
            request.setAttribute("msg", msg);
        RequestDispatcher rd = request.getRequestDispatcher("orderlist?act=list");
            rd.forward(request, response);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
