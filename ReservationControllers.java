

package com.controller;

import com.dao.ReservationDao;
import com.dao.SignupDao;
import com.model.*;
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
public class ReservationControllers extends HttpServlet {

    ReservationDao revdao = new ReservationDao();
    SignupDao sdao= new SignupDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String act = request.getParameter("act");
if(act.equalsIgnoreCase("accept")){
    String msg="accept";
         int id =Integer.parseInt(request.getParameter("id"));
             String status="accepted";
            revdao.update(status,id);
            
            request.setAttribute("msg", msg);
 RequestDispatcher rd = request.getRequestDispatcher("reservationdisplay");
            rd.forward(request, response);
    }

if(act.equalsIgnoreCase("deny")){
         int id =Integer.parseInt(request.getParameter("id"));
            String status="Table fulled";
             revdao.update(status,id);
 RequestDispatcher rd = request.getRequestDispatcher("reservationdisplay");
            rd.forward(request, response);
    }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String act = request.getParameter("act");
        if (act.equalsIgnoreCase("add")) {
            String username = request.getParameter("username");
            String phone = request.getParameter("phone");
            String time = request.getParameter("time");
            String date = request.getParameter("date");
            String party = request.getParameter("party");
            String message = request.getParameter("message");
            String status="pending";
//            Signup signup= sdao.reservationvalidate(username);
            Reservation res =revdao.reservationdetail(username);
            if(res==null){
            Reservation resv = new Reservation(0, username, phone, time, date, party, message,status);
            revdao.insert(resv);
            String msg ="Your Reservation Will be confirm soon......";
            request.setAttribute("msg", msg);
            RequestDispatcher rd = request.getRequestDispatcher("reservation.jsp");
            rd.forward(request, response);
            }
            
            else{
                    String msg ="You Already Have A Reservation";
            request.setAttribute("msg", msg);
            RequestDispatcher rd = request.getRequestDispatcher("reservation.jsp");
            rd.forward(request, response);
            }
        }
        
        
    }
}
