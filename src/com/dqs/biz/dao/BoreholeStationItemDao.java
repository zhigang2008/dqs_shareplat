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
public class BoreholeStationItemDao extends BaseIbatis3Dao<BoreholeStationItem,java.lang.Long>{
        /* (non-Javadoc)
	 * @see com.steven.framework.base.BaseIbatis3Dao#getIbatisMapperNamesapce()
	 */
	@Override
	public String getIbatisMapperNamesapce() {
		return "BoreholeStationItem";
	}
	/* (non-Javadoc)
	 * @see com.steven.framework.base.EntityDao#saveOrUpdate(java.lang.Object)
	 */
	public void saveOrUpdate(BoreholeStationItem entity) {
		if(entity.getId() == null){ 
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
	public Page findPage(BoreholeStationItemQuery query) {
		return pageQuery("BoreholeStationItem.findPage",query);
	}
	
	public BoreholeStationItem getByCode(java.lang.String v) {
		return (BoreholeStationItem)getSqlSessionTemplate().selectOne("BoreholeStationItem.getByCode",v);
	}
	public List<BoreholeStationItem> getNotExistItems(String stationCode) {
	    
	    return getSqlSessionTemplate().selectList("BoreholeStationItem.getNotExistItems",stationCode);
	}	
	

}
