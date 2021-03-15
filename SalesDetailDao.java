/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.model.SalesDetail;
/**
 *
 * @author User
 */
public class SalesDetailDao {
    Connection con =DBConnection.getConnection();
     public void insert(SalesDetail sales){
        try {
             PreparedStatement pstmt=con.prepareStatement("insert into saleddetail values(null,?,?,?,?,?,?,?)");
             pstmt.setString(1, sales.getUsername());
             pstmt.setString(2, sales.getAddress());
             pstmt.setString(3, sales.getDate());
             pstmt.setString(4, sales.getTime());
             pstmt.setString(5, sales.getDishname());
             pstmt.setInt(6, sales.getPrice());
             pstmt.setInt(7, sales.getQty());
             pstmt.setInt(8, sales.getTotal());
             pstmt.executeUpdate();
        } catch (Exception e) {
        }
    }
    
}

