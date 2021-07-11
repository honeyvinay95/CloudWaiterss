
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@page isELIgnored="false" %>

<%@include file ="AdminHome.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<!-- Spring Form tag. -->
<!-- http://localhost:8080/E-commerce_frontend/saveproduct -->

 <h1>

    Add Suppliers
</h1>

<c:url var="addsupplier" value="/newSupplier" ></c:url>
<form:form action="${addsupplier}" commandName="supplier" modelAttribute="supplier" method="post" >
<table>
    <c:if test="${!empty supplier.name}">
    
    <tr>
        <td>
            <form:label path="id">
                <spring:message text="ID"/>
            </form:label>
        </td>
        <td>
            <form:input path="id" readonly="true" size="8"  disabled="true" />
            <form:hidden path="id" />
        </td> 
    </tr>
    </c:if> 
     <tr>
        <td>
            <form:label path="name">
                  <spring:message text="name"/>
            </form:label>
        </td>
        <td> <form:input path="name" /></td>
         
      
    </tr>
  
    <tr>
        <td>
            <form:label path="address">
                <spring:message text="address"/>
            </form:label>
        </td>
        <td>
            <form:input path="address" />
        </td>
       
    </tr>
      
 <%--   </tr>--%>
    <tr>
        <td colspan="2">
            <c:if test="${!empty supplier.name}">
                <input type="submit"
                    value="<spring:message text="Edit Supplier"/>" />
            </c:if>
            <c:if test="${empty supplier.name}">
                <input type="submit"
                    value="<spring:message text="Add Supplier"/>" />
         </c:if>
        </td>
    </tr>
    
</table>  
</form:form>
<h3>List of Suppliers</h3>

<c:if test="${not empty suppliers}">
    <table class="table table-bordered">
    <tr>
        <th width="160">Name</th>
      
        <th width="180">address</th>
       <th width="200">Edit</th>
       <th width="220">Delete</th>
    </tr>
    <c:forEach items="${suppliers}" var="supplier">
        <tr>
         
            <td>${supplier.name}</td>
          
       
             <td>${supplier.address}</td>
       
           <td><a href="<c:url value='/editSupplier/${supplier.id}'/>" >Edit</a></td>
            <td><a href="<c:url value='/deleteSupplier/${supplier.id}'/>" >Delete</a></td>
            </td>
        </tr>
    </c:forEach>
    </table>
</c:if>
  
</body>
</html>
 