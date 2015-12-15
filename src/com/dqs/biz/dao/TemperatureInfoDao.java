package com.dqs.biz.dao;

import java.util.List;

import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dqs.biz.model.BoreholeStrain;
import com.dqs.biz.model.TemperatureInfo;
import com.dqs.biz.vo.query.TemperatureInfoQuery;
import com.steven.framework.base.BaseIbatis3Dao;
import com.steven.framework.core.page.Page;


@Repository
public class TemperatureInfoDao extends BaseIbatis3Dao<TemperatureInfo,java.lang.Long>{
        /* (non-Javadoc)
	 * @see com.steven.framework.base.BaseIbatis3Dao#getIbatisMapperNamesapce()
	 */
	@Override
	public String getIbatisMapperNamesapce() {
		return "TemperatureInfo";
	}
	/* (non-Javadoc)
	 * @see com.steven.framework.base.EntityDao#saveOrUpdate(java.lang.Object)
	 */
	public void saveOrUpdate(TemperatureInfo entity) {
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
	public Page findPage(TemperatureInfoQuery query) {
		return pageQuery("TemperatureInfo.findPage",query);
	}
	
	/**改写delete方式
	 * @param entity
	 */
	public void deleteById(TemperatureInfo entity) {
	    
	    getSqlSessionTemplate().update(getIbatisMapperNamesapce()+".delete", entity);
	}

	/**指定table的查询
	 * @param entity
	 * @return
	 */
	public TemperatureInfo getById(TemperatureInfo entity) {
	    return (TemperatureInfo)(getSqlSessionTemplate().selectOne(getIbatisMapperNamesapce()+".getById", entity));
	}
	/**
	 * @param da
	 * @return
	 */
	public TemperatureInfo checkById(TemperatureInfo da) {
		return (TemperatureInfo)(getSqlSessionTemplate().selectOne(getIbatisMapperNamesapce()+".checkById", da));
	}
	
	/**批量导入
	 * @param dataList
	 */
	public void batchImport(List<TemperatureInfo> dataList) throws Exception{
		SqlSession ses=this.getSqlSessionFactory().openSession(ExecutorType.BATCH, false);
		int commitSize=1000;
		int i=0;
		TemperatureInfo tempObj;
		try{
		for(TemperatureInfo b:dataList){
			i++;
			tempObj=(TemperatureInfo)ses.selectOne(getIbatisMapperNamesapce()+".checkById", b);
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
			throw e;
		}finally{
			ses.close();
		}
	}
}
