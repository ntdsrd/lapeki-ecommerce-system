package com.ecommerce.controller.client;

import com.ecommerce.model.Category;
import com.ecommerce.model.Product;
import com.ecommerce.service.CategoryService;
import com.ecommerce.service.ProductService;
import com.ecommerce.service.impl.CategoryServiceImpl;
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
 */
@WebServlet(urlPatterns = "/product/detail")
public class ProductDetailServlet extends HttpServlet {
    ProductService productService = new ProductServiceImpl();
    CategoryService categoryService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int productID = Integer.parseInt(req.getParameter("id"));

        Product product = productService.getProductByID(productID);

        Category cat = product.getCategory();

        List<Product> relatedProducts = productService.searchProductByCategory(cat.getCategoryID());
        System.out.println(relatedProducts.size());

        List<Category> categories = categoryService.getAllCategories();

        req.setAttribute("categories", categories);
        req.setAttribute("product", product);
        req.setAttribute("relatedProducts", relatedProducts);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/customer/product-detail.jsp");
        dispatcher.forward(req, resp);
    }
}