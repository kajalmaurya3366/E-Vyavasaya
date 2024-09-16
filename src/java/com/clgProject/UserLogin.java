
package com.clgProject;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/userLogin")
public class UserLogin extends HttpServlet {
    public void doPost(HttpServletRequest req, HttpServletResponse res)throws IOException,ServletException{
        PrintWriter out=res.getWriter();
           RequestDispatcher dispatcher = null;
        int count=0;
        String email=req.getParameter("email");
        String pwd=req.getParameter("pwd");
        Connection conn=null;
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn= DriverManager.getConnection("jdbc:oracle:thin:@//LAPTOP-KVRJ659S:1521/xe", "majorproject", "abc");
            PreparedStatement pst=conn.prepareCall("select email,pwd from userReg");
            ResultSet rs=pst.executeQuery();
            while(rs.next()){
                if(rs.getString(1).equalsIgnoreCase(email)&&rs.getString(2).equals(pwd)){
                    count++;
                    break;
                }
            }
            if(count>0){
                res.sendRedirect("getDetail.jsp");
//                 dispatcher = req.getRequestDispatcher("GetDetails.jsp");
//               dispatcher.forward(req, res);    
            }
            else{
          req.setAttribute("errorMessage", "Invalid email or password");
    dispatcher = req.getRequestDispatcher("userLoginAndReg.jsp"); // Forward back to login page with error message
    dispatcher.forward(req, res);
            }
        
        }catch(Exception e){
            e.printStackTrace();
               out.println(e);
        }finally{
            try{
            if(conn!=null&&!conn.isClosed()){
                conn.close();
            }
            }catch(Exception e){
                e.printStackTrace();
                out.println(e);
            }

        }
    }
    
    
}
