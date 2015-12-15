package com.dqs.biz.dao;

import org.springframework.stereotype.Repository;

import com.dqs.biz.model.StationType;
import com.dqs.biz.vo.query.StationTypeQuery;
import com.steven.framework.base.BaseIbatis3Dao;
import com.steven.framework.core.page.Page;


@Repository
public class StationTypeDao extends BaseIbatis3Dao<StationType,java.lang.Integer>{
        /* (non-Javadoc)
	 * @see com.steven.framework.base.BaseIbatis3Dao#getIbatisMapperNamesapce()
	 */
	@Override
	public String getIbatisMapperNamesapce() {
		return "StationType";
	}
	/* (non-Javadoc)
	 * @see com.steven.framework.base.EntityDao#saveOrUpdate(java.lang.Object)
	 */
	public void saveOrUpdate(StationType entity) {
		if(entity.getCode() == null){ 
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
	public Page findPage(StationTypeQuery query) {
		return pageQuery("StationType.findPage",query);
	}
	

}
