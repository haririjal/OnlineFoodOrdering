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
public class Menu {
    private int id;
    private String  category;
    private String dishimage;
    private String dishname;
    private String dishprice;
    private String dishdetail;

    public Menu() {
    }

    public Menu(int id, String category, String dishimage, String dishname, String dishprice, String dishdetail) {
        this.id = id;
        this.category = category;
        this.dishimage = dishimage;
        this.dishname = dishname;
        this.dishprice = dishprice;
        this.dishdetail = dishdetail;
    }

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the category
     */
    public String getCategory() {
        return category;
    }

    /**
     * @param category the category to set
     */
    public void setCategory(String category) {
        this.category = category;
    }

    /**
     * @return the dishimage
     */
    public String getDishimage() {
        return dishimage;
    }

    /**
     * @param dishimage the dishimage to set
     */
    public void setDishimage(String dishimage) {
        this.dishimage = dishimage;
    }

    /**
     * @return the dishname
     */
    public String getDishname() {
        return dishname;
    }

    /**
     * @param dishname the dishname to set
     */
    public void setDishname(String dishname) {
        this.dishname = dishname;
    }

    /**
     * @return the dishprice
     */
    public String getDishprice() {
        return dishprice;
    }

    /**
     * @param dishprice the dishprice to set
     */
    public void setDishprice(String dishprice) {
        this.dishprice = dishprice;
    }

    /**
     * @return the dishdetail
     */
    public String getDishdetail() {
        return dishdetail;
    }

    /**
     * @param dishdetail the dishdetail to set
     */
    public void setDishdetail(String dishdetail) {
        this.dishdetail = dishdetail;
    }
    
}
