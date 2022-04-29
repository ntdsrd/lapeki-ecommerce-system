<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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
<title>Checkout</title>
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
					<li class="breadcrumb-item"><a
						href="${pageContext.request.contextPath}/customer/cart"
						data-abc="true">Cart</a></li>

					<li class="breadcrumb-item active" aria-current="page"><span>Payment</span></li>

				</ol>
			</nav>



			<form action="${pageContext.request.contextPath}/customer/checkout"
				method="post">
				<div class="main-panel-left">


					<h4>1. Shipment - Lapeki express</h4>
					<hr>


					<table style="width: 100%;">

						<tr>
							<td style="width: 30%;">
								<div class="custom-control custom-radio">
									<input type="radio" id="ship1" name="ship" checked
										class="custom-control-input"><label
										class="custom-control-label" for="ship1">Standard
										shipment </label>
								</div>
							</td>

							<td style="width: 50%;">Package delivered within 7 days</td>
							<td style="width: 20%;">30.000 VND</td>

						</tr>
						<tr>
							<td style="width: 30%;">
								<div class="custom-control custom-radio">
									<input disabled type="radio" id="ship2" name="ship"
										class="custom-control-input"><label
										class="custom-control-label" for="ship2">Lapeki flash</label>
								</div>
							</td>

							<td style="width: 50%;">Package delivered within 2-3 days</td>
							<td style="width: 20%;">50.000 VND</td>

						</tr>

					</table>

					<div class="container-fluid dash-separator"></div>

					<h4>2. Payment method</h4>
					<hr>
					<div class="custom-control custom-radio">
						<input type="radio" id="COD" name="paymentMode" checked
							class="custom-control-input" value="COD"> <label
							class="custom-control-label label-img" for="COD"> <img
							src="${url }images/cod.png">COD - Cash on delivery
						</label>
					</div>
					<div class="custom-control custom-radio">
						<input type="radio" id="zalo-pay" name="paymentMode"
							class="custom-control-input" value="ZaloPay"> <label
							class="custom-control-label label-img" for="zalo-pay"> <img
							src="${url }images/zalopay.png"> ZaloPay
						</label>
					</div>

					<div class="custom-control custom-radio">
						<input type="radio" id="air-pay" name="paymentMode"
							class="custom-control-input" value="AirPay"> <label
							class="custom-control-label label-img" for="air-pay"> <img
							src="${url }images/airpay.jfif"> AirPay
						</label>
					</div>

					<div class="custom-control custom-radio">
						<input type="radio" id="momo" name="paymentMode"
							class="custom-control-input" value="MoMo"> <label
							class="custom-control-label label-img" for="momo"> <img
							src="${url }images/momo.jpg"> MoMo
						</label>
					</div>

					<div class="custom-control custom-radio">
						<input type="radio" id="pay-pal" name="paymentMode"
							class="custom-control-input" value="PayPal"> <label
							class="custom-control-label label-img" for="pay-pal"> <img
							src="${url }images/paypal.jfif"> Paypal
						</label>
					</div>
					<div class="container-fluid dash-separator"></div>
					<input class="btn btn-danger"
						style="font-size: 30px; font-weight: bold; margin: 20px 0;"
						type="submit" value="Place Order">

					<p>(Please review carefully before you place the order!)</p>








				</div>

				<aside class="side-bar-right" style="background-color: white;">
					<div class="container-fluid">
						<div class="heading-fluid-btn">
							<h5>Receiver address</h5>
							<a style="display: block;" class="btn btn-warning"
								href="${pageContext.request.contextPath}/customer/profile">Modify</a>
						</div>

						<hr>
						<p>
							<b>${account.fullname } | ${account.mobile }</b>
						</p>
						<p>Address: ${account.address }</p>
					</div>
					<div
						style="height: 4px; border: 1px rgba(0, 0, 0, .4) dashed; border-left: none; border-right: none;"></div>
					<div class="container-fluid"">
						<div class="heading-fluid-btn">
							<h5>Order detail</h5>
							<a data-toggle="collapse" href="#collapseExample" role="button"
								aria-expanded="false" aria-controls="collapseExample">Show
								items</a> <a style="display: block;" class="btn btn-warning"
								href="${pageContext.request.contextPath}/customer/cart">Modify</a>
						</div>

						<hr>
						<p></p>
						<div class="collapse" id="collapseExample">

							<table style="width: 100%;">
								<c:forEach items="${sessionScope.cart }" var="line">
									<tr>
										<td style="width: 5%">${ line.value.quantity}</td>
										<td style="width: 5%">x</td>
										<td style="width: 70%">${line.value.product.productName }</td>
										<td style="width: 20%; text-align: right;">${ line.value.quantity * line.value.unitPrice}</td>
									</tr>
								</c:forEach>

							</table>
							<hr>

						</div>

						<table id="total-table"
							style="width: 100%; text-align: right; float: right; margin-bottom: 30px">

							<tr>
								<td style="height: 30px;">Total:</td>
								<td><span id="total">${subtotal}</span> VND</td>
							</tr>
							<tr>
								<td style="height: 30px;">Shipping fee:</td>
								<td>30.000 VND</td>
							</tr>

							<tr>

								<td style="height: 30px;">Discount with voucher :</td>
								<td>
									<!--<fmt:formatNumber var="discount"
									value="${order.total / order.voucher.discountPercentage}"
									maxFractionDigits="0" />-${discount } VND  --> <span
									id="voucher"> <c:choose>
											<c:when test="${discount > 0 }">-${discount }</c:when>

											<c:otherwise>0</c:otherwise>
										</c:choose>

								</span> VND
								</td>
							</tr>


							<tr>
								<td style="height: 30px;"><b>Final total:</b></td>
								<td style="font-weight: bold;"><span id="final">${total + 30000}</span>
									VND</td>
							</tr>











						</table>
					</div>






				</aside>

				<input type="hidden" value=${voucherID } name="voucherID" /> <input
					type="hidden" value=${subtotal } name="subtotal" /> <input
					type="hidden" value=${discount } name="discount" />
					<input type="hidden" value=${total } name="total" />




			</form>
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

		const finalTotal = document.querySelector("#final");
		const a = parseInt(finalTotal.textContent);
		finalTotal.textContent = a.toLocaleString("vi-VN");

		const voucher = document.querySelector("#voucher");
		const b = parseInt(voucher.textContent);
		voucher.textContent = b.toLocaleString("vi-VN");

		const subTotal = document.querySelector("#total");
		const c = parseInt(subTotal.textContent);
		subTotal.textContent = c.toLocaleString("vi-VN");
	</script>



</body>
</html>