<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@include file ="AdminHome.jsp" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@page isELIgnored="false" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<!-- Spring Form tag. -->
<!-- http://localhost:8080/E-commerce_frontend/saveproduct -->

 <h1>

    Add a Product
</h1>
<c:url var="addAction" value="/product/add" ></c:url>
<form:form action="${addAction}" commandName="product" modelAttribute="product"  enctype="multipart/form-data" method="post" >
<table>
    <c:if test="${!empty product.name}">
    
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
                  <spring:message text="Name"/>
            </form:label>
        </td>
        <td> <form:input path="name" /></td>
         
      
    </tr>
    <tr>
   
    <tr>
        <td>
            <form:label path="price">
                <spring:message text="price"/>
            </form:label>
        </td>
        <td>
            <form:input path="price" />
        </td>
        
    </tr>
    
   
    
   <tr>
   <td>
       <form:label path="specification">
                <spring:message text="specification"/>
            </form:label>
   </td>
   <td>
   <form:input path ="specification"/>
   </td>
   </tr>
    
     <tr>
        <td>
            <form:label path="highlights">
                <spring:message text="highlights"/>
            </form:label>
        </td>
        <td>
            <form:input path="highlights" />
        </td>
         
        
    <tr>
				<td><form:label path="category">
						<spring:message text="Category" />
					</form:label></td>
				<td><form:select path="category.categoryName" items="${categorys}"
						itemValue="categoryName" itemLabel="categoryName" /></td>
			</tr> 
 
     <tr>
				<td><form:label path="supplier">
						<spring:message text="supplier" />
					</form:label></td>
					<td><form:select path="supplier.name" items="${suppliers}"
					itemValue="name" itemLabel="name" />
					</td>
     </tr> 
        
       
    <tr>
        <td>
            <form:label path="image">
                <spring:message text="Photo to upload"/>
            </form:label>
        </td>
        <td>
            <form:input type="file" path="image" />
        </td></tr> 
    
       
 <%--   </tr>--%>
    <tr>
        <td colspan="2">
            <c:if test="${!empty product.name}">
                <input type="submit"
                    value="<spring:message text="Edit Product"/>" />
            </c:if>
            <c:if test="${empty product.name}">
                <input type="submit"
                    value="<spring:message text="Add Product"/>" />
         </c:if>
        </td>
    </tr>
    
</table>  
</form:form>
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
        
         
         <th width="140">Action</th>
          <th width="160">Action</th>
    </tr> </thead>
    <c:forEach items="${products}" var="product">
        <tr>
         
            <td>${product.name}</td>
            
            <td>${product.price}</td>
           <td><img src="<c:url value='/resources/${product.id}.jpg'/>" class="image-responsive" height="50" width="50"/></td>
           <td>${product.category.categoryName}</td>
					<td>${product.supplier.name}</td>
          
             
           <td><a href="<c:url value='/edit/${product.id}'/>" >Edit</a></td>
            <td><a href="<c:url value='/remove/${product.id}'/>" >Delete</a></td>
            
           
        </tr>
    </c:forEach>
    </table>
</c:if>
  
</body>
</html>

