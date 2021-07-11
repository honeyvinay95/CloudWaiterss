<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="AdminHome.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>editSupplier</title>
</head>
<body>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<div>
	<form:form action="editSupplier/${editP.id}" method="POST" commandName="editP">
		<table>
			<tr>
				<td>Supplier ID :</td>
				<td><input type="text" name="id" value="${editP.id}" disabled="disabled"/></td>
			</tr>
			<tr>
				<td>Supplier Name :</td>
				<td><input type="text" name="name" value="${editP.name}" /></td>
			</tr>
			<tr>
				<td>Supplier Address :</td>
				<td><input type="text" name="address" value="${editP.address }"/></td>
			</tr>
			
			<tr>
				<td></td>
				<td><input type="submit" value="Edit Supplier"class="btn btn-success"/></td>
			</tr>
		</table>
	</form:form>
	
	</div>
	<br><br>
	<br><br><br><br><br>
	<br>
</body>
</html>