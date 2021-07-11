<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored ="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>editCategory</title>

</head>
<body>
<%@ include file="AdminHome.jsp" %>
<br><br><br><br><br><br><br>
<div>
	<form:form action="editCategory/${editP.id}" method="POST" commandName="editP">
		<table>
			<tr>
				<td>Category ID :</td>
				<td><input type="text" name="id" value="${editP.id}" disabled="disabled"/></td>
			</tr>
			<tr>
				<td>Category Name :</td>
				<td><input type="text" name="categoryName" value="${editP.categoryName}" /></td>
			</tr>
			<tr>
				<td>Category Description :</td>
				<td><input type="text" name="description" value="${editP.description }"/></td>
		</tr>
		
           <tr>
				<td></td>
		<td><input type="submit" href ="categoryTable"value="Edit Category" class="btn btn-success"/></td>
			</tr>
			
		</table>
	</form:form>
	
	</div>
	

</body>
<br><br>
	<br><br><br><br><br>
	<br>
</html>