package com.ecommerce.service.impl;

import com.ecommerce.dao.CartDAO;
import com.ecommerce.dao.impl.CartDAOImpl;
import com.ecommerce.model.Cart;
import com.ecommerce.service.CartService;

import java.util.List;

/**
 * @author Luu Thi Thom
 * @overview
 */
public class CartServiceImpl implements CartService {
    private CartDAO cartDAO = new CartDAOImpl();

    /**
     * Insert new cart
     *
     * @param cart
     */
    @Override
    public int insertCart(Cart cart) {
        return cartDAO.insertCart(cart);
    }

    /**
     * Update cart information
     *
     * @param cart
     * @return
     */
    @Override
    public boolean updateCart(Cart cart) {
        return cartDAO.updateCart(cart);
    }

    /**
     * Update cart information
     *
     * @param cartID
     * @return
     */
    @Override
    public boolean updateCartStatus(int cartID, String cartStatus) {
        return cartDAO.updateCartStatus(cartID, cartStatus);
    }

    /**
     * Delete a cart
     *
     * @param cartId
     * @return
     */
    @Override
    public boolean deleteCart(int cartId) {
        return cartDAO.deleteCart(cartId);
    }

    /**
     * get cart using id
     *
     * @param cartId
     * @return
     */
    @Override
    public Cart getCartById(int cartId) {
        return cartDAO.getCartById(cartId);
    }

    /**
     * Retrieve all carts
     * <p>
     * //     * @param all carts
     *
     * @return
     */
    @Override
    public List<Cart> getAllCarts() {
        return cartDAO.getAllCarts();
    }

    /**
     * Search cart using email
     *
     * @param email
     * @return
     */
    @Override
    public List<Cart> searchCartByEmail(String email) {
        return cartDAO.searchCartByEmail(email);
    }

    /**
     * Search cart using phone
     *
     * @param phone
     * @return
     */
    @Override
    public List<Cart> searchCartByPhone(String phone) {
        return cartDAO.searchCartByPhone(phone);
    }

    @Override
    public List<Cart> getCartByUserId(int userId) {
        return cartDAO.getCartByUserId(userId);
    }


}
