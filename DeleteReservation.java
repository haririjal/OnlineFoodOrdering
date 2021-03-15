/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.dao.ReservationDao;
import com.model.Reservation;
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
public class DeleteReservation extends HttpServlet {
ReservationDao revdao = new ReservationDao();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String act =request.getParameter("act");
        if(act.equalsIgnoreCase("cancelreservation")){
            int id =Integer.parseInt(request.getParameter("id"));
                Reservation rev =revdao.delete(id);
                String msg = "Reservation cancelled";
                request.setAttribute("msg", msg);
                 RequestDispatcher rd=request.getRequestDispatcher("orderlist?act=list");
                 
        rd.forward(request, response);
        }else{
//                RequestDispatcher rd=request.getRequestDispatcher("userprofile.jsp");
//        rd.forward(request, response);
        }
    }
}
