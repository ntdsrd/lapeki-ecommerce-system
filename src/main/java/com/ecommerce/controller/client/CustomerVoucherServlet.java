package com.ecommerce.controller.client;

import com.ecommerce.model.Voucher;
import com.ecommerce.service.VoucherService;
import com.ecommerce.service.impl.VoucherServiceImpl;

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
 */
@WebServlet("/customer/voucher")
public class CustomerVoucherServlet extends HttpServlet {
    VoucherService voucherService = new VoucherServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        List<Voucher> list = voucherService.getAllVouchers();
        System.out.println(list.size());
        req.setAttribute("vouchers", list);

        RequestDispatcher rd = req.getRequestDispatcher("/view/customer/account-voucher.jsp");
        rd.forward(req, resp);
    }

}
