package com.kgc.book.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kgc.book.mapper.EbookCategoryMapper;
import com.kgc.book.mapper.EbookEntryMapper;
import com.kgc.book.pojo.EbookCategory;
import com.kgc.book.pojo.EbookEntry;
import com.kgc.book.pojo.EbookEntryExample;
import com.kgc.book.service.EbookEntryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName EbookEntryServiceImpl
 * @Description TODO
 * @Author 张少军
 * @Date 2021/9/8 14:54
 * @Version 1.0
 **/
@Service
public class EbookEntryServiceImpl implements EbookEntryService {
    @Autowired
    private EbookEntryMapper ebookEntryMapper;

    @Autowired
    private EbookCategoryMapper ebookCategoryMapper;

    // 带条件的分页查询
    public PageInfo<EbookEntry> selectEbookEntry(Integer categoryId, Integer pageNo, Integer pageSize) {
        //创建条件类
        EbookEntryExample ebookEntryExample = new EbookEntryExample();
        EbookEntryExample.Criteria criteria = ebookEntryExample.createCriteria();
        // 倒序排序
        ebookEntryExample.setOrderByClause("id desc");
        //拼接条件
        if(categoryId != null && categoryId != 0){
            criteria.andCategoryIdEqualTo(categoryId);
        }

        // 开启分页
        PageHelper.startPage(pageNo,pageSize);

        //开始查询
        List<EbookEntry> ebookEntries = ebookEntryMapper.selectByExample(ebookEntryExample);

        for (EbookEntry ebookEntry : ebookEntries) {
            EbookCategory ebookCategory = ebookCategoryMapper.selectByPrimaryKey(ebookEntry.getCategoryId());

            ebookEntry.setEbookCategory(ebookCategory);
        }

        //将数据放到分页工具中
        PageInfo<EbookEntry> pageInfo = new PageInfo<EbookEntry>(ebookEntries);
        return pageInfo;
    }

    // 添加图书方法
    @Override
    public boolean addEbookEntry(EbookEntry ebookEntry) {
        return ebookEntryMapper.insertSelective(ebookEntry)>0;
    }

    // 修改前的查询， 根据id值进行查询
    @Override
    public EbookEntry selectEbookEntryById(Integer id) {
        return ebookEntryMapper.selectByPrimaryKey(id);
    }

    // 修改图书信息
    @Override
    public boolean updateEbookEntryById(EbookEntry ebookEntry) {
        return ebookEntryMapper.updateByPrimaryKeySelective(ebookEntry)>0;
    }

    // 删除
    @Override
    public boolean deleteEbookEntryById(Integer id) {
        return ebookEntryMapper.deleteByPrimaryKey(id)>0;
    }
}
