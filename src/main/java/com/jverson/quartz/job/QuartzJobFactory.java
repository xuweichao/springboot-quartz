package com.jverson.quartz.job;

import java.util.List;

import com.google.common.collect.Lists;

public class QuartzJobFactory  {

	public static List<ScheduleJob> jobList = Lists.newArrayList();

	static {
//        ScheduleJob job = new ScheduleJob();
//        ScheduleJob job2 = new ScheduleJob();
//
//        job.setJobId("1");
//        job.setJobName("com.jverson.quartz.job.DemoJob1");
//        job.setJobGroup("DemoJob1");
//        job.setJobStatus("1");
//        job.setCronExpression(String.format("0/%s * * * * ?", 30));
//        job.setDesc("i am job number DemoJob1");
//        job.setInterfaceName("interface DemoJob1");
//
//        job2.setJobId("1");
//        job2.setJobName("com.jverson.quartz.job.DemoJob2");
//        job2.setJobGroup("DemoJob2");
//        job2.setJobStatus("1");
//        job2.setCronExpression(String.format("0/%s * * * * ?", 40));
//        job2.setDesc("i am job number DemoJob2");
//        job2.setInterfaceName("interface DemoJob2");
//
//        jobList.add(job);
//        jobList.add(job2);


	}

	// simulate data from db
	public static List<ScheduleJob> getInitAllJobs() {
		return jobList;
	}



}
