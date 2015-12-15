package com.dqs.biz.dao;

import java.util.*;

import com.steven.framework.base.*;
import com.steven.framework.util.*;

import com.steven.framework.util.*;
import com.steven.framework.common.web.util.*;
import com.steven.framework.core.page.*;

import com.dqs.biz.model.*;
import com.dqs.biz.dao.*;
import com.dqs.biz.service.*;
import com.dqs.biz.vo.query.*;

/**
 * @author steven
 * @version 1.0
 * @since 1.0
 */


import org.springframework.stereotype.Repository;


@Repository
public class DownloadDataDao extends BaseIbatis3Dao<DownloadData,java.lang.String>{
        /* (non-Javadoc)
	 * @see com.steven.framework.base.BaseIbatis3Dao#getIbatisMapperNamesapce()
	 */
	@Override
	public String getIbatisMapperNamesapce() {
		return "DownloadData";
	}
	/* (non-Javadoc)
	 * @see com.steven.framework.base.EntityDao#saveOrUpdate(java.lang.Object)
	 */
	public void saveOrUpdate(DownloadData entity) {
		if(entity.getDownloadCount() > 1){ 
			update(entity);
		}
		else {
			save(entity);
		}
	}
	/**分页查询
	 * @param query 查询条件
	 * @return 分页查询结果
	 * @see com.steven.framework.core.page.Page
	 */
	public Page findPage(DownloadDataQuery query) {
		return pageQuery("DownloadData.findPage",query);
	}
	
	/**根据逐渐删除记录
	 * @param entity
	 */
	public void deleteByModel(DownloadData entity){
		this.getSqlSessionTemplate().delete(getIbatisMapperNamesapce()+".deleteByModel", entity);
	}
	/**根据逐渐查找记录
	 * @param entity
	 * @return
	 */
	public DownloadData getByModel(DownloadData entity){
		return (DownloadData) this.getSqlSessionTemplate().selectOne(getIbatisMapperNamesapce()+".getByModel", entity);
	}

}
