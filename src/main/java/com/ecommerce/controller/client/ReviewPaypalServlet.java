package com.ecommerce.controller.client;

import com.ecommerce.model.Cart;
import com.ecommerce.model.CartLine;
import com.ecommerce.model.User;
import com.ecommerce.model.Voucher;
import com.ecommerce.payment.PayPalService;
import com.ecommerce.service.CartLineService;
import com.ecommerce.service.CartService;
import com.ecommerce.service.impl.CartLineServiceImpl;
import com.ecommerce.service.impl.CartServiceImpl;
import com.ecommerce.tools.MailTools;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.ShippingAddress;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.PayPalRESTException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.text.NumberFormat;
import java.util.Locale;
import java.util.Map;

/**
 * @author Nguyen The Dat
 * Servlet implementation class ReviewPaypalServlet
 */
@WebServlet("/customer/review_payment")
public class ReviewPaypalServlet extends HttpServlet {
    NumberFormat nf = NumberFormat.getInstance(new Locale("vi", "VN"));
    CartLineService cartLineService = new CartLineServiceImpl();
    private static final long serialVersionUID = 1L;
    CartService cartService = new CartServiceImpl();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String paymentId = req.getParameter("paymentId");
        String payerId = req.getParameter("PayerID");

        try {
            PayPalService paymentService = new PayPalService();
            Payment payment = paymentService.getPaymentDetail(paymentId);

            PayerInfo payerInfo = payment.getPayer().getPayerInfo();
            Transaction transaction = payment.getTransactions().get(0); //Fix it multiple transaction
            ShippingAddress shippingAddress = transaction.getItemList().getShippingAddress();

            double tempTotal = Double.parseDouble(transaction.getAmount().getTotal());
            long total = (long) tempTotal;

            req.setAttribute("payer", payerInfo);
            req.setAttribute("transaction", transaction);
            req.setAttribute("shippingAddress", shippingAddress);

            //Insert cart to database
            HttpSession session = req.getSession();
            User account = (User) session.getAttribute("account");
            Voucher voucher = (Voucher) session.getAttribute("voucher");
            Cart cart = new Cart();
            cart.setUser(account);
            cart.setOrderDate(new Date(System.currentTimeMillis()));
            cart.setStatus("Checked out");
            cart.setPayment("PayPal");
            cart.setVoucher(voucher);
            cart.setTotal(total);
            int cartID = cartService.insertCart(cart);
            cart.setCartID(cartID);

            Object temporaryCart = session.getAttribute("cart");
            String message = "<p>Your order - <b>#" + cartID + "</b> has been successfully placed. <br>"
                    + " The chosen payment method is <b> PayPal</b>. <br>"
                    + "The total charge is " + total + " VND.<br>"
                    + "Please be noticed! </p> <hr>";

            String orderDetail = "<h3>Order detail - #" + cart.getCartID() + "</h3> <br> "
                    + "<table style=\"width: 100%;\">"
                    + "<thead>"
                    + "<th style=\"width:50%; text-align: left;\">Product name</th>"
                    + "<th style=\"width:20%; text-align: left;\">Price</th>"
                    + "<th style=\"width:10%; text-align: left;\">Quantity</th>"
                    + "<th style=\"width:20%; text-align: left;\">Subtotal</th>"
                    + "</thead>"
                    + "<tbody>";

            if (temporaryCart != null) {

                Map<Integer, CartLine> map = (Map<Integer, CartLine>) temporaryCart;

                for (CartLine cartLine : map.values()) {
                    orderDetail += "<tr>"
                            + "<td>" + cartLine.getProduct().getProductName() + "</td>"
                            + "<td>" + nf.format(cartLine.getUnitPrice()) + "</td>"
                            + "<td> " + cartLine.getQuantity() + "</td>"
                            + "<td>" + nf.format(cartLine.getQuantity() * cartLine.getUnitPrice()) + "</td>"
                            + "</tr>";


                    cartLine.setCart(cart);
                    cartLineService.insertCartLine(cartLine);
                }

                orderDetail += "</tbody></table>"
                        + "<hr>"
                        + "<p>Total : " + transaction.getAmount().getDetails().getSubtotal() + " VND<br>"
                        + "Shipping fee: 30.000VND<br>"
                        + "Discount with voucher: -" + nf.format(voucher.getDiscountPercentage() * total / 100) + " VND<br>"
                        + "Final total: " + nf.format(total) + " VND</p><hr>"
                        + "<p>Please contact us if any inconveniences come up!<br>"
                        + "Best regards,<br>"
                        + "<b>Lapeki Ecommerce &copy;</b></p>";
                MailTools mailTools = new MailTools();

                try {

                    mailTools.sendMail(account.getEmail(), "Lapeki - Order placed successfully", message + orderDetail);
                } catch (Exception e) {
                    e.printStackTrace();
                }


            }
            session.removeAttribute("voucher");
            session.removeAttribute("cart");
            req.setAttribute("placed-id", cartID);
            RequestDispatcher rd = req.getRequestDispatcher("/view/customer/checkout-succeed.jsp");
            rd.forward(req, resp);

        } catch (PayPalRESTException ex) {
            req.setAttribute("errorMessage", ex.getMessage());
            ex.printStackTrace();
            req.getRequestDispatcher("error.jsp").forward(req, resp);
        }
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
