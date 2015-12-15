/*    */ package org.apache.ibatis.executor;
/*    */ 
/*    */ import java.sql.BatchUpdateException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.ibatis.executor.keygen.Jdbc3KeyGenerator;
import org.apache.ibatis.executor.keygen.KeyGenerator;
import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.transaction.Transaction;

/*    */ public class BatchExecutor extends BaseExecutor
/*    */ {
/*    */   public static final int BATCH_UPDATE_RETURN_VALUE = -2147482646;
/* 24 */   private final List<Statement> statementList = new ArrayList();
/* 25 */   private final List<BatchResult> batchResultList = new ArrayList();
/*    */   private String currentSql;
/*    */ 
/*    */   public BatchExecutor(Configuration configuration, Transaction transaction)
/*    */   {
/* 29 */     super(configuration, transaction);
/*    */   }
/*    */ 
/*    */   public int doUpdate(MappedStatement ms, Object parameterObject) throws SQLException
/*    */   {
/* 34 */     Configuration configuration = ms.getConfiguration();
/* 35 */     StatementHandler handler = configuration.newStatementHandler(this, ms, parameterObject, RowBounds.DEFAULT, null);
/* 36 */     BoundSql boundSql = handler.getBoundSql();
/* 37 */     String sql = boundSql.getSql();
/*    */     Statement stmt;
/* 39 */     if ((this.currentSql != null) && (sql.hashCode() == this.currentSql.hashCode()) && (sql.length() == this.currentSql.length())) {
/* 40 */       int last = this.statementList.size() - 1;
/* 41 */       stmt = (Statement)this.statementList.get(last);
/*    */     } else {
/* 43 */       Connection connection = this.transaction.getConnection();
/* 44 */       stmt = handler.prepare(connection);
/* 45 */       this.currentSql = sql;
/* 46 */       this.statementList.add(stmt);
/* 47 */       this.batchResultList.add(new BatchResult(ms, sql, parameterObject));
/*    */     }
/* 49 */     handler.parameterize(stmt);
/* 50 */     handler.batch(stmt);
/* 51 */     return BATCH_UPDATE_RETURN_VALUE;
/*    */   }
/*    */ 
/*    */   public List doQuery(MappedStatement ms, Object parameterObject, RowBounds rowBounds, ResultHandler resultHandler) throws SQLException
/*    */   {
/* 56 */     flushStatements();
/* 57 */     Configuration configuration = ms.getConfiguration();
/* 58 */     StatementHandler handler = configuration.newStatementHandler(this, ms, parameterObject, rowBounds, resultHandler);
/* 59 */     Connection connection = this.transaction.getConnection();
/* 60 */     Statement stmt = handler.prepare(connection);
/* 61 */     handler.parameterize(stmt);
              try{

/* 62 */     return handler.query(stmt, resultHandler);
              }finally{
            	  closeStatement(stmt);
              }
/*    */   }
/*    */ 
/*    */   public List<BatchResult> doFlushStatements() throws SQLException {
/* 66 */     List results = new ArrayList();
/*    */     try {
/* 68 */       int i = 0; for (int n = this.statementList.size(); i < n; i++) {
/* 69 */         Statement stmt = (Statement)this.statementList.get(i);
/* 70 */         BatchResult batchResult = (BatchResult)this.batchResultList.get(i);
/*    */         try {
/* 72 */           batchResult.setUpdateCounts(stmt.executeBatch());
/* 73 */           MappedStatement ms = batchResult.getMappedStatement();
/* 74 */           Object parameter = batchResult.getParameterObject();
/* 75 */           KeyGenerator keyGenerator = ms.getKeyGenerator();
/* 76 */           if ((keyGenerator instanceof Jdbc3KeyGenerator))
/* 77 */             keyGenerator.processAfter(this, ms, stmt, parameter);
/*    */         }
/*    */         catch (BatchUpdateException e) {
/* 80 */           StringBuffer message = new StringBuffer();
/* 81 */           message.append(batchResult.getMappedStatement().getId()).append(" (batch index #").append(i + 1).append(")").append(" failed.");
/*    */ 
/* 86 */           if (i > 0) {
/* 87 */             message.append(" ").append(i).append(" prior sub executor(s) completed successfully, but will be rolled back.");
/*    */           }
/*    */ 
/* 91 */           throw new BatchExecutorException(message.toString(), e, results, batchResult);
/*    */         }
/* 93 */         results.add(batchResult);
/*    */       }
/*    */       Iterator i$;
/*    */       Statement stmt;
/* 95 */       return results;
/*    */     } finally {
/* 97 */       for (Statement stmt : this.statementList) {
/* 98 */         closeStatement(stmt);
/*    */       }
/* 100 */       this.currentSql = null;
/* 101 */       this.statementList.clear();
/* 102 */       this.batchResultList.clear();
/*    */     }
/*    */   }
/*    */ }

/* Location:           C:\Documents and Settings\Steven\Local Settings\Temp\Rar$DI02.843\
 * Qualified Name:     org.apache.ibatis.executor.BatchExecutor
 * JD-Core Version:    0.6.2
 */