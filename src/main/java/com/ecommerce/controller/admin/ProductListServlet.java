package com.ecommerce.controller.admin;

import com.ecommerce.model.Product;
import com.ecommerce.service.ProductService;
import com.ecommerce.service.impl.ProductServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @author Do Duc Dung
 * @overview ProductListServlet is the servlet used to handle the use case of
 * displaying the list of all
 */
@WebServlet("/admin/product/list")
public class ProductListServlet extends HttpServlet {
    ProductService productService = new ProductServiceImpl();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> productList = productService.getAllProducts();
        req.setAttribute("products", productList);

        resp.setContentType("text/html");
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/view/admin/product-list.jsp");
        requestDispatcher.forward(req, resp);

    }

}
