package com.ecommerce.dao;

import com.ecommerce.model.Product;

import java.util.List;

/**
 * @author Nguyen Tung Lam
 * @overview ProductDAO is an abstract interface which facilitates communication to
 * Product table in database.
 */

public interface ProductDAO {

    /**
     * Insert a new Product to database
     *
     * @param product - a thing, real-life object to be inserted to database
     */
    void insertProduct(Product product);

    /**
     * Update an existing Product in database
     *
     * @param product - a thing, real-life object to be inserted to database
     * @return true if the product is updated, or false if not
     */
    boolean updateProduct(Product product);

    /**
     * Delete an existing Product
     *
     * @param product - a thing, real-life object to be inserted to database
     * @return true if the product is deleted, or false if not
     */
    boolean deleteProduct(int productID);

    /**
     * Get a Product from database by its id
     *
     * @param productID - the id of the desired Product
     * @return Either the desired Product if found or null if not
     */
    Product getProductByID(int productID);

    /**
     * Get all Products that exist in database
     *
     * @return Either the list of Products or null if there is no Product
     */
    List<Product> getAllProducts();

    /**
     * Search for a Product by name
     *
     * @param productName - the name to be searched for
     * @return Either the list of matching result or null if there is no matches
     */
    List<Product> searchProductByName(String productName);

    /**
     * Search for a Product by Category
     *
     * @param categoryID - the ID to be searched for
     * @return Either the list of matching result or null if there is no matches
     */
    List<Product> searchProductByCategory(int categoryID);
}