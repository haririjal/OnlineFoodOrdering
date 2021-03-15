/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

/**
 *
 * @author User
 */
public class UserLocation {
    int id;
  String lat,lon,username,address,time,date,phone,optionalphone,addressdetail;

    public UserLocation(int id, String lat, String lon, String username, String address, String time, String date, String phone, String optionalphone, String addressdetail) {
        this.id = id;
        this.lat = lat;
        this.lon = lon;
        this.username = username;
        this.address = address;
        this.time = time;
        this.date = date;
        this.phone = phone;
        this.optionalphone = optionalphone;
        this.addressdetail = addressdetail;
    }

    public UserLocation() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLat() {
        return lat;
    }

    public void setLat(String lat) {
        this.lat = lat;
    }

    public String getLon() {
        return lon;
    }

    public void setLon(String lon) {
        this.lon = lon;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getOptionalphone() {
        return optionalphone;
    }

    public void setOptionalphone(String optionalphone) {
        this.optionalphone = optionalphone;
    }

    public String getAddressdetail() {
        return addressdetail;
    }

    public void setAddressdetail(String addressdetail) {
        this.addressdetail = addressdetail;
    }

    
    
}
