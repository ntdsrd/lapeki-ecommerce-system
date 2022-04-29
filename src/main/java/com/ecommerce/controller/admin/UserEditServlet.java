package com.ecommerce.controller.admin;

import com.ecommerce.model.User;
import com.ecommerce.service.UserService;
import com.ecommerce.service.impl.UserServiceImpl;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.annotation.processing.FilerException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

/**
 * @author Nguyen Khac Hung
 * @overview UserEditServlet is a servlet used to handle the use-case of
 * editing a user
 */
@WebServlet("/admin/user/edit")
public class UserEditServlet extends HttpServlet {
    UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        User user = userService.getUserById(id);
        req.setAttribute("user", user);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/admin/user-edit.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String gender = null;
        User user = new User();
        DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
        ServletFileUpload servletFileUpload = new ServletFileUpload(diskFileItemFactory);

        try {
            List<FileItem> items = servletFileUpload.parseRequest(req);
            for (FileItem item : items) {
                if (item.getFieldName().equals("email")) {
                    System.out.println(item.getString());
                    user.setEmail(item.getString());
                } else if (item.getFieldName().equals("username")) {
                    System.out.println(item.getString());
                    user.setUsername(item.getString());
                } else if (item.getFieldName().equals("fullname")) {
                    System.out.println(item.getString());
                    user.setFullname(item.getString());
                } else if (item.getFieldName().equals("password")) {
                    System.out.println(item.getString());
                    user.setPassword(item.getString());
                } else if (item.getFieldName().equals("mobile")) {
                    System.out.println(item.getString());
                    user.setMobile(item.getString());
                } else if (item.getFieldName().equals("address")) {
                    System.out.println(item.getString());
                    user.setAddress(item.getString());
                } else if (item.getFieldName().equals("gender")) {
                    String tmp = item.getString();
                    int genderID = Integer.parseInt(tmp);
                    if (genderID == 1) {
                        gender = "Male";
                    } else if (genderID == 2) {
                        gender = "Female";
                    } else {
                        gender = "Other";
                    }
                    System.out.println(gender);
                    user.setGender(gender);
                } else if (item.getFieldName().equals("dob")) {
                    System.out.println(item.getString());
                    user.setDob(Date.valueOf(item.getString()));
                } else if (item.getFieldName().equals("roleID")) {
                    System.out.println(item.getString());
                    String tmp = item.getString();
                    int roleID = Integer.parseInt(tmp);
                    user.setRoleID(roleID);
                } else if (item.getFieldName().equals("userID")) {
                    System.out.println(item.getString());
                    String tmp = item.getString();
                    int userID = Integer.parseInt(tmp);
                    user.setUserID(userID);
                }
            }

            userService.updateUser(user);

            resp.sendRedirect(req.getContextPath() + "/admin/user/list");
        } catch (FilerException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect(req.getContextPath() + "/admin/user/add?e=1");
        }
    }

}
