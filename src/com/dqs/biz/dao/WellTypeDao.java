package com.dqs.biz.dao;

import org.springframework.stereotype.Repository;

import com.dqs.biz.model.WellType;
import com.dqs.biz.vo.query.WellTypeQuery;
import com.steven.framework.base.BaseIbatis3Dao;
import com.steven.framework.core.page.Page;


@Repository
public class WellTypeDao extends BaseIbatis3Dao<WellType,java.lang.Integer>{
        /* (non-Javadoc)
	 * @see com.steven.framework.base.BaseIbatis3Dao#getIbatisMapperNamesapce()
	 */
	@Override
	public String getIbatisMapperNamesapce() {
		return "WellType";
	}
	/* (non-Javadoc)
	 * @see com.steven.framework.base.EntityDao#saveOrUpdate(java.lang.Object)
	 */
	public void saveOrUpdate(WellType entity) {
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
	public Page findPage(WellTypeQuery query) {
		return pageQuery("WellType.findPage",query);
	}
	

}
