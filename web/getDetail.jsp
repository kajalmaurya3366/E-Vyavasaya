<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <title>e-Vyavasaya</title>
 
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/getD.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
    <nav class="navbar bg-body-tertiary p-0">
        <div class="container-fluid">
            <a class="navbar-brand fs-2 text-white p-3" href="#">
                E-Vyavasaya
            </a>
        </div>
    </nav>

    <!-- main content -->
    <div class="drop_down">
        <div class="drop-item">
            <label for="">State</label>
            <select name="" id="">
                <option value="madhya pradesh">Madhya Pradesh</option>
                <option value="andhra pradesh">Andhra Pradesh</option>
                <option value="delhi">Delhi</option>
                <option value="uttarakhand">Uttarakhand</option>
                <option value="uttar pradesh">Uttar Pradesh</option>
            </select>
        </div>

        <div class="drop-item">
            <label for="">City</label>
            <select name="" id="">
                <option value="bhopal">Bhopal</option>
                <option value="indore">Indore</option>
                <option value="chidware">Chidwara</option>
            </select>
        </div>

        <div class="drop-item">
            <label for="">Category</label>
            <select name="" id="">
                <option value="driver">Driver</option>
                <option value="plumber">Plumber</option>
                <option value="mystery">Mystery</option>
                <option value="interior designer">Interior Designer</option>
                <option value="painter">Painter</option>
            </select>
        </div>
    </div>

    <!-- table-section -->
    <div class="table_title">Details of Service Providers</div>
    <div class="table-container">
        <table border="2" class="table">
            <thead>
                <tr>
                    
                    <th>Name</th>
                    <th>Age</th>
                    <th>City</th>
                    <th>State</th>
                    <th>Service</th>
                    <th>Contact No</th>
                   
                </tr>
            </thead>
            <tbody>
                <%
                    Connection con = null;
                    PreparedStatement pst = null;
                    ResultSet rs = null;
                    try {
                        Class.forName("oracle.jdbc.driver.OracleDriver");
                        con = DriverManager.getConnection("jdbc:oracle:thin:@//LAPTOP-KVRJ659S:1521/xe", "majorproject", "abc");
                        pst = con.prepareStatement("SELECT  name, age, city, st, cat, mobile FROM workerForm");
                        rs = pst.executeQuery();
                        while (rs.next()) {
                %>
                <tr>
                    
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getInt("age") %></td>
                    <td><%= rs.getString("city") %></td>
                    <td><%= rs.getString("st") %></td>
                    <td><%= rs.getString("cat") %></td>
                    <td><%= rs.getString("mobile") %></td>
                    
                </tr>
                <%
                    
                        }
                 
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        try {
                            if (rs != null) rs.close();
                            if (pst != null) pst.close();
                            if (con != null) con.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                %>
            </tbody>
        </table>
    </div>

           <script type="text/javascript">
    // Push the current state to the history stack
    window.history.pushState(null, "", window.location.href);

    // Detect the back button action
    window.onpopstate = function(event) {
        // Re-push the state to prevent back navigation
        window.history.pushState(null, "", window.location.href);
        alert("Back navigation is disabled on this page.");
    };
</script>


            
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
