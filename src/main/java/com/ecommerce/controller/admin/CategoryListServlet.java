package com.ecommerce.controller.admin;

import com.ecommerce.model.Category;
import com.ecommerce.service.CategoryService;
import com.ecommerce.service.impl.CategoryServiceImpl;

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
 * @Overview CategoryListServlet is the servlet used to handle the use case of displaying the list of all
 */
@WebServlet("/admin/category/list")
public class CategoryListServlet extends HttpServlet {
    CategoryService categoryService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Category> categoryList = categoryService.getAllCategories();
        req.setAttribute("categoryList", categoryList);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/admin/category-list.jsp");
        dispatcher.forward(req, resp);
    }

}
