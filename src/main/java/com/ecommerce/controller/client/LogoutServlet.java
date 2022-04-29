package com.ecommerce.controller.client;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

/**
 * @author Nguyen Tung Lam
 */
@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        session.removeAttribute("account"); //remove session
        session.removeAttribute("cart");

        Cookie[] cookies = req.getCookies();

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("username")) {
                    cookie.setMaxAge(0); // <=> remove cookie
                    resp.addCookie(cookie); // add again
                    break;
                }
            }
        }

        resp.sendRedirect(req.getContextPath() + "/");
    }
}
