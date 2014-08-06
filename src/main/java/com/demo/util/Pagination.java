package com.demo.util;

import java.io.Serializable;

/**
 * Created by guoyibin on 7/29/14.
 *
 *
 */
public class Pagination implements Serializable {


    //每页记录数
    private int pageSize;
    //当前页数
    private int currentPage;
    //总页数
    private int totalPage;
    //总记录数
    private int totalCount;

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }



    //首页
    private int firstPage;
    //尾页
    private int lastPage;
    //上一页
    private int prePage;
    //下一页
    private int nextPage;

    public int getFirstPage() {
        return firstPage;
    }

    public void setFirstPage(int firstPage) {
        this.firstPage = firstPage;
    }

    public int getLastPage() {
        return lastPage;
    }

    public void setLastPage(int lastPage) {
        this.lastPage = lastPage;
    }

    public int getPrePage() {
        return prePage;
    }

    public void setPrePage(int prePage) {
        this.prePage = prePage;
    }

    public int getNextPage() {
        return nextPage;
    }

    public void setNextPage(int nextPage) {
        this.nextPage = nextPage;
    }


    public Pagination(){}

    public Pagination(int totalCount,int pageSize){
        this.totalCount = totalCount;
        this.pageSize = pageSize;
        this.currentPage = 1;
        if (totalCount%pageSize>0) {
            this.totalPage = totalCount/pageSize + 1;
        } else {
            this.totalPage = totalCount/pageSize;
        }
        this.firstPage = 1;
        this.lastPage = this.totalPage;
        this.prePage = this.currentPage==1?1:this.currentPage-1;
        this.nextPage = this.currentPage == this.lastPage?this.lastPage:this.currentPage+1;
    }

    public Pagination(int totalCount,int pageSize,int currentPage){
        this.totalCount = totalCount;
        this.pageSize = pageSize;
        this.currentPage = currentPage;
        if (totalCount%pageSize>0) {
            this.totalPage = totalCount/pageSize + 1;
        } else {
            this.totalPage = totalCount/pageSize;
        }
        this.firstPage = 1;
        this.lastPage = this.totalPage;
        this.prePage = this.currentPage==1?1:this.currentPage-1;
        this.nextPage = this.currentPage == this.lastPage?this.lastPage:this.currentPage+1;
    }

    public Pagination(int totalCount,int pageSize,int currentPage,int totalPage){
        this.totalCount = totalCount;
        this.pageSize = pageSize;
        this.currentPage = currentPage;
        this.totalPage = totalPage;
        this.firstPage = 1;
        this.lastPage = this.totalPage;
        this.prePage = this.currentPage==1?1:this.currentPage-1;
        this.nextPage = this.currentPage == this.lastPage?this.lastPage:this.currentPage+1;
    }
}
