package com.dqs.biz.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.dqs.biz.model.BoreholeStation;
import com.dqs.biz.model.Station;
import com.dqs.biz.vo.query.StationQuery;
import com.steven.framework.base.BaseIbatis3Dao;
import com.steven.framework.core.page.Page;


@Repository
public class StationDao extends BaseIbatis3Dao<Station,java.lang.Integer>{
        /* (non-Javadoc)
	 * @see com.steven.framework.base.BaseIbatis3Dao#getIbatisMapperNamesapce()
	 */
	@Override
	public String getIbatisMapperNamesapce() {
		return "Station";
	}
	/* (non-Javadoc)
	 * @see com.steven.framework.base.EntityDao#saveOrUpdate(java.lang.Object)
	 */
	public void saveOrUpdate(Station entity) {
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
	public Page findPage(StationQuery query) {
		return pageQuery("Station.findPage",query);
	}
	/**获取所有省份信息
	 * @return
	 */
	public List<Station> getAllProvince() {
	    return getSqlSessionTemplate().selectList(getIbatisMapperNamesapce()+".getAllProvince", null);
	}
	/**获取所有台站信息
	 * @param provinceCode 
	 * @return
	 */
	public List<Station> getStationInfo(String provinceCode) {
	    return getSqlSessionTemplate().selectList(getIbatisMapperNamesapce()+".getStationInfo", provinceCode);
	}
	
	/**创建表
	 * @param params
	 */
	public void createTable(Station station) {
		getSqlSessionTemplate().update(getIbatisMapperNamesapce()+".createStationTable", station);
		
	}
	/**删除表
	 * @param params
	 */
	public void dropTable(Station station) {
		getSqlSessionTemplate().update(getIbatisMapperNamesapce()+".dropStationTable", station);
		
	}
	
	
}
