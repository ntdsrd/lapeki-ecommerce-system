package com.ecommerce.controller.client;

import com.ecommerce.model.CartLine;
import com.ecommerce.model.Product;
import com.ecommerce.service.ProductService;
import com.ecommerce.service.impl.ProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * @author Nguyen Van Giang
 */
@WebServlet("/customer/cart/add")
public class CartAddServlet extends HttpServlet {
    ProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productID = req.getParameter("productID");
        String quantity = req.getParameter("quantity");

        Product product = productService.getProductByID(Integer.parseInt(productID));
        CartLine cartLine = new CartLine();
        cartLine.setQuantity(Integer.parseInt(quantity));
        cartLine.setUnitPrice(product.getProductPrice());
        cartLine.setProduct(product);

        HttpSession httpSession = req.getSession();
        Object object = httpSession.getAttribute("cart");

        if (object == null) {
            Map<Integer, CartLine> map = new HashMap<Integer, CartLine>();
            map.put(cartLine.getProduct().getProductID(), cartLine);
            httpSession.setAttribute("cart", map);
        } else {
            Map<Integer, CartLine> map = (Map<Integer, CartLine>) object;

            CartLine existedCartLine = map.get(Integer.valueOf(productID));

            if (existedCartLine == null) {
                map.put(product.getProductID(), cartLine);
            } else {
                existedCartLine.setQuantity(existedCartLine.getQuantity() + Integer.parseInt(quantity));

            }

            httpSession.setAttribute("cart", map);
        }

        resp.sendRedirect(req.getContextPath() + "/product/detail?id=" + Integer.parseInt(productID));
    }
}
