package com.ecommerce.dao;

import com.ecommerce.model.Voucher;

import java.util.List;


/**
 * @author Luu Thi Thom
 * @overview VoucherDAO is an abstract interface which facilitates
 * communication to Voucher table in database.
 */
public interface VoucherDAO {

    /**
     * Insert a new Voucher to database
     *
     * @param voucher - a new voucher
     */

    void insertVoucher(Voucher voucher);

    /**
     * Update an existing Voucher in the database
     *
     * @param voucher - a voucher to be updated in the database
     * @return true if voucher is updated, false if not
     */
    boolean updateVoucher(Voucher voucher);

    /**
     * Delete an existing Voucher
     *
     * @param voucherID - the id of the voucher to be deleted
     * @return true if the voucher is deleted, or false if not
     */
    boolean deleteVoucher(int voucherID);

    /**
     * Get an voucher from database by its voucherID
     *
     * @param voucherID - the id of desired Voucher
     * @return Either the desired Voucher if found or null if not
     */
    Voucher getVoucherByID(int voucherID);

    /**
     * Get a Voucher from database by its voucherCode
     *
     * @param voucherCode - the name of desired voucher
     * @return Either the desired voucher if found or null if not
     */

    Voucher getVoucherByCode(String voucherCode);

    /**
     * Get all Voucher that exist in the database
     *
     * @return Either the list of Voucher or null if there is no voucher
     */
    List<Voucher> getAllVouchers();

    /**
     * Search for a Voucher by code
     *
     * @param voucherCode - the code to be searched for
     * @return Either the list of matching result or null if there is no matches
     */
    List<Voucher> searchVoucherByCode(String voucherCode);
}
