package com.dqs.biz.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dqs.biz.dao.BoreholeStrainDao;
import com.dqs.biz.model.BoreholeStrain;
import com.dqs.biz.vo.query.BoreholeStrainQuery;
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
public class BoreholeStrainManager extends BaseManager<BoreholeStrain,java.util.Date>{

       /**
	 * DAO对象
	 */
	private BoreholeStrainDao boreholeStrainDao;
	/**设置DAO对象,spring就可以通过autowire自动设置对象属性*/
	public void setBoreholeStrainDao(BoreholeStrainDao dao) {
		this.boreholeStrainDao = dao;
	}
	/* (non-Javadoc)
	 * @see com.steven.framework.base.BaseManager#getEntityDao()
	 */
	public EntityDao getEntityDao() {
		return this.boreholeStrainDao;
	}
	/**分页查询
	 * @param query 查询条件
	 * @return 封装的Page对象
	 */
	@Transactional(readOnly=true)
	public Page findPage(BoreholeStrainQuery query) {
		return boreholeStrainDao.findPage(query);
	}

	/**获取指定表里的数据
	 * @param entity
	 * @return
	 * @throws DataAccessException
	 */
	public BoreholeStrain getById(BoreholeStrain entity) throws DataAccessException {
	 
	    return boreholeStrainDao.getById(entity);
	}
	/**通过obje删除指定table的数据
	 * @param deleteObj
	 */
	public void removeById(BoreholeStrain deleteObj) {
	    boreholeStrainDao.deleteById(deleteObj);
	    
	}
	
	@Transactional(readOnly=true)
	public HashMap getCalcValue(BoreholeStrainQuery query) {
	    // TODO Auto-generated method stub
	    return boreholeStrainDao.getCalcValue(query);
	}
	
	/**批量导入系统
	 * @param datas
	 */
	public void importData(List<BoreholeStrain> datas){
	    BoreholeStrain tempObj=null;
	    for(BoreholeStrain da:datas){
		//先检查数据是否存在
		tempObj=boreholeStrainDao.getById(da);
		if(tempObj!=null){
		    boreholeStrainDao.update(da);
		}else{
		    boreholeStrainDao.save(da);
		}
		
	    }
	}
	/**导入数据,不加校验
	 * @param dataList
	 * @throws Exception 
	 */
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public void importDataNoCheck(List<BoreholeStrain> dataList) throws Exception {
//		    for(BoreholeStrain da:dataList){
//			    boreholeStrainDao.save(da);
//		    }
		boreholeStrainDao.batchImport(dataList);


	}
	
}
