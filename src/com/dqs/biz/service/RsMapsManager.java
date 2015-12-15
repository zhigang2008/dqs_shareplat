package com.dqs.biz.service;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

@Service
@Transactional
public class RsMapsManager extends BaseManager<RsMaps, java.lang.String> {

	/**
	 * DAO对象
	 */
	private RsMapsDao rsMapsDao;
	private RsMapLibDao rsMapLibDao;

	public void setRsMapLibDao(RsMapLibDao rsMapLibDao) {
		this.rsMapLibDao = rsMapLibDao;
	}

	/** 设置DAO对象,spring就可以通过autowire自动设置对象属性 */
	public void setRsMapsDao(RsMapsDao dao) {
		this.rsMapsDao = dao;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.steven.framework.base.BaseManager#getEntityDao()
	 */
	public EntityDao getEntityDao() {
		return this.rsMapsDao;
	}

	/**
	 * 分页查询
	 * 
	 * @param query
	 *            查询条件
	 * @return 封装的Page对象
	 */
	@Transactional(readOnly = true)
	public Page findPage(RsMapsQuery query) {
		return rsMapsDao.findPage(query);
	}

	public RsMaps getByModel(RsMaps rsMaps) {

		return rsMapsDao.getByModel(rsMaps);
	}

	@Override
	public void removeById(String id) throws DataAccessException {
		
		
		RsMaps rsMap=this.getById(id);
		if(rsMap!=null){
			RsMapLib mapLib=(RsMapLib) this.rsMapLibDao.getById(rsMap.getLibId());
			mapLib.setMapCount(mapLib.getMapCount()-1);
			this.rsMapLibDao.update(mapLib);
		}
		super.removeById(id);
	}

	/**
	 * @param rsMaps
	 */
	public void deleteByModel(RsMaps rsMaps) {

		 rsMapsDao.deleteByModel(rsMaps);
		//更新图件库数据量
			RsMapLib rsMapLib=(RsMapLib) this.rsMapLibDao.getById(rsMaps.getLibId());
			if(rsMapLib!=null){
				rsMapLib.setMapCount(rsMapLib.getMapCount()-1);
				this.rsMapLibDao.update(rsMapLib);
			}
	}
	
	@Override
	public void save(RsMaps entity) throws DataAccessException {
		
		super.save(entity);
		//更新图件库数据量
		RsMapLib rsMapLib=(RsMapLib) this.rsMapLibDao.getById(entity.getLibId());
		if(rsMapLib!=null){
			rsMapLib.setMapCount(rsMapLib.getMapCount()+1);
			this.rsMapLibDao.update(rsMapLib);
		}
	}

	/**获取图件库下地图件数量
	 * @param libId 图件库ID
	 * @return 图件数量
	 */
	public long getMapCountByLib(String libId){
		return rsMapsDao.getMapCountByLib(libId);
	}

}
