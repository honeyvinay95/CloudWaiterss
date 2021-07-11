<!DOCTYPE html>
<html>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<head>
<style>
input[type=text], select, textarea {
    width: 100%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    margin-top: 6px;
    margin-bottom: 16px;
    resize: vertical;
}

input[type=submit] {
    background-color: #4CAF50;
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type=submit]:hover {
    background-color: #45a049;
}

.container {
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 20px;
}
</style>
</head>
<%@include file="navbar.jsp" %>
<body>



<div class="container">
  <form:form action="savecontact" method="post" commandName="contact">
    <label for="fname">First Name</label>
    <input type="text" id="name" name="name" placeholder="Your name..">
                      <label for="Email">Email</label>
                     <input type="text" class="form-control" name="email" id="email"  placeholder="Enter your Email"/>
                    

   
  

    <label for="description">description</label>
    <textarea id="description" name="description" placeholder="Write something.." style="height:200px"></textarea>

    <input type="submit" value="Submit">
  </form:form>
</div>

</body>
</html>
