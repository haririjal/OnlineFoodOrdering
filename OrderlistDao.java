/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.model.Orderlist;
import com.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author User
 */
public class OrderlistDao {
    Connection con =DBConnection.getConnection();
    public void insert(Orderlist orderlist){
            try{
                PreparedStatement pstmt=con.prepareStatement("insert into orderlist values(null,?,?,?,?,?)");
                pstmt.setString(1, orderlist.getUsername());
                pstmt.setString(2, orderlist.getDishname());
                pstmt.setInt(3, orderlist.getPrice());
                pstmt.setInt(4, orderlist.getQty());
                pstmt.setInt(5, orderlist.getTotal());
                pstmt.executeUpdate();
            }
            catch(Exception e){
            }
    }
    
    
    public List<Orderlist> getOrderlist(){
        List<Orderlist> orderlist=new ArrayList<Orderlist>();
        try{
            PreparedStatement pstm=con.prepareStatement("select * from orderlist group by username order by id desc");
            ResultSet rs = pstm.executeQuery();
           while(rs.next()){
            orderlist.add(new Orderlist(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getInt(6)));
            }
        }
        catch(Exception e){
        }
        return orderlist;
    }
    
    
    public List<Orderlist> getList(String username){
        List<Orderlist> orderlist=new ArrayList<Orderlist>();
        try{
            PreparedStatement pstm=con.prepareStatement("select * from orderlist where username=?");
            pstm.setString(1, username);
            ResultSet rs = pstm.executeQuery();
           while(rs.next()){
            orderlist.add(new Orderlist(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getInt(6)));
            }
        }
        catch(Exception e){
        }
        return orderlist;
    }
    
   public Orderlist delete(int id){
   Orderlist deleteol=null;
   try{
     PreparedStatement pstmt=con.prepareStatement("delete from orderlist where id=?");
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
   }
   catch(Exception e){
   }
   return deleteol;
   }
   public Orderlist deleteall(String username){
   Orderlist delete=null;
   try{
       PreparedStatement stmt = con.prepareStatement("delete from orderlist where username=?");
       stmt.setString(1, username);
       stmt.executeUpdate();
   }
   catch(Exception e){
   }
   return delete;
   }
   public List<Orderlist> onlineorderlist(){
        List<Orderlist> orderlist=new ArrayList<Orderlist>();
        try{
            PreparedStatement pstm=con.prepareStatement("select * from orderlist");
            ResultSet rs = pstm.executeQuery();
           while(rs.next()){
            orderlist.add(new Orderlist(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getInt(6)));
            }
        }
        catch(Exception e){
        }
        return orderlist;
    }
   


 public void update(Orderlist orderlist){
         
        try {
             PreparedStatement pstmt=con.prepareStatement("update orderlist set price=?,qty=?,total=? where username=? and dishprice=?");
            
                pstmt.setInt(1, orderlist.getPrice());
                pstmt.setInt(2, orderlist.getQty());
                pstmt.setInt(3, orderlist.getTotal());
                 pstmt.setString(5, orderlist.getUsername());
                pstmt.setString(6, orderlist.getDishname());
                pstmt.executeUpdate();
             pstmt.executeUpdate();
        } catch (Exception e) {
        }
        }
 
  public List<Orderlist> checkdoubleitem(String username,String dishname){
        List<Orderlist> orderlist=new ArrayList<Orderlist>();
        try{
            PreparedStatement pstm=con.prepareStatement("select * from orderlist where username=? and dishname=?");
            pstm.setString(1, username);
            pstm.setString(2, dishname);
            ResultSet rs = pstm.executeQuery();
           while(rs.next()){
            orderlist.add(new Orderlist(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getInt(6)));
            }
        }
        catch(Exception e){
        }
        return orderlist;
    }
    
}

