package com.ecommerce.controller.client;

import com.ecommerce.model.User;
import com.ecommerce.service.UserService;
import com.ecommerce.service.impl.UserServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;

/**
 * @author Luu Thi Thom
 */
@WebServlet("/customer/profile")
public class CustomerAccountServlet extends HttpServlet {
    UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher rd = req.getRequestDispatcher("/view/customer/account-profile.jsp");
        rd.forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();

        User account = (User) session.getAttribute("account");
        // Unchangeable customer details
        int userID = account.getUserID();

        String username = account.getUsername();

        String email = account.getEmail();

        int roleID = account.getRoleID();

        // Changeable
        String mobile = req.getParameter("mobile");

        String fullname = req.getParameter("fullname");

        String gender = req.getParameter("gender");

        Date dob = Date.valueOf(req.getParameter("dob"));

        String address = req.getParameter("address");

        String changePassword = req.getParameter("change-password");


        String password = account.getPassword();
        if (changePassword != null) {//			String oldPassword = req.getParameter("old-password");
            String newPassword = req.getParameter("new-password");
            System.out.println(newPassword);
            password = newPassword;
        }
        account = new User(userID, username, password, fullname, mobile, email, address, gender, dob, roleID);

        userService.updateUser(account);

        session.setAttribute("account", account);

        resp.sendRedirect(req.getContextPath() + "/customer/profile");
    }

}
