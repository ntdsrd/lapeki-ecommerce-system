package com.ecommerce.controller.admin;

import com.ecommerce.model.User;
import com.ecommerce.service.UserService;
import com.ecommerce.service.impl.UserServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @author Nguyen Khac Hung
 * @overview UserListServlet is the servlet used to handle the use case of displaying the list of all users
 */
@WebServlet("/admin/user/list")
public class UserListServlet extends HttpServlet {
    UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<User> userList = userService.getAllUsers();
        req.setAttribute("userList", userList);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/admin/user-list.jsp");
        dispatcher.forward(req, resp);
    }
}
