<%-- 
    Document   : GetDetails
    Created on : 2 Sep, 2024, 7:51:20 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <title>e-Vyavasaya</title>
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/userLoginAndReg.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.0.0/mdb.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

     <script>
        // Function to hide the error message after a set amount of time (5 seconds)
        function hideErrorMessage() {
            const errorMsg = document.getElementById("errorMsg");
            if (errorMsg) {
                setTimeout(() => {
                    errorMsg.style.display = "none"; // Hide the error message
                }, 5000); // 5000 milliseconds = 5 seconds
            }
        }
    </script>
    
  </head>
  
  <body >
      <nav class="navbar bg-body-tertiary p-0">
            <div class="container-fluid">
              <a class="navbar-brand fs-2 text-white p-3" href="#">
                E-Vyavasaya
              </a>
            </div>
      </nav>

      <!-- Login/Register Section -->
       <div class="main_container">
       <div class="form_box">
            <div class="login_box">
                <!-- Pills navs -->
                <ul class="nav nav-pills nav-justified mb-3" id="ex1" role="tablist">
                    <li class="nav-item" role="presentation">
                        <a class="nav-link active" id="tab-login" data-mdb-pill-init data-mdb-toggle="pill" href="#pills-login" role="tab"
                          aria-controls="pills-login" aria-selected="true">Login</a>
                    </li>
                    <li class="nav-item" role="presentation">
                        <a class="nav-link" id="tab-register" data-mdb-pill-init data-mdb-toggle="pill" href="#pills-register" role="tab"
                          aria-controls="pills-register" aria-selected="false">Register</a>
                    </li>
                </ul>

                <!-- Pills content -->
                <div class="tab-content">
                    <!-- Login Tab -->
                    <div class="tab-pane fade show active" id="pills-login" role="tabpanel" aria-labelledby="tab-login">
                        <form method="post" action="userLogin" autocomplete="off">
                            <!-- Email input -->
                            <div data-mdb-input-init class="form-outline mb-4">
                                <input type="email" id="loginName" class="form-control" name="email" required />
                                <label class="form-label" for="loginName">Email</label>
                            </div>

                            <!-- Password input -->
                            <div data-mdb-input-init class="form-outline mb-4">
                                <input type="password" id="loginPassword" class="form-control"name="pwd"required />
                                <label class="form-label" for="loginPassword">Password</label>
                            </div>
                            
                              <%
                            String errorMessage = (String) request.getAttribute("errorMessage");
                            if (errorMessage != null) {
                        %>
                            <p style="color: red;" onload="hideErrorMessage()"><%= errorMessage %></p>
                        <% } %>

                            <!-- Submit button -->
                            <button type="submit" data-mdb-button-init data-mdb-ripple-init class="sub_btn btn btn-primary btn-block mb-4">Sign in</button>
                        </form>
                    </div>

                    <!-- Register Tab -->
                    <div class="tab-pane fade" id="pills-register" role="tabpanel" aria-labelledby="tab-register">
                        <form action="userReg" method="post" autocomplete="off">
                            <!-- Name input -->
                            <div data-mdb-input-init class="form-outline mb-4">
                                <input type="text" id="registerName" class="form-control" name="name" required/>
                                <label class="form-label" for="registerName">Name</label>
                            </div>

                            <!-- Username input -->
                            <div data-mdb-input-init class="form-outline mb-4">
                                <input type="text" id="registerUsername" class="form-control" name="username"  required />
                                <label class="form-label" for="registerUsername">Username</label>
                            </div>

                            <!-- Email input -->
                            <div data-mdb-input-init class="form-outline mb-4">
                                <input type="email" id="registerEmail" class="form-control" name="email"  required/>
                                <label class="form-label" for="registerEmail">Email</label>
                            </div>

                            <!-- Password input -->
                            <div data-mdb-input-init class="form-outline mb-4 position-relative">
                              <input type="password" required id="registerPassword" class="form-control"name="pwd" />
                              <label class="form-label" for="registerPassword">Password</label>
                              <!-- Add an eye icon to toggle password visibility -->
                              <span toggle="#registerPassword" class="fa fa-fw fa-eye field-icon position-absolute" id="togglePassword" style="right: 10px; top: 25%; cursor: pointer;"></span>
                          </div>
                          
                            
                       
                            <!-- Submit button -->
                            <button type="submit" data-mdb-button-init data-mdb-ripple-init class="btn btn-primary btn-block mb-3">Sign Up</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="image_box">
            <div class="img">
                  <img src="https://img.freepik.com/premium-vector/new-user-online-registration-sign-up-concept-tiny-characters-signing-up-huge-smartphone-with-secure-password-login-account-mobile-app-web-access-cartoon-people-vector-illustration_87771-11429.jpg" alt="">
            </div>
        </div>





        <!-- end of main container  -->
      </div>

      <script>
            document.getElementById("togglePassword").addEventListener("click", function () {
                var passwordField = document.getElementById("registerPassword");
                var toggleIcon = document.getElementById("togglePassword");
        
                if (passwordField.type === "password") {
                    // Change password field to text to show the password
                    passwordField.type = "text";
                    // Change the icon to 'eye-slash' when password is visible
                    toggleIcon.classList.remove("fa-eye");
                    toggleIcon.classList.add("fa-eye-slash");
                } else {
                    // Change password field to password to hide the password
                    passwordField.type = "password";
                    // Change the icon back to 'eye' when password is hidden
                    toggleIcon.classList.remove("fa-eye-slash");
                    toggleIcon.classList.add("fa-eye");
                }
            });
        </script>



        <!-- MDB and Bootstrap Scripts -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.0.0/mdb.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  </body>
</html>
