<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:url value="/view/customer/" var="url"></c:url>

<!DOCTYPE html>
<html>
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
	<main class="container-fluid">


		<div class="container main-content">
			<nav class="bcnav" aria-label="breadcrumb">
				<ol class="breadcrumb breadcrumb-custom">
					<li class="breadcrumb-item"><a
						href="${pageContext.request.contextPath}/" data-abc="true">Home</a></li>
					<li class="breadcrumb-item"><a href="#" data-abc="true">Customer</a></li>
					<li class="breadcrumb-item"><a href="#" data-abc="true">Orders</a></li>
					<li class="breadcrumb-item active" aria-current="page"><span>Detail</span></li>

				</ol>
			</nav>

			<!-- SIDEBAR STARTS -->
			<jsp:include page="../customer/account-sidebar.jsp"></jsp:include>
			<!-- SIDEBAR ENDS -->


			<!-- MAIN PANEL STARTS -->

			<div class="main-panel">
				<h3>Order detail</h3>
				<p>
					Order id: #${order.cartID} - <b>${order.status}</b><br> Order
					date: ${order.orderDate }
				</p>

				<hr>

				<div class="container-fluid dash-separator"></div>

				<div class="container-fluid">

					<div class="row flex-row">
						<div class="col-sm-3 detail-box">
							<h6>Receiver address</h6>
							<p>
								<b>${order.user.fullname }</b> <br> Address:
								${order.user.address } </br> Phone number: ${order.user.mobile }
							</p>

						</div>

						<div class="col-sm-3 detail-box">
							<h6>Shipment Method</h6>
							<p>
								<b>Lapeki express</b> <br> Standard shipment - You will
								receive the package within 7 days.
							</p>

						</div>

						<div class="col-sm-3 detail-box">
							<h6>Payment method</h6>
							<p>
								Pay through: <b>${order.paymentMode } </b><br> <em><c:if
										test="${order.paymentMode  != 'COD'}">
							Successfully Paid
							</c:if> <c:if test="${order.paymentMode  == 'COD'}">
							Please prepare cash beforehand!
							</c:if> </em>
							</p>
						</div>
					</div>

				</div>

				<div class="container-fluid dash-separator"></div>







				<table id="order-table"
					class="table table-striped table-hover table-shopping"
					style="width: 100%; margin-top: 20px;">

					<thead>
						<th colspan="2" style="width: 60%">Product</th>
						<th style="width: 10%">Price</th>
						<th style="width: 10%">Quantity</th>
						<!--  <th  style="width: 10%">Discount</th>-->
						<th style="width: 15%">Subtotal</th>
					</thead>

					<tbody>
						<c:forEach items="${items}" var="item">
							<tr>

								<c:set var="imgs" value="${item.product.productImg}" />
								<c:set var="img" value="${fn:split(imgs,',')}" />
								<c:set var="ava" value="${img[0]}" />
								
								<td style="width: 10%"><img height="100" src="${ava}" /></td>
								<td style="width: 50%"><a
									href="${pageContext.request.contextPath}/product/detail?id=${item.product.productID}">${item.product.productName }</a>
								</td>
								<td style="width: 10%">${item.product.productPrice}</td>
								<td style="width: 10%">${item.quantity }</td>
								<!--  <th  style="width: 10%">Discount</th>-->
								<td class="subtotal" style="width: 15%"><c:out
										value="${item.product.productPrice * item.quantity}"></c:out></td>


							</tr>
						</c:forEach>



					</tbody>

				</table>

				<div class="conainer-fluid"
					style="display: flex; justify-content: flex-end;">

					<table id="total-table" style="width: 50%; text-align: right;">

						<tr>
							<td style="height: 30px;">Total:</td>
							<td id="total"></td>
						</tr>
						<tr>
							<td style="height: 30px;">Shipping fee:</td>
							<td>30.000 VND</td>
						</tr>

						<tr>
							<td style="height: 30px;">Discount with voucher:</td>
							<td id="voucher">
								<!--<fmt:formatNumber var="discount"
									value="${order.total / order.voucher.discountPercentage}"
									maxFractionDigits="0" />-${discount } VND --> <c:if
									test="${order.voucher != null }">${order.voucher.discountPercentage }</c:if>
								<c:if test="${order.voucher == null }">0</c:if>
							</td>
						</tr>


						<tr>
							<td style="height: 30px;"><b>Final total:</b></td>
							<td id="final">${order.total}VND</td>
						</tr>











					</table>


				</div>

				<c:if test="${order.status == 'Pending' }">
					<div class="conainer-fluid"
						style="display: flex; justify-content: flex-end;">


						<a class="btn btn-danger"
							href="${pageContext.request.contextPath}/customer/order/cancel?id=${order.cartID}">Cancel
							this order </a>
					</div>

				</c:if>


			</div>



		</div>
	</main>

	<!-- MAIN PANEL ENDS -->

	<!--  -->




















	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>



	<script type="text/javascript">
		$("#acc-order").addClass("active");

		const subtotal = document.querySelectorAll(".subtotal");
		let total = 0;
		
		for (const x of subtotal){
			console.log(x.textContent);
			total += parseInt(x.textContent);
		}
		console.log(total);
		const totalText = document.querySelector("#total");
		totalText.textContent = total.toLocaleString("vi-VN") +" VND";
		
		const voucher = document.querySelector("#voucher");
		const voucherNum = parseInt(voucher.textContent);
		const discount = Math.floor(total * voucherNum / 100);
		voucher.textContent = "-" + discount.toLocaleString("vi-VN") + " VND";
		
		const finalTotal = document.querySelector("#final");
		finalTotal.textContent = (total + 30000 - discount).toLocaleString("vi-VN") + " VND";
		
		</script>



</body>
</html>