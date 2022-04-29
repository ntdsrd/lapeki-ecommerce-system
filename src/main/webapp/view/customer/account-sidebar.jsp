<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:url value="/view/customer/" var="url"></c:url>


<aside class="customer-sidebar">
        <div class="container-fluid">
           
            <h4>Hello,</h4>
            <h5>${account.username}</h5>
        </div>
        <ul class="list-group list-group-flush">




            <li id="acc-detail" class="list-group-item"><a href="${pageContext.request.contextPath }/customer/profile"><div><i class="fas fa-user-circle"></i></div>Account details</a></li>
         
            

            <li id="acc-order" class="list-group-item"><a href="${pageContext.request.contextPath }/customer/order"><div><i class="fas fa-receipt"></i></i></div>Manage orders</a></li>

            <li id="acc-payment" class="list-group-item"><a href=""><div><i class="far fa-credit-card"></i></div>Payment methods</a></li>

            <li id="acc-voucher" class="list-group-item"><a href="${pageContext.request.contextPath }/customer/voucher"><div><i class="fas fa-ticket-alt"></i></div>Vouchers</a></li>

            <li id="acc-qa" class="list-group-item"><a href=""><div><i class="fas fa-question-circle"></i></div>Q&A</a></li>
            
          </ul>
    </aside>