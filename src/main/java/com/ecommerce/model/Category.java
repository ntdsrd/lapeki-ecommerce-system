package com.ecommerce.model;

import java.io.Serializable;


/**
 * @author Nguyen Tung Lam
 * @overview Category is uses to sort products in different type
 * @attributes <pre>
 * categoryID   Integer int
 * categoryName String
 * </pre>
 * @abstract_properties mutable(categoryID)=false /\ optional(categoryID)=false /\
 * mutable(categoryName)=false /\ optional(categoryName)=false
 */

public class Category implements Serializable {
    private int categoryID;
    private String categoryName;

    public Category() {
    }

    public Category(String categoryName) {
        super();
        this.categoryName = categoryName;
    }

    public Category(int categoryID, String categoryName) {
        super();
        this.categoryID = categoryID;
        this.categoryName = categoryName;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    @Override
    public String toString() {
        return "Category [categoryID=" + categoryID + ", categoryName=" + categoryName + "]";
    }


    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Category other = (Category) obj;
        if (categoryID != other.categoryID)
            return false;
        if (categoryName == null) {
            if (other.categoryName != null)
                return false;
        } else if (!categoryName.equals(other.categoryName))
            return false;
        return true;
    }


}