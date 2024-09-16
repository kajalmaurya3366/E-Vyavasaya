
package com.clgProject;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/workerForm")
@MultipartConfig
public class WorkerForm extends HttpServlet {
    
  
    protected void doPost(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException 
    {
        
        String ename=req.getParameter("name");
        int eage=Integer.parseInt(req.getParameter("age"));
        long emobile=Long.parseLong(req.getParameter("mobile"));
        String ecity=req.getParameter("city");
        String estate=req.getParameter("state");
        Part eimg = req.getPart("img");
        InputStream eimage = eimg.getInputStream();
        Part esig = req.getPart("sig");
        InputStream esign = esig.getInputStream();
        Part eadhar = req.getPart("adhar");
        InputStream eadharcard = eadhar.getInputStream();
        String ecat=req.getParameter("cat");
        RequestDispatcher dispatcher=null;
        PrintWriter out=res.getWriter();
        Connection con=null;
            
       
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con=DriverManager.getConnection("jdbc:oracle:thin:@//LAPTOP-KVRJ659S:1521/xe","majorproject","abc");
            PreparedStatement pst=con.prepareStatement("insert into workerForm(name,age,mobile,city,st,img,sig,adhar,cat)values(?,?,?,?,?,?,?,?,?)");
            pst.setString(1,ename);
            pst.setInt(2, eage);
            pst.setLong(3, emobile);
            pst.setString(4,ecity);
            pst.setString(5,estate);
            pst.setBlob(6, eimage);
            pst.setBlob(7,esign);
            pst.setBlob(8,eadharcard);
            pst.setString(9, ecat);
            int r=pst.executeUpdate();
          
          if (r > 0) {
                req.setAttribute("status", "success");
            } else {
                req.setAttribute("status", "error");
            }
            dispatcher = req.getRequestDispatcher("workerForm.jsp");
            dispatcher.forward(req, res);
 
        }catch(Exception e){
           e.printStackTrace();
           out.println(e);
                 }finally{
            try{
            if (con != null && !con.isClosed()) {
                    con.close();
                }
            }catch(Exception e){
              e.printStackTrace();
            }
           
        }
        
        

    }

    
    
    
}
