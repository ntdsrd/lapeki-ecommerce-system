<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/view/assets" var="url"></c:url>
<c:url value="/view/customer" var="link"></c:url>
<div class="sidebar" data-color="green" data-background-color="white"
	data-image="${url}/img/sidebar-1.jpg">

	<!--   Tip 1: You can change the color of the sidebar using: data-color="purple | azure | green | orange | danger"

        Tip 2: you can also add an image using data-image tag
   -->
	<div class="logo">
		
		<a href="#" class="simple-text logo-normal">
		<img height="60px" src="${link }/images/brand.png"><br>
			Admin area </a>
	</div>
	<div class="sidebar-wrapper">
		<ul class="nav">
			<li class="nav-item" id="dashboard"><a class="nav-link"
				href="${pageContext.request.contextPath }/admin/dashboard"> <i class="material-icons">dashboard</i>
					<p>Dashboard</p>
			</a></li>
			<li class="nav-item " id="profile"><a class="nav-link"
				href="${pageContext.request.contextPath }/admin/profile"> <i class="material-icons">person</i>
					<p>Profile</p>
			</a></li>
			<li class="nav-item " id="user-management"><a class="nav-link"
				href="${pageContext.request.contextPath }/admin/user/list"> <i class="material-icons">groups</i>
					<p>User Management</p>
			</a></li>
			<li class="nav-item " id="product-management"><a
				class="nav-link" href="${pageContext.request.contextPath }/admin/product/list"> <i
					class="material-icons">library_books</i>
					<p>Product Management</p>
			</a></li>
			<li class="nav-item " id="order-management"><a class="nav-link"
				href="${pageContext.request.contextPath }/admin/cart/list"> <i class="material-icons">receipt_long</i>
					<p>Order Management</p>
			</a></li>
			<li class="nav-item " id="category-management"><a
				class="nav-link" href="${pageContext.request.contextPath }/admin/category/list"> <i class="material-icons"><span
						class="material-icons"> category </span></i>
					<p>Category Management</p>
			</a></li>
			<li class="nav-item " id="voucher-management"><a
				class="nav-link" href="${pageContext.request.contextPath }/admin/voucher/list"> <i
					class="material-icons">local_offer</i>
					<p>Voucher Management</p>
			</a></li>
			
			<li class="nav-item " ><a
				class="nav-link" href="${pageContext.request.contextPath }/"> <i
					class="material-icons">home</i>
					<p>Lapeki Home</p>
			</a></li>


		</ul>
	</div>
</div>