package org.fkjava.shopping.domain;

import java.util.Date;

public class Article {
    /*CREATE TABLE `ec_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `supplier` varchar(20) DEFAULT NULL,
  `price` double unsigned NOT NULL,
  `discount` double unsigned DEFAULT NULL,
  `locality` varchar(200) DEFAULT NULL,
  `putaway_date` datetime DEFAULT NULL,
  `STORAGE` int(10) unsigned DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `type_code` varchar(100) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `disabled` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `type_code` (`type_code`),
  CONSTRAINT `ec_article_ibfk_1` FOREIGN KEY (`type_code`) REFERENCES `ec_article_type` (`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT
    * */
    private Integer id;
    private String title;
    private String supplier;
    private Double price;
    private Double discount;
    private String locality;
    private Date putawayDate;
    private Integer storage;
    private String image;
    private String description;
    private String typeCode;
    private Date createDate;
    private Integer disabled;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSupplier() {
        return supplier;
    }

    public void setSupplier(String supplier) {
        this.supplier = supplier;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Double getDiscount() {
        return discount;
    }

    public void setDiscount(Double discount) {
        this.discount = discount;
    }

    public String getLocality() {
        return locality;
    }

    public void setLocality(String locality) {
        this.locality = locality;
    }

    public Date getPutawayDate() {
        return putawayDate;
    }

    public void setPutawayDate(Date putawayDate) {
        this.putawayDate = putawayDate;
    }

    public Integer getStorage() {
        return storage;
    }

    public void setStorage(Integer storage) {
        this.storage = storage;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTypeCode() {
        return typeCode;
    }

    public void setTypeCode(String typeCode) {
        this.typeCode = typeCode;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Integer getDisabled() {
        return disabled;
    }

    public void setDisabled(Integer disabled) {
        this.disabled = disabled;
    }
}
