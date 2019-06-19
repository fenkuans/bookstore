package org.fkjava.shopping.domain;

import java.text.DecimalFormat;

public class ShopCarData {
    private Integer articleId;
    private Integer userId;
    private Integer articleNumb;
    private String image;
    private String title;
    private Double price;
    private String totalPrices;
    private Integer state;

    public Integer getArticleId() {
        return articleId;
    }

    public void setArticleId(Integer articleId) {
        this.articleId = articleId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getArticleNumb() {
        return articleNumb;
    }

    public void setArticleNumb(Integer articleNumb) {
        this.articleNumb = articleNumb;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "ShopCarData{" +
                "articleId=" + articleId +
                ", userId=" + userId +
                ", articleNumb=" + articleNumb +
                ", image='" + image + '\'' +
                ", title='" + title + '\'' +
                ", price=" + price +
                ", totalPrices='" + totalPrices + '\'' +
                ", state=" + state +
                '}';
    }

    public String getTotalPrice(Integer number, Double price) {
        DecimalFormat df = new DecimalFormat( "0.00");
        System.out.println(number);
        System.out.println(price);
        Double totalPrice= number*price;
        return df.format(totalPrice);
    }

    public String getTotalPrices() {

        return totalPrices;
    }

    public void setTotalPrices(String totalPrices) {
        this.totalPrices = totalPrices;
    }
}
