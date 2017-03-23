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


public class SenseDataQuery extends BaseQuery implements Serializable {
    //序列化,请自动生成
    private static final long serialVersionUID = 0L;
    

	/** 序号 */
	private java.lang.Long seqno;
	/** 标题 */
	private java.lang.String title;
	/** 文件名 */
	private java.lang.String fileName;
	/** 上传时间 */
	private java.util.Date insertTimeBegin;
	private java.util.Date insertTimeEnd;
	/** 浏览数 */
	private java.lang.Long viewCount;
	/** 下载量 */
	private java.lang.Long downloadCount;
	/** 备注 */
	private java.lang.String remark;

	public java.lang.Long getSeqno() {
		return this.seqno;
	}
	
	public void setSeqno(java.lang.Long value) {
		this.seqno = value;
	}
	
	public java.lang.String getTitle() {
		return this.title;
	}
	
	public void setTitle(java.lang.String value) {
		this.title = value;
	}
	
	public java.lang.String getFileName() {
		return this.fileName;
	}
	
	public void setFileName(java.lang.String value) {
		this.fileName = value;
	}
	
	public java.util.Date getInsertTimeBegin() {
		return this.insertTimeBegin;
	}
	
	public void setInsertTimeBegin(java.util.Date value) {
		this.insertTimeBegin = value;
	}	
	
	public java.util.Date getInsertTimeEnd() {
		return this.insertTimeEnd;
	}
	
	public void setInsertTimeEnd(java.util.Date value) {
		this.insertTimeEnd = value;
	}
	
	public java.lang.Long getViewCount() {
		return this.viewCount;
	}
	
	public void setViewCount(java.lang.Long value) {
		this.viewCount = value;
	}
	
	public java.lang.Long getDownloadCount() {
		return this.downloadCount;
	}
	
	public void setDownloadCount(java.lang.Long value) {
		this.downloadCount = value;
	}
	
	public java.lang.String getRemark() {
		return this.remark;
	}
	
	public void setRemark(java.lang.String value) {
		this.remark = value;
	}
	

	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}
	
}

