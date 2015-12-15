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
public class BoreholeStationDao extends BaseIbatis3Dao<BoreholeStation,java.lang.Long>{
        /* (non-Javadoc)
	 * @see com.steven.framework.base.BaseIbatis3Dao#getIbatisMapperNamesapce()
	 */
	@Override
	public String getIbatisMapperNamesapce() {
		return "BoreholeStation";
	}
	/* (non-Javadoc)
	 * @see com.steven.framework.base.EntityDao#saveOrUpdate(java.lang.Object)
	 */
	public void saveOrUpdate(BoreholeStation entity) {
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
	public Page findPage(BoreholeStationQuery query) {
		return pageQuery("BoreholeStation.findPage",query);
	}
	/**获取所有省份信息
	 * @return
	 */
	public List getAllProvince() {
	    return getSqlSessionTemplate().selectList(getIbatisMapperNamesapce()+".getAllProvince", null);
	}
	/**获取所有台站信息
	 * @param provinceCode 
	 * @return
	 */
	public List getStationInfo(String provinceCode) {
	    return getSqlSessionTemplate().selectList(getIbatisMapperNamesapce()+".getStationInfo", provinceCode);
	}
	/**获取所有观测项信息
	 * @param stationCode 
	 * @return
	 */
	public List getItemInfo(String stationCode) {
	    return getSqlSessionTemplate().selectList(getIbatisMapperNamesapce()+".getItemInfo", stationCode);
	}
	/**根据编号查找站点
	 * @param provinceCode
	 * @param stationCode
	 * @return
	 */
//	public BoreholeStation getByCode(String provinceCode, String stationCode) {
//	    Map parameters=new HashMap();
//	    parameters.put("provinceCode", provinceCode);
//	    parameters.put("stationCode", stationCode);
//	    return (BoreholeStation)getSqlSessionTemplate().selectOne(getIbatisMapperNamesapce()+".getByCode",parameters );
//	}
	/**根据台站编码查询台站信息
	 * @param stationcode
	 * @return
	 */
	public List getStationByCode(String stationCode) {
		return getSqlSessionTemplate().selectList(getIbatisMapperNamesapce()+".getStationByCode", stationCode);
	}
	/**创建表
	 * @param params
	 */
	public void createTable(Map params) {
		getSqlSessionTemplate().update(getIbatisMapperNamesapce()+".createStationTable", params);
		
	}
	/**删除表
	 * @param params
	 */
	public void dropTable(Map params) {
		getSqlSessionTemplate().update(getIbatisMapperNamesapce()+".dropStationTable", params);
		
	}
	/**查找唯一的台站信息
	 * @param stationCode
	 * @return
	 */
	public BoreholeStation getStationInfoByCode(String stationCode) {
	    
	    return (BoreholeStation) getSqlSessionTemplate().selectOne(getIbatisMapperNamesapce()+".getStationInfoByCode", stationCode);
	}
	/**更新表
	 * @param params
	 */
	public void updateTable(Map params) {
	    getSqlSessionTemplate().update(getIbatisMapperNamesapce()+".updateStationTable", params);
	    
	}
	/**更新表名称
	 * @param boreholeStation
	 */
	public void updateStationInfo(BoreholeStation boreholeStation) {
	    getSqlSessionTemplate().update(getIbatisMapperNamesapce()+".updateStationInfo", boreholeStation);
	    
	}
	

}
