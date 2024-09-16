<%-- 
    Document   : EmpRegistration
    Created on : 2 Sep, 2024, 4:29:22 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    
    <title>e-Vyavasaya</title>
     <link rel="stylesheet" href="css/header.css">
       <link rel="stylesheet" href="css/workerForm.css">
      <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  </head>
  <body>
      <!--Navbar-->
      <nav class="navbar bg-body-tertiary p-0 ">
            <div class="container-fluid  ">
              <a class="navbar-brand fs-2 text-white p-3" href="#">
                E-Vyavasaya
              </a>
            </div>
      </nav>
      <div class="main-box">
           <div class="form-container">
               <div class="page-title"><h3>FILL FORM AS A WORKER</h3></div>
               <div class="divbox">
                  <div class="form-box">
                        <form action="workerForm" method="post"enctype="multipart/form-data"  autocomplete="off">
                              <div class="name in">
                                    <label for="name">Name</label>
                                    <input type="text" placeholder="Enter Full Name" name="name" required>
                              </div>
                              <div class="age in">
                                    <label for="age"> Age</label>
                                    <input type="text" placeholder="Enter Age" name="age" required>
                              </div>
                              <div class="phone in">
                                    <label for="mobile"> Phone No</label>
                                    <input type="text" placeholder="Enter Phone Number" name="mobile"required>
                              </div>
                              <div class="city in">
                                    <label for="city"> City</label>
                                    <input type="text" placeholder="Enter city name" name="city" required>
                              </div>
                            <div class="state in">
                                    <label for="state"> State</label>
                                    <input type="text" placeholder="Enter state name " name="state" required>
                              </div>
                              <p id="note"> *All documents are in pdf Format </p>
                              <div class="img in">
                                    <label for="img"> Image</label>
                                    <input type="file" name="img" required>
                              </div>
                              <div class="sig in">
                                    <label for="sig"> Signature</label>
                                    <input type="file" name="sig" required>
                              </div>
                              <div class="adhar in">
                                    <label for="adhar"> Adhar Card</label>
                                    <input type="file" name="adhar" required>
                              </div>
                              <div class="cate in">
                                    <label for=""> Category</label>
                                    <select name="cat" id="" required>
<!--                                          <option value="" >Select</option>-->
                                          <option value="Driver" name="cat">Driver</option>
                                          <option value="Plumber" name="cat">Plumber</option>
                                          <option value="Mystri" name="cat">Mystri</option>
                                          <option value="Interior Designer"name="cat">Interior Designer</option>
                                          <option value="painter" name="painter">Painter</option>
                                    </select>
                              </div>
                               <button type="submit">Submit</button>
                        </form>
                  </div>
                  <div class="form-img">
                        <img src="https://img.freepik.com/free-vector/cartoon-character-filling-form-survey-checklist-man-writing-test-signing-business-medical-document-flat-illustration_74855-20483.jpg" alt="">
                  </div>
            </div>

           </div>
      
    </div>

<script>
        document.addEventListener("DOMContentLoaded", function() {
            const status = "<%= request.getAttribute("status") %>";
            if (status === "success") {
                Swal.fire({
                    icon: 'success',
                    title: 'Success',
                    text: 'Form submitted successfully!',
                }).then(() => {
                    window.location.href = 'index.jsp'; // Redirect or reload the page
                });
            } else if (status === "error") {
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: 'There was an issue submitting the form. Please try again.',
                });
            }
        });
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  </body>
</html>