package kr.co.dessertfarm.config;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;

import kr.co.dessertfarm.join.JoinService;
import kr.co.dessertfarm.login.LoginService;
import kr.co.dessertfarm.spring.MainDAO;



public class MainConfig {
	@Bean(destroyMethod = "close")
	public DataSource dataSource() {
		DataSource ds = new DataSource();
		ds.setDriverClassName("com.mysql.jdbc.Driver");
		ds.setUrl("jdbc:mysql://dessertfarm.cbftdh9otqqo.ap-northeast-2.rds.amazonaws.com/dessertfarm?characterEncoding=utf8");
		ds.setUsername("root");
		ds.setPassword("dessertfarm111!");
		ds.setInitialSize(2);
		ds.setMaxActive(10);
		ds.setTestWhileIdle(true);
		ds.setMinEvictableIdleTimeMillis(6000 * 3);
		ds.setTimeBetweenEvictionRunsMillis(10 * 100);
		return ds;
	}
	
	@Bean
	public PlatformTransactionManager transacationManager() {
		DataSourceTransactionManager tm = new DataSourceTransactionManager();
		tm.setDataSource(dataSource());
		return tm;
	}
	
	@Bean
	public MainDAO mainDAO() {
		return new MainDAO(dataSource());
	}
	
	@Bean
	public LoginService loginSvc() {
		return new LoginService(mainDAO());
	}
	
	@Bean
	public JoinService joinSvc() {
		return new JoinService(mainDAO());
	}
}
