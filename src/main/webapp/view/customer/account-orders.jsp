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
<title>Your orders</title>
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
	<main class="container-fluid" style="height: 700px">


		<div class="container main-content">
			<nav class="bcnav" aria-label="breadcrumb">
				<ol class="breadcrumb breadcrumb-custom">
					<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/" data-abc="true">Home</a></li>
					<li class="breadcrumb-item"><a href="#" data-abc="true">Customer</a></li>
					<li class="breadcrumb-item active" aria-current="page"><span>Orders</span></li>
				</ol>
			</nav>

			<!-- SIDEBAR STARTS -->
			<jsp:include page="../customer/account-sidebar.jsp"></jsp:include>
			<!-- SIDEBAR ENDS -->


			<!-- MAIN PANEL STARTS -->
			<c:if test="${orders.size() !=0 }">
				<div class="main-panel">
					<h3>My orders</h3>
					<p>Track your orders here</p>
					<hr>
					<table id="order-table"
						class="table table-striped table-hover table-shopping"
						style="width: 100%">
						<thead>
							<th style="width: 10%">Order ID</th>
							<th style="width: 20%">Order Date</th>
							<th>Products</th>
							<th style="width: 20%">Total (VND)</th>
							<th style="width: 15%">Status</th>
						</thead>
						<tbody>
							<c:forEach items="${orders}" var="order">
								<tr>
									<td style="width: 10%"><a
										href="${pageContext.request.contextPath }/customer/order/detail?id=${order.cartID}">${order.cartID }</a></td>
									<td style="width: 20%">${order.orderDate}</td>
									<td></td>
									<td style="width: 20%">${order.total }</td>
									<td style="width: 15%">${order.status}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</c:if>
			<c:if test="${orders.size() == 0 }">
				<div class="main-panel not-found">

					<img alt="404" width="200px" src="${url}images/ic_404.png">

					<div>
						<h5>404</h5>
						You have no orders!
					</div>

					<a class="btn btn-warning"
						href="${pageContext.request.contextPath }/">Continue shopping</a>

				</div>
			</c:if>



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


	<script
		src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap4.min.js"></script>

	<script type="text/javascript">
		$("#acc-order").addClass("active");

		$(document).ready(function() {
			$('#order-table').DataTable({
				"ordering" : false,

			});
		});
	</script>



</body>
</html>