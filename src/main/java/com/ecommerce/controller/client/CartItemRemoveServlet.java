package com.ecommerce.controller.client;

import com.ecommerce.model.CartLine;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

/**
 * @author Nguyen Van Giang
 */
@WebServlet("/customer/cart/remove")
public class CartItemRemoveServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession httpSession = req.getSession();

        Object object = httpSession.getAttribute("cart");
        String productID = req.getParameter("productID");
        if (object != null) {
            Map<Integer, CartLine> map = (Map<Integer, CartLine>) object;

            map.remove(Integer.parseInt(productID));

            httpSession.setAttribute("cart", map);
        }

        resp.sendRedirect(req.getContextPath() + "/customer/cart");
    }
}
