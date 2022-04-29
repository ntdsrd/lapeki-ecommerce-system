<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:url value="/view/customer/" var="url"></c:url>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="${url }images/favicon.png">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register successfully</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<link rel="stylesheet" href="${url }custom.css/breadcrumb.css">



<link
	rel="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap4.min.css">

<link rel="stylesheet" href="${url }custom.css/style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">

</head>

<body>
	 <%
	 	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
	 	response.setHeader("Pragma", "no-cache"); //HTTP 1.0
	 %>


	<!-- HEADER START -->

	<jsp:include page="../customer/header.jsp"></jsp:include>
	<!-- HEADER ENDS -->

	<!-- MAIN STARTS -->
	<main class="container-fluid">

		<div class="container main-content" style="height: 500px; display: flex; justify-content: center; align-items: center; flex-direction: column;">
		
		<img alt="" src="${url }images/order-succeed.png" width="100px">
		<h4 style="margin: 20px;">Registration successfully
		</h4>
		
		<p>Please check your email</p>
		
		
		
		<p><a class="btn btn-primary" href="${pageContext.request.contextPath }/admin/user/list">Go to Login</a></p>
		
		<p><a class="btn btn-warning" href="${pageContext.request.contextPath }/">Go to Home page</a></p>
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