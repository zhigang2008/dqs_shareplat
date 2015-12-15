package com.dqs.biz.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dqs.biz.dao.StationDao;
import com.dqs.biz.model.Station;
import com.dqs.biz.vo.query.StationQuery;
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
public class StationManager extends BaseManager<Station,java.lang.Integer>{

       /**
	 * DAO对象
	 */
	private StationDao stationDao;
	/**设置DAO对象,spring就可以通过autowire自动设置对象属性*/
	public void setStationDao(StationDao dao) {
		this.stationDao = dao;
	}
	/* (non-Javadoc)
	 * @see com.steven.framework.base.BaseManager#getEntityDao()
	 */
	public EntityDao getEntityDao() {
		return this.stationDao;
	}
	/**分页查询
	 * @param query 查询条件
	 * @return 封装的Page对象
	 */
	@Transactional(readOnly=true)
	public Page findPage(StationQuery query) {
		return stationDao.findPage(query);
	}
	/**获取所有的省份信息
	 * @return
	 */
	public List<Station> getAllProvince() {
		return stationDao.getAllProvince();
	}
	/**获取指定省份的台站信息
	 * @param zmCode
	 * @return 
	 */
	public List<Station> getStationInfo(String zmCode) {
		return stationDao.getStationInfo(zmCode);
	}
	
}
