package com.ecommerce.controller.admin;

import com.ecommerce.model.Category;
import com.ecommerce.model.Product;
import com.ecommerce.service.CategoryService;
import com.ecommerce.service.ProductService;
import com.ecommerce.service.impl.CategoryServiceImpl;
import com.ecommerce.service.impl.ProductServiceImpl;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

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
 * @overview ProductAddServlet is a controller servlet used to handle the use
 * case of Adding a new Product to the database
 */
@WebServlet(urlPatterns = "/admin/product/add")
public class ProductAddServlet extends HttpServlet {
    ProductService productService = new ProductServiceImpl();
    CategoryService categoryService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Category> categories = categoryService.getAllCategories();
        System.out.println(categories.size());

        req.setAttribute("categories", categories);


        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/view/admin/product-add.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Product product = new Product();
        // Create a factory for disk-based file items
        DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
        // Create a new file upload handler
        ServletFileUpload servletFileUpload = new ServletFileUpload(diskFileItemFactory);

        try {
            // parse the request to fileItems
            List<FileItem> items = servletFileUpload.parseRequest(req);

            for (FileItem item : items) {

                if (item.getFieldName().equals("productName")) {
                    product.setProductName(item.getString());
                    System.out.println(item.getFieldName() + " - " + item.getString());

                } else if (item.getFieldName().equals("productPrice")) {
                    product.setProductPrice(Long.parseLong(item.getString()));
                    System.out.println(item.getFieldName() + " - " + item.getString());
                } else if (item.getFieldName().equals("instock")) {
                    product.setInstock(Integer.parseInt(item.getString()));
                    System.out.println(item.getFieldName() + " - " + item.getString());
                } else if (item.getFieldName().equals("productDesc")) {
                    product.setProductDesc(item.getString());
                    System.out.println(item.getFieldName() + " - " + item.getString());
                } else if (item.getFieldName().equals("category")) {
                    product.setCategory(categoryService.getCategoryByID(Integer.parseInt(item.getString())));
                    System.out.println(item.getFieldName() + " - " + item.getString());
                } else if (item.getFieldName().equals("productImg")) {


                    product.setProductImg(item.getString());
                    String imgs[] = item.getString().split(",");
                    for (String img : imgs) {
                        System.out.println(img);
                    }
                    System.out.println(item.getFieldName() + " - " + item.getString());

                }

            }
            productService.insertProduct(product);


//			resp.sendRedirect(req.getContextPath() + "/admin/product/list");

//			RequestDispatcher requestDispatcher = req.getRequestDispatcher(req.getContextPath() + "/admin/product/all");
//			requestDispatcher.forward(req, resp);

            resp.sendRedirect("list");

        } catch (FileUploadException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
