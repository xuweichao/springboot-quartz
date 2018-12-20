/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.23 : Database - quartz
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`quartz` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `quartz`;

/*Table structure for table `qrtz_calendars` */

DROP TABLE IF EXISTS `qrtz_calendars`;

CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `qrtz_calendars` */

/*Table structure for table `qrtz_cron_triggers` */

DROP TABLE IF EXISTS `qrtz_cron_triggers`;

CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `FK_QRTZ_CRON_TRIGGERS_QRTZ_TRIGGERS` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `qrtz_cron_triggers` */

insert  into `qrtz_cron_triggers`(`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`CRON_EXPRESSION`,`TIME_ZONE_ID`) values ('springboot-quartz','com.jverson.quartz.job.DemoJob1','DemoJob1','0/30 * * * * ?','Asia/Shanghai'),('springboot-quartz','com.jverson.quartz.job.DemoJob2','DemoJob2','0/40 * * * * ?','Asia/Shanghai'),('springboot-quartz','com.jverson.quartz.job.DemoJob3','zzzz','0/20 * * * * ?','Asia/Shanghai');

/*Table structure for table `qrtz_fired_triggers` */

DROP TABLE IF EXISTS `qrtz_fired_triggers`;

CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(20) NOT NULL,
  `SCHED_TIME` bigint(20) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` tinyint(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `qrtz_fired_triggers` */

insert  into `qrtz_fired_triggers`(`SCHED_NAME`,`ENTRY_ID`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`INSTANCE_NAME`,`FIRED_TIME`,`SCHED_TIME`,`PRIORITY`,`STATE`,`JOB_NAME`,`JOB_GROUP`,`IS_NONCONCURRENT`,`REQUESTS_RECOVERY`) values ('springboot-quartz','admin-PC15452786728611545278672772','com.jverson.quartz.job.DemoJob1','DemoJob1','admin-PC1545278672861',1545278860592,1545278880000,5,'ACQUIRED',NULL,NULL,0,0);

/*Table structure for table `qrtz_job_details` */

DROP TABLE IF EXISTS `qrtz_job_details`;

CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` tinyint(1) NOT NULL,
  `IS_NONCONCURRENT` tinyint(1) NOT NULL,
  `IS_UPDATE_DATA` tinyint(1) NOT NULL,
  `REQUESTS_RECOVERY` tinyint(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `qrtz_job_details` */

insert  into `qrtz_job_details`(`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`,`DESCRIPTION`,`JOB_CLASS_NAME`,`IS_DURABLE`,`IS_NONCONCURRENT`,`IS_UPDATE_DATA`,`REQUESTS_RECOVERY`,`JOB_DATA`) values ('springboot-quartz','com.jverson.quartz.job.DemoJob1','DemoJob1','i am job number DemoJob1','com.jverson.quartz.job.DemoJob1',0,0,0,0,'¬í\0sr\0org.quartz.JobDataMapŸ°ƒè¿©°Ë\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap‚èÃûÅ](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMapæ.­(v\nÎ\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0scheduleJobsr\0\"com.jverson.quartz.job.ScheduleJob\0\0\0\0\0\0\0\0L\0cronExpressiont\0Ljava/lang/String;L\0descq\0~\0	L\0\rinterfaceNameq\0~\0	L\0jobGroupq\0~\0	L\0jobIdq\0~\0	L\0jobNameq\0~\0	L\0	jobStatusq\0~\0	xpt\00/30 * * * * ?t\0i am job number DemoJob1t\0interface DemoJob1t\0DemoJob1t\01t\0com.jverson.quartz.job.DemoJob1q\0~\0x\0'),('springboot-quartz','com.jverson.quartz.job.DemoJob2','DemoJob2','i am job number DemoJob2','com.jverson.quartz.job.DemoJob2',0,0,0,0,'¬í\0sr\0org.quartz.JobDataMapŸ°ƒè¿©°Ë\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap‚èÃûÅ](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMapæ.­(v\nÎ\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0scheduleJobsr\0\"com.jverson.quartz.job.ScheduleJob\0\0\0\0\0\0\0\0L\0cronExpressiont\0Ljava/lang/String;L\0descq\0~\0	L\0\rinterfaceNameq\0~\0	L\0jobGroupq\0~\0	L\0jobIdq\0~\0	L\0jobNameq\0~\0	L\0	jobStatusq\0~\0	xpt\00/40 * * * * ?t\0i am job number DemoJob2t\0interface DemoJob2t\0DemoJob2t\02t\0com.jverson.quartz.job.DemoJob2t\01x\0'),('springboot-quartz','com.jverson.quartz.job.DemoJob3','zzzz',NULL,'com.jverson.quartz.job.DemoJob3',0,0,0,0,'¬í\0sr\0org.quartz.JobDataMapŸ°ƒè¿©°Ë\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap‚èÃûÅ](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMapæ.­(v\nÎ\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0scheduleJobsr\0\"com.jverson.quartz.job.ScheduleJob\0\0\0\0\0\0\0\0L\0cronExpressiont\0Ljava/lang/String;L\0descq\0~\0	L\0\rinterfaceNameq\0~\0	L\0jobGroupq\0~\0	L\0jobIdq\0~\0	L\0jobNameq\0~\0	L\0	jobStatusq\0~\0	xpt\00/20 * * * * ?t\0testpt\0zzzzt\05t\0com.jverson.quartz.job.DemoJob3px\0');

/*Table structure for table `qrtz_locks` */

DROP TABLE IF EXISTS `qrtz_locks`;

CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `qrtz_locks` */

insert  into `qrtz_locks`(`SCHED_NAME`,`LOCK_NAME`) values ('springboot-quartz','STATE_ACCESS'),('springboot-quartz','TRIGGER_ACCESS');

/*Table structure for table `qrtz_paused_trigger_grps` */

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;

CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `qrtz_paused_trigger_grps` */

/*Table structure for table `qrtz_scheduler_state` */

DROP TABLE IF EXISTS `qrtz_scheduler_state`;

CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(20) NOT NULL,
  `CHECKIN_INTERVAL` bigint(20) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `qrtz_scheduler_state` */

insert  into `qrtz_scheduler_state`(`SCHED_NAME`,`INSTANCE_NAME`,`LAST_CHECKIN_TIME`,`CHECKIN_INTERVAL`) values ('springboot-quartz','admin-PC1545278672861',1545278873385,20000);

/*Table structure for table `qrtz_simple_triggers` */

DROP TABLE IF EXISTS `qrtz_simple_triggers`;

CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(20) NOT NULL,
  `REPEAT_INTERVAL` bigint(20) NOT NULL,
  `TIMES_TRIGGERED` bigint(20) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `FK_QRTZ_SIMPLE_TRIGGERS_QRTZ_TRIGGERS` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `qrtz_simple_triggers` */

/*Table structure for table `qrtz_triggers` */

DROP TABLE IF EXISTS `qrtz_triggers`;

CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(20) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(20) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(20) NOT NULL,
  `END_TIME` bigint(20) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(6) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `FK_QRTZ_TRIGGERS_QRTZ_JOB_DETAILS` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  CONSTRAINT `FK_QRTZ_TRIGGERS_QRTZ_JOB_DETAILS` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `qrtz_triggers` */

insert  into `qrtz_triggers`(`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`JOB_NAME`,`JOB_GROUP`,`DESCRIPTION`,`NEXT_FIRE_TIME`,`PREV_FIRE_TIME`,`PRIORITY`,`TRIGGER_STATE`,`TRIGGER_TYPE`,`START_TIME`,`END_TIME`,`CALENDAR_NAME`,`MISFIRE_INSTR`,`JOB_DATA`) values ('springboot-quartz','com.jverson.quartz.job.DemoJob1','DemoJob1','com.jverson.quartz.job.DemoJob1','DemoJob1',NULL,1545278880000,1545278850000,5,'ACQUIRED','CRON',1545275137000,0,NULL,0,''),('springboot-quartz','com.jverson.quartz.job.DemoJob2','DemoJob2','com.jverson.quartz.job.DemoJob2','DemoJob2',NULL,1545278880000,1545278860000,5,'WAITING','CRON',1545275138000,0,NULL,0,''),('springboot-quartz','com.jverson.quartz.job.DemoJob3','zzzz','com.jverson.quartz.job.DemoJob3','zzzz',NULL,1545278880000,1545278860000,5,'WAITING','CRON',1545276077000,0,NULL,0,'');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
