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
<title>Detail</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="${url }custom.css/breadcrumb.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<link rel="stylesheet" href="${url }custom.css/landing.css">


<style type="text/css">
.pr-detail-icon {

	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 16px;
	width: 40px;
	height: 40px;
	border-radius: 25px;
	box-shadow: rgb(47 83 151/ 20%) 0px 2px 6px 0px;
}

.icon-container {
	display: flex;
	align-items: center;
	justify-content: space-between;
}

#price-container {
	padding: 20px;
	background-color: rgba(0, 0, 0, .04);
	border-radius: 10px;
}

.btn-add-to-cart {
	margin-top: 20px;
	color: rgb(255, 255, 255);
	background-color: rgb(255, 57, 69);
	cursor: pointer;
	display: block;
	-webkit-box-align: center;
	align-items: center;
	-webkit-box-pack: center;
	justify-content: center;
	min-width: 190px;
	width: 100%;
	max-width: 300px;
	height: 48px;
	font-size: 15px;
	line-height: 24px;
	font-weight: 500;
	text-transform: capitalize;
	border: none;
	border-radius: 4px;
	outline: none;
}

.little-img {
	margin-right: 10px;
	padding: 10px;
	transition: box-shadow .5s;
}

.little-img:hover {
	box-shadow: rgb(47 83 151/ 40%) 0px 2px 6px 0px;
}

.little-img.active {
	box-shadow: rgb(47 83 151/ 60%) 0px 2px 6px 0px;
}


