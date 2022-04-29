package com.ecommerce.controller.admin;

import com.ecommerce.service.CategoryService;
import com.ecommerce.service.impl.CategoryServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


/**
 * @author Luu Thi Thom
 * @overview CategoryDeleteServlet is a servlet used to handle the use-case of
 * deleting a  from database
 */
@WebServlet("/admin/category/delete")
public class CategoryDeleteServlet extends HttpServlet {
    CategoryService categoryService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        categoryService.deleteCategory(Integer.parseInt(id));

        resp.sendRedirect(req.getContextPath() + "/admin/category/list");
    }

}
