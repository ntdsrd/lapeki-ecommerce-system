<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:url value="/view/customer/" var="url"></c:url>

	<header class="header-style">

		<nav class="navbar navbar-expand-md   navbar-dark sticky-top"
			style="background-color: #d03737;">
			<div class="container">
				<a class="navbar-brand" href="${pageContext.request.contextPath }/"> <img
					src="${url }images/account-brand.png" width="50px" alt=""> <img
					src="${url }images/brand-light.png" height="50px" alt="">
				</a>

				<form class="form-search" action="${pageContext.request.contextPath}/product/search"
				method="get">
					<div class="search-content">
						<input type="text" placeholder="Find product.."
							class="search-input" name="pname">
						<button type="submit" class="search-btn">
							<img class="search-icon"
								src="${url }images/search-icon-light.png"> Search
						</button>

					</div>
				</form>


				<div class="user-shortcut">
					<div class="account-container">
						<img src="${url }images/profile-img.png" class="profile-icon">
						<c:choose>
							<c:when test="${sessionScope.account == null }">
								<div class="account-block">
									<a class="login-text"
										href="${pageContext.request.contextPath }/login">Login</a> <br />
									<span>or</span> <a
										href="${pageContext.request.contextPath }/register">Register</a>
								</div>
							</c:when>
							<c:otherwise>
								<div class="account-block">
									<a href="${pageContext.request.contextPath }/customer/profile">My
										Account</a> <br /> <a
										href="${pageContext.request.contextPath }/logout"
										style="font-size: 12px;">Logout</a>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="cart-container">
						<a href="${pageContext.request.contextPath }/customer/cart">
							<div class="cart-wrapper">
								<div class="cart-icon-wrapper">
									<img class="cart-icon" src="${url }images/cart-icon.png">
									<c:set var="count" value="${0}" />
									<c:forEach items="${sessionScope.cart}" var="map">
										<c:set var="count" value="${count + map.value.quantity}" />
									</c:forEach>
									<span class="cart-quantity">${count}</span>
								</div>
								<span class="cart-text">Cart</span>
							</div>
						</a>
					</div>
				</div>
		</nav>
	</header>