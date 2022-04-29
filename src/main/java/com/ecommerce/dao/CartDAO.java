package com.ecommerce.dao;

import com.ecommerce.model.Cart;

import java.util.List;

/**
 * @author Nguyen The Dat
 * @overview CartDAO is an interface which facilitates communication to database
 */
public interface CartDAO {

    /**
     * Insert a new cart record into Cart table
     *
     * @param cart
     */
    int insertCart(Cart cart);


    /**
     * Update cart in database
     *
     * @param cart
     */
    boolean updateCart(Cart cart);

    /**
     * Update cart status in database
     *
     * @param cartID
     * @param cartStatus
     * @return
     */
    boolean updateCartStatus(int cartID, String cartStatus);

    /**
     * Delete a cart in database by using it's id
     *
     * @param id
     * @return
     */
    boolean deleteCart(int id);

    /**
     * Get Cart from database by using it's id
     *
     * @param cartId
     * @return
     */
    Cart getCartById(int cartId);

    /**
     * Get Cart from database by using it's user id
     *
     * @param userId
     * @return
     */
    List<Cart> getCartByUserId(int userId);


    /**
     * Get all carts in database
     *
     * @return
     */
    List<Cart> getAllCarts();

    /**
     * Search all carts by using email
     *
     * @param email
     * @return
     */
    List<Cart> searchCartByEmail(String email);


    /**
     * Search all carts by using phone
     *
     * @param phone
     * @return
     */
    List<Cart> searchCartByPhone(String phone);
}
