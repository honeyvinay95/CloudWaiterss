<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@include file = "navbar.jsp" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>editProduct</title>
</head>
<%@ include file="AdminHome.jsp" %>
<br><br><br><br><br><br><br><br><br><br><br><br>
<body>

 <%-- <c:url value ="/admin/product/editproduct" var="urL"></c:url>
<form:form  action ="${url }"  modelAttribute ="productObj">
 --%>
 
 <form:form action="editProduct/${editP.id}" method="POST" commandName="editP">
 
<div class="form-group">
Product Id
<form:hidden path="id" class="form-control"/> 

</div>

<div class="form-group">
Enter Product Name 
<form:input path ="productName" class="form-control"/>
</div>
<br>

<div class="form-group">
Enter Product Description 
<form:input path = "decription" class="form-control"/>
</div>
<br>

<div class="form-group">
Enter Price 
 <form:input path= "price" class="form-control"/>
 </div>
  <br>
  
  <div class="form-group">
Enter Quantity 
<form:input path ="quantity" class="form-control"/>
</div>
<br>
<div class="form-group">
    Enter Description
<form:textarea path ="description" class="form-control"/>
</div>
<br>
 <div class="form-group">
Select Category
<c:forEach items="${categories }" var="c"> 
<form:radiobutton path="category.id" value="${c.id }"/>${c.categoryName}
</c:forEach>
</div>

<div class="form-group">
Supplier:
<form:select path="supplier.name" items ="${suppliers}" 
itemValue ="name" itemLabel ="name" value ="${editP.supplier}">
</form:select>
</div>

<div class="form-group">
<input type="submit" value="Edit Product"class="btn btn-success"/>
</div>
</form:form>

</body>

</html> 