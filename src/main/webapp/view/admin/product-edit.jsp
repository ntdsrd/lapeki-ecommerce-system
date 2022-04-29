<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:url value="/view/assets" var="url"></c:url>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />

<link rel="icon" type="image/png" href="../assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Edit product</title>
<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no'
	name='viewport' />

<!-- CSS Files -->
<link rel="stylesheet" href="${url}/css/material-dashboard.css" />
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">



</head>

<body class="">
	 <%
	 	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
	 	response.setHeader("Pragma", "no-cache"); //HTTP 1.0
	 %>
	<div class="wrapper ">

		<!-- SIDE-BAR -->
		<jsp:include page="../admin/side-bar.jsp"></jsp:include>
		<!-- SIDE-BAR ends -->

		<div class="main-panel">
			<!-- Navbar -->
			<jsp:include page="../admin/nav-bar.jsp"></jsp:include>
			<!-- End Navbar -->


			<!-- MAIN CONTENT -->
			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header card-header-primary">
									<h4 class="card-title">Edit product</h4>
									<p class="card-category">Update product details here</p>
								</div>
								<div class="card-body">
									<!-- Form start -->
									<form role="form" action="<c:url value='/admin/product/edit'/>"
										method="post" enctype="multipart/form-data">

										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<input type="text" name="productID" class="form-control"
														value="ProductID: ${product.productID }"
														readonly="readonly">
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="bmd-label-floating">Product name</label> <input
														type="text" name="productName" class="form-control"
														required="required" value="${product.productName }">
												</div>
											</div>

										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="bmd-label-floating">Price (VND)</label> <input
														type="number" min="0" name="productPrice"
														class="form-control" required="required"
														value="${product.productPrice }">
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="bmd-label-floating">Instock</label> <input
														type="number" min="0" name="instock" class="form-control"
														required="required" value="${product.instock }">
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<label>Product Description</label>
													<div class="form-group">

														<textarea class="col-md-12 form-control" id="editor"
															rows="6" required="required" name="productDesc">${product.productDesc}</textarea>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="card">
													<div
														class="card-header card-header-text card-header-primary">
														<div class="btn-group">
															<button type="button" class="btn btn-primary">Category</button>
															<button type="button"
																class="btn btn-primary dropdown-toggle dropdown-toggle-split"
																data-toggle="dropdown" aria-haspopup="true"
																aria-expanded="false">
																<span class="sr-only">Toggle Dropdown</span>
															</button>
															<div class="dropdown-menu">
																<c:forEach items="${categories}" var="c">
																	<span id="${c.categoryID}"
																		onclick="onCategoryClick(event)" class="dropdown-item">${c.categoryName}</span>
																</c:forEach>
															</div>
														</div>
													</div>
													<div class="card-body">
														<input style="border: none" type="text" id="category-text"
															value="${product.category.categoryName}"
															readonly="readonly"> <input type="hidden"
															id="category-id" name="category"
															value="${product.category.categoryID}">
													</div>
												</div>
											</div>
										</div>



										<div class="row">

											<div class="col-lg-10">
												<div class="form-group">
													<label class="bmd-label-floating">Product Image URL</label>
													<input type="text" id="productImgAdd" name="productImgAdd"
														class="form-control"> <input type="hidden"
														id="productImg" name="productImg"
														value="${product.productImg}">
												</div>
											</div>
											<div class="col-lg-2">
												<div onclick="onAddImgBtn(event)"
													class="btn btn-success pull-right btn-fab btn-fab-mini btn-round">
													<i class="material-icons">add</i>
												</div>
											</div>


										</div>
										<div class="row" id="all-image-container">



											<!-- IMAGES GO HERE -->

										</div>



										<!-- ADD button -->
										<div onClick="window.location.reload();"
											class="btn btn-warning pull-right">Reset</div>
										<button type="submit" class="btn btn-success pull-right">Update</button>

										<!-- ADD button -->
										<div class="clearfix"></div>
									</form>

									<!-- Form ends -->
								</div>
							</div>
						</div>

					</div>


				</div>
			</div>

		</div>
	</div>




	<!-- LOAD SCRIPTS -->




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

	<!-- Chartist JS -->
	<script src="${url}/js/plugins/chartist.min.js"></script>
	<!--  Notifications Plugin    -->
	<script src="${url}/js/plugins/bootstrap-notify.js"></script>
	<!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
	<script src="${url}/js/material-dashboard.js?v=2.1.2"
		type="text/javascript"></script>

	<!--  

