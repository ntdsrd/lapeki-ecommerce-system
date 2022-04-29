<%@ page language="java" contentType="text/html; charset=UTF-8"
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
<title>Customer profile</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<link rel="stylesheet" href="${url }custom.css/style.css">

<link rel="stylesheet" href="${url }custom.css/breadcrumb.css">
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
	<main class="container-fluid" style="height: 700px">
		<div class="container main-content">

			<nav class="bcnav" aria-label="breadcrumb">
				<ol class="breadcrumb breadcrumb-custom">
					<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/" data-abc="true">Home</a></li>
					<li class="breadcrumb-item"><a href="#" data-abc="true">Customer</a></li>
					<li class="breadcrumb-item active" aria-current="page"><span>Profile</span></li>
				</ol>
			</nav>


			<!-- SIDEBAR STARTS -->
			<jsp:include page="../customer/account-sidebar.jsp"></jsp:include>
			<!-- SIDEBAR ENDS -->


			<!-- MAIN PANEL STARTS -->

			<div class="main-panel">

				<h3>My profile</h3>
				<p>Manage your information to secure your account</p>
				<hr>
				<form action="<c:url value='/customer/profile'/>" method="post">

					<div class="mb-3 row">
						<h5>Basic information</h5>

					</div>
					<div class="mb-3 row">
						<label for="username" class="col-sm-2 col-form-label">Username</label>
						<div class="col-sm-5">
							<input type="text" readonly class="form-control readonly"
								id="username" name="username" value="${account.username}"
								maxlength="25">
						</div>
					</div>
					<div class="mb-3 row">
						<label for="fullname" class="col-sm-2 col-form-label">Full
							name</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="fullname"
								name="fullname" value="${account.fullname}" maxlength="30">
						</div>
					</div>
					<div class="mb-3 row">
						<label for="email" class="col-sm-2 col-form-label">Email
							address</label>
						<div class="col-sm-5">
							<input type="email" readonly class="form-control readonly"
								id="email" name="email" value="${ account.email}" maxlength="50">
						</div>
					</div>
					<div class="mb-3 row">
						<label for="mobile" class="col-sm-2 col-form-label">Phone
							number</label>
						<div class="col-sm-5">
							<input type="tel" class="form-control" id="mobile" name="mobile"
								value="${account.mobile }" maxlength="10">
						</div>
					</div>

					<div class="mb-3 row">
						<label for="gender" class="col-sm-2 col-form-label">Gender</label>
						<div class="col-sm-5">
							<div class="form-check horizon">
								<input class="form-check-input" type="radio" name="gender"
									id="male" value="Male"
									<c:if test ="${account.gender == 'Male'}">
																		 checked="checked"
																		</c:if>>
								<label class="form-check-label" for="male"> Male </label>
							</div>
							<div class="form-check horizon">
								<input class="form-check-input" type="radio" name="gender"
									id="female" value="Female"
									<c:if test ="${account.gender == 'Female'}">
																		 checked="checked"
																		</c:if>>
								<label class="form-check-label" for="female"> Female </label>
							</div>
							<div class="form-check horizon">
								<input class="form-check-input" type="radio" name="gender"
									id="other" value="Others"
									<c:if test ="${account.gender == 'Other'}">
																		 checked="checked"
																		</c:if>>
								<label class="form-check-label" for="other"> Other </label>
							</div>
						</div>
					</div>

					<div class="mb-3 row">
						<label for="dob" class="col-sm-2 col-form-label">Date of
							birth</label>
						<div class="col-sm-5">
							<input type="date" class="form-control" id="mobile" name="dob"
								value="${account.dob }">
							<!--	<select class="custom-select" name="day"><option
									value="0">Day</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
								<option value="13">13</option>
								<option value="14">14</option>
								<option value="15">15</option>
								<option value="16">16</option>
								<option value="17">17</option>
								<option value="18">18</option>
								<option value="19">19</option>
								<option value="20">20</option>
								<option value="21">21</option>
								<option value="22">22</option>
								<option value="23">23</option>
								<option value="24">24</option>
								<option value="25">25</option>
								<option value="26">26</option>
								<option value="27">27</option>
								<option value="28">28</option>
								<option value="29">29</option>
								<option value="30">30</option>
								<option value="31">31</option></select> <select class="custom-select"
								name="month"><option value="0">Month</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option></select> <select class="custom-select"
								name="year"><option value="0">Year</option>
								<option value="2021">2021</option>
								<option value="2020">2020</option>
								<option value="2019">2019</option>
								<option value="2018">2018</option>
								<option value="2017">2017</option>
								<option value="2016">2016</option>
								<option value="2015">2015</option>
								<option value="2014">2014</option>
								<option value="2013">2013</option>
								<option value="2012">2012</option>
								<option value="2011">2011</option>
								<option value="2010">2010</option>
								<option value="2009">2009</option>
								<option value="2008">2008</option>
								<option value="2007">2007</option>
								<option value="2006">2006</option>
								<option value="2005">2005</option>
								<option value="2004">2004</option>
								<option value="2003">2003</option>
								<option value="2002">2002</option>
								<option value="2001">2001</option>
								<option value="2000">2000</option>
								<option value="1999">1999</option>
								<option value="1998">1998</option>
								<option value="1997">1997</option>
								<option value="1996">1996</option>
								<option value="1995">1995</option>
								<option value="1994">1994</option>
								<option value="1993">1993</option>
								<option value="1992">1992</option>
								<option value="1991">1991</option>
								<option value="1990">1990</option>
								<option value="1989">1989</option>
								<option value="1988">1988</option>
								<option value="1987">1987</option>
								<option value="1986">1986</option>
								<option value="1985">1985</option>
								<option value="1984">1984</option>
								<option value="1983">1983</option>
								<option value="1982">1982</option>
								<option value="1981">1981</option>
								<option value="1980">1980</option>
								<option value="1979">1979</option>
								<option value="1978">1978</option>
								<option value="1977">1977</option>
								<option value="1976">1976</option>
								<option value="1975">1975</option>
								<option value="1974">1974</option>
								<option value="1973">1973</option>
								<option value="1972">1972</option>
								<option value="1971">1971</option>
								<option value="1970">1970</option>
								<option value="1969">1969</option>
								<option value="1968">1968</option>
								<option value="1967">1967</option>
								<option value="1966">1966</option>
								<option value="1965">1965</option>
								<option value="1964">1964</option>
								<option value="1963">1963</option>
								<option value="1962">1962</option>
								<option value="1961">1961</option>
								<option value="1960">1960</option>
								<option value="1959">1959</option>
								<option value="1958">1958</option>
								<option value="1957">1957</option>
								<option value="1956">1956</option></select> -->
						</div>


					</div>

					<div class="mb-3 row">
						<label for="address" class="col-sm-2 col-form-label">Address</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="address"
								name="address" value="${account.address}">
						</div>
					</div>

					<div class="mb-3 row">
						<label class="col-sm-2 col-form-label"></label>
						<div class="col-sm-5">
							<input type="checkbox" class="btn btn-light" type="button"
								data-toggle="collapse" data-target="#collapseExample"
								aria-expanded="false" aria-controls="collapseExample"
								id="change-password" name="change-password" value="change" /> <label
								for="change-password">Change password</label>
						</div>
					</div>



					<div class="collapse" id="collapseExample">

						<div class="mb-3 row">
							<label for="new-password" class="col-sm-2 col-form-label">New
								password</label>
							<div class="col-sm-5">
								<input type="password" class="form-control" id="new-password"
									name="new-password" value="">
							</div>
						</div>






					</div>

					<div class="mb-3 row">
						<label for="mobile" class="col-sm-2 col-form-label"></label>
						<div class="col-sm-5">
							<input type="submit" value="Update" class="btn btn-danger"
								onclick="validatePassword()">
						</div>
					</div>


				</form>
			</div>



		</div>
	</main>

	<!-- MAIN PANEL ENDS -->

	<!--  -->

	<jsp:include page="../customer/footer.jsp"></jsp:include>



















	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


	<script type="text/javascript">
		$("#acc-detail").addClass("active");

		function validatePassword() {
			const change = document.querySelector("#change-password");
			if (change.checked) {
				const newPassword = document.querySelector("#new-password").value;
				const confirm = document.querySelector("#confirm").value;

				if (newPassword != confirm) {
					alert("Confirm password and new password do not match.")
				}

			}

		}
	</script>



</body>
</html>