package org.fkjava.shopping.page;

import org.fkjava.shopping.domain.Article;
import org.fkjava.shopping.domain.ArticleType;

import java.util.List;

public class IndexData {
    private List<Article> articleData;
    private List<ArticleType> oneCodeData;
    private List<ArticleType> towCOdeData;
    //封装分页数据
    private PageNumb pageNumb;

    public PageNumb getPageNumb() {
        return pageNumb;
    }

    public void setPageNumb(PageNumb pageNumb) {
        this.pageNumb = pageNumb;
    }

    public List<Article> getArticleData() {
        return articleData;
    }

    public void setArticleData(List<Article> articleData) {
        this.articleData = articleData;
    }

    public List<ArticleType> getOneCodeData() {
        return oneCodeData;
    }

    public void setOneCodeData(List<ArticleType> oneCodeData) {
        this.oneCodeData = oneCodeData;
    }

    public List<ArticleType> getTowCOdeData() {
        return towCOdeData;
    }

    public void setTowCOdeData(List<ArticleType> towCOdeData) {
        this.towCOdeData = towCOdeData;
    }
}