<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap4.min.js"></script>
-->


	<script src="https://cdn.ckeditor.com/4.11.1/standard/ckeditor.js"></script>
	<script>
		window.onload = function() {
			CKEDITOR.replace('editor');
		};
	</script>
	<!-- 	<script>
		$(document).ready(function() {
			$('#dataTables-example').DataTable();
		});
	</script> -->
	<script type="text/javascript">
		$("#product-management").addClass("active");
		$("#page-name").text("Edit product");

		function loadImages(){
		const container = document.querySelector('#all-image-container');
		const productImg = document.querySelector('#productImg');
		
		const imgs = productImg.value.split(',');
		imgs.shift('');
			
			
		for (const img of imgs){
			const num = container.childNodes.length;
			getImageCard(img, (num+1));
		}
		
		
	
		console.log(imgs);
		
		
		
		}
		
		loadImages();
		
		
		function onCategoryClick(event) {
			const span = event.currentTarget;
			const id = span.id;

			const text = span.textContent;
			const cateInput = document.querySelector("#category-text");
			cateInput.value = text;
			const valueID = document.querySelector("#category-id");
			valueID.value = id;
			console.log(valueID.value);

		}
		
		function onDeleteImgBtn(event) {
			if (confirm("Delete this image?")) {
				const btn = event.currentTarget;
				const divID = "imgDiv-" + btn.id;
				const container = document.querySelector('#'+divID);
				container.remove();
				
				const containerAll = document.querySelector('#all-image-container');
				const productImg = document.querySelector('#productImg');
				productImg.value="";
				const imgList = containerAll.querySelectorAll('img');
				for (const img of imgList){
					productImg.value = productImg.value + "," + img.src;
				}
				
				console.log(productImg.value);
				
			}
		}
		
		
		function onAddImgBtn(event){
			const container = document.querySelector('#all-image-container')
			const num = container.childNodes.length;
			const imgInput = document.querySelector('#productImgAdd');
			const url = imgInput.value;
			if (url.length > 0) {
				getImageCard(url, (num+1));
				imgInput.value = "";
			}
			
			const productImg = document.querySelector('#productImg');
			productImg.value="";
			const imgList = container.querySelectorAll('img');
			for (const img of imgList){
				productImg.value = productImg.value + "," + img.src;
			}
			
			console.log(productImg.value);
		}
		
		
		function getImageCard(link, imageNum){
			const imgContainer = document.querySelector('#all-image-container');
			const singleContainerDiv = document.createElement('div');
			const divID = "imgDiv-" + imageNum;
			const imgID = "img-" + imageNum;
			singleContainerDiv.id = divID;
			singleContainerDiv.classList.add('col-lg-3', 'col-md-6', 'col-sm-6');
			singleContainerDiv.innerHTML = `<div class="card" style="width: 12rem;">
				<img class="card-img-top"
			
				rel="nofollow" alt="Card image cap">
			<div class="card-body">
				<div onclick="onDeleteImgBtn(event)"
					class="btn btn-danger centered btn-fab btn-fab-mini btn-round">
					<i class="material-icons">delete</i>
				</div>
			</div>
		</div>`;
			const img = singleContainerDiv.querySelector('img');
			const btn = singleContainerDiv.querySelector('.btn');
			btn.id = imageNum;
			img.src = link;
			img.id = imgID;
			
			imgContainer.appendChild(singleContainerDiv);
			
		}
		

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