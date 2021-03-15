/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.util;

import java.sql.*;

/**
 *
 * @author User
 */
public class DBConnection {
    public static  Connection getConnection(){
        Connection con=null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","");
            
        } catch (Exception e) {
        }
        return con;
    }
    
}
