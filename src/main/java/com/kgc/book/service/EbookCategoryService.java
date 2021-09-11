package com.kgc.book.service;

import com.kgc.book.pojo.EbookCategory;

import java.util.List;

public interface EbookCategoryService {

    // 查询图书分类信息 全部
    List<EbookCategory> selectEbookCategory();
}
