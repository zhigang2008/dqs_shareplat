/**
 * 
 */
package com.dqs.report.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.dqs.report.service.ReportManager;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.steven.framework.base.BaseStruts2Action;

/**
 * @author Administrator
 *
 */
public class ReportAction extends BaseStruts2Action implements Preparable,ModelDriven {

	private ReportManager reportManager;
	private List result;
	private String reportName;
	private Map params;



	@Override
	public void prepare() throws Exception {
		params=new HashMap();
		
	}

	@Override
	public List getModel() {
		return this.result;
	}

	public String execute(){
		result= reportManager.getReport(reportName, params);
		saveJsonResult(result);
		return JSONLIST;
	}

	/**
	 * @return the result
	 */
	public List getResult() {
		return result;
	}

	/**
	 * @param result the result to set
	 */
	public void setResult(List result) {
		this.result = result;
	}

	/**
	 * @return the reportName
	 */
	public String getReportName() {
		return reportName;
	}

	/**
	 * @param reportName the reportName to set
	 */
	public void setReportName(String reportName) {
		this.reportName = reportName;
	}

	/**
	 * @param reportManager the reportManager to set
	 */
	public void setReportManager(ReportManager reportManager) {
		this.reportManager = reportManager;
	}

	/**
	 * @return the params
	 */
	public Map getParams() {
		return params;
	}

	/**
	 * @param params the params to set
	 */
	public void setParams(Map params) {
		this.params = params;
	}
	
	

}
