package com.kgc.book.service;

import com.github.pagehelper.PageInfo;
import com.kgc.book.pojo.EbookEntry;

public interface EbookEntryService {
    // 查询全部， 带条件的分页查询
    PageInfo<EbookEntry> selectEbookEntry(Integer categoryId, Integer pageNo, Integer pageSize);

    // 添加图书方法
    boolean addEbookEntry(EbookEntry ebookEntry);

    // 修改前的查询， 根据id值进行查询
    EbookEntry selectEbookEntryById(Integer id);

    // 修改图书信息
    boolean updateEbookEntryById(EbookEntry ebookEntry);

    // 删除
    boolean deleteEbookEntryById(Integer id);
}
