/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import com.model.*;
import java.sql.ResultSet;

/**
 *
 * @author User
 */
public class ReserveStatusDao {
    Connection con = DBConnection.getConnection();
    
    public void insert(ReserveStatus r){
            try{
                PreparedStatement pstmt = con.prepareStatement("insert into reservestatus values(?,?,?)");
                pstmt.setInt(1,r.getId());
                pstmt.setString(2, r.getStatus());
                pstmt.setString(3, r.getUsername());
                
                pstmt.executeUpdate();
            }
            catch(Exception e){
            
            }
    }
    
     public ReserveStatus getById(String status){
        
        ReserveStatus r=null;
        try {
            PreparedStatement pstmt=con.prepareStatement("select * from reservestatus where status=?");
            pstmt.setString(1, status);
            ResultSet rs=pstmt.executeQuery();
            if(rs.next()){
                r=new ReserveStatus(rs.getInt(1), rs.getString(2),rs.getString(3));
            }
        } catch (Exception e) {
        }
        
        
        return r;
    
    
    }
}
