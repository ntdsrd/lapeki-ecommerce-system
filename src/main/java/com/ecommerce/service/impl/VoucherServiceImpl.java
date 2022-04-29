package com.ecommerce.service.impl;

import com.ecommerce.dao.VoucherDAO;
import com.ecommerce.dao.impl.VoucherDAOImpl;
import com.ecommerce.model.Voucher;
import com.ecommerce.service.VoucherService;

import java.util.List;

/**
 * @author Nguyen Tung Lam
 * @overview VoucherServiceImpl implements all methods of VoucherService
 * interface.
 */
public class VoucherServiceImpl implements VoucherService {
    VoucherDAO voucherDAO = new VoucherDAOImpl();

    /**
     * Insert a new voucher
     *
     * @param voucher - the voucher to be inserted to database
     */
    public void insertVoucher(Voucher voucher) {
        voucherDAO.insertVoucher(voucher);
    }

    /**
     * Update an existing voucher
     *
     * @param voucher - the voucher to be updated
     * @return true if the voucher is updated, or false if not
     */
    public boolean updateVoucher(Voucher voucher) {
        return voucherDAO.updateVoucher(voucher);
    }

    /**
     * Delete an existing voucher
     *
     * @param voucherID - the id of the voucher to be deleted
     * @return true if the voucher is deleted, or false if not
     */
    public boolean deleteVoucher(int voucherID) {
        return voucherDAO.deleteVoucher(voucherID);
    }

    /**
     * Retrieve a voucher by its id
     *
     * @param voucherID - the id of the desired voucher
     * @return
     */
    public Voucher getVoucherByID(int voucherID) {
        return voucherDAO.getVoucherByID(voucherID);
    }

    /**
     * Retrieve a voucher by its code
     *
     * @param voucherCode - the code of the desired voucher
     * @return
     */
    public Voucher getVoucherByCode(String voucherCode) {
        return voucherDAO.getVoucherByCode(voucherCode);
    }

    /**
     * Retrieve all voucher
     *
     * @return Either the list of all vouchers or null if there is none
     */
    public List<Voucher> getAllVouchers() {
        return voucherDAO.getAllVouchers();
    }

    /**
     * Search for a voucher by its code
     *
     * @param voucherCode - the code of the desired voucher
     * @return Either the list of all matching vouchers or null if there is none
     */
    public List<Voucher> searchVoucherByCode(String voucherCode) {
        return voucherDAO.searchVoucherByCode(voucherCode);
    }
}