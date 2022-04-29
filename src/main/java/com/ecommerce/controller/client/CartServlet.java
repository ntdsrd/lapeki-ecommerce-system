package com.ecommerce.controller.client;

import com.ecommerce.model.Voucher;
import com.ecommerce.service.VoucherService;
import com.ecommerce.service.impl.VoucherServiceImpl;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * @author Nguyen Van Giang
 */
@WebServlet("/customer/cart")
public class CartServlet extends HttpServlet {
    VoucherService voucherService = new VoucherServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<Voucher> list = voucherService.getAllVouchers();
        System.out.println(list.size());
        req.setAttribute("vouchers", list);

        HttpSession httpSession = req.getSession();
        Object object = httpSession.getAttribute("cart");
        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/customer/list-cart.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
        ServletFileUpload servletFileUpload = new ServletFileUpload(diskFileItemFactory);

        try {
            List<FileItem> items = servletFileUpload.parseRequest(req);
            for (FileItem item : items) {
                if (item.getFieldName().equals("subtotal")) {
                    String tmp = item.getString();
                    int subtotal = Integer.parseInt(tmp);
                    System.out.println(subtotal);
                    System.out.println(subtotal);
                    req.setAttribute("subtotal", subtotal);
                } else if (item.getFieldName().equals("discount")) {
                    String tmp = item.getString();
                    int discount = Integer.parseInt(tmp);
                    System.out.println(discount);
                    req.setAttribute("discount", discount);
                } else if (item.getFieldName().equals("total")) {
                    String tmp = item.getString();
                    int total = Integer.parseInt(tmp);
                    System.out.println(total);
                    req.setAttribute("total", total);
                } else if (item.getFieldName().equals("voucherID")) {
                    String tmp = item.getString();
                    int voucherID = Integer.parseInt(tmp);
                    System.out.println(voucherID);
                    req.setAttribute("voucherID", voucherID);
                }
            }
            RequestDispatcher rd = req.getRequestDispatcher("/view/customer/checkout.jsp");
            rd.forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
