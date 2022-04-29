package com.ecommerce.dao.impl;

import com.ecommerce.connection.DatabaseConnection;
import com.ecommerce.dao.CartDAO;
import com.ecommerce.model.Cart;
import com.ecommerce.model.User;
import com.ecommerce.model.Voucher;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Nguyen The Dat
 */
public class CartDAOImpl implements CartDAO {
    Connection connection = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    /**
     * @param cart
     * @effects Insert a new cart record into Cart table
     */
    @Override
    public int insertCart(Cart cart) {
        connection = DatabaseConnection.getConnection();
        String sql = "INSERT INTO cart(voucher_id, user_id, order_date, status, payment_mode, total) VALUES (?, ?, ?, ?,?, ?)";
        int cartID = 0;
        try {
            ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, cart.getVoucher().getVoucherID());
            ps.setInt(2, cart.getUser().getUserID());
            ps.setDate(3, cart.getOrderDate());
            ps.setString(4, cart.getStatus());
            ps.setString(5, cart.getPaymentMode());
            ps.setLong(6, cart.getTotal());
            ps.executeUpdate();


            rs = ps.getGeneratedKeys();
            if (rs.next()) {
                cartID = rs.getInt(1);
            }

        } catch (SQLException e) {

            e.printStackTrace();
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
        return cartID;
    }

