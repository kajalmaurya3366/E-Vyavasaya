package com.clgProject;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/userReg")
public class UserReg extends HttpServlet {
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        PrintWriter out = res.getWriter();
        String name = req.getParameter("name");
        String uname = req.getParameter("username");
        String email = req.getParameter("email");
        String pwd = req.getParameter("pwd");
        RequestDispatcher dispatcher = null;
        Connection con = null;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@//LAPTOP-KVRJ659S:1521/xe", "majorproject", "abc");
            PreparedStatement pst = con.prepareStatement("insert into userReg(name, usern, email, pwd) values(?, ?, ?, ?)");
            pst.setString(1, name);
            pst.setString(2, uname);
            pst.setString(3, email);
            pst.setString(4, pwd);
            int r = pst.executeUpdate();
            if (r > 0) {
                req.setAttribute("status", "success");
            } else {
                req.setAttribute("status", "error");
            }
            dispatcher = req.getRequestDispatcher("getDetail.jsp");
            dispatcher.forward(req, res);
        } catch (Exception e) {
            out.println(e);
            e.printStackTrace();
        } finally {
            try {
                if (con != null && !con.isClosed()) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
