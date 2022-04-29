package com.ecommerce.controller.client;

import com.ecommerce.model.Cart;
import com.ecommerce.model.User;
import com.ecommerce.service.CartLineService;
import com.ecommerce.service.CartService;
import com.ecommerce.service.impl.CartLineServiceImpl;
import com.ecommerce.service.impl.CartServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @author Nguyen Khac Hung
 */
@WebServlet("/customer/order")
public class CustomerOrdersServlet extends HttpServlet {
    CartService cartService = new CartServiceImpl();
    CartLineService cartLineService = new CartLineServiceImpl();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User account = (User) req.getSession().getAttribute("account");
        List<Cart> orders = null;
        try {
            orders = cartService.getCartByUserId(account.getUserID());
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("no orders: " + orders.size());
        System.out.println("user id - " + account.getUserID());
        req.setAttribute("orders", orders);


        RequestDispatcher rd = req.getRequestDispatcher("/view/customer/account-orders.jsp");
        rd.forward(req, resp);
    }

}
