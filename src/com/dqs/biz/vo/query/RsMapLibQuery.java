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


public class RsMapLibQuery extends BaseQuery implements Serializable {
    //序列化,请自动生成
    private static final long serialVersionUID = 0L;
    

	/** 序列号 */
	private java.lang.String seqno;
	/** 图库名称 */
	private java.lang.String mapLibName;
	/** 图件数量 */
	private java.lang.Long mapCount;
	/** 说明文件路径 */
	private java.lang.String descFileLocation;
	/** 创建时间 */
	private java.util.Date createTimeBegin;
	private java.util.Date createTimeEnd;
	/** 备注 */
	private java.lang.String remark;
	/** 说明文件 */
	private java.lang.String descFileName;

	public java.lang.String getSeqno() {
		return this.seqno;
	}
	
	public void setSeqno(java.lang.String value) {
		this.seqno = value;
	}
	
	public java.lang.String getMapLibName() {
		return this.mapLibName;
	}
	
	public void setMapLibName(java.lang.String value) {
		this.mapLibName = value;
	}
	
	public java.lang.Long getMapCount() {
		return this.mapCount;
	}
	
	public void setMapCount(java.lang.Long value) {
		this.mapCount = value;
	}
	
	public java.lang.String getDescFileLocation() {
		return this.descFileLocation;
	}
	
	public void setDescFileLocation(java.lang.String value) {
		this.descFileLocation = value;
	}
	
	public java.util.Date getCreateTimeBegin() {
		return this.createTimeBegin;
	}
	
	public void setCreateTimeBegin(java.util.Date value) {
		this.createTimeBegin = value;
	}	
	
	public java.util.Date getCreateTimeEnd() {
		return this.createTimeEnd;
	}
	
	public void setCreateTimeEnd(java.util.Date value) {
		this.createTimeEnd = value;
	}
	
	public java.lang.String getRemark() {
		return this.remark;
	}
	
	public void setRemark(java.lang.String value) {
		this.remark = value;
	}
	
	public java.lang.String getDescFileName() {
		return this.descFileName;
	}
	
	public void setDescFileName(java.lang.String value) {
		this.descFileName = value;
	}
	

	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}
	
}

