/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.dao.MenuDao;
import com.dao.OrderListBackDao;
import com.dao.OrderlistDao;
import com.dao.ReservationDao;
import com.dao.SalesDetailDao;
import com.dao.SignupDao;
import com.dao.UserLocationDao;
import com.model.Menu;
import com.model.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
/**
 *
 * @author User
 */
public class OrderListController extends HttpServlet {
    MenuDao mdao = new MenuDao();
    OrderlistDao odao = new OrderlistDao();
    ReservationDao rdao =  new ReservationDao();
    SignupDao sdao = new SignupDao();
    UserLocationDao udao = new UserLocationDao();
    OrderListBackDao olbdao=new OrderListBackDao();
    SalesDetailDao salesdao = new SalesDetailDao();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession(true);
        String act = request.getParameter("act");
        if(act.equalsIgnoreCase("list")){
                String username=request.getParameter("username");
                List<Orderlist> list =odao.getList(username);
                 List<Reservation> reservelist =rdao.orderlist(username);
                 request.setAttribute("reservelist", reservelist);
                request.setAttribute("list", list);
                RequestDispatcher rd=request.getRequestDispatcher("userprofile.jsp");
                rd.forward(request, response);
        }
        if(act.equalsIgnoreCase("add")){
                DateFormat df = new SimpleDateFormat("dd/MM/yy");
                Date dateobj = new Date();
                String b = "n";
                String date=df.format(dateobj);
                DateFormat t1 = new SimpleDateFormat("HH:mm:ss");
                String time=df.format(dateobj);
                String username=request.getParameter("username");
                String dishname=request.getParameter("dishname");
                int price = Integer.parseInt(request.getParameter("price"));
                int qty= Integer.parseInt(request.getParameter("qty"));
                int total= price*qty;
                Orderlist order= new Orderlist(0, username, dishname, price, qty, total);
                odao.insert(order); 
//                SalesDetail salesd = new SalesDetail(0, price, qty, total, username, date, date, time, dishname);
//                salesdao.insert(salesd);
//                OrderListBack orderback= new OrderListBack(0, username, dishname, price, qty, total);
//                 
//                olbdao.insert(orderback);
                RequestDispatcher rd=request.getRequestDispatcher("ordermenu");
                rd.forward(request, response);
        }
        if(act.equalsIgnoreCase("cancelorder")){
           String username=request.getParameter("username");
            Orderlist del= odao.deleteall(username);
            request.setAttribute("suman", username);
            RequestDispatcher rd = request.getRequestDispatcher("userorderlist");
            rd.forward(request, response);
            
            
        }
        if(act.equalsIgnoreCase("checkout")){
            String address =request.getParameter("address");
            String phone=request.getParameter("phone");
           String username=request.getParameter("username");
            Orderlist del= odao.deleteall(username);
            String msg ="Your order will be deliver soon....";
            request.setAttribute("suman", username);
                request.setAttribute("msg", msg);
                 RequestDispatcher rd=request.getRequestDispatcher("orderlist?act=list");
            
            
        }
        if(act.equalsIgnoreCase("cancelitem")){
            int id = Integer.parseInt(request.getParameter("id"));
            Orderlist delete=odao.delete(id);
            RequestDispatcher rd = request.getRequestDispatcher("orderlist?act=list");
            rd.forward(request, response);
        }
        if(act.equalsIgnoreCase("itemlist")){
           List<OrderListBack> orderlist=olbdao.getOrderlist();
        RequestDispatcher rd = request.getRequestDispatcher("admin/orderlist.jsp");
        request.setAttribute("list", orderlist);
        rd.forward(request, response);
            }
        if(act.equalsIgnoreCase("orderdisplay")){
            String username=request.getParameter("username");
                List<OrderListBack> orderlist=olbdao.getList(username);
                 List<UserLocation> display=udao.display(username);
                RequestDispatcher rd = request.getRequestDispatcher("admin/itemlist.jsp");
                request.setAttribute("detail", display);
                request.setAttribute("usernamedis", username);
        request.setAttribute("orderdisplay", orderlist);
        rd.forward(request, response);
        }
        if(act.equalsIgnoreCase("completeorder")){
            String username = request.getParameter("username");
            olbdao.deleteall(username);
        RequestDispatcher rd = request.getRequestDispatcher("orderlist?act=itemlist");
        request.setAttribute("u", username);
        rd.forward(request, response);
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
   
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
