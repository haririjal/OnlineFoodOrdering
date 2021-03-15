/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.util.DBConnection;
import java.sql.Connection;
import  com.model.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author User
 */
public class OrderListBackDao {
    Connection con =DBConnection.getConnection();
    public void insert(String username){
            try{
                PreparedStatement pstmt=con.prepareStatement("insert into orderlistback SELECT * FROM orderlist where username=?");
                
               
                pstmt.setString(1, username);
                pstmt.executeUpdate();
            }
            catch(Exception e){
            }
    }
    
    public List<OrderListBack> getOrderlist(){
        List<OrderListBack> orderlist=new ArrayList<OrderListBack>();
        try{
            PreparedStatement pstm=con.prepareStatement("select * from orderlistback group by username order by id desc");
            ResultSet rs = pstm.executeQuery();
           while(rs.next()){
            orderlist.add(new OrderListBack(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getInt(6)));
            }
        }
        catch(Exception e){
        }
        return orderlist;
    }
    
    
     public List<OrderListBack> getList(String username){
        List<OrderListBack> orderlist=new ArrayList<OrderListBack>();
        try{
            PreparedStatement pstm=con.prepareStatement("select * from orderlistback where username=?");
            pstm.setString(1, username);
            ResultSet rs = pstm.executeQuery();
           while(rs.next()){
            orderlist.add(new OrderListBack(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getInt(6)));
            }
        }
        catch(Exception e){
        }
        return orderlist;
    }
     
     
      public OrderListBack deleteall(String username){
   OrderListBack delete=null;
   try{
       PreparedStatement stmt = con.prepareStatement("delete from orderlistback where username=?");
       stmt.setString(1, username);
       stmt.executeUpdate();
   }
   catch(Exception e){
   }
   return delete;
   }
}
