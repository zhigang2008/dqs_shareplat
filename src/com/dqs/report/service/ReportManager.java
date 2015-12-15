package com.dqs.report.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.dqs.report.dao.ReportDao;
import com.steven.framework.base.BaseManager;
import com.steven.framework.base.EntityDao;

/**
 * @author steven
 * @version 1.0
 * @since 1.0
 */

@Service
public class ReportManager extends BaseManager{

       /**
	 * DAO对象
	 */
	private ReportDao reportDao;
	/**设置DAO对象,spring就可以通过autowire自动设置对象属性*/
	public void setReportDao(ReportDao dao) {
		this.reportDao = dao;
	}
	/* (non-Javadoc)
	 * @see com.steven.framework.base.BaseManager#getEntityDao()
	 */
	public EntityDao getEntityDao() {
		return this.reportDao;
	}
	/**分页查询
	 * @param query 查询条件
	 * @return 封装的Page对象
	 */

	public List getReport(String reportName,Map params) {
		return reportDao.getReport(reportName,params);
	}
	
}
