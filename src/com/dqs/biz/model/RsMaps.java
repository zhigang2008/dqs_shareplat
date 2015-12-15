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


public class RsMaps extends BaseEntity implements java.io.Serializable{
        //序列化,请重新生成
	private static final long serialVersionUID = 0L;
	
	//表别名
	public static final String TABLE_ALIAS = "遥感图件信息";
	//字段名称
	public static final String ALIAS_LIB_ID = "图件库编号";
	public static final String ALIAS_MAP_ID = "图件编码";
	public static final String ALIAS_MAP_NAME = "图件名称";
	public static final String ALIAS_MAP_LOCATION = "图件路径";
	public static final String ALIAS_UPLOAD_TIME = "上传时间";
	public static final String ALIAS_SEQNO = "序列号";
	
	//date formats
	public static final String FORMAT_UPLOAD_TIME = DATE_FORMAT;
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
       /**
        * 图件库编号       db_column: LIB_ID 
        */	
	//@NotBlank @Length(max=50)
	private java.lang.String libId;
       /**
        * 图件编码       db_column: MAP_ID 
        */	
	//@NotBlank @Length(max=80)
	private java.lang.String mapId;
       /**
        * 图件名称       db_column: MAP_NAME 
        */	
	//@NotBlank @Length(max=50)
	private java.lang.String mapName;
       /**
        * 图件路径       db_column: MAP_LOCATION 
        */	
	//@Length(max=100)
	private java.lang.String mapLocation;
       /**
        * 上传时间       db_column: UPLOAD_TIME 
        */	
	//@NotNull 
	private java.util.Date uploadTime;
       /**
        * 序列号       db_column: SEQNO 
        */	
	//@Length(max=50)
	private java.lang.String seqno;
	//columns END

	public RsMaps(){
	}

	public RsMaps(
		java.lang.String seqno
	){
		this.seqno = seqno;
	}

	public void setLibId(java.lang.String value) {
		this.libId = value;
	}
	
	public java.lang.String getLibId() {
		return this.libId;
	}
	public void setMapId(java.lang.String value) {
		this.mapId = value;
	}
	
	public java.lang.String getMapId() {
		return this.mapId;
	}
	public void setMapName(java.lang.String value) {
		this.mapName = value;
	}
	
	public java.lang.String getMapName() {
		return this.mapName;
	}
	public void setMapLocation(java.lang.String value) {
		this.mapLocation = value;
	}
	
	public java.lang.String getMapLocation() {
		return this.mapLocation;
	}
	public String getUploadTimeString() {
		return DateConvertUtils.format(getUploadTime(), FORMAT_UPLOAD_TIME);
	}
	public void setUploadTimeString(String value) {
		setUploadTime(DateConvertUtils.parse(value, FORMAT_UPLOAD_TIME,java.util.Date.class));
	}
	
	public void setUploadTime(java.util.Date value) {
		this.uploadTime = value;
	}
	
	public java.util.Date getUploadTime() {
		return this.uploadTime;
	}
	public void setSeqno(java.lang.String value) {
		this.seqno = value;
	}
	
	public java.lang.String getSeqno() {
		return this.seqno;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("LibId",getLibId())
			.append("MapId",getMapId())
			.append("MapName",getMapName())
			.append("MapLocation",getMapLocation())
			.append("UploadTime",getUploadTime())
			.append("Seqno",getSeqno())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getSeqno())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof RsMaps == false) return false;
		if(this == obj) return true;
		RsMaps other = (RsMaps)obj;
		return new EqualsBuilder()
			.append(getSeqno(),other.getSeqno())
			.isEquals();
	}
}

