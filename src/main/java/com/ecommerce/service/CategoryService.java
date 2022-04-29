package com.ecommerce.service;

import com.ecommerce.model.Category;

import java.util.List;


/**
 * @author Nguyen Khac Hung
 * @overview CategoryService is a class providing a number of function to be
 * implemented on Category.
 */
public interface CategoryService {
    /**
     * Insert a new category
     *
     * @param category - the category to be inserted to database
     */
    public void insertCategory(Category category);

    /**
     * Update an existing category
     *
     * @param category - the category to be updated
     * @return true if the category is updated, or false if not
     */
    public boolean updateCategory(Category category);

    /**
     * Delete an existing category
     *
     * @param categoryID - the id of the category to be deleted
     * @return true if the category is deleted, or false if not
     */
    public boolean deleteCategory(int categoryID);

    /**
     * Retrieve a category by its id
     *
     * @param categoryID - the id of the desired category
     * @return
     */
    public Category getCategoryByID(int categoryID);

    /**
     * Retrieve a category by its name
     *
     * @param categoryName - the name of the desired category
     * @return
     */
    public Category getCategoryByName(String categoryName);

    /**
     * Retrieve all categories
     *
     * @return Either the list of all categories or null if there is none
     */
    public List<Category> getAllCategories();

    /**
     * Search for a category by its name
     *
     * @param categoryName - the name of the desired category
     * @return Either the list of all matching categories or null if there is none
     */
    public List<Category> searchCategoryByName(String categoryName);

}
