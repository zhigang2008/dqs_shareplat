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


public class DownloadRecord extends BaseEntity implements java.io.Serializable{
        //序列化,请重新生成
	private static final long serialVersionUID = 0L;
	
	//表别名
	public static final String TABLE_ALIAS = "数据下载记录表";
	//字段名称
	public static final String ALIAS_SEQNO = "序列号";
	public static final String ALIAS_USERID = "用户ID";
	public static final String ALIAS_USER_NAME = "用户姓名";
	public static final String ALIAS_DOWNLOAD_TIME = "下载时间";
	public static final String ALIAS_FILE_CATALOG = "文件目录";
	public static final String ALIAS_FILE_NAME = "文件名称";
	public static final String ALIAS_FROMIP = "来源IP";
	
	//date formats
	public static final String FORMAT_DOWNLOAD_TIME = DATE_FORMAT;
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
       /**
        * 序列号       db_column: SEQNO 
        */	
	//
	private java.lang.Long seqno;
       /**
        * 用户ID       db_column: USERID 
        */	
	//@NotNull 
	private java.lang.Long userid;
       /**
        * 用户姓名       db_column: USER_NAME 
        */	
	//@Length(max=100)
	private java.lang.String userName;
       /**
        * 下载时间       db_column: DOWNLOAD_TIME 
        */	
	//@NotNull 
	private java.util.Date downloadTime;
       /**
        * 文件目录       db_column: FILE_CATALOG 
        */	
	//@Length(max=100)
	private java.lang.String fileCatalog;
       /**
        * 文件名称       db_column: FILE_NAME 
        */	
	//@Length(max=100)
	private java.lang.String fileName;
       /**
        * 来源IP       db_column: FROMIP 
        */	
	//@Length(max=100)
	private java.lang.String fromip;
	//columns END

	public DownloadRecord(){
	}

	public DownloadRecord(
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
	public void setUserid(java.lang.Long value) {
		this.userid = value;
	}
	
	public java.lang.Long getUserid() {
		return this.userid;
	}
	public void setUserName(java.lang.String value) {
		this.userName = value;
	}
	
	public java.lang.String getUserName() {
		return this.userName;
	}
	public String getDownloadTimeString() {
		return DateConvertUtils.format(getDownloadTime(), FORMAT_DOWNLOAD_TIME);
	}
	public void setDownloadTimeString(String value) {
		setDownloadTime(DateConvertUtils.parse(value, FORMAT_DOWNLOAD_TIME,java.util.Date.class));
	}
	
	public void setDownloadTime(java.util.Date value) {
		this.downloadTime = value;
	}
	
	public java.util.Date getDownloadTime() {
		return this.downloadTime;
	}
	public void setFileCatalog(java.lang.String value) {
		this.fileCatalog = value;
	}
	
	public java.lang.String getFileCatalog() {
		return this.fileCatalog;
	}
	public void setFileName(java.lang.String value) {
		this.fileName = value;
	}
	
	public java.lang.String getFileName() {
		return this.fileName;
	}
	public void setFromip(java.lang.String value) {
		this.fromip = value;
	}
	
	public java.lang.String getFromip() {
		return this.fromip;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Seqno",getSeqno())
			.append("Userid",getUserid())
			.append("UserName",getUserName())
			.append("DownloadTime",getDownloadTime())
			.append("FileCatalog",getFileCatalog())
			.append("FileName",getFileName())
			.append("Fromip",getFromip())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getSeqno())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof DownloadRecord == false) return false;
		if(this == obj) return true;
		DownloadRecord other = (DownloadRecord)obj;
		return new EqualsBuilder()
			.append(getSeqno(),other.getSeqno())
			.isEquals();
	}
}

