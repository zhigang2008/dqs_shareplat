package com.dqs.biz.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dqs.biz.dao.StationTypeDao;
import com.dqs.biz.model.StationType;
import com.dqs.biz.vo.query.StationTypeQuery;
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
public class StationTypeManager extends BaseManager<StationType,java.lang.Integer>{

       /**
	 * DAO对象
	 */
	private StationTypeDao stationTypeDao;
	/**设置DAO对象,spring就可以通过autowire自动设置对象属性*/
	public void setStationTypeDao(StationTypeDao dao) {
		this.stationTypeDao = dao;
	}
	/* (non-Javadoc)
	 * @see com.steven.framework.base.BaseManager#getEntityDao()
	 */
	public EntityDao getEntityDao() {
		return this.stationTypeDao;
	}
	/**分页查询
	 * @param query 查询条件
	 * @return 封装的Page对象
	 */
	@Transactional(readOnly=true)
	public Page findPage(StationTypeQuery query) {
		return stationTypeDao.findPage(query);
	}
	
}
