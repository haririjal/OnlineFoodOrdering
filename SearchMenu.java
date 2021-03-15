/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.dao.MenuDao;
import com.model.*;
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
public class SearchMenu extends HttpServlet {
    MenuDao mdao= new MenuDao();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            String keyword=request.getParameter("dishname");
             List<Menu> list=mdao.getList();
            request.setAttribute("list", list);
            List<Menu> menusearch = mdao.searchmenu(keyword);
            request.setAttribute("menusearch", menusearch);
            RequestDispatcher rd = request.getRequestDispatcher("searchmenu.jsp");
            rd.forward(request, response);
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
