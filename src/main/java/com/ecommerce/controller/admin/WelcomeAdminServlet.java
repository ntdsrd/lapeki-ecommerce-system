package com.ecommerce.controller.admin;

import com.ecommerce.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @author Nguyen Van Giang
 */
@WebServlet("/admin")
public class WelcomeAdminServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Object obj = session.getAttribute("account");
        User user = (User) obj;
        req.setAttribute("username", user.getUsername());
        req.getRequestDispatcher("/admin/dashboard").forward(req, resp);
    }
}
