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
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<link rel="stylesheet" href="${url }custom.css/landing.css">

</head>
<body style="background-color: rgb(244, 244, 244);">
	 <%
	 	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
	 	response.setHeader("Pragma", "no-cache"); //HTTP 1.0
	 %>
	<jsp:include page="../customer/header.jsp"></jsp:include>


	<div class="container">
		<div class="row">

			<div id="hero" class="carousel slide col-md-8" data-ride="carousel">
				<ul class="carousel-indicators">
					<li data-target="#hero" data-slide-to="0" class="active"></li>
					<li data-target="#hero" data-slide-to="1"></li>

				</ul>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="${url }images/2.jpg" alt="Los Angeles">

					</div>
					<div class="carousel-item">
						<img src="${url }images/3.jpg" alt="Chicago">

					</div>

				</div>
				<a class="carousel-control-prev" href="#hero" data-slide="prev">
					<span class="carousel-control-prev-icon"></span>
				</a> <a class="carousel-control-next" href="#hero" data-slide="next">
					<span class="carousel-control-next-icon"></span>
				</a>
			</div>

			<div id="hero-md-d4" class="col-md-4" style="padding-right: 0px">
				<img src="${url }images/hero-md-4.jpg" alt="">
			</div>
		</div>

	</div>

	<div class="body-container">
		<!-- Category Section -->
		<div class="category-sec">
			<div class="header">Featured Categories</div>
			<div class="body">
				<div class="cate-list-wrapper">
					<div class="cate-list-content">
						<div class="cate-list">
							<div class="cate-list-inner">
								<div class="cate-current">
									<div>
										<div class="page">
											<c:forEach items="${categories}" var="category">
												<a class="item"
													href="${pageContext.request.contextPath }/product/category?id=${category.categoryID}">
													<span class="text">${category.categoryName }</span>
												</a>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Trend Search Section -->
		<div class="trend-search-sec">
			<div class="header">
				<span class="header-name"> <img
					src="${url }images/search-icon.png"> Trend Search
				</span>
			</div>
			<div class="body">
				<a class="trend-search-item odd"
					href="${pageContext.request.contextPath }/product/search?pname=micellar+water">
					<div class="picture-group">
						<div style="width: 86px;">
							<div class="image-search">
								<img src="${url }images/miwa1.jpg" class="image-inner">
							</div>
						</div>
						<div style="width: 86px;">
							<div class="image-search">
								<img src="${url }images/miwa2.jpg" class="image-inner">
							</div>
						</div>
						<div style="width: 86px;">
							<div class="image-search">
								<img src="${url }images/miwa3.jpg" class="image-inner">
							</div>
						</div>

					</div>
					<div class="content">
						<span class="title">Micellar Water</span> <span class="subtitle">123
							products</span>
					</div>

				</a> <a class="trend-search-item even"
					href="${pageContext.request.contextPath }/product/search?pname=biti%27s+hunter">
					<div class="picture-group">
						<div style="width: 86px;">
							<div class="image-search">
								<img src="${url }images/bihu1.jpg" class="image-inner">
							</div>
						</div>
						<div style="width: 86px;">
							<div class="image-search">
								<img src="${url }images/bihu2.jpg" class="image-inner">
							</div>
						</div>
						<div style="width: 86px;">
							<div class="image-search">
								<img src="${url }images/bihu3.jpg" class="image-inner">
							</div>
						</div>

					</div>
					<div class="content">
						<span class="title">Biti's Hunter</span> <span class="subtitle">123
							products</span>
					</div>

				</a> <a class="trend-search-item odd"
					href="${pageContext.request.contextPath }/product/search?pname=sportslink">
					<div class="picture-group">
						<div style="width: 86px;">
							<div class="image-search">
								<img src="${url }images/spli1.jpg" class="image-inner">
							</div>
						</div>
						<div style="width: 86px;">
							<div class="image-search">
								<img src="${url }images/spli2.jpg" class="image-inner">
							</div>
						</div>
						<div style="width: 86px;">
							<div class="image-search">
								<img src="${url }images/spli3.jpg" class="image-inner">
							</div>
						</div>

					</div>
					<div class="content">
						<span class="title">Sportslink</span> <span class="subtitle">123
							products</span>
					</div>

				</a> <a class="trend-search-item even"
					href="${pageContext.request.contextPath }/product/search?pname=powder">
					<div class="picture-group">
						<div style="width: 86px;">
							<div class="image-search">
								<img src="${url }images/pow1.jpg" class="image-inner">
							</div>
						</div>
						<div style="width: 86px;">
							<div class="image-search">
								<img src="${url }images/pow2.jpg" class="image-inner">
							</div>
						</div>
						<div style="width: 86px;">
							<div class="image-search">
								<img src="${url }images/pow3.jpg" class="image-inner">
							</div>
						</div>

					</div>
					<div class="content">
						<span class="title">Powder</span> <span class="subtitle">123
							products</span>
					</div>

				</a>
			</div>

		</div>

		<!-- Product Section -->
		<c:forEach items="${categories }" var="category">
			<div class="product-sec">
				<div class="header">
					<span style="font-weight: 500; color: #D03737;">${category.categoryName}</span>
					<a class="seemore"
						href="${pageContext.request.contextPath }/product/category?id=${category.categoryID}">See
						more</a>
				</div>
				<div class="product-list-wrapper">
					<div class="content">
						<c:set var="count" value="${0}" />
						<c:forEach items="${products}" var="product">
							<c:if
								test="${product.category.categoryID == category.categoryID }">
								<c:set var="count" value="${count + 1}" />
								<c:if test="${count < 11}">
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
															<span class="p-price"> <ins ><span class="pr-price">${product.productPrice}</span> 
																	VND </ins>
															</span>

															<div style="color: #FBC52E; margin: 20px 0; font-size: 15px;">
																<i class="fas fa-star"></i> <i class="fas fa-star"></i>
																<i class="fas fa-star"></i> <i class="fas fa-star"></i>
																<i class="fas fa-star-half-alt"></i> 
															</div>
															<div class="atc-btn">
																<i class="fa fa-shopping-basket"></i> <em
																	style="margin-left: 7px">See more details</em>
															</div>

														</div>
													</div>
												</span>
											</div>

										</a>
									</div>
								</c:if>
							</c:if>
						</c:forEach>

					</div>
				</div>
			</div>
		</c:forEach>
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
		
		
		
		const prices = document.querySelectorAll(".pr-price");
		for (const x of prices){
			const b = parseInt(x.textContent);
			x.textContent = b.toLocaleString("vi-VN");
		}
		
		
	</script>

</body>
</html>