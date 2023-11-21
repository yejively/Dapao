package com.dapao.controller;

import java.sql.Connection;

import java.sql.SQLException;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dapao.domain.AcVO;
import com.dapao.persistence.AdminDAOImpl;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"}
		)
public class DataSourceTest {
	
	private static final Logger logger = LoggerFactory.getLogger(DataSourceTest.class);
	@Inject
	private DataSource ds;
	@Inject
	private AdminDAOImpl adao;
	
	//@Test
	public void ds_test() {
		logger.debug("ds_test() 실행");
		
		try {
			Connection con = ds.getConnection();
			logger.debug("con : "+con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//@Test
	public void 사업자정보수정test() {
		logger.debug("사업자정보수정test()");
		try {
			
			logger.debug("ownerInfoUpdate");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//@Test
	public void 사업자탈퇴test() {
		logger.debug("사업자탈퇴test()");
		try {
			adao.ownerInfoDelete(null);
			logger.debug("ownerInfoDelete");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
//	@Test
//	public void test() throws Exception{
//		adao.acResultSelectOwnerId(null);
//		adao.acResultSelectUserId(null);
//		adao.acResultUserUpdate(null,  "");
//		adao.acResultOwnerUpdate(null, "");
//	}
	
	

	
	
}