</style>
</head>
<body style="background-color: rgb(244, 244, 244);">
	 <%
	 	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
	 	response.setHeader("Pragma", "no-cache"); //HTTP 1.0
	 %>
	<jsp:include page="../customer/header.jsp"></jsp:include>




	<div class="body-container">
		<nav class="bcnav" aria-label="breadcrumb" style="margin-top: 20px;">
			<ol class="breadcrumb breadcrumb-custom">
				<li class="breadcrumb-item"><a
					href="${pageContext.request.contextPath}/" data-abc="true">Home</a></li>
				<li class="breadcrumb-item"><a
					href="${pageContext.request.contextPath }/product/category?id=${product.category.categoryID}"
					data-abc="true">${product.category.categoryName }</a></li>

				<li class="breadcrumb-item active" aria-current="page"><span>${product.productName }</span></li>

			</ol>
		</nav>








		<div class="product-sec">

			<div class="row">
				<div class="col-md-5"
					style="padding: 20px; border-right: 1px rgba(0, 0, 0, .1) solid;">


					<c:set var="imgstr" value="${product.productImg}" />
					<c:set var="imgs" value="${fn:split(imgstr,',')}" />
					<c:set var="ava" value="${imgs[0]}" />

					<div class="row" style="display: flex; justify-content: center;">

						<img id="big-img" height="400px" src="${ava}" />
					</div>

					<div class="row" id=" lil-img-container">
						<c:set var="c" value="${0}" />
						<c:forEach items="${ imgs}" var="img">

							<c:set var="count" value="${count + 1}" />
							<c:if test="${c < 7}">
								<div class="col-md-2 little-img" style="padding: 5px;">
									<img class="" src="${img}" />
								</div>
							</c:if>



						</c:forEach>



					</div>

				</div>

				<div class="col-md-7" style="padding: 20px;">
					<div class="row" style="margin: 0;">
						<div class="col-md-10">
							<img height="35px" style="display: inline-block;" alt=""
								src="${url }images/name-img.png">
							<div style="font-size: 25px">${product.productName }</div>

							<div style="color: #FBC52E; margin: 10px 0;">
								<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
									class="fas fa-star"></i> <i class="fas fa-star"></i> <i
									class="fas fa-star-half-alt"></i> <span
									style="color: rgba(0, 0, 0, .4)">| (4.5/5.0)</span>
							</div>
						</div>
						<div class="col-md-2 icon-container">

							<div class="pr-detail-icon">
								<i class="far fa-heart"></i>
							</div>
							<div class="pr-detail-icon">
								<i class="fas fa-share-alt"></i>
							</div>
						</div>
					</div>

					<div class="row" style="margin: 0;">

						<div class="col-md-8">

							<div id="price-container">
								<h6>Discount applied</h6>
								<span id="price" style="font-size: 30px; font-weight: bold;">
									${product.productPrice }</span> VND <br> <img height="25px"
									alt="" src="${url }images/lamember.png"> <span
									style="font-size: 14px;">Register now for more super
									duper hot deals </span>
							</div>
							<form name="f1" class="product-quantity sm-margin-bottom-20"
								method="get" action="<c:url value="/customer/cart/add"></c:url>">
								<input type="hidden" value="${product.productID }"
									name="productID">
								<div style="width: 50%; margin: 20px 0;">
									<input style="width: 100px;" type="number" min="1"
										name="quantity" value=1 required="required">

									<button type="submit" class="btn-add-to-cart">Add to
										Cart</button>
								</div>
							</form>
						</div>

						<div class="col-md-4"
							style="border: 1px rgba(0, 0, 0, .1) solid; border-radius: 10px; padding: 10px;">
							<span
								style="color: #0C1248; display: inline-block; margin: 0 10px;"><i
								class="fas fa-store"></i></span> <span
								style="color: #D03737; font-weight: bold;">Lapeki
								Ecommerce</span>

							<hr>


							<div style="padding: 10px; font-size: 14px;">
								<span style="color: green;"><i class="fas fa-award"></i></span>
								Authenication commitment
							</div>
							<div style="padding: 10px; font-size: 14px;">
								<span style="color: green;"><i
									class="fas fa-check-circle"></i></span> Package check on delivery
							</div>

							<div style="padding: 10px; font-size: 14px;">
								<span style="color: green;"><i class="fas fa-sync-alt"></i></span>
								Return within 7 days
							</div>



						</div>



					</div>









				</div>




			</div>


		</div>







		<div class="product-sec">
			<div class="header">
				<span style="font-weight: 500; color: #D03737;">Products you
					may like</span> <a class="seemore"
					href="${pageContext.request.contextPath }/product/category?id=${product.category.categoryID}">See
					more</a>
			</div>
			<div class="product-list-wrapper">
				<div class="content">
					<c:set var="count" value="${0}" />
					<c:forEach items="${relatedProducts}" var="pr">
						<c:set var="count" value="${count + 1}" />
						<c:if test="${count < 11}">

							<c:if test="${product.productID != pr.productID}">
								<div>
									<a class="product-item"
										href="${pageContext.request.contextPath }/product/detail?id=${pr.productID}">
										<div class="product-border">
											<span class="product-inner">
												<div>
													<div class="thumbnail">
														<c:set var="imgs" value="${pr.productImg}" />
														<c:set var="img" value="${fn:split(imgs,',')}" />
														<c:set var="ava" value="${img[0]}" />
														<img src="${ava}" />
													</div>
													<div class="info">
														<div class="p-categories">
															<span>${pr.category.categoryName }</span>
														</div>
														<div class="p-name">
															<h3>${pr.productName }</h3>
														</div>
														<span class="p-price"> <ins>
																<span class="pr-price">${pr.productPrice}</span>
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

		<div class="product-sec" style="width: 700px;">
			<div class="header">
				<span style="font-weight: 500; color: #D03737;">Description</span>
			</div>
			<div class="product-list-wrapper" style="padding: 20px;">
				<div  id="collapseExample">
					<div class="card card-body">${product.productDesc}</div>
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



	<script src="${url }/js/input-spinner.js"></script>
	<script type="text/javascript">
    $("input[type='number']").inputSpinner()
</script>

	<script type="text/javascript">

	
	
	const bigImg = document.querySelector("#big-img");
	console.log(bigImg.src);

	const smallImg = document.querySelectorAll(".little-img");
	smallImg[0].classList.add("active");

	for (const aa of smallImg) {
		
		const img = aa.querySelector("img");
	    aa.onclick = function() {
	    	for (const x of smallImg){
	    		x.classList.remove("active");
	    	}
	    	aa.classList.add("active");
	        bigImg.src = img.src;
	    }
	}
	
	const prices = document.querySelectorAll(".pr-price");
	for (const x of prices){
		const b = parseInt(x.textContent);
		x.textContent = b.toLocaleString("vi-VN");
	}
	
	
		const price = document.querySelector("#price");
		const b = parseInt(price.textContent);
		price.textContent = b.toLocaleString("vi-VN");

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