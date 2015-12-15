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


public class RsMapsQuery extends BaseQuery implements Serializable {
    //序列化,请自动生成
    private static final long serialVersionUID = 0L;
    

	/** 图件库编号 */
	private java.lang.String libId;
	/** 图件编码 */
	private java.lang.String mapId;
	/** 图件名称 */
	private java.lang.String mapName;
	/** 图件路径 */
	private java.lang.String mapLocation;
	/** 上传时间 */
	private java.util.Date uploadTimeBegin;
	private java.util.Date uploadTimeEnd;
	/** 序列号 */
	private java.lang.String seqno;

	public java.lang.String getLibId() {
		return this.libId;
	}
	
	public void setLibId(java.lang.String value) {
		this.libId = value;
	}
	
	public java.lang.String getMapId() {
		return this.mapId;
	}
	
	public void setMapId(java.lang.String value) {
		this.mapId = value;
	}
	
	public java.lang.String getMapName() {
		return this.mapName;
	}
	
	public void setMapName(java.lang.String value) {
		this.mapName = value;
	}
	
	public java.lang.String getMapLocation() {
		return this.mapLocation;
	}
	
	public void setMapLocation(java.lang.String value) {
		this.mapLocation = value;
	}
	
	public java.util.Date getUploadTimeBegin() {
		return this.uploadTimeBegin;
	}
	
	public void setUploadTimeBegin(java.util.Date value) {
		this.uploadTimeBegin = value;
	}	
	
	public java.util.Date getUploadTimeEnd() {
		return this.uploadTimeEnd;
	}
	
	public void setUploadTimeEnd(java.util.Date value) {
		this.uploadTimeEnd = value;
	}
	
	public java.lang.String getSeqno() {
		return this.seqno;
	}
	
	public void setSeqno(java.lang.String value) {
		this.seqno = value;
	}
	

	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}
	
}

