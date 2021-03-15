/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.model.Signup;
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
public class SignupDao {
    private Connection con = DBConnection.getConnection();
    public void Insert(Signup signup){
    try{
        PreparedStatement pstmt = con.prepareStatement("insert into signup values(null,?,?, PASSWORD(?),?,?)");
        pstmt.setString(1, signup.getName());
        pstmt.setString(2,signup.getUsername() );
        pstmt.setString(3, signup.getPassword());
        pstmt.setString(4, signup.getEmail());
        pstmt.setString(5, signup.getPhone());
        pstmt.executeUpdate();
        }
   catch(Exception e){
        
    }
    }
    
  public List<Signup> getList(){
      List<Signup> signuplist= new ArrayList<Signup>();
      try{
          Statement stmt =con.createStatement();
          ResultSet rs =stmt.executeQuery("select * from signup");
          while(rs.next()){
          signuplist.add(new Signup(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4), rs.getString(5),rs.getString(6)));
          }
          
      }
      catch(Exception e){
      }
      return signuplist;
  }
  
  
  public Signup loginvalidate(String username,String password){
  Signup loginvalidate=null;
        try {
            PreparedStatement pstm=con.prepareStatement("select * from signup where username=? and password= PASSWORD(?)");
            pstm.setString(1, username);
            pstm.setString(2, password);
            ResultSet rs=pstm.executeQuery();
            if(rs.next()){
            loginvalidate=new Signup(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4), rs.getString(5),rs.getString(6));
            
            }
        } catch (Exception e) {
        }
        return loginvalidate;
  }
  
   public Signup reservationvalidate(String username){
  Signup reservationvalidate=null;
        try {
            PreparedStatement pstm=con.prepareStatement("select * from signup where username=?");
            pstm.setString(1, username);
            ResultSet rs=pstm.executeQuery();
            if(rs.next()){
            reservationvalidate=new Signup(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4), rs.getString(5),rs.getString(6));
            
            }
        } catch (Exception e) {
        }
        return reservationvalidate;
  }
  
  public Signup signupValidate(String username,String email){
  Signup signupvalidate=null;
  try{
      PreparedStatement pstm = con.prepareStatement("select * from signup where username=? and email=?");
      pstm.setString(1, username);
      pstm.setString(2, email);
      ResultSet rs = pstm.executeQuery();
      if(rs.next()){
      signupvalidate= new Signup(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4), rs.getString(5),rs.getString(6));
      }
  }
  catch(Exception e){
  }
  return signupvalidate;
  } 
  
  
  public Signup forgotpassword(String email){
  Signup forgotpass=null;
  try{
      PreparedStatement pstm = con.prepareStatement("select * from signup where email=?");
      pstm.setString(1, email);
      ResultSet rs = pstm.executeQuery();
      if(rs.next()){
      forgotpass= new Signup(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4), rs.getString(5),rs.getString(6));
      }
  }
  catch(Exception e){
  }
  return forgotpass;
  } 
 
   public void updatepassword(String email,String password){
         
        try {
             PreparedStatement pstmt=con.prepareStatement("update signup set password=PASSWORD(?) where email=?");
             pstmt.setString(1, password);
             pstmt.setString(2, email);
             pstmt.executeUpdate();
        } catch (Exception e) {
        }
   
    
    }
    public void changepassword(String username,String password){
         
        try {
             PreparedStatement pstmt=con.prepareStatement("update signup set password=PASSWORD(?) where username=?");
             pstmt.setString(1, password);
             pstmt.setString(2, username);
             pstmt.executeUpdate();
        } catch (Exception e) {
        }
    }
  
}
