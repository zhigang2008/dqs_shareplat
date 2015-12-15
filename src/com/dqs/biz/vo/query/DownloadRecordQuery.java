package com.dqs.biz.vo.query;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import java.io.Serializable;

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


public class DownloadRecordQuery extends BaseQuery implements Serializable {
    //序列化,请自动生成
    private static final long serialVersionUID = 0L;
    

	/** 序列号 */
	private java.lang.Long seqno;
	/** 用户ID */
	private java.lang.Long userid;
	/** 用户姓名 */
	private java.lang.String userName;
	/** 下载时间 */
	private java.util.Date downloadTimeBegin;
	private java.util.Date downloadTimeEnd;
	/** 文件目录 */
	private java.lang.String fileCatalog;
	/** 文件名称 */
	private java.lang.String fileName;
	/** 来源IP */
	private java.lang.String fromip;

	public java.lang.Long getSeqno() {
		return this.seqno;
	}
	
	public void setSeqno(java.lang.Long value) {
		this.seqno = value;
	}
	
	public java.lang.Long getUserid() {
		return this.userid;
	}
	
	public void setUserid(java.lang.Long value) {
		this.userid = value;
	}
	
	public java.lang.String getUserName() {
		return this.userName;
	}
	
	public void setUserName(java.lang.String value) {
		this.userName = value;
	}
	
	public java.util.Date getDownloadTimeBegin() {
		return this.downloadTimeBegin;
	}
	
	public void setDownloadTimeBegin(java.util.Date value) {
		this.downloadTimeBegin = value;
	}	
	
	public java.util.Date getDownloadTimeEnd() {
		return this.downloadTimeEnd;
	}
	
	public void setDownloadTimeEnd(java.util.Date value) {
		this.downloadTimeEnd = value;
	}
	
	public java.lang.String getFileCatalog() {
		return this.fileCatalog;
	}
	
	public void setFileCatalog(java.lang.String value) {
		this.fileCatalog = value;
	}
	
	public java.lang.String getFileName() {
		return this.fileName;
	}
	
	public void setFileName(java.lang.String value) {
		this.fileName = value;
	}
	
	public java.lang.String getFromip() {
		return this.fromip;
	}
	
	public void setFromip(java.lang.String value) {
		this.fromip = value;
	}
	

	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}
	
}

