package kr.co.dessertfarm.aws;


import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSCredentialsProvider;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;

@PropertySource("classpath:/application.properties")
@Configuration
public class S3Config {
	
	
	@Value("${cloud.aws.s3.bucket}")
	private String bucket;
	
	@Value("${cloud.aws.credentials.accessKey}")
	private String awsId;
	
	@Value("${cloud.aws.credentials.secretKey}")
	private String awsKey;
	
	@Bean
	public BasicAWSCredentials basicAWSCredentials() {
		return new BasicAWSCredentials(awsId, awsKey);
	}
	
	@Bean
	public AWSCredentialsProvider awsCredentialsProvider(AWSCredentials awsCredentials) {
		return new AWSCredentialsProvider() {
			
			@Override
			public void refresh() {}
			
			@Override
			public AWSCredentials getCredentials() {
				return awsCredentials;
			}
		};
	}
	
	@Bean
	public AmazonS3 s3Client() {
		BasicAWSCredentials awsCreds = new BasicAWSCredentials(awsId, awsKey);
		AmazonS3 s3Client = AmazonS3ClientBuilder.standard()
				.withRegion(Regions.valueOf("AP_NORTHEAST_2"))
				.withCredentials(new AWSStaticCredentialsProvider(awsCreds))
				.build();
		
		return s3Client;
	}
}
