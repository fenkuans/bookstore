package org.fkjava.shopping.page;

public class PageNumb {
    //默认当前页数
    private Integer numb=1;
    //下一页
    private Integer nextNumb;
    //上一页
    private Integer upNumb;
    //总页数
    private Integer allNumb;
    //显示条数
    private Integer showNumb=9;
    //总条数
    private Integer allDataNumb;
    //起始
    private Integer startPage;



    public PageNumb(){

    }
    public PageNumb(Integer allDataNumb,Integer indexNumb){
        if (indexNumb!=null){
            this.numb=indexNumb;
        }
        this.allDataNumb=allDataNumb;
        allNumb=allDataNumb%showNumb==0?allDataNumb/showNumb:(allDataNumb/showNumb)+1;
        startPage=(numb-1)*showNumb;

        nextNumb=numb+1<allNumb?numb+1:allNumb;
        upNumb=numb-1!=0?numb-1:numb;
    }
    public Integer getStartPage() {
        return startPage;
    }

    public Integer getNumb() {
        return numb;
    }

    public Integer getNextNumb() {
        return nextNumb;
    }

    public Integer getUpNumb() {
        return upNumb;
    }

    public Integer getAllNumb() {
        return allNumb;
    }

    public Integer getShowNumb() {
        return showNumb;
    }

    public Integer getAllDataNumb() {
        return allDataNumb;
    }


}
