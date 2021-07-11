<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page isELIgnored="false" %>
    
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
       <%@include file="navbar.jsp" %>
       
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


              <br>
              <br>
              <br>
              <div class="container">
              <div class="row">
              <div class="col-md-4"></div>
              <div class="col-md-5"><h4><strong>ORDER DETAILS</strong></h4></div>
              <div class="col-md-3"></div>
              </div>
             
             
              <div class="row">
                     <div class="col-md-2"></div>
                     <div class="col-md-10">
                           <sf:form modelAttribute="cart" method="post">
 
 
                                  <table class="table table-striped">
                                   <table class="table table-bordered"> 
                                  
                                  <tr class="info">
                                    <thead>
                                                <tr>
                                              <th>ID</th>
                                     
                                               <th>Name</th>
                                              
                                               <th>Quantity</th>
                                                <th>Price</th>
                                               <th>Total Amount</th>
                                                      	
                                                </tr>
                                         </thead>
                                          <tbody>
                                          
                      
                                         
       <c:forEach items="${sessionScope.cart.listitem}" var="product">
       <c:set var="sum" value="${sum+ product.p.price * product.quantity}"></c:set>
                                 <tr>
                             <td>${product.p.id}</td>
                            <%--  <td>${product.p.productName}</td> --%>
                                     <td>${product.p.name}</td>
                             <td>${product.p.price}</td>
                             <td>${product.quantity}</td> 
                      <td>${product.p.price* product.quantity}</td>
                        <td><a class="btn btn-danger"
              href="<c:url value='${session.getContextPath()}/delete/${product.p.id}' />">
              Delete  <span class="glyphicon glyphicon-remove-sign"></span></a></td>
                              </tr>
                             
                            
                  </c:forEach>
                                        
      </tbody>
       <tr>
       <td></td>
       <td></td>
       <td></td>
       <td></td>
       <td></td>
       <td></td>
       <td></td>
      
      
       <td><b>Total Amount::</td>
       <td><b>${sum}</td>
       </table>
        </div>
        
                      
              <div class="row">
             <div class="col-md-4"></div>
             <div class="col-md-4"></div>
             <div class="col-md-4">
            
             <a href = "${session.getContextPath()}/CloudWaiters/thankyou/${prod.id}" input class="btn btn-info" name="_eventId_submit" type="submit"value="Next" /> Next</a>
             <!-- <input class="btn btn-info" name="_eventId_submit" type="submit"value="Next" /> -->
        </div>
         </div>
        
       <div class="container">
       <a href="http://localhost:8080/CloudWaiters/index"input class="btn btn-success" name="_eventId_submit" type="submit"value="BACK TO HOME" >BACK TO HOME</a>
        <!--  <button type="button" class="btn btn-success">BACK TO HOME</button> -->
                 
     
      </div>
      
       </sf:form>

 

                     </div>
                     </div>
</body>
</html>