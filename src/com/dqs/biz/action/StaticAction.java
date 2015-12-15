package com.dqs.biz.action;

import org.apache.commons.lang.StringUtils;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

/**
 * @author steven
 * @version 1.0
 * @since 1.0
 */


public class StaticAction extends ActionSupport implements Preparable {
	private String includePage;
	private String fileExtention;

	@Override
	public void prepare() throws Exception {
		fileExtention="html";
		
	}
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		ActionInvocation invocation = ActionContext.getContext().getActionInvocation();
		includePage = "";
		String namespace = invocation.getProxy().getNamespace();
		if (StringUtils.isNotBlank(namespace) && !namespace.equals("/")) {
			includePage = includePage + namespace;
		}
		String actionName = invocation.getProxy().getActionName();
		if (StringUtils.isNotBlank(actionName)) {
			includePage = includePage + "/" + actionName;
		}
		includePage=includePage+"."+ getExt();
		return super.execute();
	}

	/**
	 * @return the includePage
	 */
	public String getIncludePage() {
		return includePage;
	}

	/**
	 * @param includePage the includePage to set
	 */
	public void setIncludePage(String includePage) {
		this.includePage = includePage;
	}

	/**
	 * @return the fileExtention
	 */
	public String getExt() {
		return fileExtention;
	}

	/**
	 * @param fileExtention the fileExtention to set
	 */
	public void setExt(String fileExtention) {
		this.fileExtention = fileExtention;
	}

	
	
	
}
