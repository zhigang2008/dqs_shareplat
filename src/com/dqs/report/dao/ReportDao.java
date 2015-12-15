package com.dqs.report.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.steven.framework.base.BaseIbatis3Dao;


@Repository
public class ReportDao extends BaseIbatis3Dao{
        /* (non-Javadoc)
	 * @see com.steven.framework.base.BaseIbatis3Dao#getIbatisMapperNamesapce()
	 */
	@Override
	public String getIbatisMapperNamesapce() {
		return "Report";
	}

	/**获取报表数据
	 * @param reportName
	 * @param params
	 * @return
	 */
	public List getReport(String reportName,Map params) {
		return (List)getSqlSessionTemplate().selectList(getIbatisMapperNamesapce()+"."+reportName, params);
	}

	@Override
	public void saveOrUpdate(Object entity) throws DataAccessException {
		// TODO Auto-generated method stub
			
	}
	

}
