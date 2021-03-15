/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.dao.LikeDao;
import com.dao.SignupDao;
import com.model.Like;
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
public class LikeCommentController extends HttpServlet {
    LikeDao likedao= new LikeDao();
    SignupDao sdao= new SignupDao();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String act=request.getParameter("act");
if(act.equalsIgnoreCase("like")){
    
    String  username =request.getParameter("username");
    Signup signup = sdao.reservationvalidate(username);
    Like likevalidate=likedao.validatelike(username);
    if(signup!=null&likevalidate==null){
        String msg="liked";
        request.setAttribute("liked", msg);
    Like l= new Like(0,username );
    likedao.insert(l);
        RequestDispatcher rd=request.getRequestDispatcher("likecommentdisplay");
        rd.forward(request, response);
    }
    else{
       
        likedao.delete(username);
        int count= likedao.countlike();
    request.setAttribute("like", count);
        RequestDispatcher rd=request.getRequestDispatcher("likecommentdisplay");
        rd.forward(request, response);
    }
}
        if(act.equalsIgnoreCase("comment")){
                
        }
 
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
    }
}