    /**
     * Update cart in database
     *
     * @param cart
     * @effects <pre>
     * 	if the update is successful
     * 		return true
     * 	else
     * 		return false
     * </pre>
     */
    @Override
    public boolean updateCart(Cart cart) {
        connection = DatabaseConnection.getConnection();
        String sql = "UPDATE cart SET voucher_id = ?, user_id = ?, order_date = ?, status =?, payment_mode =? , total = ? WHERE cart_id = ?";
        boolean isUpdated = false;

        try {
            ps = connection.prepareStatement(sql);

            ps.setInt(1, cart.getVoucher().getVoucherID());
            ps.setInt(2, cart.getUser().getUserID());
            ps.setDate(3, cart.getOrderDate());
            ps.setString(4, cart.getStatus());
            ps.setString(5, cart.getPaymentMode());
            ps.setLong(6, cart.getTotal());
            ps.setInt(7, cart.getCartID());

            isUpdated = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
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
     * Update cart status in database
     *
     * @param cart
     * @effects <pre>
     * 	if the update is successful
     * 		return true
     * 	else
     * 		return false
     * </pre>
     */
    @Override
    public boolean updateCartStatus(int cartID, String cartStatus) {
        connection = DatabaseConnection.getConnection();
        String sql = "UPDATE cart SET status =? WHERE cart_id = ?";
        boolean isUpdated = false;
        System.out.println(cartID + "" + cartStatus);
        try {
            ps = connection.prepareStatement(sql);

            ps.setString(1, cartStatus);
            ps.setInt(2, cartID);

            isUpdated = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
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
     * Delete a cart in database by using it's id
     *
     * @param id
     * @return
     * @effects <pre>
     * if delete successful
     * 		return true
     * else
     * 		return false
     *
     *          </pre>
     */
    @Override
    public boolean deleteCart(int cartId) {
        connection = DatabaseConnection.getConnection();
        // Query statement
        String sql = "DELETE FROM cart WHERE cart_id = ?";
        boolean isDeleted = false;
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, cartId);
            ps.executeUpdate();
            isDeleted = true;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
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
     * Get cart from database by using it's id
     *
     * @param cartId
     * @return
     * @effects <pre>
     * if id is  valid
     * 		get record and return
     * else
     * 		return null
     *          </pre>
     */
    @Override
    public Cart getCartById(int cartId) {
        connection = DatabaseConnection.getConnection();
        String sql = "SELECT c.order_date, c.status, c.payment_mode, c.total,u.user_email,u.user_id, u.user_fullname, u.user_phone, u.user_address, v.voucher_code, v.discount_percent, v.expire_date"
                + "	FROM cart c INNER JOIN user u" + "    ON c.user_id = u.user_id" + "    INNER JOIN voucher v"
                + "    ON c.voucher_id = v.voucher_id" + "	WHERE cart_id = ?";
        Cart cart = null;
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, cartId);

            rs = ps.executeQuery();

            if (rs.next()) {
                // create user object with required data
                User user = new User();
                user.setUserID(Integer.parseInt(rs.getString("user_id")));
                user.setFullname(rs.getString("user_fullname"));
                user.setMobile(rs.getString("user_phone"));
                user.setAddress(rs.getString("user_address"));
                user.setEmail(rs.getString("user_email"));

                // create voucher object with required data
                Voucher voucher = new Voucher();
                voucher.setVoucherCode(rs.getString("voucher_code"));
                voucher.setDiscountPercentage(rs.getInt("discount_percent"));
                voucher.setExpireDate(rs.getDate("expire_date"));

                // c.order_date, c.status, c.payment_mode, c.total,
                // create cart object
                Date orderDate = rs.getDate("order_date");
                String status = rs.getString("status");
                String paymentMode = rs.getString("payment_mode");
                long total = rs.getLong("total");
                cart = new Cart(cartId, user, orderDate, status, paymentMode, voucher, total);

            }

        } catch (SQLException e) {
            e.printStackTrace();
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
        return cart;
    }

    /**
     * Get all carts in database
     *
     * @return
     */
    @Override
    public List<Cart> getAllCarts() {
        connection = DatabaseConnection.getConnection();
        String sql = "SELECT c.cart_id, c.order_date, c.status,c.user_id, c.payment_mode, c.total, u.user_fullname, u.user_phone, u.user_address, v.voucher_code, v.discount_percent, v.expire_date\r\n"
                + "				FROM cart c INNER JOIN user u" + "				ON c.user_id = u.user_id"
                + "				INNER JOIN voucher v " + "				ON c.voucher_id = v.voucher_id;";
        List<Cart> carts = new ArrayList<>();
        try {
            ps = connection.prepareStatement(sql);

            rs = ps.executeQuery();

            while (rs.next()) {
                // create user object with required data
                User user = new User();
                user.setUserID(Integer.parseInt(rs.getString("user_id")));
                user.setFullname(rs.getString("user_fullname"));
                user.setMobile(rs.getString("user_phone"));
                user.setAddress(rs.getString("user_address"));

                // create voucher object with required data
                Voucher voucher = new Voucher();
                voucher.setVoucherCode(rs.getString("voucher_code"));
                voucher.setDiscountPercentage(rs.getInt("discount_percent"));
                voucher.setExpireDate(rs.getDate("expire_date"));

                // c.order_date, c.status, c.payment_mode, c.total,
                // create cart object
                int id = rs.getInt("cart_id");
                Date orderDate = rs.getDate("order_date");
                String status = rs.getString("status");
                String paymentMode = rs.getString("payment_mode");
                long total = rs.getLong("total");
                Cart cart = new Cart(id, user, orderDate, status, paymentMode, voucher, total);
                carts.add(cart);
            }
        } catch (SQLException e) {
            e.printStackTrace();
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
        return carts;
    }

    /**
     * Search all carts by using email
     *
     * @param email
     * @return
     * @effects return all carts match with this email
     */
    @Override
    public List<Cart> searchCartByEmail(String email) {
        connection = DatabaseConnection.getConnection();
        List<Cart> carts = new ArrayList<>();

        String sql = "SELECT c.cart_id, c.order_date, c.status, c.payment_mode, c.total, u.user_fullname, u.user_phone, u.user_address, v.voucher_code, v.discount_percent, v.expire_date \r\n"
                + "	FROM cart c\r\n" + "	INNER JOIN user u \r\n" + "    ON c.user_id = u.user_id\r\n"
                + "    INNER JOIN voucher v\r\n" + "    ON c.voucher_id = v.voucher_id\r\n"
                + "    WHERE u.user_email LIKE ?";

        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + email + "%");
            rs = ps.executeQuery();

            while (rs.next()) {
                // create user object with required data
                User user = new User();
                user.setFullname(rs.getString("user_fullname"));
                user.setMobile(rs.getString("user_phone"));
                user.setAddress(rs.getString("user_address"));

                // create voucher object with required data
                Voucher voucher = new Voucher();
                voucher.setVoucherCode(rs.getString("voucher_code"));
                voucher.setDiscountPercentage(rs.getInt("discount_percent"));
                voucher.setExpireDate(rs.getDate("expire_date"));

                // c.order_date, c.status, c.payment_mode, c.total,
                // create cart object
                int id = rs.getInt("cart_id");
                Date orderDate = rs.getDate("order_date");
                String status = rs.getString("status");
                String paymentMode = rs.getString("payment_mode");
                long total = rs.getLong("total");
                Cart cart = new Cart(id, user, orderDate, status, paymentMode, voucher, total);
                carts.add(cart);
            }

        } catch (SQLException e) {
            e.printStackTrace();
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

        return carts;
    }

    /**
     * Search all carts by using phone
     *
     * @param phone
     * @return
     * @effects <pre>
     * 	return all cart match with this phone
     *          </pre>
     */
    @Override
    public List<Cart> searchCartByPhone(String phone) {
        connection = DatabaseConnection.getConnection();
        List<Cart> carts = new ArrayList<>();

        String sql = "SELECT c.cart_id, c.order_date, c.status, c.payment_mode, c.total, u.user_fullname, u.user_phone, u.user_address, v.voucher_code, v.discount_percent, v.expire_date \r\n"
                + "	FROM cart c\r\n" + "	INNER JOIN user u \r\n" + "    ON c.user_id = u.user_id\r\n"
                + "    INNER JOIN voucher v\r\n" + "    ON c.voucher_id = v.voucher_id\r\n"
                + "    WHERE u.user_phone LIKE ?";

        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + phone + "%");
            rs = ps.executeQuery();

            while (rs.next()) {
                // create user object with required data
                User user = new User();
                user.setFullname(rs.getString("user_fullname"));
                user.setMobile(rs.getString("user_phone"));
                user.setAddress(rs.getString("user_address"));

                // create voucher object with required data
                Voucher voucher = new Voucher();
                voucher.setVoucherCode(rs.getString("voucher_code"));
                voucher.setDiscountPercentage(rs.getInt("discount_percent"));
                voucher.setExpireDate(rs.getDate("expire_date"));

                // c.order_date, c.status, c.payment_mode, c.total,
                // create cart object
                int id = rs.getInt("cart_id");
                Date orderDate = rs.getDate("order_date");
                String status = rs.getString("status");
                String paymentMode = rs.getString("payment_mode");
                long total = rs.getLong("total");
                Cart cart = new Cart(id, user, orderDate, status, paymentMode, voucher, total);
                carts.add(cart);
            }

        } catch (SQLException e) {
            e.printStackTrace();
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

        return carts;
    }

    @Override
    public List<Cart> getCartByUserId(int userId) {
        connection = DatabaseConnection.getConnection();
        String sql = "SELECT c.cart_id, c.order_date, c.status,c.user_id, c.payment_mode, c.total, u.user_fullname, u.user_phone, u.user_address, v.voucher_code, v.discount_percent, v.expire_date\r\n"
                + "				FROM cart c INNER JOIN user u" + "				ON c.user_id = u.user_id"
                + "				INNER JOIN voucher v " + "				ON c.voucher_id = v.voucher_id WHERE c.user_id = ? ORDER BY c.order_date DESC";
        List<Cart> carts = new ArrayList<>();
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, userId);

            rs = ps.executeQuery();

            while (rs.next()) {
                // create user object with required data
                User user = new User();
                user.setUserID(Integer.parseInt(rs.getString("user_id")));
                user.setFullname(rs.getString("user_fullname"));
                user.setMobile(rs.getString("user_phone"));
                user.setAddress(rs.getString("user_address"));

                // create voucher object with required data
                Voucher voucher = new Voucher();
                voucher.setVoucherCode(rs.getString("voucher_code"));
                voucher.setDiscountPercentage(rs.getInt("discount_percent"));
                voucher.setExpireDate(rs.getDate("expire_date"));

                // c.order_date, c.status, c.payment_mode, c.total,
                // create cart object
                int id = rs.getInt("cart_id");
                Date orderDate = rs.getDate("order_date");
                String status = rs.getString("status");
                String paymentMode = rs.getString("payment_mode");
                long total = rs.getLong("total");
                Cart cart = new Cart(id, user, orderDate, status, paymentMode, voucher, total);
                carts.add(cart);
            }
        } catch (SQLException e) {
            e.printStackTrace();
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
        return carts;
    }


}
