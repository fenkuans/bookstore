package org.fkjava.shopping.domain;

public class Car {
    /*CREATE TABLE `ec_car` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `article_code` varchar(20) DEFAULT NULL,
  `article_pices` double DEFAULT NULL,
  `article_numb` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8*/
    private Integer id;
    private Integer articleId;
    private Integer articleNumb;
    private Integer userId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getArticleId() {
        return articleId;
    }

    public void setArticleId(Integer articleId) {
        this.articleId = articleId;
    }

    public Integer getArticleNumb() {
        return articleNumb;
    }

    public void setArticleNumb(Integer articleNumb) {
        this.articleNumb = articleNumb;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}
