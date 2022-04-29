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
<title>All voucher</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<link rel="stylesheet" href="${url }custom.css/breadcrumb.css">

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
	<main class="container-fluid" style="height: 700px">
		<div class="container main-content">
			<nav class="bcnav" aria-label="breadcrumb">
				<ol class="breadcrumb breadcrumb-custom">
					<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/" data-abc="true">Home</a></li>
					<li class="breadcrumb-item"><a href="#" data-abc="true">Customer</a></li>
					<li class="breadcrumb-item active" aria-current="page"><span>Vouchers</span></li>
				</ol>
			</nav>


			<!-- SIDEBAR STARTS -->
			<jsp:include page="../customer/account-sidebar.jsp"></jsp:include>
			<!-- SIDEBAR ENDS -->


			<!-- MAIN PANEL STARTS -->

			<!-- <div class="main-panel transparent"> -->
			<div class="main-panel">
				<h3>Choose a voucher</h3>
				<p>All vouchers will be offered to you on this page.</p>
				<hr>

				<div class="row">


					<c:forEach items="${vouchers}" var="vou">
						<div class="col-md-5 voucher-item">
							<img alt="voucher-img" src="${url}images/voucher-img.png">
							<div>
								<h5>${vou.discountPercentage}%offper order</h5>
								<p>Code: ${vou.voucherCode }ABCXYZ</p>
								<p>Expire date: ${vou.expireDate }</p>
								<a class="btn btn-primary" href="#">Use now</a>
							</div>
						</div>
					</c:forEach>

				</div>
			</div>




		</div>



		</div>
	</main>

	<!-- MAIN PANEL ENDS -->

	<!--  -->

	<jsp:include page="../customer/footer.jsp"></jsp:include>



















	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>



	<script type="text/javascript">
		$("#acc-voucher").addClass("active");
	</script>


</body>
</html>