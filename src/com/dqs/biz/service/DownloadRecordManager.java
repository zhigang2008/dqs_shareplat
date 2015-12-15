package com.dqs.biz.service;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dqs.biz.dao.DownloadRecordDao;
import com.dqs.biz.model.DownloadData;
import com.dqs.biz.model.DownloadRecord;
import com.dqs.biz.vo.query.DownloadRecordQuery;
import com.steven.Constants;
import com.steven.core.model.User;
import com.steven.framework.base.BaseManager;
import com.steven.framework.base.EntityDao;
import com.steven.framework.core.page.Page;

/**
 * @author steven
 * @version 1.0
 * @since 1.0
 */

@Service
@Transactional
public class DownloadRecordManager extends BaseManager<DownloadRecord,java.lang.Long>{

       /**
	 * DAO对象
	 */
	private DownloadRecordDao downloadRecordDao;
	private DownloadDataManager downloadDataManager;
	
	/**设置DAO对象,spring就可以通过autowire自动设置对象属性*/
	public void setDownloadRecordDao(DownloadRecordDao dao) {
		this.downloadRecordDao = dao;
	}
	/* (non-Javadoc)
	 * @see com.steven.framework.base.BaseManager#getEntityDao()
	 */
	public EntityDao getEntityDao() {
		return this.downloadRecordDao;
	}
	/**分页查询
	 * @param query 查询条件
	 * @return 封装的Page对象
	 */
	@Transactional(readOnly=true)
	public Page findPage(DownloadRecordQuery query) {
		return downloadRecordDao.findPage(query);
	}
	
	@Override
	public void save(DownloadRecord entity) throws DataAccessException {
		// TODO Auto-generated method stub
		super.save(entity);
		
		DownloadData queryData=new DownloadData();
		queryData.setFileCatalog(entity.getFileCatalog());
		queryData.setFileName(entity.getFileName());
		//更新下载统计记录
		DownloadData existData=this.downloadDataManager.getByModel(queryData);
		if(existData==null){
			queryData.setDownloadCount(1l);
			queryData.setUpdateTime(new Date());
			this.downloadDataManager.save(queryData);
		}else{
			existData.setDownloadCount(existData.getDownloadCount()+1);
			existData.setUpdateTime(new Date());
			this.downloadDataManager.update(existData);
		}
	}
	public DownloadDataManager getDownloadDataManager() {
		return downloadDataManager;
	}
	public void setDownloadDataManager(DownloadDataManager downloadDataManager) {
		this.downloadDataManager = downloadDataManager;
	}
	
	/**记录下载行为
	 * @param fileCatalog 文件分类
	 * @param fileName 文件名
	 * @param request 请求
	 */
	public void downloadRecord(String fileCatalog,String fileName,HttpServletRequest request){
		HttpSession session=request.getSession(false);
		Integer userid=999999;
		String userName="未登录用户";
		
		if(session!=null){
			User user=(User)session.getAttribute(Constants.CURRENT_USER);
			if(user!=null){
				userid=user.getUserid();
				userName=user.getUserName();
			}
			
		}
		//下载记录
		String fromip=request.getRemoteAddr();
		DownloadRecord downloadRecord=new DownloadRecord();
		downloadRecord.setDownloadTime(new Date());
		downloadRecord.setUserid(userid.longValue());
		downloadRecord.setUserName(userName);
		downloadRecord.setFileCatalog(fileCatalog);
		downloadRecord.setFileName(fileName);
		downloadRecord.setFromip(fromip);
		
		this.save(downloadRecord);
	}
	
}
