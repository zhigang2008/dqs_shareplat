package com.dqs.biz.model;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

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


public class RsMapLib extends BaseEntity implements java.io.Serializable{
        //序列化,请重新生成
	private static final long serialVersionUID = 0L;
	
	//表别名
	public static final String TABLE_ALIAS = "遥感图件库";
	//字段名称
	public static final String ALIAS_SEQNO = "序列号";
	public static final String ALIAS_MAP_LIB_NAME = "图库名称";
	public static final String ALIAS_MAP_COUNT = "图件数量";
	public static final String ALIAS_DESC_FILE_LOCATION = "说明文件路径";
	public static final String ALIAS_CREATE_TIME = "创建时间";
	public static final String ALIAS_REMARK = "备注";
	public static final String ALIAS_DESC_FILE_NAME = "说明文件";
	
	//date formats
	public static final String FORMAT_CREATE_TIME = DATE_FORMAT;
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
       /**
        * 序列号       db_column: SEQNO 
        */	
	//@Length(max=50)
	private java.lang.String seqno;
       /**
        * 图库名称       db_column: MAP_LIB_NAME 
        */	
	//@NotBlank @Length(max=100)
	private java.lang.String mapLibName;
       /**
        * 图件数量       db_column: MAP_COUNT 
        */	
	//@NotNull 
	private java.lang.Long mapCount;
       /**
        * 说明文件路径       db_column: DESC_FILE_LOCATION 
        */	
	//@Length(max=100)
	private java.lang.String descFileLocation;
       /**
        * 创建时间       db_column: CREATE_TIME 
        */	
	//@NotNull 
	private java.util.Date createTime;
       /**
        * 备注       db_column: REMARK 
        */	
	//@Length(max=150)
	private java.lang.String remark;
       /**
        * 说明文件       db_column: DESC_FILE_NAME 
        */	
	//@Length(max=50)
	private java.lang.String descFileName;
	//columns END

	public RsMapLib(){
	}

	public RsMapLib(
		java.lang.String seqno
	){
		this.seqno = seqno;
	}

	public void setSeqno(java.lang.String value) {
		this.seqno = value;
	}
	
	public java.lang.String getSeqno() {
		return this.seqno;
	}
	public void setMapLibName(java.lang.String value) {
		this.mapLibName = value;
	}
	
	public java.lang.String getMapLibName() {
		return this.mapLibName;
	}
	public void setMapCount(java.lang.Long value) {
		this.mapCount = value;
	}
	
	public java.lang.Long getMapCount() {
		return this.mapCount;
	}
	public void setDescFileLocation(java.lang.String value) {
		this.descFileLocation = value;
	}
	
	public java.lang.String getDescFileLocation() {
		return this.descFileLocation;
	}
	public String getCreateTimeString() {
		return DateConvertUtils.format(getCreateTime(), FORMAT_CREATE_TIME);
	}
	public void setCreateTimeString(String value) {
		setCreateTime(DateConvertUtils.parse(value, FORMAT_CREATE_TIME,java.util.Date.class));
	}
	
	public void setCreateTime(java.util.Date value) {
		this.createTime = value;
	}
	
	public java.util.Date getCreateTime() {
		return this.createTime;
	}
	public void setRemark(java.lang.String value) {
		this.remark = value;
	}
	
	public java.lang.String getRemark() {
		return this.remark;
	}
	public void setDescFileName(java.lang.String value) {
		this.descFileName = value;
	}
	
	public java.lang.String getDescFileName() {
		return this.descFileName;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Seqno",getSeqno())
			.append("MapLibName",getMapLibName())
			.append("MapCount",getMapCount())
			.append("DescFileLocation",getDescFileLocation())
			.append("CreateTime",getCreateTime())
			.append("Remark",getRemark())
			.append("DescFileName",getDescFileName())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getSeqno())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof RsMapLib == false) return false;
		if(this == obj) return true;
		RsMapLib other = (RsMapLib)obj;
		return new EqualsBuilder()
			.append(getSeqno(),other.getSeqno())
			.isEquals();
	}
}

