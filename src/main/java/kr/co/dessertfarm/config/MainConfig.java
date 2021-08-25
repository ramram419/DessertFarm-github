package kr.co.dessertfarm.config;


import javax.sql.DataSource;

import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.transaction.PlatformTransactionManager;

import kr.co.dessertfarm.article.ArticleDAO;
import kr.co.dessertfarm.article.ArticleService;
import kr.co.dessertfarm.join.JoinService;
import kr.co.dessertfarm.login.LoginService;
import kr.co.dessertfarm.product.ProductDAO;
import kr.co.dessertfarm.product.ProductService;
import kr.co.dessertfarm.spring.MainDAO;


@Configuration
public class MainConfig {
	@Bean
	public DataSource dataSource() {
		DriverManagerDataSource ds = new DriverManagerDataSource();
		ds.setDriverClassName("com.mysql.jdbc.Driver");
		ds.setUrl("jdbc:mysql://dessertfarm.cbftdh9otqqo.ap-northeast-2.rds.amazonaws.com/dessertfarm?characterEncoding=utf8");
		ds.setUsername("root");
		ds.setPassword("dessertfarm111!");
		return ds;
	}
	
	@Bean
	public PlatformTransactionManager transacationManager() {
		DataSourceTransactionManager tm = new DataSourceTransactionManager();
		tm.setDataSource(dataSource());
		return tm;
	}
	
	@Bean
    public SqlSessionFactoryBean factoryBean() {
        SqlSessionFactoryBean factory = new SqlSessionFactoryBean();
        factory.setDataSource(dataSource());
        factory.setConfigLocation(new ClassPathResource("./mybatis/config/mybatis-config.xml"));
        
        return factory;
    }
    
    @Bean
    public SqlSessionTemplate sqltemplate() throws Exception {
        SqlSessionFactoryBean factory = factoryBean();
        SqlSessionTemplate template = new SqlSessionTemplate(factory.getObject());
        
        return template;
    }
	
	@Bean
	public MainDAO mainDAO() {
		return new MainDAO();
	}
	
	@Bean 
	public ProductDAO productDAO() {
		return new ProductDAO();
	}
	
	@Bean
	public ArticleDAO articleDAO() {
		return new ArticleDAO();
	}
	
	@Bean
	public LoginService loginSvc() {
		return new LoginService(mainDAO());
	}
	
	@Bean
	public JoinService joinSvc() {
		return new JoinService(mainDAO());
	}
	
	@Bean
	public ProductService productSvc() {
		return new ProductService();
	}
	
	@Bean
	public ArticleService articleSvc() {
		return new ArticleService(articleDAO());
	}
}
