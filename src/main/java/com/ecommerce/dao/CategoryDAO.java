package com.ecommerce.dao;

import com.ecommerce.model.Category;

import java.util.List;

/**
 * @author Nguyen Khac Hung
 * @overview CategoryDAO is an abstract interface which facilitates
 * communication to Category table in database.
 */
public interface CategoryDAO {
    /**
     * Insert a new Category to database
     *
     * @param category - a new category
     */
    void insertCategory(Category category);

    /**
     * Update an existing Category in the database
     *
     * @param category - a category to be updated in the database
     * @return true if category is updated, false if not
     */
    boolean updateCategory(Category category);

    /**
     * Delete an existing Category
     *
     * @param categoryID - the id of the category to be deleted
     * @return true if the category is deleted, or false if not
     */
    boolean deleteCategory(int categoryID);

    /**
     * Get an category from database by its categoryID
     *
     * @param categoryID - the id of desired Category
     * @return Either the desired Category if found or null if not
     */
    Category getCategoryByID(int categoryID);

    /**
     * Get an CartLine from database by its categoryName
     *
     * @param categoryName - the name of desired Category
     * @return Either the desired Category if found or null if not
     */
    Category getCategoryByName(String categoryName);

    /**
     * Get all Categories that exist in the database
     *
     * @return Either the list of Categories or null if there is no Category
     */
    List<Category> getAllCategories();

    /**
     * Search for a Category by name
     *
     * @param categoryName - the name to be searched for
     * @return Either the list of matching result or null if there is no matches
     */
    List<Category> searchCategoryByName(String categoryName);
}
