<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:url value="/view/customer/" var="url"></c:url>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="${url }images/favicon.png">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Oops! Order not found</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<link rel="stylesheet" href="${url }custom.css/breadcrumb.css">

<link rel="stylesheet" href="${url }custom.css/landing.css">

<link
	rel="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap4.min.css">

<link rel="stylesheet" href="${url }custom.css/style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">

</head>

<body>



	<!-- HEADER START -->
	<jsp:include page="../customer/header.jsp"></jsp:include>
	<!-- HEADER ENDS -->

	<!-- MAIN STARTS -->
	<main class="container-fluid" >


		<div class="container main-content">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb breadcrumb-custom">
					<li class="breadcrumb-item"><a href="#" data-abc="true">Home</a></li>
					<li class="breadcrumb-item"><a href="#" data-abc="true">Customer</a></li>
					<li class="breadcrumb-item"><a href="#" data-abc="true">Orders</a></li>
					<li class="breadcrumb-item active" aria-current="page"><span>Detail</span></li>

				</ol>
			</nav>

			<!-- SIDEBAR STARTS -->
			<jsp:include page="../customer/account-sidebar.jsp"></jsp:include>
			<!-- SIDEBAR ENDS -->


			<!-- MAIN PANEL STARTS -->

			<div class="main-panel not-found">
			
				<img alt="404" width="200px" src="${url}images/ic_404.png"> 
				
				<div><h5>404</h5>
				Order not found!
				</div>
				
				<a class="btn btn-warning" href="${pageContext.request.contextPath }/">Continue shopping</a>

			</div>



		</div>
	</main>

	<!-- MAIN PANEL ENDS -->

	<!--  -->

	<footer></footer>



















	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


	
	<script type="text/javascript">
		$("#acc-order").addClass("active");

		
		
	</script>



</body>
</html>