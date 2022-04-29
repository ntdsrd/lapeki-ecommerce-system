package com.ecommerce.controller.client;

import com.ecommerce.model.Cart;
import com.ecommerce.model.CartLine;
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
@WebServlet("/customer/order/detail")
public class CustomerOrderDetailServlet extends HttpServlet {
    CartService cartService = new CartServiceImpl();
    CartLineService cartLineServiceImpl = new CartLineServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int cartId = Integer.parseInt(req.getParameter("id"));

        User account = (User) req.getSession().getAttribute("account");

        List<Cart> carts = cartService.getCartByUserId(account.getUserID());

        System.out.println(carts.size());


        if (isIn(cartId, carts)) {

            Cart cart = cartService.getCartById(cartId);

            List<CartLine> cartLines = cartLineServiceImpl.getCartLineByCartID(cartId);

            req.setAttribute("order", cart);

            req.setAttribute("items", cartLines);

            RequestDispatcher rd = req.getRequestDispatcher("/view/customer/account-order-detail.jsp");
            rd.forward(req, resp);
        } else {
            RequestDispatcher rd = req.getRequestDispatcher("/view/error-pages/order-not-found.jsp");
            rd.forward(req, resp);


        }

    }

    public boolean isIn(int cartID, List<Cart> carts) {

        for (Cart c : carts) {
            if (c.getCartID() == cartID) {
                return true;
            }
        }

        return false;


    }

}
