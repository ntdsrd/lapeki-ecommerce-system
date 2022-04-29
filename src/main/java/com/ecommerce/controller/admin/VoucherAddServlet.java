package com.ecommerce.controller.admin;

import com.ecommerce.model.Voucher;
import com.ecommerce.service.VoucherService;
import com.ecommerce.service.impl.VoucherServiceImpl;
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
import java.sql.Date;
import java.util.List;

/**
 * @author Nguyen Tung Lam
 * @overview VoucherAddServlet is a controller servlet used to handle the use
 * case of Adding a new Voucher to the database
 */
@WebServlet(urlPatterns = "/admin/voucher/add")
public class VoucherAddServlet extends HttpServlet {
    VoucherService voucherService = new VoucherServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Voucher> vouchers = voucherService.getAllVouchers();
        req.setAttribute("vouchers", vouchers);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/view/admin/voucher-add.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Voucher voucher = new Voucher();
        // Create a factory for disk-based file items
        DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
        // Create a new file upload handler
        ServletFileUpload servletFileUpload = new ServletFileUpload(diskFileItemFactory);

        try {
            // parse the request to fileItems
            List<FileItem> items = servletFileUpload.parseRequest(req);

            for (FileItem item : items) {
                System.out.println(item.getFieldName());
                if (item.getFieldName().equals("voucherCode")) {
                    voucher.setVoucherCode(item.getString());
                    System.out.println(item.getFieldName() + " - " + item.getString());
                } else if (item.getFieldName().equals("discountPercent")) {
                    voucher.setDiscountPercentage(Integer.parseInt(item.getString()));
                    System.out.println(item.getFieldName() + " - " + item.getString());
                } else if (item.getFieldName().equals("expireDate")) {
                    voucher.setExpireDate(Date.valueOf(item.getString()));
                    System.out.println(item.getFieldName() + " - " + item.getString());
                }
            }
            voucherService.insertVoucher(voucher);
            resp.sendRedirect("list");
        } catch (FileUploadException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}