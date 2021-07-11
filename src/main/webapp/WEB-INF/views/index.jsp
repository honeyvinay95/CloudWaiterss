<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@page isELIgnored="false" %>
<!DOCTYPE htnl>
<html lang="en">
<head>
<title>cloud waiters</title>
<meta name="viewport"content="vidth=device-vidth,initial-scale=1">
<meta charset="utf-8">
<link href="http://maxcdn.bootstrapcdn.com/frount-avesome/4.7.0/css/front-avesome">
<link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <jsp:include page="navbar.jsp"></jsp:include>
  
<style>
footer {
background-colour:#b49d9d;
padding 25px;
}
.carousel-inner img{
width:100%;/*set width to 100%*/
min-height:300px;
max-height:220px;
}
body
{
background-image:url("");

}
</style>
</head>
<body>
<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Carousel indicators -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
        <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>   
    <!-- Wrapper for carousel items -->
    <div class="carousel-inner">
        <div class="item active">
        <img src="resources/img.jpg" alt="First Slide">
        </div>
       
        <div class="item">
            <img src="resources/vivo.jpg" alt="First Slide">
        </div>
        <div class="item">
            <img src="resources/vivo.jpg" alt="Secound Slide">
        </div>
        <div class="item">
            <img src="resources/mobiles.png" alt="Third Slide">
        </div>
        <div class="item">
            <img src="resources/mobiles.png" alt="fourth Slide">
        </div>
        
    
    <!-- Carousel controls -->
    <a class="carousel-control left" href="#myCarousel" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left"></span>
    </a>
    <a class="carousel-control right" href="#myCarousel" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right"></span>
    </a>
  <!--   <footer class="container-fluid text-center"> -->


	<br/><br/><br/><br/></div>
	
<c:forEach var="prod" items="${listProduct}">
<td><%-- <c:if test="${prod.category.categoryName =='Mobile phone'}"> --%><a href="showproduct/${prod.id}">
<div class="col-md-4">
<img src = "<c:url value ='/resources/${prod.id}.jpg'/>" height="200" width="200"/></a><br>
<c:url var="action" value="/product1"></c:url>

<form:form action="${action}" modelAttribute="cart">
<td id="td1"><i>Product name is <br/><c:out value="${prod.name}" /><br/>
<td id="td1"><i>product price is RS. <c:out value="${prod.price}" /><br/><br/>
<!-- <input type="submit" class="btn btn-primary" value="Add To Cart" /> -->
</form:form></td>
</div>
<%-- <a href="<c:url value='/viewDetails?id=${prod.id}' />" class ="btn btn-success" >View</a> --%><%-- </c:if> --%></td>


</c:forEach>

<!-- </footer> -->
    
    


  <jsp:include page="footer.jsp"></jsp:include>

<%--  <jsp:include page="contact us.jsp"></jsp:include>
 --%>

</body>
</html>