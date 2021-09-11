package com.kgc.book.service.impl;

import com.kgc.book.mapper.EbookCategoryMapper;
import com.kgc.book.pojo.EbookCategory;
import com.kgc.book.service.EbookCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName EbookCategoryServiceImpl
 * @Description TODO
 * @Author 张少军
 * @Date 2021/9/8 16:04
 * @Version 1.0
 **/
@Service
public class EbookCategoryServiceImpl implements EbookCategoryService {
    // 引入mapper接口
    @Autowired
    EbookCategoryMapper ebookCategoryMapper;

    @Override
    public List<EbookCategory> selectEbookCategory() {
        return ebookCategoryMapper.selectByExample(null);
    }
}
