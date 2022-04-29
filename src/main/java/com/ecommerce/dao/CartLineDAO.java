package com.ecommerce.dao;

import com.ecommerce.model.CartLine;

import java.util.List;

/**
 * @author Nguyen Khac Hung
 * @overview CartLineDAO is an abstract interface which facilitates
 * communication to CartLine table in database.
 */
public interface CartLineDAO {

    /**
     * Insert a new CartLine to database
     *
     * @param cartLine - a new cartLine
     */
    void insertCartLine(CartLine cartLine);

    /**
     * Update an existing CartLine in the database
     *
     * @param cartLine - a cartLine to be updated in the database
     * @return true if cartLine is updated, false if not
     */
    boolean updateCartLine(CartLine cartLine);

    /**
     * Delete an existing CartLine
     *
     * @param cartLineID - the id of the cartLine to be deleted
     * @return true if the cartLine is deleted, or false if not
     */
    boolean deleteCartLine(int cartLineID);

    /**
     * Get an CartLine from database by its cartLineID
     *
     * @param cartLineID - the id of desired CartLine
     * @return Either the desired CartLine if found or null if not
     */
    CartLine getCartLineByID(int cartLineID);

    /**
     * Get an CartLine from database by its cartLineID
     *
     * @param cartLineID - the id of desired CartLine
     * @return Either the desired CartLine if found or null if not
     */
    List<CartLine> getCartLineByCartID(int cartID);

    /**
     * Get all CartLines that exist in the database
     *
     * @return Either the list of CartLines or null if there is no CartLine
     */
    List<CartLine> getAllCartLines();
}
