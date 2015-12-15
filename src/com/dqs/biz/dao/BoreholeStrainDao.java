package com.dqs.biz.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.dqs.biz.model.BoreholeStrain;
import com.dqs.biz.vo.query.BoreholeStrainQuery;
import com.steven.framework.base.BaseIbatis3Dao;
import com.steven.framework.core.page.Page;


@Repository
public class BoreholeStrainDao extends BaseIbatis3Dao<BoreholeStrain,java.util.Date>{
        /* (non-Javadoc)
	 * @see com.steven.framework.base.BaseIbatis3Dao#getIbatisMapperNamesapce()
	 */
	@Override
	public String getIbatisMapperNamesapce() {
		return "BoreholeStrain";
	}
	/* (non-Javadoc)
	 * @see com.steven.framework.base.EntityDao#saveOrUpdate(java.lang.Object)
	 */
	public void saveOrUpdate(BoreholeStrain entity) {
		if(entity.getObserveTime() == null){ 
			//save(entity);
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
	public Page findPage(BoreholeStrainQuery query) {
		return pageQuery("BoreholeStrain.findPage",query);
	}

	/**改写delete方式
	 * @param entity
	 */
	public void deleteById(BoreholeStrain entity) {
	    
	    getSqlSessionTemplate().update(getIbatisMapperNamesapce()+".delete", entity);
	}

	/**指定table的查询
	 * @param entity
	 * @return
	 */
	public BoreholeStrain getById(BoreholeStrain entity) {
	    return (BoreholeStrain)(getSqlSessionTemplate().selectOne(getIbatisMapperNamesapce()+".getById", entity));
	}
	public HashMap getCalcValue(BoreholeStrainQuery query) {
	    return (HashMap)getSqlSessionTemplate().selectOne(getIbatisMapperNamesapce()+".getCalcValue", query);
	}
	

	/**批量导入
	 * 启用了批量模式,批次提交.
	 * @param dataList
	 */
	
	public void batchImport(List<BoreholeStrain> dataList) throws Exception {
		SqlSession ses=this.getSqlSessionFactory().openSession(ExecutorType.BATCH, true);
		int commitSize=1000;
		int i=0;
		BoreholeStrain tempObj;
		try{
		for(BoreholeStrain b:dataList){
			i++;
			tempObj=(BoreholeStrain)ses.selectOne(getIbatisMapperNamesapce()+".getById", b);
			//需要判断是否存在记录
			if(tempObj!=null){
				ses.update(getUpdateStatement(),b);
			}else{
			   ses.insert(getInsertStatement(),b);
			}
			if(i%commitSize==0){
				ses.commit();
				ses.clearCache();
			}
		}
		//最终提交
		ses.commit();
		}catch(Exception e){
			ses.rollback();
			//e.printStackTrace();
			throw e;
			
		}finally{
			ses.close();
		}
	}
}
