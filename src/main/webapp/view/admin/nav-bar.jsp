<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<nav
	class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
	<div class="container-fluid">
		<div class="navbar-wrapper">
			<a id="page-name" class="navbar-brand" href="javascript:;"></a>
		</div>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			aria-controls="navigation-index" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="sr-only">Toggle navigation</span> <span
				class="navbar-toggler-icon icon-bar"></span> <span
				class="navbar-toggler-icon icon-bar"></span> <span
				class="navbar-toggler-icon icon-bar"></span>
		</button>
		<div class="collapse navbar-collapse justify-content-end">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/admin/dashboard">
						<i class="material-icons">dashboard</i>
						<p class="d-lg-none d-md-block">Stats</p>
				</a></li>
				<li class="nav-item dropdown"><a class="nav-link"
					href="http://example.com" id="navbarDropdownMenuLink"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<i class="material-icons">notifications</i> <span
						class="notification">5</span>
						<p class="d-lg-none d-md-block">Some Actions</p>
				</a>
					<div class="dropdown-menu dropdown-menu-right"
						aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="#">Mike John responded to your
							email</a> <a class="dropdown-item" href="#">You have 5 new tasks</a>
						<a class="dropdown-item" href="#">You're now friend with
							Andrew</a> <a class="dropdown-item" href="#">Another Notification</a>
						<a class="dropdown-item" href="#">Another One</a>
					</div></li>
				<li class="nav-item dropdown"><a class="nav-link"
					href="javascript:;" id="navbarDropdownProfile"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<i class="material-icons">person</i>
						<p class="d-lg-none d-md-block">Account</p>
				</a>
					<div class="dropdown-menu dropdown-menu-right"
						aria-labelledby="navbarDropdownProfile">
						<a class="dropdown-item" href="${pageContext.request.contextPath }/admin/user">Profile</a> <a
							class="dropdown-item" href="#">Settings</a>
						<div class="dropdown-divider"></div>
						<c:url value="/logout" var="logout"></c:url>
						<form action="${logout}" method="get">
							<input class="dropdown-item" type="submit" value="Log out">
						</form>
					</div></li>
			</ul>
		</div>
	</div>
</nav>