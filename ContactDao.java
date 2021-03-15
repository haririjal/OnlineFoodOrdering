/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

/**
 *
 * @author User
 */

import com.model.Contact;
import com.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class ContactDao {
    private Connection con=DBConnection.getConnection();
    
    public void insert(Contact contact){
        try {
            PreparedStatement pstmt=con.prepareStatement("insert into contact values(null,?,?,?,?)");
            pstmt.setString(1, contact.getName());
            pstmt.setString(2, contact.getEmail());
            pstmt.setString(3, contact.getPhone());
            pstmt.setString(4, contact.getMessage());
            pstmt.executeUpdate();
        } catch (Exception e) {
        }
        
        
    }
    public List<Contact> getList(){
    List<Contact> contactlist = new ArrayList<Contact>();
    try{
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("select * from contact order by id desc");
        while (rs.next()) {            
            contactlist.add(new Contact(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5)));
        }
    }
    catch(Exception e){
    
    }
    return contactlist;
    }
    
    public Contact delete(int id){
        
        Contact contact=null;
        try {
            PreparedStatement pstmt=con.prepareStatement("delete from contact where id=?");
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
            }
         catch (Exception e) {
        }
        
        
        return contact;
    
    
    }
    
}
