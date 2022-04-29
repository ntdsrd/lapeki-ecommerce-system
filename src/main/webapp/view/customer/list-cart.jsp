<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:url value="/view/customer/" var="url"></c:url>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="${url }images/favicon.png">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cart</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<link rel="stylesheet" href="${url }custom.css/cart.css">

</head>
<body>
	 <%
	 	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
	 	response.setHeader("Pragma", "no-cache"); //HTTP 1.0
	 %>
	<jsp:include page="../customer/header.jsp"></jsp:include>

	<div class="popup-voucher" id="popup">
		<div class="outer-background" style="z-index: 1050">
			<div class="menu-wrapper">
				<div class="menu-inner">
					<div class="header">
						<div class="title">Voucher List</div>
						<svg stroke="currentColor" fill="currentColor" stroke-width="0"
							viewBox="0 0 24 24" class="close" size="25" color="#999999"
							height="25" width="25" xmlns="http://www.w3.org/2000/svg"
							style="color: rgb(153, 153, 153);" onclick="closeVoucher()"
							id="close-menu">
						<path
								d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"></path>
						</svg>
					</div>
					<div class="body">
						<c:forEach items="${vouchers}" var="vou">
							<div class="row">
								<div class="col-voucher">
									<img alt="voucher-img" src="${url}images/voucher-img.png"
										style="height: 100px; width: 100px;">
									<div>
										<h5>${vou.discountPercentage}% off per order</h5>
										<p>Code: ${vou.voucherCode }</p>
										<p>Expire date: ${vou.expireDate }</p>

									</div>
									<button class="btn btn-primary" id="${vou.voucherID }" value="${vou.discountPercentage }"
										onclick="selectVoucher(this.value, this.id)">Use Now</button>
								</div>
							</div>
						</c:forEach>
								

					</div>
				</div>

			</div>
		</div>
	</div>

	<div class="container-cart">
		<div class="cart">
			<div class="cart-inner">
				<c:set var="count" value="${0}" />
				<c:forEach items="${sessionScope.cart}" var="map">
					<c:set var="count" value="${count + map.value.quantity}" />
				</c:forEach>
				<h2 class="cart-products__title">Your Cart <span style="text-transform: none">(${count } products)</span></h2>
				<c:choose>
					<c:when test="${count == 0 }">
						<div class="cart-products-inner">
							<div class="cart-products__group"
								style="text-align: center; padding: 40px 20px; border-radius: 4px">
								<img src="https://salt.tikicdn.com/desktop/img/mascot@2x.png"
									style="width: 100px; max-width: 100%;">
								<p style="margin: 15px 0px 30px;">Your cart is empty.</p>
								<a href="${pageContext.request.contextPath}/" class="contin-btn">Continue Shopping </a>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="cart-products-inner">
							<c:forEach items="${sessionScope.cart}" var="map">
								<div class="cart-products__group">
									<div class="cart-products__product">
										<div class="cart-products__inner">
											<div class="cart-products__img">
												<c:set var="imgs" value="${map.value.product.productImg}" />
												<c:set var="img" value="${fn:split(imgs,',')}" />
												<c:set var="ava" value="${img[0]}" />
												<a href="${pageContext.request.contextPath}/product/detail?id=${map.value.product.productID}"> <img src="${ava}" alt="">
												</a>
											</div>
											<div class="cart-products__content">
												<div class="cart-products__content--inner">
													<div class="cart-product-desc">
														<a class="cart-product-name"
															href="${pageContext.request.contextPath}/product/detail?id=${map.value.product.productID}">${map.value.product.productName }</a>
														<div class="cart-product-description">${map.value.product.productDesc }</div>

														<p class="cart-product-action">
															<a class="cart-product-del"
																href="${pageContext.request.contextPath}/customer/cart/remove?productID=${map.value.product.productID}">Delete</a>
														</p>
													</div>
													<div class="cart-product-details">
														<div class="cart-product-pricess">
															
															<div class="cart-product-realprice">
																${map.value.product.productPrice }</div> VND
														</div>
														<div class="cart-product-qty">
															<div class="qty-wrapper">
																<span class="qty-decrease" onclick="decreaseValue()">-</span>
																<input type="tel" class="qty-input" id="input-num"
																	value="${map.value.quantity }"> <span
																	class="qty-increase" onclick="increaseValue()">+</span>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>

						</div>
					</c:otherwise>
				</c:choose>
			</div>

			<div class="cart-total-prices">
				<div class="cart-total-prices__inner">

					<div class="voucher-choose">
						<div class="title-usage">
							<p class="voucher-title">Voucher</p>
							<p class="discount-percent">
								<ins id="dis-per" style="text-decoration: none">0</ins>
								% OFF
							</p>
						</div>
						<div class="more-voucher" onclick="moreVoucher()">
							<img
								src="https://frontend.tikicdn.com/_desktop-next/static/img/mycoupon/coupon_icon.svg" />
							<span>Choose a voucher</span>
						</div>
					</div>

					<form role="form" action="<c:url value='/customer/cart'/>"
						method="post" enctype="multipart/form-data">
						<div class="cart-price">
							<ul class="prices-item-list">
								<li class="prices-item"><span class="text">Subtotal</span>
									<c:set var="total" value="${0}" /> <c:forEach
										items="${sessionScope.cart}" var="map">
										<c:set var="total"
											value="${total + map.value.quantity * map.value.product.productPrice}" />
									</c:forEach> <span class="value"> <ins id="subtotal">${total }</ins> VND
										<input style="display: none" id="subtotal-input" value=""
										name="subtotal">
								</span></li>
								<li class="prices-item"><span class="text">Discount</span>
									<span class="value"> <ins id="discount">0</ins> VND<input
										style="display: none;" id="discount-input" value="0"
										name="discount">
								</span></li>
							</ul>
							<p class="prices-total">
								<span class="text">Total Amount</span> <span class="final-value">
									<ins id="total">${total }</ins> VND <input style="display: none;"
									value="" id="total-input" name="total"> <i>(VAT
										included)</i>
								</span>
							</p>
							<input style="display: none;" value="11111" id="voucher-input" name="voucherID">
						</div>

						<button class="cart-submit" type="submit">Checkout</button>
					</form>
				</div>
			</div>
		</div>

	</div>





	<!-- FOOTER -->
	<jsp:include page="../customer/footer.jsp"></jsp:include>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<script type="text/javascript">
		function increaseValue() {
			var value = parseInt(document.getElementById('input-num').value, 10);
			value = isNaN(value) ? 0 : value;
			value++;
			document.getElementById('input-num').value = value;
		}

		function decreaseValue() {
			var value = parseInt(document.getElementById('input-num').value, 10);
			value = isNaN(value) ? 0 : value;
			value < 2 ? value = 2 : '';
			value--;
			document.getElementById('input-num').value = value;
		}

		function moreVoucher() {
			document.getElementById('popup').style.display = "block";
		}

		function closeVoucher() {
			document.getElementById('popup').style.display = "none";
		}

		//case: do not use voucher
		const subtotalValue = parseInt(document.getElementById('subtotal').innerText)
		document.getElementById('subtotal-input').value = subtotalValue
		document.getElementById('total-input').value = subtotalValue

		console.log(document.getElementById('subtotal-input').value)
		console.log(document.getElementById('total-input').value)

		//case: use voucher
		function selectVoucher(discount, voucherID) {
			document.getElementById('dis-per').innerText = discount;
			closeVoucher();
			const subtotalValue = parseInt(document.getElementById('subtotal').innerText)
			const discountValue = (subtotalValue * discount) / 100
			document.getElementById('discount').innerText = "-" + discountValue
			document.getElementById('total').innerText = subtotalValue
					- discountValue

			document.getElementById('subtotal-input').value = subtotalValue
			document.getElementById('discount-input').value = discountValue
			document.getElementById('total-input').value = subtotalValue
					- discountValue
			document.getElementById('voucher-input').value = voucherID
					
			console.log(document.getElementById('subtotal-input').value)
			console.log(document.getElementById('discount-input').value)
			console.log(document.getElementById('total-input').value)
			console.log(document.getElementById('voucher-input').value)
		}
	</script>









	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>



</body>
</html>