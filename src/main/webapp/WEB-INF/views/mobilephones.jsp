<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@include file ="navbar.jsp" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


  <style>
.btn {
    border: none;
    color: white;
    padding: 12px 20px;
    font-size: 13px;
    cursor: pointer;
}



.back {background-color: #4CAF50;} 
.back:hover {background: #da190b;}


</style>
</head>
<body>
<a href="http://localhost:8080/CloudWaiters/"><button class="btn back pull-right">BACK</button></a>



</body>
       



</head>
<body>
<h3>List of Products</h3>

<c:if test="${not empty products}">
  <table class="table">
  <thead class="thead-inverse">
    <tr>
        <th width="160">Name</th>
      
        <th width="80">price</th>
         <th width="120">image</th>
          <th width="80">categoryname</th>
          <th width="80">suppliername</th>  
        
         
        
    </tr> </thead>
    <c:forEach items="${products}" var="product">
        <tr>
         
            <td>${product.name}</td>
            
            <td>${product.price}</td>
           <td><img src="<c:url value='/resources/${product.id}.jpg'/>" class="image-responsive" height="50" width="50"/></td>
           <td>${product.category.categoryName}</td>
					<td>${product.supplier.name}</td> 
          
              </c:forEach>
            
              </c:if>
   
</body>
</html>