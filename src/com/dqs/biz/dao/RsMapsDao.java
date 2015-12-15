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
public class RsMapsDao extends BaseIbatis3Dao<RsMaps,java.lang.String>{
        /* (non-Javadoc)
	 * @see com.steven.framework.base.BaseIbatis3Dao#getIbatisMapperNamesapce()
	 */
	@Override
	public String getIbatisMapperNamesapce() {
		return "RsMaps";
	}
	/* (non-Javadoc)
	 * @see com.steven.framework.base.EntityDao#saveOrUpdate(java.lang.Object)
	 */
	public void saveOrUpdate(RsMaps entity) {
		if(entity.getLibId() == null){ 
			save(entity);
		}
		else {
			update(entity);
		}
	}
	/**分页查询
	 * @param query 查询条件
	 * @return 分页查询结果
	 * @see com.steven.framework.core.page.Page
	 */
	public Page findPage(RsMapsQuery query) {
		return pageQuery("RsMaps.findPage",query);
	}
	public RsMaps getByModel(RsMaps rsMaps) {
		return (RsMaps) this.getSqlSessionTemplate().selectOne(getIbatisMapperNamesapce()+".getByModel", rsMaps);
		
	}
	public void deleteByModel(RsMaps rsMaps) {
		this.getSqlSessionTemplate().delete(getIbatisMapperNamesapce()+".deleteByModel", rsMaps);
	}
	public long getMapCountByLib(String libId) {
	
		return  (Long) this.getSqlSessionTemplate().selectOne(getIbatisMapperNamesapce()+".getMapCountByLib", libId);
	}
	

}
