package com.ecommerce.controller.admin;

import com.ecommerce.model.Cart;
import com.ecommerce.service.CartService;
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
 * @author Nguyen Van Giang
 */
@WebServlet("/admin/cart/list")
public class CartListServlet extends HttpServlet {

    CartService cartService = new CartServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Cart> cartList = cartService.getAllCarts();
        req.setAttribute("carts", cartList);
        resp.setContentType("text/html");

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/view/admin/cart-list.jsp");
        requestDispatcher.forward(req, resp);
    }
}
