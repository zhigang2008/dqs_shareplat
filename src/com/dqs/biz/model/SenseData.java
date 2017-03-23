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


public class SenseData extends BaseEntity implements java.io.Serializable{
        //序列化,请重新生成
	private static final long serialVersionUID = 0L;
	
	//表别名
	public static final String TABLE_ALIAS = "遥感图件库";
	//字段名称
	public static final String ALIAS_SEQNO = "序号";
	public static final String ALIAS_TITLE = "标题";
	public static final String ALIAS_FILE_NAME = "文件名";
	public static final String ALIAS_INSERT_TIME = "上传时间";
	public static final String ALIAS_VIEW_COUNT = "浏览数";
	public static final String ALIAS_DOWNLOAD_COUNT = "下载量";
	public static final String ALIAS_REMARK = "备注";
	
	//date formats
	public static final String FORMAT_INSERT_TIME = DATE_FORMAT;
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
       /**
        * 序号       db_column: SEQNO 
        */	
	//
	private java.lang.Long seqno;
       /**
        * 标题       db_column: TITLE 
        */	
	//@NotBlank @Length(max=100)
	private java.lang.String title;
       /**
        * 文件名       db_column: FILE_NAME 
        */	
	//@Length(max=150)
	private java.lang.String fileName;
       /**
        * 上传时间       db_column: INSERT_TIME 
        */	
	//@NotNull 
	private java.util.Date insertTime;
       /**
        * 浏览数       db_column: VIEW_COUNT 
        */	
	//
	private java.lang.Long viewCount;
       /**
        * 下载量       db_column: DOWNLOAD_COUNT 
        */	
	//
	private java.lang.Long downloadCount;
       /**
        * 备注       db_column: REMARK 
        */	
	//@Length(max=200)
	private java.lang.String remark;
	//columns END

	public SenseData(){
	}

	public SenseData(
		java.lang.Long seqno
	){
		this.seqno = seqno;
	}

	public void setSeqno(java.lang.Long value) {
		this.seqno = value;
	}
	
	public java.lang.Long getSeqno() {
		return this.seqno;
	}
	public void setTitle(java.lang.String value) {
		this.title = value;
	}
	
	public java.lang.String getTitle() {
		return this.title;
	}
	public void setFileName(java.lang.String value) {
		this.fileName = value;
	}
	
	public java.lang.String getFileName() {
		return this.fileName;
	}
	public String getInsertTimeString() {
		return DateConvertUtils.format(getInsertTime(), FORMAT_INSERT_TIME);
	}
	public void setInsertTimeString(String value) {
		setInsertTime(DateConvertUtils.parse(value, FORMAT_INSERT_TIME,java.util.Date.class));
	}
	
	public void setInsertTime(java.util.Date value) {
		this.insertTime = value;
	}
	
	public java.util.Date getInsertTime() {
		return this.insertTime;
	}
	public void setViewCount(java.lang.Long value) {
		this.viewCount = value;
	}
	
	public java.lang.Long getViewCount() {
		return this.viewCount;
	}
	public void setDownloadCount(java.lang.Long value) {
		this.downloadCount = value;
	}
	
	public java.lang.Long getDownloadCount() {
		return this.downloadCount;
	}
	public void setRemark(java.lang.String value) {
		this.remark = value;
	}
	
	public java.lang.String getRemark() {
		return this.remark;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Seqno",getSeqno())
			.append("Title",getTitle())
			.append("FileName",getFileName())
			.append("InsertTime",getInsertTime())
			.append("ViewCount",getViewCount())
			.append("DownloadCount",getDownloadCount())
			.append("Remark",getRemark())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getSeqno())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof SenseData == false) return false;
		if(this == obj) return true;
		SenseData other = (SenseData)obj;
		return new EqualsBuilder()
			.append(getSeqno(),other.getSeqno())
			.isEquals();
	}
}

