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
<title>Lapeki - Enjoy incredible online shopping.</title>

<link rel="stylesheet" href="${url }custom.css/cart.css">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">



<link rel="stylesheet" href="${url }custom.css/landing.css">

<style>
.nav-item.nav-link.active {
	font-weight: bold;
	color: #1C79D8;
}
</style>

</head>
<body style="background-color: rgb(244, 244, 244);">
	 <%
	 	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
	 	response.setHeader("Pragma", "no-cache"); //HTTP 1.0
	 %>
	<jsp:include page="../customer/header.jsp"></jsp:include>


	<div class="container"></div>

	<div class="body-container" sty>

		<div class="product-sec">
			<div class="header">
				<span style="font-weight: 500; color: #D03737;">${category.categoryName }
					| <span
					style="color: gray; text-transform: lowercase; font-weight: normal;">(${results.size() }
						products)</span>
				</span>

			</div>

			<nav>
				<div class="nav nav-tabs" id="nav-tab" role="tablist">
					<a class="nav-item nav-link active" id="nav-home-tab"
						data-toggle="tab" href="#nav-home" role="tab"
						aria-controls="nav-home" aria-selected="true">Common</a> <a
						class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab"
						href="#nav-profile" role="tab" aria-controls="nav-profile"
						aria-selected="false">Low price</a> <a class="nav-item nav-link"
						id="nav-contact-tab" data-toggle="tab" href="#nav-contact"
						role="tab" aria-controls="nav-contact" aria-selected="false">High
						price</a> <a class="nav-item nav-link" id="nav-az-tab"
						data-toggle="tab" href="#nav-az" role="tab" aria-controls="nav-az"
						aria-selected="false">A - Z</a> <a class="nav-item nav-link"
						id="nav-za-tab" data-toggle="tab" href="#nav-za" role="tab"
						aria-controls="nav-za" aria-selected="false">Z - A</a>
				</div>
			</nav>
			<div class="tab-content" id="nav-tabContent">
				<div class="tab-pane fade show active" id="nav-home" role="tabpanel"
					aria-labelledby="nav-home-tab">

					<div class="product-list-wrapper">
						<div class="content">
							<c:forEach items="${results}" var="product">
								<div>
									<a class="product-item"
										href="${pageContext.request.contextPath }/product/detail?id=${product.productID}">
										<div class="product-border">
											<span class="product-inner">
												<div>
													<div class="thumbnail">
														<c:set var="imgs" value="${product.productImg}" />
														<c:set var="img" value="${fn:split(imgs,',')}" />
														<c:set var="ava" value="${img[0]}" />
														<img src="${ava}" />
													</div>
													<div class="info">
														<div class="p-categories">
															<span>${product.category.categoryName }</span>
														</div>
														<div class="p-name">
															<h3>${product.productName }</h3>
														</div>
														<span class="p-price"> <ins>
																<span class="pr-price">${product.productPrice}</span>
																VND
															</ins>
														</span>

														<div
															style="color: #FBC52E; margin: 20px 0; font-size: 15px;">
															<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
																class="fas fa-star"></i> <i class="fas fa-star"></i> <i
																class="fas fa-star-half-alt"></i>
														</div>
														<div class="atc-btn">
															<i class="fa fa-shopping-basket"></i> <em style="margin-left: 7px">See more details</em>
														</div>
													</div>
												</div>
											</span>
										</div>
									</a>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="tab-pane fade" id="nav-profile" role="tabpanel"
					aria-labelledby="nav-profile-tab">

					<div class="product-list-wrapper">
						<div class="content">
							<c:forEach items="${lowPrice}" var="product">
								<div>
									<a class="product-item"
										href="${pageContext.request.contextPath }/product/detail?id=${product.productID}">
										<div class="product-border">
											<span class="product-inner">
												<div>
													<div class="thumbnail">
														<c:set var="imgs" value="${product.productImg}" />
														<c:set var="img" value="${fn:split(imgs,',')}" />
														<c:set var="ava" value="${img[0]}" />
														<img src="${ava}" />
													</div>
													<div class="info">
														<div class="p-categories">
															<span>${product.category.categoryName }</span>
														</div>
														<div class="p-name">
															<h3>${product.productName }</h3>
														</div>
														<span class="p-price"> <ins>
																<span class="pr-price">${product.productPrice}</span>
																VND
															</ins>
														</span>

														<div
															style="color: #FBC52E; margin: 20px 0; font-size: 15px;">
															<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
																class="fas fa-star"></i> <i class="fas fa-star"></i> <i
																class="fas fa-star-half-alt"></i>
														</div>
														<div class="atc-btn">
															<i class="fa fa-shopping-basket"></i> <em>Add To
																Cart</em>
														</div>
													</div>
												</div>
											</span>
										</div>
									</a>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="tab-pane fade" id="nav-contact" role="tabpanel"
					aria-labelledby="nav-contact-tab">
					<div class="product-list-wrapper">
						<div class="content">
							<c:forEach items="${highPrice}" var="product">
								<div>
									<a class="product-item"
										href="${pageContext.request.contextPath }/product/detail?id=${product.productID}">
										<div class="product-border">
											<span class="product-inner">
												<div>
													<div class="thumbnail">
														<c:set var="imgs" value="${product.productImg}" />
														<c:set var="img" value="${fn:split(imgs,',')}" />
														<c:set var="ava" value="${img[0]}" />
														<img src="${ava}" />
													</div>
													<div class="info">
														<div class="p-categories">
															<span>${product.category.categoryName }</span>
														</div>
														<div class="p-name">
															<h3>${product.productName }</h3>
														</div>
														<span class="p-price"> <ins>
																<span class="pr-price">${product.productPrice}</span>
																VND
															</ins>
														</span>

														<div
															style="color: #FBC52E; margin: 20px 0; font-size: 15px;">
															<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
																class="fas fa-star"></i> <i class="fas fa-star"></i> <i
																class="fas fa-star-half-alt"></i>
														</div>
														<div class="atc-btn">
															<i class="fa fa-shopping-basket"></i> <em>Add To
																Cart</em>
														</div>
													</div>
												</div>
											</span>
										</div>
									</a>
								</div>
							</c:forEach>
						</div>
					</div>



				</div>


				<div class="tab-pane fade" id="nav-az" role="tabpanel"
					aria-labelledby="nav-az-tab">
					<div class="product-list-wrapper">
						<div class="content">
							<c:forEach items="${az}" var="product">
								<div>
									<a class="product-item"
										href="${pageContext.request.contextPath }/product/detail?id=${product.productID}">
										<div class="product-border">
											<span class="product-inner">
												<div>
													<div class="thumbnail">
														<c:set var="imgs" value="${product.productImg}" />
														<c:set var="img" value="${fn:split(imgs,',')}" />
														<c:set var="ava" value="${img[0]}" />
														<img src="${ava}" />
													</div>
													<div class="info">
														<div class="p-categories">
															<span>${product.category.categoryName }</span>
														</div>
														<div class="p-name">
															<h3>${product.productName }</h3>
														</div>
														<span class="p-price"> <ins>
																<span class="pr-price">${product.productPrice}</span>
																VND
															</ins>
														</span>

														<div
															style="color: #FBC52E; margin: 20px 0; font-size: 15px;">
															<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
																class="fas fa-star"></i> <i class="fas fa-star"></i> <i
																class="fas fa-star-half-alt"></i>
														</div>
														<div class="atc-btn">
															<i class="fa fa-shopping-basket"></i> <em>Add To
																Cart</em>
														</div>
													</div>
												</div>
											</span>
										</div>

									</a>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>


				<div class="tab-pane fade" id="nav-za" role="tabpanel"
					aria-labelledby="nav-za-tab">
					<div class="product-list-wrapper">
						<div class="content">
							<c:forEach items="${za}" var="product">
								<div>
									<a class="product-item"
										href="${pageContext.request.contextPath }/product/detail?id=${product.productID}">
										<div class="product-border">
											<span class="product-inner">
												<div>
													<div class="thumbnail">
														<c:set var="imgs" value="${product.productImg}" />
														<c:set var="img" value="${fn:split(imgs,',')}" />
														<c:set var="ava" value="${img[0]}" />
														<img src="${ava}" />
													</div>
													<div class="info">
														<div class="p-categories">
															<span>${product.category.categoryName }</span>
														</div>
														<div class="p-name">
															<h3>${product.productName }</h3>
														</div>
														<span class="p-price"> <ins>
																<span class="pr-price">${product.productPrice}</span>
																VND
															</ins>
														</span>

														<div
															style="color: #FBC52E; margin: 20px 0; font-size: 15px;">
															<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
																class="fas fa-star"></i> <i class="fas fa-star"></i> <i
																class="fas fa-star-half-alt"></i>
														</div>
														<div class="atc-btn">
															<i class="fa fa-shopping-basket"></i> <em>Add To
																Cart</em>
														</div>
													</div>
												</div>
											</span>
										</div>

									</a>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>


			</div>

		</div>

	</div>

	<!-- FOOTER -->
	<jsp:include page="../customer/footer.jsp"></jsp:include>

	<a onclick="topFunction()" id="btnTop"> <i
		class="fas fa-chevron-up"></i>
	</a>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<script type="text/javascript">
	const prices = document.querySelectorAll(".pr-price");
	for (const x of prices){
		const b = parseInt(x.textContent);
		x.textContent = b.toLocaleString("vi-VN");
	}
		//Get the button
		var mybutton = document.querySelector("#btnTop");

		// When the user scrolls down 20px from the top of the document, show the button
		window.onscroll = function scrollFunction() {
			if (document.body.scrollTop > 20
					|| document.documentElement.scrollTop > 20) {
				mybutton.style.display = "block";
			} else {
				mybutton.style.display = "none";
			}
		}

		// When the user clicks on the button, scroll to the top of the document
		function topFunction() {
			document.body.scrollTop = 0;
			document.documentElement.scrollTop = 0;
		}
	</script>

</body>
</html>