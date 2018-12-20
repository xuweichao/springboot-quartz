package com.jverson.quartz.job;

import org.quartz.Job;
import org.quartz.JobExecutionContext;


public class DemoJob5 implements Job {


	@Override
	public void execute(JobExecutionContext jobExecutionContext) {
		ScheduleJob scheduleJob = (ScheduleJob)jobExecutionContext.getMergedJobDataMap().get("scheduleJob");
		String jobName = scheduleJob.getJobName();
		System.out.println("---------------DemoJob5----------------executed");


	}

}
