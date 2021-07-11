
 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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

    Add Category
</h1>

<c:url var="addcategory" value="/newCategory" ></c:url>
<form:form action="${addcategory}" commandName="category" modelAttribute="category"   method="post" >
<table>
    <c:if test="${!empty category.categoryName}">
    
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
            <form:label path="categoryName">
                  <spring:message text="name"/>
            </form:label>
        </td>
        <td> <form:input path="categoryName" /></td>
         
      
    </tr>
  
    
   
    
   
    
    <tr>
        <td>
            <form:label path="description">
                <spring:message text="description"/>
            </form:label>
        </td>
        <td>
            <form:input path="description" />
        </td>
       
    </tr>
  
   
    
    
    
     
       
 <%--   </tr>--%>
    <tr>
        <td colspan="2">
            <c:if test="${!empty category.categoryName}">
                <input type="submit"
                    value="<spring:message text="Edit Category"/>" />
            </c:if>
            <c:if test="${empty category.categoryName}">
                <input type="submit"
                    value="<spring:message text="Add Category"/>" />
         </c:if>
        </td>
    </tr>
    
</table>  
</form:form>
<h3>List of Category</h3>

<c:if test="${not empty categorys}">
    <table class="table table-bordered">
    <tr>
        <th width="160">Name</th>
      
        <th width="180">Description</th>
       <th width="200">Edit</th>
       <th width="220">Delete</th>
    </tr>
    <c:forEach items="${categorys}" var="category">
        <tr>
         
            <td>${category.categoryName}</td>
          
       
             <td>${category.description}</td>
       
           <td><a href="<c:url value='/editCategory/${category.id}'/>" >Edit</a></td>
            <td><a href="<c:url value='/deleteCategory/${category.id}'/>" >Delete</a></td>
            
        </tr>
    </c:forEach>
    </table>
</c:if>
  
</body>
</html>
