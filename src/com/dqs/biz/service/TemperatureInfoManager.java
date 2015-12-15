package com.dqs.biz.service;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dqs.biz.dao.TemperatureInfoDao;
import com.dqs.biz.model.TemperatureInfo;
import com.dqs.biz.vo.query.TemperatureInfoQuery;
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
public class TemperatureInfoManager extends BaseManager<TemperatureInfo,java.lang.Long>{

       /**
	 * DAO对象
	 */
	private TemperatureInfoDao temperatureInfoDao;
	/**设置DAO对象,spring就可以通过autowire自动设置对象属性*/
	public void setTemperatureInfoDao(TemperatureInfoDao dao) {
		this.temperatureInfoDao = dao;
	}
	/* (non-Javadoc)
	 * @see com.steven.framework.base.BaseManager#getEntityDao()
	 */
	public EntityDao getEntityDao() {
		return this.temperatureInfoDao;
	}
	/**分页查询
	 * @param query 查询条件
	 * @return 封装的Page对象
	 */
	@Transactional(readOnly=true)
	public Page findPage(TemperatureInfoQuery query) {
		return temperatureInfoDao.findPage(query);
	}
	/**获取指定表里的数据
	 * @param entity
	 * @return
	 * @throws DataAccessException
	 */
	public TemperatureInfo getById(TemperatureInfo entity) throws DataAccessException {
	 
	    return temperatureInfoDao.getById(entity);
	}
	/**通过obje删除指定table的数据
	 * @param deleteObj
	 */
	public void removeById(TemperatureInfo deleteObj) {
		temperatureInfoDao.deleteById(deleteObj);
	    
	}
	/**普通导入
	 * @param dataList
	 */
	public void importData(List<TemperatureInfo> dataList) {
		TemperatureInfo tempObj=null;
	    for(TemperatureInfo da:dataList){
		//先检查数据是否存在
		tempObj=temperatureInfoDao.checkById(da);
		if(tempObj!=null){
			temperatureInfoDao.update(da);
		}else{
			temperatureInfoDao.save(da);
		}
		
	    }
		
	}
	/**批量导入数据,效率高
	 * @param dataList
	 * @throws Exception 
	 */
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public void importDataBatch(List<TemperatureInfo> dataList) throws Exception {
//		 for(TemperatureInfo da:dataList){
//					temperatureInfoDao.save(da);
//		 }
		temperatureInfoDao.batchImport(dataList);
		
	}
}
