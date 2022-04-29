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
 * @overview CategoryEditServlet is a servlet used to handle the use case of editing a category
 */

@WebServlet("/admin/category/edit")
public class CategoryEditServlet extends HttpServlet {
    CategoryService categoryService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int categoryID = Integer.parseInt(req.getParameter("id"));
        Category category = categoryService.getCategoryByID(categoryID);
        List<Category> categories = categoryService.getAllCategories();
        req.setAttribute("categories", categories);
        req.setAttribute("category", category);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/view/admin/category-edit.jsp");
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
                    System.out.println(item.getString());
                    category.setCategoryName(item.getString());
                } else if (item.getFieldName().equals("categoryID")) {
                    System.out.println(item.getString());
                    String tmp = item.getString();
                    int categoryID = Integer.parseInt(tmp);
                    category.setCategoryID(categoryID);
                }
                categoryService.updateCategory(category);
                resp.sendRedirect(req.getContextPath() + "/admin/category/list");

            }
        } catch (FileUploadException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
