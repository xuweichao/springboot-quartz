package com.jverson.quartz.job;

import org.quartz.Job;
import org.quartz.JobExecutionContext;

public class DemoJob1 implements Job {


	@Override
	public void execute(JobExecutionContext jobExecutionContext) {
		ScheduleJob scheduleJob = (ScheduleJob)jobExecutionContext.getMergedJobDataMap().get("scheduleJob");
		String jobName = scheduleJob.getJobName();

//		sampleService.hello(jobName);
		System.out.println("---------------DemoJob1----------------executed");

	}
}
