/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package backend.controller;
import com.model.*;
import com.dao.ReservationDao;
import com.dao.ReserveStatusDao;
import java.io.IOException;
import java.io.PrintWriter;
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
public class ReservationDisplay extends HttpServlet {
    ReservationDao rdao = new ReservationDao();
    ReserveStatusDao rsdao= new ReserveStatusDao();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
       List<Reservation> reservationlist=rdao.getList();
        RequestDispatcher rd=request.getRequestDispatcher("admin/reservation.jsp");
        request.setAttribute("reservelist", reservationlist);
       rd.forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
}
