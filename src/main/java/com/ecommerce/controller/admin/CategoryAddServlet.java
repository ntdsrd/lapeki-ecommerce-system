package com.ecommerce.controller.admin;

import com.ecommerce.model.Category;
import com.ecommerce.service.CategoryService;
import com.ecommerce.service.impl.CategoryServiceImpl;
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
 * @author Luu Thi Thom
 * @overview CategoryAddServlet is a controller servlet used to handle the use
 * case of Adding a new Category to the database
 */
@WebServlet(urlPatterns = "/admin/category/add")
public class CategoryAddServlet extends HttpServlet {
    CategoryService categoryService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Category> categories = categoryService.getAllCategories();

        req.setAttribute("categories", categories);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/view/admin/category-add.jsp");
        requestDispatcher.forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Category category = new Category();
        // Create a factory for disk-based file items
        DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
        // Create a new file upload handler
        ServletFileUpload servletFileUpload = new ServletFileUpload(diskFileItemFactory);

        try {
            // parse the request to fileItems
            List<FileItem> items = servletFileUpload.parseRequest(req);
            for (FileItem item : items) {
                if (item.getFieldName().equals("categoryName")) {
                    category.setCategoryName(item.getString());
                    System.out.println(item.getFieldName() + "-" + item.getString());
                }
            }
            categoryService.insertCategory(category);

            resp.sendRedirect("list");
        } catch (FileUploadException e) {
            e.printStackTrace();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
