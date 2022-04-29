package com.ecommerce.dao.impl;


import com.ecommerce.connection.DatabaseConnection;
import com.ecommerce.dao.VoucherDAO;
import com.ecommerce.model.Voucher;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Luu Thi Thom
 * @overview VoucherDAO is an abstract interface which facilitates
 * communication to Voucher table in database.
 */
public class VoucherDAOImpl implements VoucherDAO {
    Connection connection = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    /**
     * Insert a new Voucher to database
     *
     * @param voucher - a new voucher
     */
    @Override
    public void insertVoucher(Voucher voucher) {
        connection = DatabaseConnection.getConnection();
        String sql = "INSERT INTO voucher(voucher_code, discount_percent, expire_date) VALUES (?,?,?)";

        try {
            ps = connection.prepareStatement(sql);

            ps.setString(1, voucher.getVoucherCode());
            ps.setInt(2, voucher.getDiscountPercentage());
            ps.setDate(3, voucher.getExpireDate());

            ps.executeUpdate();

        } catch (Exception e) {
            System.err.println(e.getMessage());
        } finally {
            try {
                ps.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * Update an existing Voucher in the database
     *
     * @param voucher - a voucher to be updated in the database
     * @return true if voucher is updated, false if not
     */
    public boolean updateVoucher(Voucher voucher) {
        connection = DatabaseConnection.getConnection();
        String sql = "UPDATE voucher SET voucher_code = ?, discount_percent = ?, expire_date = ? WHERE voucher_id = ?";
        boolean isUpdated = false;

        try {
            ps = connection.prepareStatement(sql);

            ps.setString(1, voucher.getVoucherCode());
            ps.setInt(2, voucher.getDiscountPercentage());
            ps.setDate(3, voucher.getExpireDate());
            ps.setInt(4, voucher.getVoucherID());


            isUpdated = ps.executeUpdate() > 0;


        } catch (Exception e) {
            System.err.println(e.getMessage());
        } finally {
            try {
                ps.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return isUpdated;
    }

    /**
     * Delete an existing Voucher
     *
     * @param voucherID - the id of the voucher to be deleted
     * @return true if the voucher is deleted, or false if not
     */
    @Override
    public boolean deleteVoucher(int voucherID) {
        connection = DatabaseConnection.getConnection();
        boolean isDeleted = false;
        String sql = "DELETE FROM voucher WHERE voucher_id = ?";

        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, voucherID);

            isDeleted = ps.executeUpdate() > 0;

        } catch (Exception e) {
            System.err.println(e.getMessage());
        } finally {
            try {
                ps.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return isDeleted;
    }

    /**
     * Get an Voucher from database by its voucherID
     *
     * @param voucherID - the id of desired Voucher
     * @return Either the desired Voucher if found or null if not
     */
    @Override
    public Voucher getVoucherByID(int voucherID) {
        connection = DatabaseConnection.getConnection();
        String sql = "SELECT * FROM voucher WHERE voucher_id = ?";
        Voucher voucher = null;
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, voucherID);
            rs = ps.executeQuery();

            if (rs.next()) {
                String voucherCode = rs.getString("voucher_code");
                int discountPercentage = rs.getInt("discount_percent");
                java.sql.Date expireDate = rs.getDate("expire_date");

                voucher = new Voucher(voucherID, voucherCode, discountPercentage, expireDate);

            }

        } catch (Exception e) {
            System.err.println(e.getMessage());
        } finally {
            try {
                rs.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                ps.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return voucher;
    }

    /**
     * Get a Voucher from database by its voucherCode
     *
     * @param voucherCode - the code of desired Voucher
     * @return Either the desired Voucher if found or null if not
     */
    @Override
    public Voucher getVoucherByCode(String voucherCode) {
        connection = DatabaseConnection.getConnection();
        String sql = "SELECT * FROM voucher WHERE voucher_code = ?";
        Voucher voucher = null;
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, voucherCode);
            rs = ps.executeQuery();

            if (rs.next()) {
                int voucherID = rs.getInt("voucher_id");
                int discountPercentage = rs.getInt("discount_percent");
                java.sql.Date expireDate = rs.getDate("expire_date");
                voucher = new Voucher(voucherID, voucherCode, discountPercentage, expireDate);

            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
        } finally {
            try {
                rs.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                ps.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return voucher;
    }

    /**
     * Get all Vouchers that exist in the database
     *
     * @return Either the list of Vouchers or null if there is no Voucher
     */
    @Override
    public List<Voucher> getAllVouchers() {
        connection = DatabaseConnection.getConnection();
        List<Voucher> list = new ArrayList<Voucher>();
        Voucher voucher = null;
        String sql = "SELECT * FROM voucher";

        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                int voucherID = rs.getInt("voucher_id");
                String voucherCode = rs.getString("voucher_code");
                int discountPercentage = rs.getInt("discount_percent");
                java.sql.Date expireDate = rs.getDate("expire_date");

                voucher = new Voucher(voucherID, voucherCode, discountPercentage, expireDate);

                list.add(voucher);

            }

        } catch (Exception e) {
            System.err.println(e.getMessage());
        } finally {
            try {
                rs.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                ps.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    /**
     * Search for a Voucher by code
     *
     * @param voucherCode - the code to be searched for
     * @return Either the list of matching result or null if there is no matches
     */
    @Override
    public List<Voucher> searchVoucherByCode(String voucherCode) {
        connection = DatabaseConnection.getConnection();
        List<Voucher> list = new ArrayList<Voucher>();
        Voucher voucher = null;
        String sql = "SELECT * FROM voucher WHERE voucher_code LIKE ?";

        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + voucherCode + "%");
            rs = ps.executeQuery();

            while (rs.next()) {
                int voucherID = rs.getInt("voucher_id");
                int discountPercentage = rs.getInt("discount_percent");
                java.sql.Date expireDate = rs.getDate("expire_date");
                voucher = new Voucher(voucherID, voucherCode, discountPercentage, expireDate);

                list.add(voucher);


            }

        } catch (Exception e) {
            System.err.println(e.getMessage());
        } finally {
            try {
                rs.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                ps.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return list;
    }

}
