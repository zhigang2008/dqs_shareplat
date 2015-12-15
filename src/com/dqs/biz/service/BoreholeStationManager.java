package com.dqs.biz.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dqs.biz.dao.BoreholeStationDao;
import com.dqs.biz.model.BoreholeStation;
import com.dqs.biz.model.BoreholeStationItem;
import com.dqs.biz.vo.query.BoreholeStationQuery;
import com.steven.framework.base.BaseManager;
import com.steven.framework.base.EntityDao;
import com.steven.framework.core.page.Page;

/**
 * @author steven
 * @version 1.0
 * @since 1.0
 */

@Service
@Transactional
public class BoreholeStationManager extends BaseManager<BoreholeStation,java.lang.Long>{

       /**
	 * DAO对象
	 */
	private BoreholeStationDao boreholeStationDao;
	/**设置DAO对象,spring就可以通过autowire自动设置对象属性*/
	public void setBoreholeStationDao(BoreholeStationDao dao) {
		this.boreholeStationDao = dao;
	}
	private BoreholeStationItemManager boreholeStationItemManager;
	
	/* (non-Javadoc)
	 * @see com.steven.framework.base.BaseManager#getEntityDao()
	 */
	public EntityDao getEntityDao() {
		return this.boreholeStationDao;
	}
	/**分页查询
	 * @param query 查询条件
	 * @return 封装的Page对象
	 */
	@Transactional(readOnly=true)
	public Page findPage(BoreholeStationQuery query) {
		return boreholeStationDao.findPage(query);
	}
	
	/**获取所有省份信息
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<BoreholeStation> getAllProvince() {
		return boreholeStationDao.getAllProvince();
	}
	/**获取所有台站信息
	 * @param provinceCode 
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<BoreholeStation> getStationInfo(String provinceCode) {
		return boreholeStationDao.getStationInfo(provinceCode);
	}
	/**获取所有观测项信息
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<BoreholeStation> getItemInfo(String stationCode) {
		return boreholeStationDao.getItemInfo(stationCode);
	}
	/**检查台站是否已经存在
	 * @param stationcode
	 */
	public boolean checkExistStation(String stationcode) {
		 List list=this.boreholeStationDao.getStationByCode(stationcode);
		 if(list!=null&&list.size()>0){
			 return true;
		 }
		 else{
			 return false;
		 }
		
	}
	
	/**创建台站
	 * @param boreholeStation
	 * @param stationItems
	 */
    public void createStation(BoreholeStation boreholeStation,  String[] stationItems) {
	// 创建表结构
	Map params = new HashMap();
	params.put("tableName", boreholeStation.getStationCode());
	params.put("items", stationItems);

	boreholeStationDao.createTable(params);

	BoreholeStationItem item = null;

	try {
	    for (String itemcode : stationItems) {
		boreholeStation.setItemCode(itemcode);
		item = this.boreholeStationItemManager.getByCode(itemcode);
		boreholeStation.setItemCname(item.getName());
		this.boreholeStationDao.save(boreholeStation);
	    }
	} catch (Exception e) {
	    log.error("添加站点信息时出错:" + e.getMessage(), e);
	    this.boreholeStationDao.dropTable(params);
	}
    }
	/**
	 * @param boreholeStationItemManager
	 */
	public void setBoreholeStationItemManager(BoreholeStationItemManager boreholeStationItemManager) {
		this.boreholeStationItemManager = boreholeStationItemManager;
	}
	
	/**根据台站号查找台站信息
	 * @param stationCode
	 * @return
	 */
	public BoreholeStation getStationInfoByCode(String stationCode) {
	    return boreholeStationDao.getStationInfoByCode(stationCode);
	}
	
	
	/**更改表结构
	 * @param boreholeStation
	 * @param newItems
	 */
	public void updateStation(BoreholeStation boreholeStation,
		List<String> newItems) {
	    
	        Map params = new HashMap();
		params.put("tableName", boreholeStation.getStationCode());

		BoreholeStationItem item = null;

		try {
		    //更新台站名称
		    boreholeStationDao.updateStationInfo(boreholeStation);

		    for (String itemcode : newItems) {
                        //更新表结构
			params.put("item", itemcode);
			boreholeStationDao.updateTable(params);
			
			//添加表信息
			boreholeStation.setItemCode(itemcode);
			item = this.boreholeStationItemManager.getByCode(itemcode);
			boreholeStation.setItemCname(item.getName());
			this.boreholeStationDao.save(boreholeStation);
		    }
		} catch (Exception e) {
		    log.error("添加站点信息时出错:" + e.getMessage(), e);
		}
	    
	}
	
	/**根据省份和编号查找站点
	 * @param provinceCode
	 * @param stationCode
	 * @return
	 */
//	@Transactional(readOnly=true)
//	public BoreholeStation getByCode(String provinceCode,String stationCode) {
//	    return boreholeStationDao.getByCode(provinceCode,stationCode);
//	}

}
