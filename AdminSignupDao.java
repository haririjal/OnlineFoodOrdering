/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.util.DBConnection;
import java.sql.Connection;
import com.model.AdminSignup;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author User
 */
public class AdminSignupDao {
    Connection con=DBConnection.getConnection();
    
    public void insert(AdminSignup admin){
    try{
       PreparedStatement pstmt=con.prepareStatement("insert into adminsignup values(null,?,?, PASSWORD(?),?,?)");
       pstmt.setString(1, admin.getName());
       pstmt.setString(2, admin.getUsername());
       pstmt.setString(3, admin.getPassword());
       pstmt.setString(4, admin.getEmail());
       pstmt.setString(5, admin.getPhone());
       pstmt.executeUpdate();
}
    catch(Exception e){

}
    }
    public List<AdminSignup> getList(){
      List<AdminSignup> list= new ArrayList<AdminSignup>();
      try{
          Statement stmt =con.createStatement();
          ResultSet rs =stmt.executeQuery("select * from adminsignup");
          while(rs.next()){
          list.add(new AdminSignup(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4), rs.getString(5),rs.getString(6)));
          }
          
      }
      catch(Exception e){
      }
      return list;
  }
    
    
    
    public AdminSignup signupValidate(String username,String email){
  AdminSignup signupvalidate=null;
  try{
      PreparedStatement pstm = con.prepareStatement("select * from adminsignup where username=? and email=?");
      pstm.setString(1, username);
      pstm.setString(2, email);
      ResultSet rs = pstm.executeQuery();
      if(rs.next()){
      signupvalidate= new AdminSignup(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4), rs.getString(5),rs.getString(6));
      }
  }
  catch(Exception e){
  }
  return signupvalidate;
  }
    
    
      public AdminSignup loginvalidate(String username,String password){
  AdminSignup loginvalidate=null;
        try {
            PreparedStatement pstm=con.prepareStatement("select * from adminsignup where username=? and password=PASSWORD(?)");
            pstm.setString(1, username);
            pstm.setString(2, password);
            ResultSet rs=pstm.executeQuery();
            if(rs.next()){
            loginvalidate=new AdminSignup(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4), rs.getString(5),rs.getString(6));
            
            }
        } catch (Exception e) {
        }
        return loginvalidate;
  }
      
       public AdminSignup forgotpassword(String email){
  AdminSignup forgotpass=null;
  try{
      PreparedStatement pstm = con.prepareStatement("select * from adminsignup where email=?");
      pstm.setString(1, email);
      ResultSet rs = pstm.executeQuery();
      if(rs.next()){
      forgotpass= new AdminSignup(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4), rs.getString(5),rs.getString(6));
      }
  }
  catch(Exception e){
  }
  return forgotpass;
  } 
//       public AdminSignup selectusername(String email){
//       AdminSignup forgotpass=null;
//  try{
//      PreparedStatement pstm = con.prepareStatement("select username from adminsignup where email=?");
//      pstm.setString(1, email);
//      ResultSet rs = pstm.executeQuery();
//      if(rs.next()){
//      forgotpass= new AdminSignup(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4), rs.getString(5),rs.getString(6));
//      }
//  }
//  catch(Exception e){
//  }
//  return forgotpass;
//       }
       
        public void updatepassword(String email,String password){
         
        try {
             PreparedStatement pstmt=con.prepareStatement("update adminsignup set password=PASSWORD(?) where email=?");
             pstmt.setString(1, password);
             pstmt.setString(2, email);
             pstmt.executeUpdate();
        } catch (Exception e) {
        }
}
}
