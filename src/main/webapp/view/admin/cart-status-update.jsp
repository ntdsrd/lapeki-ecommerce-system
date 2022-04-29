<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:url value="/view/assets" var="url"></c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<link rel="icon" type="image/png" href="${url}/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Cart Detail</title>
<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no'
	name='viewport' />
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<!-- CSS Files -->
<link href="${url}/css/material-dashboard.css?v=2.1.2" rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="${url}/demo/demo.css" rel="stylesheet" />
</head>
<body>
	 <%
	 	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
	 	response.setHeader("Pragma", "no-cache"); //HTTP 1.0
	 %>
	<div class="wrapper ">
		<!-- SIDE BAR -->
		<jsp:include page="../admin/side-bar.jsp"></jsp:include>
		<div class="main-panel">
			<!-- Navbar -->
			<jsp:include page="../admin/nav-bar.jsp"></jsp:include>
			<!-- End Navbar -->

			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header card-header-primary">
									<h4 class="card-title">Order Detail</h4>
									<p class="card-category">Update Order Status</p>
								</div>
								<div class="card-body">
									<c:url value="/admin/order/status/update" var="statusUpdate"></c:url>
									<form action="${statusUpdate}" method="post">
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="bmd-label-floating">Cart ID</label> <input
														type="text" class="form-control" name="cartID"
														value="${cart.cartID}" readonly>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="bmd-label-floating">Voucher Code</label> <input
														type="text" class="form-control"
														value="${cart.voucher.voucherCode}" disabled>
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="bmd-label-floating">User ID</label> <input
														type="text" class="form-control"
														value="${cart.user.userID}" disabled>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="bmd-label-floating">User Name</label> <input
														type="text" class="form-control"
														value="${cart.user.fullname}" disabled>
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="bmd-label-floating">Phone number</label> <input
														type="text" class="form-control"
														value="${cart.user.mobile}" disabled>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="bmd-label-floating">Email</label> <input
														type="text" class="form-control"
														value="${cart.user.email}" disabled>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="bmd-label-floating">Address</label> <input
														type="text" class="form-control"
														value="${cart.user.address}" disabled>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="bmd-label-floating">Payment Method</label> <input
														type="text" class="form-control"
														value="${cart.paymentMode}" disabled>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="bmd-label-floating">Order Date</label> <input
														type="text" class="form-control" value="${cart.orderDate}"
														disabled>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="bmd-label-floating">Discount
														Percentage</label> <input type="text" class="form-control"
														value="${cart.voucher.discountPercentage}%" disabled>
												</div>
											</div>
										</div>
										<div class="table-responsive">
											<table class="table table-striped table-hover" id="table">
												<thead class=" text-primary">
													<th>ID</th>
													<th>Image</th>
													<th>Name</th>
													<th>Unit Price</th>
													<th>Quantity</th>
													<th>Sub total(VND)</th>
												</thead>
												<tbody>
													<c:set var="total" value="${0}" />
													<c:forEach items="${cartLines}" var="cl">
														<c:set var="subtotal"
															value="${cl.quantity * cl.product.productPrice}" />
														<c:set var="total" value="${total + subtotal}" />
														<tr>
															<td>${cl.cartLineID}</td>
															<c:set var="imgs" value="${cl.product.productImg}" />
															<c:set var="img" value="${fn:split(imgs,',')}" />
																<c:set var="ava" value="${img[0]}" />
															<td><img height="100" src="${img[0]}" /></td>
															<td>${cl.product.productName}</td>
															<td>${cl.product.productPrice}</td>
															<td>${cl.quantity}</td>
															<td>${cl.quantity * cl.product.productPrice}</td>
														</tr>
													</c:forEach>

												</tbody>
											</table>
										</div>
										<div class="d-flex justify-content-between">
											<div class="col-md-3 dropdown">
												<div class="form-group">
													<label class="bmd-label-floating">Status</label> <select
														name="cartStatus" class="browser-default custom-select">
														<option ${cart.status == "Pending" ? "selected": ""}>Pending</option>
														<option ${cart.status == "Rejected" ? "selected": ""}>Rejected</option>
														<option ${cart.status == "Delivering" ? "selected": ""}>Delivering</option>
														<option ${cart.status == "Delivered" ? "selected": ""}>Delivered</option>
													</select>
												</div>
											</div>
											
											<div class="col-md-9"
												style="display: flex; justify-content: flex-end;">

												<table id="total-table"
													style="width: 50%; text-align: right;">

													<tr>
														<td style="height: 30px;">Total:</td>
														<td id="total">${total}VND</td>
													</tr>
													

													<tr>
														<td style="height: 30px;">Discount with voucher:</td>
														<td id="voucher">
															<c:if
																test="${cart.voucher != null }">-${(total*cart.voucher.discountPercentage)/100 }</c:if>
															<c:if test="${cart.voucher == null }">0</c:if>
														</td>
													</tr>
													
													<tr>
														<td style="height: 30px;">Shipping fee:</td>
														<td>30.000 VND</td>
													</tr>

													<tr>
														<td style="height: 30px;"><b>Final total:</b></td>
														<td id="final">${cart.total}VND</td>
													</tr>

												</table>


											</div>
											
										</div>
										<button type="submit" class="btn btn-primary pull-right" style="margin-top: 45px">Save
											change</button>
										<div class="clearfix"></div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<footer class="footer">
				<div class="container-fluid">

					<div class="copyright float-center">
						&copy;
						<script>
							document.write(new Date().getFullYear())
						</script>
						, Lapeki Shop
					</div>
				</div>
			</footer>
		</div>
	</div>
	<div class="fixed-plugin">
		<div class="dropdown show-dropdown">
			<a href="#" data-toggle="dropdown"> <i class="fa fa-cog fa-2x">
			</i>
			</a>
			<ul class="dropdown-menu">
				<li class="header-title">Sidebar Filters</li>
				<li class="adjustments-line"><a href="javascript:void(0)"
					class="switch-trigger active-color">
						<div class="badge-colors ml-auto mr-auto">
							<span class="badge filter badge-purple" data-color="purple"></span>
							<span class="badge filter badge-azure" data-color="azure"></span>
							<span class="badge filter badge-green" data-color="green"></span>
							<span class="badge filter badge-warning" data-color="orange"></span>
							<span class="badge filter badge-danger" data-color="danger"></span>
							<span class="badge filter badge-rose active" data-color="rose"></span>
						</div>
						<div class="clearfix"></div>
				</a></li>
				<li class="header-title">Images</li>
				<li class="active"><a class="img-holder switch-trigger"
					href="javascript:void(0)"> <img src="${url}/img/sidebar-1.jpg"
						alt="">
				</a></li>
				<li><a class="img-holder switch-trigger"
					href="javascript:void(0)"> <img src="${url}/img/sidebar-2.jpg"
						alt="">
				</a></li>
				<li><a class="img-holder switch-trigger"
					href="javascript:void(0)"> <img src="${url}/img/sidebar-3.jpg"
						alt="">
				</a></li>
				<li><a class="img-holder switch-trigger"
					href="javascript:void(0)"> <img src="${url}/img/sidebar-4.jpg"
						alt="">
				</a></li>
				<li class="button-container"><a
					href="https://www.creative-tim.com/product/material-dashboard"
					target="_blank" class="btn btn-primary btn-block">Free Download</a>
				</li>
				<!-- <li class="header-title">Want more components?</li>
            <li class="button-container">
                <a href="https://www.creative-tim.com/product/material-dashboard-pro" target="_blank" class="btn btn-warning btn-block">
                  Get the pro version
                </a>
            </li> -->
				<li class="button-container"><a
					href="https://demos.creative-tim.com/material-dashboard/docs/2.1/getting-started/introduction.html"
					target="_blank" class="btn btn-default btn-block"> View
						Documentation </a></li>
				<li class="button-container github-star"><a
					class="github-button"
					href="https://github.com/creativetimofficial/material-dashboard"
					data-icon="octicon-star" data-size="large" data-show-count="true"
					aria-label="Star ntkme/github-buttons on GitHub">Star</a></li>
				<li class="header-title">Thank you for 95 shares!</li>
				<li class="button-container text-center">
					<button id="twitter" class="btn btn-round btn-twitter">
						<i class="fa fa-twitter"></i> &middot; 45
					</button>
					<button id="facebook" class="btn btn-round btn-facebook">
						<i class="fa fa-facebook-f"></i> &middot; 50
					</button> <br> <br>
				</li>
			</ul>
		</div>
	</div>
	<!--   Core JS Files   -->
	<script src="${url}/js/core/jquery.min.js"></script>
	<script src="${url}/js/core/popper.min.js"></script>
	<script src="${url}/js/core/bootstrap-material-design.min.js"></script>
	<script src="${url}/js/plugins/perfect-scrollbar.jquery.min.js"></script>
	<!-- Plugin for the momentJs  -->
	<script src="${url}/js/plugins/moment.min.js"></script>
	<!--  Plugin for Sweet Alert -->
	<script src="${url}/js/plugins/sweetalert2.js"></script>
	<!-- Forms Validations Plugin -->
	<script src="${url}/js/plugins/jquery.validate.min.js"></script>
	<!-- Plugin for the Wizard, full documentation here: https://github.com/VinceG/twitter-bootstrap-wizard -->
	<script src="${url}/js/plugins/jquery.bootstrap-wizard.js"></script>
	<!--	Plugin for Select, full documentation here: http://silviomoreto.github.io/bootstrap-select -->
	<script src="${url}/js/plugins/bootstrap-selectpicker.js"></script>
	<!--  Plugin for the DateTimePicker, full documentation here: https://eonasdan.github.io/bootstrap-datetimepicker/ -->
	<script src="${url}/js/plugins/bootstrap-datetimepicker.min.js"></script>
	<!--  DataTables.net Plugin, full documentation here: https://datatables.net/  -->
	<script src="${url}/js/plugins/jquery.dataTables.min.js"></script>
	<!--	Plugin for Tags, full documentation here: https://github.com/bootstrap-tagsinput/bootstrap-tagsinputs  -->
	<script src="${url}/js/plugins/bootstrap-tagsinput.js"></script>
	<!-- Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
	<script src="${url}/js/plugins/jasny-bootstrap.min.js"></script>
	<!--  Full Calendar Plugin, full documentation here: https://github.com/fullcalendar/fullcalendar    -->
	<script src="${url}/js/plugins/fullcalendar.min.js"></script>
	<!-- Vector Map plugin, full documentation here: http://jvectormap.com/documentation/ -->
	<script src="${url}/js/plugins/jquery-jvectormap.js"></script>
	<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
	<script src="${url}/js/plugins/nouislider.min.js"></script>
	<!-- Include a polyfill for ES6 Promises (optional) for IE11, UC Browser and Android browser support SweetAlert -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>
	<!-- Library for adding dinamically elements -->
	<script src="${url}/js/plugins/arrive.min.js"></script>
	<!--  Google Maps Plugin    -->
	<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
	<!-- Chartist JS -->
	<script src="${url}/js/plugins/chartist.min.js"></script>
	<!--  Notifications Plugin    -->
	<script src="${url}/js/plugins/bootstrap-notify.js"></script>
	<!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
	<script src="${url}/js/material-dashboard.js?v=2.1.2"
		type="text/javascript"></script>
	<!-- Material Dashboard DEMO methods, don't include it in your project! -->
	<script src="${url}/demo/demo.js"></script>
	<script>
		const activeSidebarItem = document.querySelector("#order-management");
		activeSidebarItem.classList.add("active");

		const pageName = document.querySelector("#page-name");
		pageName.textContent = "Order Management";
		$(document)
				.ready(
						function() {
							$()
									.ready(
											function() {
												$sidebar = $('.sidebar');

												$sidebar_img_container = $sidebar
														.find('.sidebar-background');

												$full_page = $('.full-page');

												$sidebar_responsive = $('body > .navbar-collapse');

												window_width = $(window)
														.width();

												fixed_plugin_open = $(
														'.sidebar .sidebar-wrapper .nav li.active a p')
														.html();

												if (window_width > 767
														&& fixed_plugin_open == 'Dashboard') {
													if ($(
															'.fixed-plugin .dropdown')
															.hasClass(
																	'show-dropdown')) {
														$(
																'.fixed-plugin .dropdown')
																.addClass(
																		'open');
													}

												}

												$('.fixed-plugin a')
														.click(
																function(event) {
																	// Alex if we click on switch, stop propagation of the event, so the dropdown will not be hide, otherwise we set the  section active
																	if ($(this)
																			.hasClass(
																					'switch-trigger')) {
																		if (event.stopPropagation) {
																			event
																					.stopPropagation();
																		} else if (window.event) {
																			window.event.cancelBubble = true;
																		}
																	}
																});

												$(
														'.fixed-plugin .active-color span')
														.click(
																function() {
																	$full_page_background = $('.full-page-background');

																	$(this)
																			.siblings()
																			.removeClass(
																					'active');
																	$(this)
																			.addClass(
																					'active');

																	var new_color = $(
																			this)
																			.data(
																					'color');

																	if ($sidebar.length != 0) {
																		$sidebar
																				.attr(
																						'data-color',
																						new_color);
																	}

																	if ($full_page.length != 0) {
																		$full_page
																				.attr(
																						'filter-color',
																						new_color);
																	}

																	if ($sidebar_responsive.length != 0) {
																		$sidebar_responsive
																				.attr(
																						'data-color',
																						new_color);
																	}
																});

												$(
														'.fixed-plugin .background-color .badge')
														.click(
																function() {
																	$(this)
																			.siblings()
																			.removeClass(
																					'active');
																	$(this)
																			.addClass(
																					'active');

																	var new_color = $(
																			this)
																			.data(
																					'background-color');

																	if ($sidebar.length != 0) {
																		$sidebar
																				.attr(
																						'data-background-color',
																						new_color);
																	}
																});

												$('.fixed-plugin .img-holder')
														.click(
																function() {
																	$full_page_background = $('.full-page-background');

																	$(this)
																			.parent(
																					'li')
																			.siblings()
																			.removeClass(
																					'active');
																	$(this)
																			.parent(
																					'li')
																			.addClass(
																					'active');

																	var new_image = $(
																			this)
																			.find(
																					"img")
																			.attr(
																					'src');

																	if ($sidebar_img_container.length != 0
																			&& $('.switch-sidebar-image input:checked').length != 0) {
																		$sidebar_img_container
																				.fadeOut(
																						'fast',
																						function() {
																							$sidebar_img_container
																									.css(
																											'background-image',
																											'url("'
																													+ new_image
																													+ '")');
																							$sidebar_img_container
																									.fadeIn('fast');
																						});
																	}

																	if ($full_page_background.length != 0
																			&& $('.switch-sidebar-image input:checked').length != 0) {
																		var new_image_full_page = $(
																				'.fixed-plugin li.active .img-holder')
																				.find(
																						'img')
																				.data(
																						'src');

																		$full_page_background
																				.fadeOut(
																						'fast',
																						function() {
																							$full_page_background
																									.css(
																											'background-image',
																											'url("'
																													+ new_image_full_page
																													+ '")');
																							$full_page_background
																									.fadeIn('fast');
																						});
																	}

																	if ($('.switch-sidebar-image input:checked').length == 0) {
																		var new_image = $(
																				'.fixed-plugin li.active .img-holder')
																				.find(
																						"img")
																				.attr(
																						'src');
																		var new_image_full_page = $(
																				'.fixed-plugin li.active .img-holder')
																				.find(
																						'img')
																				.data(
																						'src');

																		$sidebar_img_container
																				.css(
																						'background-image',
																						'url("'
																								+ new_image
																								+ '")');
																		$full_page_background
																				.css(
																						'background-image',
																						'url("'
																								+ new_image_full_page
																								+ '")');
																	}

																	if ($sidebar_responsive.length != 0) {
																		$sidebar_responsive
																				.css(
																						'background-image',
																						'url("'
																								+ new_image
																								+ '")');
																	}
																});

												$('.switch-sidebar-image input')
														.change(
																function() {
																	$full_page_background = $('.full-page-background');

																	$input = $(this);

																	if ($input
																			.is(':checked')) {
																		if ($sidebar_img_container.length != 0) {
																			$sidebar_img_container
																					.fadeIn('fast');
																			$sidebar
																					.attr(
																							'data-image',
																							'#');
																		}

																		if ($full_page_background.length != 0) {
																			$full_page_background
																					.fadeIn('fast');
																			$full_page
																					.attr(
																							'data-image',
																							'#');
																		}

																		background_image = true;
																	} else {
																		if ($sidebar_img_container.length != 0) {
																			$sidebar
																					.removeAttr('data-image');
																			$sidebar_img_container
																					.fadeOut('fast');
																		}

																		if ($full_page_background.length != 0) {
																			$full_page
																					.removeAttr(
																							'data-image',
																							'#');
																			$full_page_background
																					.fadeOut('fast');
																		}

																		background_image = false;
																	}
																});

												$('.switch-sidebar-mini input')
														.change(
																function() {
																	$body = $('body');

																	$input = $(this);

																	if (md.misc.sidebar_mini_active == true) {
																		$(
																				'body')
																				.removeClass(
																						'sidebar-mini');
																		md.misc.sidebar_mini_active = false;

																		$(
																				'.sidebar .sidebar-wrapper, .main-panel')
																				.perfectScrollbar();

																	} else {

																		$(
																				'.sidebar .sidebar-wrapper, .main-panel')
																				.perfectScrollbar(
																						'destroy');

																		setTimeout(
																				function() {
																					$(
																							'body')
																							.addClass(
																									'sidebar-mini');

																					md.misc.sidebar_mini_active = true;
																				},
																				300);
																	}

																	// we simulate the window Resize so the charts will get updated in realtime.
																	var simulateWindowResize = setInterval(
																			function() {
																				window
																						.dispatchEvent(new Event(
																								'resize'));
																			},
																			180);

																	// we stop the simulation of Window Resize after the animations are completed
																	setTimeout(
																			function() {
																				clearInterval(simulateWindowResize);
																			},
																			1000);

																});
											});
						});
	</script>
</body>
</html>