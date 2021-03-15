/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.util.DBConnection;
import java.sql.Connection;
import com.model.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author User
 */
public class LikeDao {
    Connection con = DBConnection.getConnection();
    
    public void insert(Like like){
            try{
                PreparedStatement pstmt = con.prepareStatement("insert into likecount values(null,?)");
                pstmt.setString(1, like.getUsername());
                pstmt.executeUpdate();
            }
            catch(Exception e){
            
            }
    }
    
    public Like validatelike(String username){
  Like like=null;
        try {
            PreparedStatement pstm=con.prepareStatement("select * from likecount where username=?");
            pstm.setString(1, username);
            ResultSet rs=pstm.executeQuery();
            if(rs.next()){
            like=new Like(rs.getInt(1),rs.getString(2));
            
            }
        } catch (Exception e) {
        }
        return like;
  }
    
    
    public int countlike(){
        
        int a=0;
                try{
                    Statement stmt=con.createStatement();
                    ResultSet rs = stmt.executeQuery("select count(id) from likecount");
                    if(rs.next()){
                       a = rs.getInt(1);
                    }
                }
                catch(Exception e){
                }
                return a;
    }
    
    
     public Like delete(String username){
        
        Like like=null;
        try {
            PreparedStatement pstmt=con.prepareStatement("delete from likecount where username=?");
            pstmt.setString(1, username);
            pstmt.executeUpdate();
            }
         catch (Exception e) {
        }
        
        
        return like;
    
    
    }
}
