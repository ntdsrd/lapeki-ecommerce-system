package com.ecommerce.controller.client;

import com.ecommerce.model.Category;
import com.ecommerce.model.Product;
import com.ecommerce.service.ProductService;
import com.ecommerce.service.impl.ProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

/**
 * @author Nguyen The Dat
 */
@WebServlet("/product/search")
public class ProductSearchByName extends HttpServlet {
    ProductService productService = new ProductServiceImpl();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("pname");

        System.out.println(name);

        // a list of all search result
        List<Product> results = productService.searchProductByName(name);

        // a list of products in ascending order of price
        List<Product> lowPrice = new ArrayList<Product>();
        lowPrice.addAll(results);
        lowPrice.sort(new Comparator<Product>() {
            @Override
            public int compare(Product o1, Product o2) {
                return -compareProductPrice(o1, o2);
            }
        });

        List<Product> highPrice = new ArrayList<Product>();
        highPrice.addAll(results);
        highPrice.sort(new Comparator<Product>() {
            @Override
            public int compare(Product o1, Product o2) {
                return compareProductPrice(o1, o2);
            }

        });


        List<Product> az = new ArrayList<Product>();
        az.addAll(results);
        az.sort(new Comparator<Product>() {

            @Override
            public int compare(Product o1, Product o2) {
                return compareProductName(o1, o2);
            }

        });

        List<Product> za = new ArrayList<Product>();
        za.addAll(results);
        za.sort(new Comparator<Product>() {

            @Override
            public int compare(Product o1, Product o2) {
                return -compareProductName(o1, o2);
            }

        });

        List<Category> categories = getCategories(results);
        System.out.println("No. categories: " + categories.size());


        req.setAttribute("results", results);
        req.setAttribute("lowPrice", lowPrice);
        req.setAttribute("highPrice", highPrice);
        req.setAttribute("az", az);
        req.setAttribute("za", za);
        req.setAttribute("categories", categories);
        req.setAttribute("pname", name);
        req.getRequestDispatcher("/view/customer/product-search-by-name.jsp").forward(req, resp);

    }

    /**
     * Comapre products by their prices
     */
    public int compareProductPrice(Product o1, Product o2) {
        if (o1.getProductPrice() < o2.getProductPrice())
            return 1;
        if (o1.getProductPrice() > o2.getProductPrice())
            return -1;
        return 0;
    }

    /**
     * Comapre products by their name
     */
    public int compareProductName(Product o1, Product o2) {
        return o1.getProductName().compareTo(o2.getProductName());
    }


    public List<Category> getCategories(List<Product> list) {
        List<Category> cat = new ArrayList<Category>();

        for (Product p : list) {
            if (!cat.contains(p.getCategory())) {
                cat.add(p.getCategory());
            }
        }


        return cat;

    }
}