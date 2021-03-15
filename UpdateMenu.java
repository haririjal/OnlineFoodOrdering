/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package backend.controller;

import com.dao.MenuDao;
import com.model.Menu;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.util.Enumeration;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.io.FilenameUtils;

/**
 *
 * @author User
 */
public class UpdateMenu extends HttpServlet {
        MenuDao mdao = new MenuDao();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String path=request.getServletContext().getRealPath("")+"assests/images";
            MultipartRequest mrequest= new MultipartRequest(request, path,5000000, new FileRenamePolicy() {
                @Override
                public File rename(File file) {
                    String name="Suman_IMG_"+String.valueOf(new java.util.Date().getTime());
                    String ext=FilenameUtils.getExtension(file.getName());
                    return new File(file.getParentFile(),name+"."+ext);
                    
                }
            });
            String dishimage=null;
            Enumeration files=mrequest.getFileNames();
            if(files.hasMoreElements())
            {
            
                dishimage=mrequest.getFilesystemName(files.nextElement().toString());
                
            }
            
            String ext=FilenameUtils.getExtension(dishimage);
            if(ext.equalsIgnoreCase("jpg")|| ext.equalsIgnoreCase("jpeg")|| ext.equalsIgnoreCase("png"))
            {
                int id=Integer.parseInt(request.getParameter("id"));
             String category=mrequest.getParameter("category");
        String dishname=mrequest.getParameter("dishname");
        String dishprice=mrequest.getParameter("dishprice");
        String dishdetail=mrequest.getParameter("dishdetail");
        Menu m=new Menu(id, category, dishimage, dishname, dishprice, dishdetail);
        mdao.update(m);
        
        RequestDispatcher rd=request.getRequestDispatcher("menudisplay");
        request.setAttribute("update",m );
        rd.forward(request, response);    
        
            
            }
            
            else
            {
                Files.delete(new File(path+"/"+dishimage).toPath());
                response.sendRedirect("admin/dashboard.jsp?msg=file error");
            }
            
            
    }
}
