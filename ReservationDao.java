/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import com.model.Reservation;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author User
 */
public class ReservationDao {
    private Connection con=DBConnection.getConnection();
    
    public void insert(Reservation reservation){
        try{
            PreparedStatement pstm =con.prepareStatement("insert into reservation values(null,?,?,?,?,?,?,?)");
           pstm.setString(1, reservation.getUsername());
            pstm.setString(2, reservation.getPhone());
            pstm.setString(3, reservation.getTime());
            pstm.setString(4, reservation.getDate());
             pstm.setString(5, reservation.getParty());
            pstm.setString(6, reservation.getMessage());
            pstm.setString(7, reservation.getStatus());
            
            pstm.executeUpdate();
        }
        catch(Exception e){
            
        }
    }
     public List<Reservation> getList(){
    
        List<Reservation> reservelist=new ArrayList<Reservation>();
        
        
        try
        {
            Statement stmt=con.createStatement();
            ResultSet rs=stmt.executeQuery("select * from reservation order by id desc");
            while(rs.next()){
            reservelist.add(new Reservation(rs.getInt(1),rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7),rs.getString(8)));
            }
            
        } catch (Exception e) {
        }
        
        return reservelist;
    
    
    }
   
    
    public Reservation status(int id){
    
        Reservation reserve=null;
        try {
            PreparedStatement pstm=con.prepareStatement("select * from reservation where id=?");
            pstm.setInt(1, id);
            ResultSet rs=pstm.executeQuery();
            if(rs.next()){
            reserve=new Reservation(rs.getInt(1),rs.getString(2),  rs.getString(3),rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7),rs.getString(8));
            
            }
        } catch (Exception e) {
        }
        return reserve;
        
    }
    
    public Reservation reservationdetail(String username){
    
        Reservation reserve=null;
        try {
            PreparedStatement pstm=con.prepareStatement("select * from reservation where username=?");
//            pstm.setString(1, email);
//            pstm.setString(2, time);
//            pstm.setString(3, date);
//            pstm.setString(4, party);
//            pstm.setString(5, message);
            pstm.setString(1, username);
            ResultSet rs=pstm.executeQuery();
            if(rs.next()){
            reserve=new Reservation(rs.getInt(1),rs.getString(2),  rs.getString(3),rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7),rs.getString(8));
            
            }
        } catch (Exception e) {
        }
        return reserve;
        
    }
    public Reservation delete(int id){
        
        Reservation rev=null;
        try {
            PreparedStatement pstmt=con.prepareStatement("delete from reservation where id=?");
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
            }
         catch (Exception e) {
             
        }
        
        
        return rev;
    
    
    }
    
 
     public List<Reservation> orderlist(String username){
    
        List<Reservation> reservelist=new ArrayList<Reservation>();
        
        
        try
        {
            PreparedStatement pstm=con.prepareStatement("select * from reservation where username=?");
            pstm.setString(1, username);
            ResultSet rs=pstm.executeQuery();
            while(rs.next()){
            reservelist.add(new Reservation(rs.getInt(1),rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7),rs.getString(8)));
            }
            
        } catch (Exception e) {
        }
        
        return reservelist;
    
    
    }
    
  public void update(String status,int id){
         
        try {
             PreparedStatement pstmt=con.prepareStatement("update reservation set status=? where id=?");
             pstmt.setString(1, status);
             pstmt.setInt(2, id);
             pstmt.executeUpdate();
        } catch (Exception e) {
        }
   
    
    }

    
}
