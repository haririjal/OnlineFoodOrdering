/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.util.DBConnection;
import com.model.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author User
 */
public class UserLocationDao {
    Connection con = DBConnection.getConnection();
    public void insert(UserLocation userloc){
    try{
        PreparedStatement pstmt= con.prepareStatement("insert into userlocation values(null,?,?,?,?,?,?,?,?,?)");
        pstmt.setString(1, userloc.getLat());
        pstmt.setString(2, userloc.getLon());
        pstmt.setString(3, userloc.getUsername());
        pstmt.setString(4, userloc.getAddress());
        pstmt.setString(5, userloc.getTime());
        pstmt.setString(6, userloc.getDate());
        pstmt.setString(7, userloc.getPhone());
        pstmt.setString(8, userloc.getOptionalphone());
        pstmt.setString(9, userloc.getAddressdetail());
        pstmt.executeUpdate();
    }
    catch(Exception e){
    
    }
    }
    
    public List<UserLocation> display(String username){
            List<UserLocation> display =new ArrayList<UserLocation>();
            try{
                PreparedStatement pstm = con.prepareStatement("select * from userlocation where username=?");
      pstm.setString(1, username);
      ResultSet rs = pstm.executeQuery();
      while(rs.next()){
      display.add (new UserLocation(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4),rs.getString(5), rs.getString(6),rs.getString(7),rs.getString(8), rs.getString(9),rs.getString(10)));
      }
            }
            catch(Exception e){
            }
            return  display;
}
    
   public UserLocation displaylocation(String username){
  UserLocation display=null;
  try{
      PreparedStatement pstm = con.prepareStatement("select * from userlocation where username=?");
      pstm.setString(1, username);
      ResultSet rs = pstm.executeQuery();
      if(rs.next()){
      display= new UserLocation(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4),rs.getString(5), rs.getString(6),rs.getString(7),rs.getString(8), rs.getString(9),rs.getString(10));
      }
  }
  catch(Exception e){
  }
  return display;
  } 
   
    public void updatelocation(UserLocation user){
    try{
        PreparedStatement pstmt = con.prepareStatement("update userlocation set lat=?,lon=?,address=? ,time=?,date=?,phone=?,optionalphone=?,addressdetail=? where username=?");
        pstmt.setString(1,user.getLat());
        pstmt.setString(2, user.getLon());
        pstmt.setString(3, user.getAddress());
        pstmt.setString(4, user.getTime());
        pstmt.setString(5, user.getDate());
        pstmt.setString(6, user.getPhone());
        pstmt.setString(7, user.getOptionalphone());
        pstmt.setString(8, user.getAddressdetail());
        pstmt.setString(9, user.getUsername());
        pstmt.executeUpdate();
    }
    catch(Exception e){
    
    }
    }
    
}
