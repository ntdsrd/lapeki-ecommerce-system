package com.ecommerce.model;

import java.io.Serializable;
import java.sql.Date;

/**
 * @author Nguyen Tung Lam
 * @overview Voucher is uses to decrease price in percentage
 * @attributes <pre>
 * voucherID   			Integer  	int
 * voucherCode 			String
 * discountPercentage	Integer		int
 * expireDate			Date
 * </pre>
 * @abstract_properties mutable(voucherID)=false /\ optional(voucherID)=false /\ length(voucherID)=6 /\
 * mutable(voucherCode)=true /\ optional(voucherCode)=false /\ length(voucherID)=10 /\
 * mutable(discountPercentage)=true /\ optional(discountPercentage)=false /\ length(voucherID)=3 /\
 * mutable(expireDate)=false /\ optional(expireDate)=false
 */

public class Voucher implements Serializable {

    private int voucherID;
    private String voucherCode;
    private int discountPercentage;
    private Date expireDate;

    public Voucher() {
        super();
    }

    public Voucher(String voucherCode, int discountPercentage, Date expireDate) {
        super();
        this.voucherCode = voucherCode;
        this.discountPercentage = discountPercentage;
        this.expireDate = expireDate;
    }

    public Voucher(int voucherID, String voucherCode, int discountPercentage, Date expireDate) {
        super();
        this.voucherID = voucherID;
        this.voucherCode = voucherCode;
        this.discountPercentage = discountPercentage;
        this.expireDate = expireDate;
    }

    public int getVoucherID() {
        return voucherID;
    }

    public void setVoucherID(int voucherID) {
        this.voucherID = voucherID;
    }

    public String getVoucherCode() {
        return voucherCode;
    }

    public void setVoucherCode(String voucherCode) {
        this.voucherCode = voucherCode;
    }

    public int getDiscountPercentage() {
        return discountPercentage;
    }

    public void setDiscountPercentage(int discountPercentage) {
        this.discountPercentage = discountPercentage;
    }

    public Date getExpireDate() {
        return expireDate;
    }

    public void setExpireDate(Date expireDate) {
        this.expireDate = expireDate;
    }


}
