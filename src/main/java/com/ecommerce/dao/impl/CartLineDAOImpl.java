package com.ecommerce.dao.impl;

import com.ecommerce.connection.DatabaseConnection;
import com.ecommerce.dao.CartLineDAO;
import com.ecommerce.dao.UserDAO;
import com.ecommerce.model.Cart;
import com.ecommerce.model.CartLine;
import com.ecommerce.model.Product;
import com.ecommerce.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


/**
 * @author Nguyen Khac Hung
 * @overview CartLineDAO is an abstract interface which facilitates
 * communication to CartLine table in database.
 */
public class CartLineDAOImpl implements CartLineDAO {
    Connection connection = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    UserDAO userDao = new UserDAOImpl();

    /**
     * Insert a new CartLine to database
     *
     * @param cartLine - a new cartLine
     */
    @Override
    public void insertCartLine(CartLine cartLine) {
        connection = DatabaseConnection.getConnection();
        String sql = "INSERT INTO cartline(cart_id, product_id, quantity, unit_price) VALUES (?,?,?,?)";

        try {
            ps = connection.prepareStatement(sql);

            ps.setInt(1, cartLine.getCart().getCartID());
            ps.setInt(2, cartLine.getProduct().getProductID());
            ps.setInt(3, cartLine.getQuantity());
            ps.setLong(4, cartLine.getUnitPrice());

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
     * Update an existing CartLine in the database
     *
     * @param cartLine - a cartLine to be updated in the database
     * @return true if cartLine is updated, false if not
     */
    @Override
    public boolean updateCartLine(CartLine cartLine) {
        connection = DatabaseConnection.getConnection();
        String sql = "UPDATE cartline SET cart_id = ?, product_id = ?, quantity = ?, unit_price = ? WHERE cartline_id = ?";
        boolean isUpdated = false;

        try {
            ps = connection.prepareStatement(sql);

            ps.setInt(1, cartLine.getCart().getCartID());
            ps.setInt(2, cartLine.getProduct().getProductID());
            ps.setInt(3, cartLine.getQuantity());
            ps.setLong(4, cartLine.getUnitPrice());
            ps.setInt(5, cartLine.getCartLineID());

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
     * Delete an existing CartLine
     *
     * @param cartLineID - the id of the cartLine to be deleted
     * @return true if the cartLine is deleted, or false if not
     */
    @Override
    public boolean deleteCartLine(int cartLineID) {
        connection = DatabaseConnection.getConnection();
        String sql = "DELETE FROM cartline WHERE cartline_id = ?";
        boolean isDeleted = false;
        try {
            ps = connection.prepareStatement(sql);

            ps.setInt(1, cartLineID);
            isDeleted = ps.executeUpdate() > 0;

        } catch (Exception e) {
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
     * Get an CartLine from database by its cartLineID
     *
     * @param cartLineID - the id of desired CartLine
     * @return Either the desired CartLine if found or null if not
     */
    @Override
    public CartLine getCartLineByID(int cartLineID) {
        connection = DatabaseConnection.getConnection();
        String sql = "SELECT " +
                "cartline.cartline_id, " +
                "cartline.quantity, " +
                "cartline.unit_price, " +
                "cart.cart_id, " +
                "cart.order_date, " +
                "product.product_name, " +
                "product.product_price " +
                "FROM cartline " +
                "INNER JOIN cart " +
                "ON cartline.cart_id = cart.cart_id " +
                "INNER JOIN product " +
                "ON cartline.product_id = product.product_id " +
                "WHERE cartline.cartline_id = ?";
        CartLine cartLine = null;
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, cartLineID);
            rs = ps.executeQuery();

            while (rs.next()) {
                User user = userDao.getUserByID(rs.getInt("user_id"));

                Cart cart = new Cart();
                cart.setUser(user);
                cart.setOrderDate(rs.getDate("order_date"));

                Product product = new Product();
                product.setProductName(rs.getString("product_name"));
                product.setProductPrice(rs.getLong("product_price"));

                int quantity = rs.getInt("quantity");
                long unitPrice = rs.getLong("unit_price");

                cartLine = new CartLine(cartLineID, quantity, unitPrice, product, cart);

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
        return cartLine;
    }

    @Override
    public List<CartLine> getCartLineByCartID(int cartID) {
        connection = DatabaseConnection.getConnection();
        List<CartLine> cartLines = new ArrayList<>();
        CartLine cartLine = null;
        String sql = "SELECT cl.cartline_id, cl.cart_id, cl.quantity,cl.product_id, cl.unit_price, p.product_name, p.product_img, product_price " +
                "FROM cartline cl " +
                "INNER JOIN product p " +
                "ON cl.product_id = p.product_id " +
                "WHERE cl.cart_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, cartID);
            rs = ps.executeQuery();

            while (rs.next()) {
                int cartLineID = rs.getInt("cartline_id");

                Cart cart = new Cart();

                Product product = new Product();
                product.setProductID(rs.getInt("product_id"));
                product.setProductName(rs.getString("product_name"));
                product.setProductPrice(rs.getLong("product_price"));
                product.setProductImg(rs.getString("product_img"));

                int quantity = rs.getInt("quantity");
                long unitPrice = rs.getLong("unit_price");

                cartLine = new CartLine(cartLineID, quantity, unitPrice, product, cart);
                cartLines.add(cartLine);
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

        return cartLines;
    }

    /**
     * Get all CartLines that exist in the database
     *
     * @return Either the list of CartLines or null if there is no CartLine
     */
    @Override
    public List<CartLine> getAllCartLines() {
        connection = DatabaseConnection.getConnection();
        String sql = "SELECT " +
                "cartline.cartline_id, " +
                "cartline.quantity, " +
                "cartline.unit_price, " +
                "cart.cart_id, " +
                "cart.order_date, " +
                "product.product_name, " +
                "product.product_price " +
                "FROM cartline " +
                "INNER JOIN cart " +
                "ON cartline.car_id = cart.cart_id " +
                "INNER JOIN product " +
                "ON cartline.product_id = product.product_id ";
        List<CartLine> list = new ArrayList<CartLine>();
        CartLine cartLine = null;

        try {
            ps = connection.prepareStatement(sql);

            rs = ps.executeQuery();

            while (rs.next()) {
                User user = userDao.getUserByID(rs.getInt("u_id"));

                Cart cart = new Cart();
                cart.setUser(user);
                cart.setOrderDate(rs.getDate("order_date"));

                Product product = new Product();
                product.setProductName(rs.getString("product_name"));
                product.setProductPrice(rs.getLong("product_price"));

                int cartLineID = rs.getInt("cartline_id");
                int quantity = rs.getInt("quantity");
                long unitPrice = rs.getLong("unit_price");

                cartLine = new CartLine(cartLineID, quantity, unitPrice, product, cart);

                list.add(cartLine);
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
