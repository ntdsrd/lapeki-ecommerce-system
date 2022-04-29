package com.ecommerce.controller.admin;

import com.ecommerce.service.ProductService;
import com.ecommerce.service.impl.ProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author Do Duc Dung
 * @overview ProductDeleteServlet is a servlet used to handle the use-case of
 * deleting a product from database
 */
@WebServlet("/admin/product/delete")
public class ProductDeleteServlet extends HttpServlet {
    ProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        productService.deleteProduct(Integer.parseInt(id));

        resp.sendRedirect(req.getContextPath() + "/admin/product/list");


    }


}
