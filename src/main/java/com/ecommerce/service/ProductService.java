package com.ecommerce.service;

import com.ecommerce.model.Product;

import java.util.List;

/**
 * @author Do Duc Dung
 * @overview ProductService is a class providing a number of function to be
 * implemented on Product.
 */
public interface ProductService {
    /**
     * Insert a new product
     *
     * @param product - the product to be inserted to database
     */
    void insertProduct(Product product);

    /**
     * Update an existing product
     *
     * @param product - the product to be updated
     * @return true if the product is updated, or false if not
     */
    boolean updateProduct(Product product);

    /**
     * Delete an existing product
     *
     * @param productID - the id of the product to be deleted
     * @return true if the product is deleted, or false if not
     */
    boolean deleteProduct(int productID);

    /**
     * Retreive a product by its id
     *
     * @param productID - the id of the desired product
     * @return
     */
    Product getProductByID(int productID);

    /**
     * Retrieve all products
     *
     * @return Either the list of all products or null if there is none
     */
    List<Product> getAllProducts();

    /**
     * Search for a product by its name
     *
     * @param productName - the name of the desired product
     * @return Either the list of all matching products or null if there is none
     */
    List<Product> searchProductByName(String productName);

    /**
     * Search for a product by its category
     *
     * @param categoryID - the id of the desired category
     * @return Either the list of all matching products or null if there is none
     */
    List<Product> searchProductByCategory(int categoryID);

}
