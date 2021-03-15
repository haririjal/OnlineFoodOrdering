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
import com.model.Menu;
import com.util.DBConnection;
import java.sql.*;
import java.util.*;
public class MenuDao {
    private Connection con=DBConnection.getConnection();
//    protected void disconnect() throws SQLException {
//        if (con!= null && !con.isClosed()) {
//            con.close();
//        }
//    }
//    
    public void insert(Menu menu){
        try {
             PreparedStatement pstmt=con.prepareStatement("insert into menu values(null,?,?,?,?,?)");
             pstmt.setString(1, menu.getCategory());
             pstmt.setString(2, menu.getDishimage());
             pstmt.setString(3, menu.getDishname());
             pstmt.setString(4, menu.getDishprice());
             pstmt.setString(5, menu.getDishdetail());
             pstmt.executeUpdate();
        } catch (Exception e) {
        }
   
    
    }
     public void update(Menu menu){
         
        try {
             PreparedStatement pstmt=con.prepareStatement("update menu set category=?,dishimage=?,dishname=?,dishprice=?,dishdetail=? where id=?");
             pstmt.setString(1, menu.getCategory());
             pstmt.setString(2, menu.getDishimage());
             pstmt.setString(3, menu.getDishname());
             pstmt.setString(4, menu.getDishprice());
             pstmt.setString(5, menu.getDishdetail());
             pstmt.setInt(6, menu.getId());
             pstmt.executeUpdate();
        } catch (Exception e) {
        }
   
    
    }
    public Menu delete(int id){
        
        Menu menu=null;
        try {
            PreparedStatement pstmt=con.prepareStatement("delete from menu where id=?");
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
            }
         catch (Exception e) {
        }
        
        
        return menu;
    
    
    }
    
     public Menu orderlist(int id){
        
        Menu menu=null;
        try {
            PreparedStatement pstmt=con.prepareStatement("select * from menu where id=?");
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
            }
         catch (Exception e) {
        }
        
        
        return menu;
    
    
    }
    
    public List<Menu> getList(){
    
        List<Menu> menulist=new ArrayList<Menu>();
        
        
        try
        {
            Statement stmt=con.createStatement();
            ResultSet rs=stmt.executeQuery("select * from menu order by category asc");
            while(rs.next()){
            menulist.add(new Menu(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6)));
            }
            
        } catch (Exception e) {
        }
        
        return menulist;
    
    
    }
    
    
    public Menu getById(int id){
        
        Menu menu=null;
        try {
            PreparedStatement pstmt=con.prepareStatement("select * from menu where id=?");
            pstmt.setInt(1, id);
            ResultSet rs=pstmt.executeQuery();
            if(rs.next()){
            menu=new Menu(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6));
            }
        } catch (Exception e) {
        }
        
        
        return menu;
    
    
    }
    public List<Menu> searchmenu(String dishname){
            List<Menu> menusearch =new ArrayList<Menu>();
            try{
                PreparedStatement pstmt = con.prepareStatement("select * from menu where dishname like ?");
                pstmt.setString(1, "%" + dishname + "%");
                ResultSet rs = pstmt.executeQuery();
                while(rs.next()){
                menusearch.add(new Menu(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6)));
                }
            }
            catch(Exception e){
            }
            return  menusearch;
}
    
}
